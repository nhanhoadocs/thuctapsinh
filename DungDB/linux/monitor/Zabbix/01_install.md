# Cài đặt Zabbix 5 trên Centos 7 (sử dụng với mariadb)

Zabbix 5.0 yêu cầu phiên bản php 7.2 trở lên

Cài php 7.2:

    sudo yum install -y epel-release yum-utils
    sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    yum-config-manager --enable remi-php72
    yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
    yum update -y

Kiểm tra phiên bản php đã cài

    php -v

Tắt firewall và selinux

    sudo systemctl disable firewalld
    sudo systemctl stop firewalld
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0

Cài MariaDB 10.4:

    sudo yum remove mariadb-server

Thêm MariaDB YUM repository vào CentOS 7

    cat <<EOF | sudo tee /etc/yum.repos.d/MariaDB.repo
    [mariadb]
    name = MariaDB
    baseurl = http://yum.mariadb.org/10.4/centos7-amd64
    gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    gpgcheck=1
    EOF

Clean yum cache index:

    sudo yum makecache fast

Cài đặt:

    sudo yum -y install MariaDB-server MariaDB-client

Kiểm tra phiêm bản sau khi cài

    rpm -qi MariaDB-server

Start và enable dịch vụ mariadb

    sudo systemctl enable --now mariadb

Cài đặt cấu hình bảo mật

    mysql_secure_installation 

Trả lời theo thứ tự

Enter -> n -> y -> Nhập mật khẩu -> xác nhận mật khẩu -> y -> y -> y -> y

Tạo database cho zabbix

    mysql -u root -p

nhập mật khẩu

    CREATE DATABASE zabbix CHARACTER SET UTF8 COLLATE UTF8_BIN;
    CREATE USER 'zabbix'@'%' IDENTIFIED BY 'yourpassword';
    GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'%';
    quit;

Cài đặt zabbix 5.0 repository

    sudo yum install -y https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm

Cài Zabbix 5.0 Server và frontend với MySQL support:

    sudo yum install -y zabbix-server-mysql zabbix-agent zabbix-get

Cài Zabbix Frontend:

    sudo yum-config-manager --enable zabbix-frontend
    sudo yum -y install centos-release-scl
    sudo yum -y install zabbix-web-mysql-scl zabbix-apache-conf-scl

Import database đối với mysql/mariadb

    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix

Sửa nội dung file `/etc/zabbix/zabbix_server.conf`

Sửa các chỗ sau:

    DBHost=localhost
    DBName=zabbix
    DBUser=zabbix
    DBPassword=yourpassword             #Nhập mật khẩu của bạn tại đây

Cấu hình PHP cho zabbix frontend. Sửa file `/etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf`

Sửa dòng

    php_value date.timezone Asia/Ho_Chi_Minh

Khởi động Zabbix server và các tiến trình agent và enable chúng khởi động khi hệ thống boot.

    sudo systemctl restart zabbix-server zabbix-agent httpd rh-php72-php-fpm
    sudo systemctl enable zabbix-server zabbix-agent httpd rh-php72-php-fpm

Khởi động lại httpd

    systemctl restart httpd

Truy cập vào `http://(Zabbix server’s hostname or IP address)/zabbix/` để cài đặt

Bước này thực hiện giống trong bài này: https://news.cloud365.vn/zabbix-cai-dat-zabbix-server-phien-ban-4-4-tren-centos7/

Next -> Next -> DB dùng port mặc định (port 0), Nhập password của bạn, Next -> Đặt hostname, Next -> Finnish

Đăng nhập bằng tài khoản mặc định ID/pass: `Admin/zabbix`

Kết quả như sau:

![Imgur](https://i.imgur.com/mXTrGTf.png)

Tham khảo: https://computingforgeeks.com/install-mariadb-10-on-ubuntu-18-04-and-centos-7/

https://www.zabbix.com/download?zabbix=5.0&os_distribution=centos&os_version=7&db=mysql&ws=apache

https://news.cloud365.vn/zabbix-cai-dat-zabbix-server-phien-ban-4-4-tren-centos7/