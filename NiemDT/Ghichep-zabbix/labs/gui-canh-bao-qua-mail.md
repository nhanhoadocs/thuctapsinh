## Hướng dẫn cấu hình gửi cảnh báo qua mail

Trước tiên cần cài đặt các gói phụ trợ

```
yum install python2.7
yum install python-pip
```

Để cấu hình gửi cảnh báo qua mail trước hết cần phải cấu kiểm tra trong file cấu hình của zabbix-server để kiểm tra đường dẫn của thư mục chứa script alert

```
[root@localhost alertscripts]# cat /etc/zabbix/zabbix_server.conf | grep alert
#	Number of pre-forked instances of alerters.
#	Full path to location of custom alert scripts.
# AlertScriptsPath=${datadir}/zabbix/alertscripts
AlertScriptsPath=/usr/lib/zabbix/alertscripts
``` 

Ta thấy thư mục có đường dẫn

```
/usr/lib/zabbix/alertscripts
```

Vào thư mục đó và tiến hành download scripts về

```
[root@localhost ~]# cd /usr/lib/zabbix/alertscripts/
[root@localhost alertscripts]# wget https://raw.githubusercontent.com/niemdinhtrong/zabbix-monitor/master/Alert/Email/zabbix-alert-smtp.sh
```

Chỉnh sửa 2 dòng sau trong file này

```
MAIL_ACCOUNT = 'emailcuaban@gmail.com'
MAIL_PASSWORD = 'password email cua ban'
```

Ở đây bạn khai báo địa chỉ email và password của email của bạn. Email này sẽ được dùng để gửi mail.

Sau khi sửa xong thì lưu lại sau đó cấp quyền cho file này

```
chmod +x zabbix-alert-smtp.sh
```

**Cấu hình trên web**

Đến bước này bạn cấu hình tương tự như cấu hình với gửi telegram ở [bài trước](https://github.com/niemdinhtrong/ghichep-zabbix/blob/master/labs/gui-canh-bao-telegram.md) 

Cần lưu ý một vài bước

Bước này bạn chỉ ra tên script dùng để gửi mail

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/mail/01.png)

Bước này chỉ ra địa chỉ mail nhận cảnh báo

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/mail/02.png)

Khi thông số vợt quá ngưỡng cảnh báo thì cảnh báo sẽ được gửi về mail của tôi

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/mail/03.png)