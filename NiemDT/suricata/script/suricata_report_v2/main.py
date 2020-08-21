import requests
import time
import threading
from queue import Queue
import redis
import Checkipvirustotal
import SearchGraylog
import Mysql
import PutQueue
from GetConfig import get_config
from Telegram import send

config = get_config("/home/niemdt/Desktop/suricata_report_1/setting")
token_tele = config['telegram']['token_tele']
chat_id_er = config['telegram']['chat_id_er']


q_check = Queue(maxsize = 100000)
#print(q_check)
q_mal = Queue(maxsize = 1000)

re = redis.Redis(host=config['redis']['host'])
#print(re)

def getIP():
    while True:
        SearchGraylog.searchIP(re, q_check)

def check_ip_all(ip):
    l_ip = Mysql.queryIP()
    if ip in l_ip:
        print("A")
        mal = Mysql.query_mal(ip)
    else:
        print("B")
        mal = Checkipvirustotal.check_ip(ip)
        time.sleep(25)
    return mal

def check():
    while True:
        if q_check.empty() == False:
            info = q_check.get()
            ip_src = info[0]
            print(ip_src)
            sid = info[1]
            ip_dst = info[2]
            mal_s = check_ip_all(ip_src)
            print(mal_s)
            mal_d = check_ip_all(ip_dst)
            if mal_s > 5 or mal_d >5:
                if ip_src not in Mysql.query_ip():
                    q_mal.put([ip_src,sid])
                    Mysql.insert_content(ip_src, sid, ip_dst)
                if sid not in Mysql.query_sid(ip_src):
                    q_mal.put([ip_src,sid])
                    Mysql.insert_content(ip_src, sid, ip_dst)
                elif ip_dst not in Mysql.query_IP_affect(ip_src, sid):
                    q_mal.put([ip_src,sid])
                    Mysql.insert_content(ip_src, sid, ip_dst)
            else:
                if ip_src not in Mysql.query_ip():
                    Mysql.insert_content(ip_src, sid, ip_dst)
                if sid not in Mysql.query_sid(ip_src):
                    Mysql.insert_content(ip_src, sid, ip_dst)
                elif ip_dst not in Mysql.query_IP_affect(ip_src, sid):
                    Mysql.insert_content(ip_src, sid, ip_dst)
            
def search():
    while True:
        SearchGraylog.searchMessage(q_mal)

getIpGraylog = threading.Thread(name="get IP from Graylog", target = getIP)
checkIp = threading.Thread(name="Check IP in virustotal", target = check)
sendMessa = threading.Thread(name="send Message", target = search)
#checkIp2 = threading.Thread(name="Check IP in virustotal 2", target = check)

getIpGraylog.start()
checkIp.start()
sendMessa.start()
#checkIp2.start()