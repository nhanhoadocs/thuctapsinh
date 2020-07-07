# Giám sát MySQL

Hướng dẫn: https://news.cloud365.vn/zabbix-giam-sat-mysql/

Làm theo tương tự, chỉ khác chỗ tạo user thì làm như sau:

    mysql -u root -p

    CREATE USER 'zabbix'@'%' IDENTIFIED BY 'zabbix';
    GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'%';
    quit;

Kết quả thực hiện trên host 10.10.10.115 chạy Centos 7

![Imgur](https://i.imgur.com/XYPvwny.png)

Đã giám sát được dịch vụ Mysql 