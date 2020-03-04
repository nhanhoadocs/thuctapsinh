import pymysql
from GetConfig import get_config

config = get_config("/home/niemdt/Desktop/suricata_report_1/setting")

myConnection = pymysql.connect(
    host = config['mysql']['host'], user = config['mysql']['username'],
    passwd = config['mysql']['passwd'], db = config['mysql']['DB'])


def close():
    myConnection.close()

def queryIP():
    values = []
    mysql = myConnection.cursor()
    sql = "select IP from IP_Virustotal"
    mysql.execute(sql)
    queries = mysql.fetchall()
    for value in queries:
        value = value[0]
        values.append(value)
    return values
def insert_IP_Virustotal(IP, owner, country, last_modifi, harmless, malicious, suspicious, timeout, undetected):
    mysql = myConnection.cursor()
    sql = "insert into IP_Virustotal \
        (IP, owner, country, last_modifi, harmless, malicious, suspicious, timeout, undetected) \
        values ('{}', '{}', '{}', {}, {}, {}, {}, {}, {})"\
        .format(IP, owner, country, last_modifi, harmless, malicious, suspicious, timeout, undetected)
    mysql.execute(sql)
    myConnection.commit()
#def insert_rule(IP, sid):
#    mysql = myConnection.cursor()
#    sql = "insert into rule (IP, sid) value ('{}', '{}')".format(IP, sid)
#    mysql.execute(sql)
#    myConnection.commit()

def insert_content(IP, sid, IP_affect):
    mysql = myConnection.cursor()
    sql = "insert into content (IP, sid, IP_affect) value ('{}', '{}', '{}')".format(IP, sid, IP_affect)
    mysql.execute(sql)
    myConnection.commit()

def query_sid(IP):
    values = []
    mysql = myConnection.cursor()
    sql = "select sid from content where IP = '{}'".format(IP)
    mysql.execute(sql)
    queries = mysql.fetchall()
    for value in queries:
        value = value[0]
        values.append(value)
    return values

def query_ip():
    values = []
    mysql = myConnection.cursor()
    sql = "select IP from content"
    mysql.execute(sql)
    queries = mysql.fetchall()
    for value in queries:
        value = value[0]
        values.append(value)
    return values

def query_IP_affect(IP, sid):
    values = []
    mysql = myConnection.cursor()
    sql = "select IP_affect from content where IP = '{}' and sid = '{}'".format(IP, sid)
    mysql.execute(sql)
    queries = mysql.fetchall()
    for value in queries:
        value = value[0]
        values.append(value)
    return values

def query_mal(IP):
    mysql = myConnection.cursor()
    sql = "select malicious from IP_Virustotal where IP = '{}'".format(IP)
    mysql.execute(sql)
    queries = mysql.fetchall()
    value = queries[0][0]
    return value
