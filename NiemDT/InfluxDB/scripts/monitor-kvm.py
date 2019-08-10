import sys
import time
from xml.etree import ElementTree

import libvirt
from influxdb import InfluxDBClient

# URL de connection toi KVM host
URL = 'qemu+tcp://root@10.10.10.163/system'

def check_connection (url):
    conn = libvirt.open(url)
    return conn
    
def check_domain (conn):
    domains = conn.listAllDomains(1)
    return domains

def check_cpu (dom):
    cpu = dom.getCPUStats(True)
    cpu_time = cpu[0]['cpu_time']
    return cpu_time

def check_ram (dom):
    ram = dom.memoryStats()
    total = ram["available"] / 1024
    free = ram["unused"] / 1024
    return (total, free)

def list_dev (tree, path, target):
    dev_l = list()
    devs = tree.findall(path)
    for device in devs:
        device = device.get(target)
        dev_l.append(device)
    return dev_l

def check_disk (dom, disk_l):
    read_l = list()
    write_l = list()
    for disk in disk_l:
        dev = dom.blockStats(disk)
        read_l.append(dev[1])
        write_l.append(dev[3])
    return (read_l, write_l)

def check_net (dom, net_l):
    net_in_l = list()
    net_out_l = list()
    for iface in net_l:
        net_if = dom.interfaceStats(iface)
        net_in_l.append(net_if[0])
        net_out_l.append(net_if[4])
    return (net_in_l, net_out_l)

conn = check_connection(URL)
if conn == None:
    print("Failed to connection to" +URL)
    exit()

domains = check_domain (conn)
if len(domains) == 0:
    print("None!!!")
    exit()


def write_disk_net(domain, mea, dev, name, read, write, value1, value2):
    json_body = [
    {
        "measurement": mea,
        "tags": {
            "host": domain,
            dev: name
        },
        "fields": {
            read: value1,
            write: value2
        }
    }
    ]
    client = InfluxDBClient('IP_infludb', 8086, 'user_name', 'password', 'monitor_kvm')
    client.write_points(json_body)


def write_ram_cpu(domain, mea, name, value1):
    json_body = [
    {
        "measurement": mea,
        "tags": {
            "host": domain
        },
        "fields": {
            name: value1
        }
    }
    ]
    client = InfluxDBClient('IP_infludb', 8086, 'user_name', 'password', 'monitor_kvm')
    client.write_points(json_body)

    
while True:
    domains = check_domain (conn)
    for domain in domains:
        domain = str(domain.name())
        print(domain)
        dom = conn.lookupByName(domain)
        tree = ElementTree.fromstring(dom.XMLDesc())
        disk_l = list_dev(tree, "devices/disk/source", "file")
        net_l = list_dev(tree, "devices/interface/target", "dev")
        disk_sta_1 = check_disk(dom, disk_l)
        net_sta_1 = check_net(dom, net_l)
        cpu_time_1 = check_cpu(dom)
        print(cpu_time_1)
        time.sleep(3)
        cpu_time_2 = check_cpu(dom)
        print(cpu_time_2)
        disk_sta_2 = check_disk(dom, disk_l)
        net_sta_2 = check_net(dom, net_l)
        ram = check_ram(dom)
        nu_cpu = dom.info()[3]
        cpu_usage = (cpu_time_2 - cpu_time_1) / (31000000*nu_cpu)
        print(cpu_usage)
        #write_ram_cpu(domain, "ram_total", "ram_total", ram[0])
        #write_ram_cpu(domain, "ram_free", "ram_free", ram[1])
        #write_ram_cpu(domain, "cpu", "ram_usage", cpu_usage)
    
        for i in range(0, len(disk_l)):
            name_disk = "Disk %d" %(i + 1)
            disk_r = (disk_sta_2[0][i] - disk_sta_1[0][i]) / 3000
            disk_w = (disk_sta_2[1][i] - disk_sta_1[1][i]) / 3000
            #write_disk_net(domain, "disk", "disk", name_disk, "read", \
            #"write", disk_r, disk_w)
        
    
        for i in range(0, len(net_l)):
            name_interface = "Interface %d" %(i + 1)
            net_in = (net_sta_2[0][i] - net_sta_1[0][i]) / (1048576*3)*8
            net_out = (net_sta_2[1][i] - net_sta_1[1][i]) / (1048576*3)*8
            #write_disk_net(domain, "network", "interface", name_interface, "net_in", \
            #"net_out", net_in, net_out) 
    time.sleep(10)
