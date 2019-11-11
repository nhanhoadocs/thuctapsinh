# Hướng dẫn cài đặt sqli-labs

## Cài đặt LAMP

**Install apache**

```
yum install httpd
systemctl start httpd
systemctl enable httpd
```

**Install Mariadb**

```
yum install mariadb-server mariadb
systemctl start mariadb
systemctl enable mariadb
```

Setup mariadb

```
mysql_secure_installation
```

**Install PHP**

```
yum install php php-mysql
```

Restart lại http

```
systemctl restart httpd
```

## Cài đặt sqli-labs

```
cd /var/www/html
git clone https://github.com/Audi-1/sqli-labs.git sqli-labs
```

Khai báo password user root của mariadb vào file sau

```
vi sqli-labs/sql-connections/db-creds.inc
```

Sau đó mở trình duyệt web và gõ vào địa chỉ sau:

```
ip/sqli-labs/index.html
```