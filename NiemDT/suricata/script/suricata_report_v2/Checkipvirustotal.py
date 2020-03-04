import requests
import time
from GetConfig import get_config
from Telegram import send
import Mysql

config = get_config("/home/niemdt/Desktop/suricata_report_1/setting")

url = config['virustotal']['url']
token_tele = config['telegram']['token_tele']
chat_id_er = config['telegram']['chat_id_er']
api_key = config['virustotal']['api_key']

headers = {
    'x-apikey': '{}'.format(api_key),
}

def check_ip(ip):
    #print(ip)
    url_ip = url + ip
    try:
        response = requests.get(url_ip, headers=headers)
        print(response)
        if response.status_code == 200:
            jresponse = response.json()
            resul = jresponse['data']['attributes']
            #print(resul)
            try:
                owner = resul['as_owner']
            except:
                owner = "unknow"
            try:
                country = resul['country']
            except:
                country = "unknow"
            try:
                last_modifi = resul['last_modification_date']
            except:
                last_modifi = time.time()
            try:
                last_stat = resul['last_analysis_stats']
                harmless = last_stat['harmless']
                malicious = last_stat['malicious']
                suspicious = last_stat['suspicious']
                timeout = last_stat['timeout']
                undetected = last_stat['undetected']
            except:
                harmless = 0
                malicious = 0
                suspicious = 0
                timeout = 0
                undetected = 0
            #print(malicious)
            Mysql.insert_IP_Virustotal(ip, owner, country, last_modifi, harmless, malicious,
                          suspicious, timeout, undetected)
            print("insert OK")
            return malicious
        else:
            send(token_tele, chat_id_er, "Virustotal error: {}".format(response.status_code))
            time.sleep(3600)
    except:
        return 0
