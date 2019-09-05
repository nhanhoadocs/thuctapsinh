# Cài đặt MariaDB trên CentOS7 


## Mô hình : 

![Mô hình](../images/mohinhcbi.png)
## Chuẩn bị :

- Một máy hệ điều hành centOS7 có ip 192.168.70.129
- OS ping được ra ngoài internet và ping được với PC 


## Cài đặt MariaDB 

Sử dụng `yum install` để cài đặt `mariadb-server` để cài đặt MariaDB 

```
yum install mariadb-server
```

Sau khi hoàn tất cài đặt chúng ta khởi động dịch vụ MariaDB 

```
systemctl start mysqld 
```

Kiểm tra cổng mà MariaDB đang sử dụng 

```
netstat -plnt | grep mysql
```

![](../images/port-mariadb.png)

Như trên hình tra thấy dịch vụ MariaDB đang chạy ở cổng `3306`.




