# Cài đặt zabbix server trên centOS 7

## Mô hình 

Một mô hình giám sát zabbix sẽ bao gồm đầy đủ các thành phần như sau:

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/cai-dat/1.jpg)

Nhưng ở đây tôi giám sát với hệ thống nhỏ nên tôi sẽ không cài đặt zabbix proxy. Tôi và tôi cài đặt web server, Zabbix server và Database server trên cùng một máy.

## Chuẩn bị

Một máy cài centOS 7 dùng làm zabbix server có cấu hình:

 * 2 CPU
 * 2G RAM
 * 1 interface
 * 15G disk

Một máy làm zabbix agent nên ko yêu cầu phần cứng. Nhưng trong bài lab này tôi cài agent trên máy có HĐH centOS7.

Mô hình đơn giản của tôi như sau

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/cai-dat/2.png)

## Cài đặt

Cài đặt LAMP tham khảo [tại đây](https://github.com/niemdinhtrong/NIEMDT/blob/master/wordpress/docs/LAMP.md)

**Cài đặt zabbix server**

Ở đây tôi sử dụng cách cài đặt bằng package

Cài đặt gói cấu hình

```
rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
```

Cài đặt zabbix server

```
yum install zabbix-server-mysql
```

Cài đặt zabbix frontend

```
yum install zabbix-web-mysql
```

Nếu mô hình của bạn có zabbix proxy thì bạn dùng lênh sau để cài đặt trên máy zabbix proxy

```
yum install zabbix-proxy-mysql
```

**Tạo database cho zabbix**

```
mysql -u root -p

create database zabbix;

grant all privileges on zabbix.* to 'zabbix'@'localhost' identified by 'zabbix';

exit
```

**Import database**

```
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
```

Sửa file zabbix_server.conf để có thể sử dụng database (nếu ban có cài zabbix proxy thì cẩn sửa file zabbix_proxy.conf)

```
# vi /etc/zabbix/zabbix_server.conf
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=zabbix
```

Đây là các thông số mà tôi vừa tạo trong database ở câu lệnh bên trên

**Start zabbix server**

```
service zabbix-server start

systemctl enable zabbix-server
```

**Cấu hình zabbix frontend**

Truy cập file `/etc/httpd/conf.d/zabbix.conf` và uncomment ở dòng timezone và chỉnh sửa lại timezone

```
php_value max_execution_time 300
php_value memory_limit 128M
php_value post_max_size 16M
php_value upload_max_filesize 2M
php_value max_input_time 300
php_value max_input_vars 10000
php_value always_populate_raw_post_data -1
php_value date.timezone Asia/Ho_Chi_Minh
```

**Cầu hình selinux**

Bạn có thể disable SElinux hoặc cho phép kết nối bằng câu lệnh sau

```
setsebool -P httpd_can_connect_zabbix on

setsebool -P httpd_can_network_connect_db on
```

Restart lại Apache

```
service httpd restart
```

Bạn mở trình duyệt web và truy cập `http://IP-server/zabbix` bạn sẽ thấy như sau

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/cai-dat/3.png)

## Cài đặt zabbix agent

Cài đặt zabbix agent trên các host muốn monitor

Cài đặt gói cấu hình

```
rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
```

Cài đặt agent

```
yum install zabbix-agent
```

Bật agent

```
service zabbix-agent start

systemctl enable zabbix-agent
```

Sau đó và file `/etc/zabbix/zabbix_agentd.conf` và chỉnh sửa một số thông tin

```
SourceIP=IP-agent
ListenIP=IP-agent
ListenPort=10050
Server=IP-server
ServerActive=IP-server
```

`SourceIP`: IP của zabbix agent. Khai báo này được sử dụng khi máy có nhiều IP ta cần chỉ ra IP giao tiếp với zabbix server

`ListenIP`: IP của zabbix agent. IP được dùng để lắng nghe các gói tin mà zabbix server gửi đến.

`ListenPost`: Port lắng nghe giao tiếp với server. Port mặc định ở đây là 10050

`Server`: Bật chế độ Zabbix Monitor Passive ở agent

`ServerActive`: Bật chế độ Zabbix Monitor Active ở agent

**Khởi động lại agent**

```
systemctl restart zabbix-agent

systemctl enable zabbix-agent
```

**Mở port**

Tắt SElinux

```
setenforce 0
```

Câu lệnh trên dùng để tắt tạm thời cho đến khi bạn reboot. Muốn tắt vĩnh viễn bạn vào file `/etc/selinux/config` và sửa như sau:

```
SELINUX=disabled
```

Mở port

```
firewall-cmd --zone=public --add-port=10050/tcp

firewall-cmd --zone=public --permanent --add-port=10050/tcp
```