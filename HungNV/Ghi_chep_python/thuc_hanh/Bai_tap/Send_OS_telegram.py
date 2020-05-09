import os
import requests

mess_id = input("Nhập vào message id: ")
token_id = input("Nhập vào bot token: ")


def release():
    a = os.popen('cat /etc/*release | grep "PRETTY_NAME"').read()
    b = a[13:-2]
    return(b)
global z
z = release()

def host():
    a = os.popen('cat /etc/hostname').read()
    return(a)
global y
y = host()

def cpu():
    a = os.popen('nproc').read()
    return(a)
global x
x = cpu()

def ram():
    a = os.popen('free -h').read()
    return(a)
global t
t = ram()

def disk():
    a = os.popen('df -h').read()
    return(a)
global h
h = disk()

def sentmessage(mess_id, token_id, x, y, z, t, h):
    requests.get('https://api.telegram.org/bot{}/sendMessage?chat_id={}&text=Thông số OS như sau :\n---------\nPhiên bản :  {}\n----------\nHostname:  {}\n----------\nThông số CPU:  {}\n----------\nThông số Ram :\n\n{}\n----------\nThông số Disk :\n\n{}\n '.format(token_id, mess_id, z, y, x, t, h))

send = sentmessage(mess_id, token_id, x, y, z, t, h)
