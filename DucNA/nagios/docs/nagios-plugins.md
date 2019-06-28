Trong nagios sẽ có những cộng đồng phát triển. Thế nên dẫn đến việc sẽ có 2 loại nagios được tạo ra. 
- Nagios plugins chính thức. Sẽ luôn được phát triển bởi nhà phát triển nagios và luôn được update
- Nagios plugins do cộng đồng phát triển. Sẽ không được phát triển đều sẽ có những bản không được phát triển lỗi rất có thể gây ra lỗi trong hệ thống nagios 

Trong nagios plugins sẽ được phân ra hai luồng hoạt động chính. Đại diện cho hai luồng hoạt động này là 2 loại  plugins
- NRPE (Nagios Remote Plugin Executor) : 

![](../images/lab/screen.png)

- Nagios Service Check Acceptor (NSCA): 

![](../images/lab/screen_1.png)

# Cài đặt NRPE 
## Trên máy linux từ xa 
- Bước 1: Cài đặt các gói phụ kiện cần thiết 
```
yum install -y gcc glibc glibc-common gd gd-devel make net-snmp openssl-devel
```
- Bước 2: Tạo user để nrpe sử dụng tiến trình bằng user này 
```
useradd nagios
passwd nagios
```
- Bước 3 Download plugins 
```
yum install wget -y 
wget https://www.nagios-plugins.org/download/nagios-plugins-2.1.2.tar.gz
```
- Bước 4: Giải nén file vừa tải về 
```
tar -xvf nagios-plugins-2.1.2.tar.gz
```
- Bước 5: Cài đặt plugins 
```
cd nagios-plugins-2.1.2
./configure
 make
 make install
```
- Bước 6 : Cấp quyền sử dụng nagios cho user 
```
chown nagios.nagios /usr/local/nagios
chown -R nagios.nagios /usr/local/nagios/libexec
```
- Bước 7: Cài đặt xinetd 
```
yum install xinetd
```
- Bước 8: Cài đặt NRPE plugins 
```
wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz

tar xzf nrpe-3.2.1.tar.gz
cd nrpe-3.2.1
./configure
make install
make install-plugin
make install-daemon
make install-daemon-config
make install-inetd
```
- Bước 9: Sửa file `/usr/local/nagios/etc/nrpe.cfg` 
```
allowed_hosts=127.0.0.1,(nagios server IP )
```
ví dụ 
```
allowed_hosts=127.0.0.1,192.168.122.145
```
- Bước 10: Sửa file `/etc/xinetd.d/nrpe`
```
only_from = 127.0.0.1 localhost <nagios_ip_address>
```
- Bước 11: Sửa file ` /etc/services` Thêm vào cuối file dòng sau 
```
nrpe            5666/tcp                 #NRPE
```
- Bước 12: Khởi chạy các dịch vụ 
```
service xinetd restart
systemctl start nrpe 
systemctl enable nrpe 
```

## Trên nagios server 
- Bước 1: Download NRPE plugins 
```
wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz
```
- Bước 2: Cài đặt NRPE
```
tar xzf nrpe-3.2.1.tar.gz
cd nrpe-3.2.1
./configure
make install
make install-plugin
make install-daemon
```
- Bước 3: Kiểm tra phiên bản NRPE
```
/usr/local/nagios/libexec/check_nrpe -H <remote_linux_ip_address>
```
- Bước 4: Thêm chức năng kiểm tra máy linux từ xa. Khai báo Trong file main config
```
 vi /usr/local/nagios/etc/nagios.cfg
```
- Thêm vào dòng sau 
```
cfg_file=/usr/local/nagios/etc/hosts.cfg
cfg_file=/usr/local/nagios/etc/services.cfg
```
- Bước 5: Chỉnh sửa file host  đã khai báo 
```
vi /usr/local/nagios/etc/hosts.cfg
```

```
## Default Linux Host Template ##
define host{
name                            linux-box
use                             generic-host
check_period                    24x7
check_interval                  5
retry_interval                  1
max_check_attempts              10
check_command                   check-host-alive
notification_period             24x7
notification_interval           30
notification_options            d,r
contact_groups                  admins
register                        0
}

## Default
define host{
        use                             linux-box
        host_name                       server
        alias                           CentOS 7
        address                         192.168.122.34
        }

```
- Bước 6: Chỉnh sửa file service 
```
vi /usr/local/nagios/etc/services.cfg
```

```
define service{
        use                     generic-service
        host_name               server
        service_description     CPU Load
        check_command           check_nrpe!check_load
        }
define service{
        use                     generic-service
        host_name               server
        service_description      disk load
        check_command           check_nrpe!check_hda1
        }

```

- Bước 7: Sau đó chạy lệnh check lại file cấu hình
```
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```
- Kết quả sẽ như sau là sẽ không có lỗi gì xảy ra
```
Nagios Core 4.1.1
Copyright (c) 2009-present Nagios Core Development Team and Community Contributors
Copyright (c) 1999-2009 Ethan Galstad
Last Modified: 08-19-2015
License: GPL

Website: https://www.nagios.org
Reading configuration data...
   Read main config file okay...
   Read object config files okay...

Running pre-flight check on configuration data...

Checking objects...
	Checked 10 services.
	Checked 2 hosts.
	Checked 1 host groups.
	Checked 0 service groups.
	Checked 1 contacts.
	Checked 1 contact groups.
	Checked 25 commands.
	Checked 5 time periods.
	Checked 0 host escalations.
	Checked 0 service escalations.
Checking for circular paths...
	Checked 2 hosts
	Checked 0 service dependencies
	Checked 0 host dependencies
	Checked 5 timeperiods
Checking global event handlers...
Checking obsessive compulsive processor commands...
Checking misc settings...

Total Warnings: 0
Total Errors:   0
```

- Bước 8: Khởi động lại dịch vụ 
```
service nagios restart
```

Sau khi khởi động lại dịch vụ thì ta sẽ đăng nhập vào web để kiểm tra thông báo của naigos 

![](../images/lab/screen_2.png)

Ta thấy rằng nagios đã giám sát được CPU và disk của host 

# link tham khảo 
https://assets.nagios.com/downloads/nagioscore/docs/nrpe/NRPE.pdf

https://www.tecmint.com/how-to-add-linux-host-to-nagios-monitoring-server/

http://nuxref.com/2013/12/09/installing-nrpe-and-nsca-into-nagios-core-4-centos-6/

