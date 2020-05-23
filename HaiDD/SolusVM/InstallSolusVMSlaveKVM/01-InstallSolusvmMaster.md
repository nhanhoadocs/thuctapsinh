# Cài đặt Solusvm Master

Cài đặt trên CentOS 7

**Yêu cầu** : Máy chủ sạch và đã update

```
yum update
```
## I. Cài đặt
1. Tải xuống script cài đặt và khởi chạy nó

```
curl -o install.sh https://files.solusvm.com/install.sh && sh install.sh
```

<img src="..\images\Screenshot_10.png">

2. Chọn cài đặt UI. Option 1 và đợi quá trình hoàn tất.

<img src="..\images\Screenshot_11.png">



## II. Đăng nhập vào SolusVM Master
Khi đăng nhập vào SolusVM Master lần đầu tiên, bạn nên sử dụng liên kết được đề xuất khi hoàn tất cài đặt.

```
Installation Complete. Full install log: /tmp/install.log

 SolusVM UI Login Information:
 =============================
 Admin Area Standard Port (SSL) .... : https://103.101.160.130/admincp
 Admin Area Custom Port (SSL) ...... : https://103.101.160.130:5656/admincp
 Client Area Standard Port (SSL) ... : https://103.101.160.130
 Client Area Custom Port (SSL) ..... : https://103.101.160.130:5656
 Admin Username ...... : vpsadmin
 Admin Password ...... : vpsadmin

 It is advised that you change the default admin password on your first login
```

 Admin Username : `vpsadmin`
 
 Admin Password : `vpsadmin`
