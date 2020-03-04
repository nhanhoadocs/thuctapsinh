from grapi.grapi import Grapi 
from datetime import datetime
from datetime import timedelta
import time
from Telegram import send
from GetConfig import get_config

config = get_config("/home/niemdt/Desktop/suricata_report_1/setting")

#telegram
token_tele = config['telegram']['token_tele']
chat_id = config['telegram']['chat_id']
chat_id_er = config['telegram']['chat_id_er']

#graylog
token = config['graylog']['token']
url = config['graylog']['url']

my_api = Grapi(url, token)
def create_params(times, query, fields):
    my_params = {
        "query": query,
        "fields": fields,
        "from": times[0],
        "to": times[1],
        "limit": 10000
    }
    return my_params

def get_time(t):
    time_1 = str(datetime.now() - timedelta(minutes=t))
    time_2 = str(datetime.now())
    t_1 = time_1[:19]
    t_2 = time_2[:19]
    return (t_1, t_2)

def searchIP(re, q):
    times = get_time(1)
    #print(times)
    my_params = create_params(times, "", "src_ip, dst_ip, sid")
    response = my_api.send("get", **my_params)
    resul = response.json()
    try:
        a = resul['messages']
        for mess in a:
            c = mess['message']
            src_ip = c["src_ip"]
            dst_ip = c["dst_ip"]
            sid = c['sid']
            info = [src_ip, sid, dst_ip]
            inf = str(info)
            #print(inf)
            if re.get(inf) != b'1':
                print(info)
                re.set(inf,"1")
                q.put(info)
                print(q.get())
                q.put(info)
    except:
        pass
            
    #except:
    #    resul = response.text.split("\n")
    #    #print(resul)
    #    for a in resul:
    #        a1 = a.split(",")
    #        print(a1)
    #        break
    #        try:
    #            src_ip = str(a1[1])[1:-1]
    #            dst_ip = str(a1[2])[1:-1]
    #            sid = str(a1[3])[1:-1]
    #            info = [src_ip, sid, dst_ip]
    #            #print(info)
    #            if re.get(info) != b'1':
    #                re.set(info,'1')
    #                q.put(info)
    #        except:
    #            pass

def searchMessage(q):
    if q.empty() == False:
        l_msg = []
        l_srcIP = []
        l_dstIP = []
        l_srcPort = []
        l_dstPort = []
        info = q.get()
        ip = info[0]
        sid = info[1]
        mess = ""
        query_s = ip + " AND sid:" + sid
        times = get_time(1440)
        my_params = create_params(times, query_s,
                    "msg, src_ip, dst_ip, src_port, dst_port")
        response = my_api.send("get", **my_params)
        try:
            resul = response.json()
            a = resul['messages']
            if len(a) > 10:
                a1 =  a[0:9]
            else:
                a1 = a
            for b in a1:
                c = b['message']
                if c['msg'] not in l_msg:
                    l_msg.append(c['msg'])
                if c['src_ip'] not in l_srcIP:
                    l_srcIP.append(c['src_ip'])
                if c['dst_ip'] not in l_dstIP:
                    l_dstIP.append(c['dst_ip'])
                if c['src_port'] not in l_srcPort:
                    l_srcPort.append(c['src_port'])
                if c['dst_port'] not in l_dstPort:
                    l_dstPort.append(c['dst_port'])               
        except:
            send(token_tele, chat_id_er, "graylog not return json")

        msg = ""
        source_ip = ""
        desti_ip = ""
        for m_1 in l_msg:
            msg = msg + m_1 + "\n"
        for m_2 in l_srcIP:
            source_ip = source_ip + m_2 + "\n"
        for m_3 in l_dstIP:
            desti_ip = desti_ip + m_3 + "\n"
        url_se = "http%3A%2F%2F10.10.34.127%3A9000%2Fsearch%3Frangetype%3" +\
                    "Drelative%26fields%3Dmessage%26width%3D1920%26highlight" +\
                    "Message%3D%26relative%3D86400%26q%3D{}".format(ip)
        mess = "*IP: "+ip+"*"+"\n" + "*message: *\n" + msg + "\n" +\
                "*Source IP:*\n" + source_ip + "\n" +\
                "*Destination IP:*\n" + desti_ip + "\n" +\
                "*Source port: *" + str(l_srcPort) + "\n" +\
                "*Destination port: *" + str(l_dstPort) + "\n" +\
                "*Graylog: *" + "{}".format(url_se)

        send(token_tele, chat_id, mess)
