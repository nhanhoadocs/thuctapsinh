## Hướng dẫn tự tạo một plugin để gửi metric về zabbix server

Trước tiên cần tạo một item trên host với kiểu `zabbix trapper`

Sau đó tạo một script để tiến hành gửi metric. Ví dụ một đoạn script như sau dùng để kiểm tra số user đang login vào server

```
#!/bin/sh

###########################################################
# Server_addr dia chi zabbix server
SERVER_ADDR="10.10.10.160"
# Name_host ten cua host duoc cau hinh tren zabbix server
NAME_HOST="Host-10.162"
# Port la port tren zabbix server de thuc hien ket noi voi host
PORT="10051"
# Key la key cau hinh tren item cua host nhan gia tri 
KEY="test.send.notified"
###########################################################

while [ 1 != 0 ]
do
a=`uptime | awk '{print $4}'`
zabbix_sender -z ${SERVER_ADDR} -s ${NAME_HOST} -p ${PORT} -k ${KEY} -o $a > /dev/null 2>&1
sleep 60
done
```

Tiếp theo cho script này chạy trong supervisor

Trước tiên cần cài đặt supervisor

```
yum install supervisor
```

Thêm nội dung như sau vào file `/etc/supervisord.d/plugin.ini`. Ban đầu file này chưa tồn tại

```
[program:plugin-user]
command=/root/plugin-check-user.sh
directory=/root
autostart=true
autorestart=true
logfile=/var/log/supervisor/plugin-user.log
log_stderr=true
user=root
```

Tiến hành restart lại và cho supervisor khởi động cùng hệ thống

```
systemctl restart supervisord

systemctl enable supervisord
```

Bạn có thể thấy script của ta đang được chạy 

```
[root@zabbix2 ~]# supervisorctl status
plugin-user                      RUNNING   pid 10210, uptime 0:11:47
```

Và ta thấy các metric đang được gửi về zabbix server

![](/images/plugin/1.png)