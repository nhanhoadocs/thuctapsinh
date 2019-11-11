import configparser
from zabbix import Zabbix
from ast import literal_eval

def get_config(file):
    config = configparser.ConfigParser()
    config.read(file)
    return config

def get_host(file_host):
    list_host = []
    file = open(file_host)
    for line in file:
        line = line.rstrip()
        line = literal_eval(line)
        list_host.append(line)
    return list_host

config = get_config('setting')
username = config['zabbix']['zabbix_username']
passwd = config['zabbix']['zabbix_password']
group = config['zabbix']['group_name']
template = config['zabbix']['template_name']
list_host = get_host('hosts')

zabi = Zabbix(username, passwd, group, template)
auth_key = zabi.get_aut_key()
templateid = zabi.get_tem_id(auth_key)
groupid = zabi.get_group_id(auth_key)
zabi.add_host(auth_key, list_host, groupid, templateid)
