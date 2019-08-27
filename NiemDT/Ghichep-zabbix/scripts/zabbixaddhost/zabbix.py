import configparser
import json
import sys
import requests
from requests.auth import HTTPBasicAuth

def get_config(file):
    config = configparser.ConfigParser()
    config.read(file)
    return config

config = get_config('setting')
addr = config['zabbix']['zabbix_addr']

class Zabbix(object):
    url = 'http://{}/zabbix/api_jsonrpc.php'.format(addr)
    print(url)
    headers = {'content-type': 'application/json'}
    
    def __init__(self, username, passwd, group, template):
        #self.url = url
        #self.header = header
        self.username = username
        self.passwd = passwd
        self.group = group
        self.template = template

    def get_aut_key(self):
        payload= {'jsonrpc': '2.0','method':'user.login','params':
                {'user':'admin','password':'zabbix'},'id':'1'}
        r = requests.post(self.url, data=json.dumps(payload), headers=self.headers,
                         verify=True, auth=HTTPBasicAuth('admin','zabbix'))
        if r.status_code != 200:
            print('problem -key')
            print(r.status_code)
            print(r.text)
            sys.exit()
        else:
            print(r)
            result=r.json()
            auth_key=result['result']
            return auth_key

    def get_tem_id(self, auth_key):
        payload={
            "jsonrpc": "2.0",
            "method": "template.get",
            "params": {
                "output": "extend",
                "filter": {
                    "host": [
                        self.template,
                    ]
                }
            },
            "auth": auth_key,
            "id": 1
        }
        r = requests.post(self.url, data=json.dumps(payload),
                      headers=self.headers, verify=True,
                      auth=HTTPBasicAuth(self.username,self.passwd))
        a = r.json()['result'][0]
        return(a['templateid'])

    def get_group_id(self, auth_key):
        payload={
            "jsonrpc": "2.0",
            "method": "hostgroup.get",
            "params": {
                "output": "extend",
                "filter": {
                    "name": [
                        self.group,
                    ]
                }
            },
            "auth": auth_key,
            "id": 1
        }
        r = requests.post(self.url, data=json.dumps(payload),
                      headers=self.headers, verify=True,
                      auth=HTTPBasicAuth(self.username,self.passwd))
        a = r.json()['result'][0]
        groupid = a['groupid']
        return groupid
    
    def add_host(self, auth_key, list_host, groupid, templateid):
        i = 0
        for host in list_host:
            print(host)
            ip = host[1]
            name = host[0]
            print(name)  
            payload={
                "jsonrpc": "2.0",
                "method": "host.create",
                "params": {
                    "host": name,
                    "interfaces": [
                        {
                            "type": 1,
                            "main": 1,
                            "useip": 1,
                            "ip": ip,
                            "dns": "",
                            "port": "10050"
                        }
                    ],
                    "groups": [
                        {
                            "groupid": groupid
                        }
                    ],
                    "templates": [
                        {
                            "templateid": templateid
                        }
                    ],
                },
                    "auth": auth_key,
                    "id":  i + 1
            }
            r = requests.post(self.url, data=json.dumps(payload),
                          headers=self.headers, verify=True,
                          auth=HTTPBasicAuth(self.username,self.passwd))
            
