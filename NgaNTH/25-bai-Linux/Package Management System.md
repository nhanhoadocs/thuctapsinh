### Package Management Systems (Hệ thống quản lý gói)   

 1. Giới thiệu về hệ thống quản lý gói  

Phần cốt lõi của các bản distro Linux và hầu hết các phần mềm bổ trợ của nó được cài đặt thông qua Hệ thống quản lý gói. Mỗi gói chứa các tệp và các hướng dẫn khác giúp cho phần mềm hoạt động trong hệ thống.  
Mỗi họ khác nhau sẽ có các gói quản lý khác nhau nhưng về cơ bản sẽ được phân làm 2 loại: gói quản lý cấp cao và gói quản lý cấp thấp.  

<img src="https://i.imgur.com/nrpHbaJ.png">  

Gói quản lý cấp thấp - Low Level Tool (*dpkg*, *rpm*) đảm nhiệm giải nén các gói riêng lẻ, chạy tập lệnh, cài đặt phần mềm chính xác. Trong khi gói quản lý cấp cao - High Level Tool (*apt-get*, *zypper*, *yum*) làm việc với các gói, tải các gói từ nhà sản xuất và tìm ra các phụ thuộc. Hầu hết, người dùng thường sử dụng gói công cụ cấp cao (gói này đảm nhiệm công việc của gói cấp thấp khi cần thiết).  

2. Những trình quản lý gói của Red Hat 

2.1 Trình quản lý gói cấp cao - yum  
`yum` - viết tắt của *YellowDog Updater Modified*, là lệnh được sử dụng mạnh mẽ và tiện lợi trong CentOS để cài đặt, update, gỡ bỏ các phần mềm. 
Một số tùy chọn với `yum`:  
- Cài đặt 1 package 
```
# yum install [tên package]
```
- Gỡ một package
```
# yum remove [tên package]
```
- Cập nhật 1 package
```
# yum update [tên package]
```
Để tự động cập nhật ta thêm tùy chọn  `-y`:
```
# yum update -y [tên package]
```
- Hiển thị tất cả các gói đã được cài đặt
```
# yum list installed
```
- Liệt kê các gói phần mềm với bộ lọc (ví dụ: samba)
```
# yum list installed samba
```
- Hiển thị các gói phần mềm theo nhóm  
```
# yum grouplist
```
- Cài đặt tất cả các gói phần mềm có trong nhóm
```
# yum Groupinstall "Development Tools"
```
Tương tự với update và remove.  
- hiển thị các gói không thể cài đặt
```
# yum list extras
```
- Hiển thị thông tin về gói phần mềm có file cụ thể
```
# yum whatprovides /etc/passwd
```

2.2 Trình quản lý gói cấp thấp (rpm)  
- rpm là viết tắt của RedHat Package Management  
- Các tập tin RPM thường có đuôi là .rpm  
- Trong các phiên bản của RedHat, các tập tin RPM thường có cấu trúc như sau:  
```
<tên_gói>-<phiên_bản>-<số_hiệu>.<mã_máy>.rpm
```
Ví dụ: `unbound-1.6.6-1.el7.x86_64.rpm`  

- Cài đặt: 
```
# rpm [option] [tập tin rpm]
```
Các option:  
    i - cài đặt,  
    U - cập nhật,  
    vh - hiển thị chi tiết quá trình cài đặt các gói.  










 

