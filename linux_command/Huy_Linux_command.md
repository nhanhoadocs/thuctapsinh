# Linux_Command1

## Lệnh man
### 1. Các man page
- Được viết tắt của *Manual Page* (Trang hướng dẫn)
- Muốn thoát khỏi trang ta bấm ``q``

### 1.1. Man $command
- Nó giúp ta có cái có thể nhìn chi tiết các lệnh(VD: nó để làm gì, được dùng như thế nào,..)
```
man mkdir
```

![Imgur](https://i.imgur.com/uR0EeOi.png)

### 1.2. man $configfile
- Hầu hết các file config đều có hướng dẫn 
```
man rsyslog.conf
```
![Imgur](https://i.imgur.com/nYtYlGV.png)

### 1.3. man $daemon
- Nó cũng giống như hầu hết chương trình daemons( chương trình background) trên hệ thống  
```
    #man rsyslogd
```
![Imgur](https://i.imgur.com/LXmfsba.png)
### 1.4. man -k(apropos)

man -k(or apropos) giúp hiển thị danh sách các man page có chứa chuỗi
```
man -k syslog
```
![Imgur](https://i.imgur.com/K8gj9dr.png)
### 1.5. whatis
- Dùng để xem phần mô tả của 1 man page
```
#whatis ls
```
![Imgur](https://i.imgur.com/VmMHFrj.png)
### 1.6. whereis
- Dùng để xem vị trí lưu của man page
 ```
 #whereis -m mkdir
  -m ở đây nghĩa là chỉ tìm kiếm man page
 ```

 ![Imgur](https://i.imgur.com/8GzSKTq.png)  

 Tập tin này có thể được đọc trực tiếp bởi ``man``
 ```
 [root@localhost ~]# man /usr/share/man/man1/mkdir.1.gz
```
### 1.7. man sections
ý nghĩa các con số trong giấu ngoặc() khi dùng lệnh ``man``:  
1: Các chương trình thực thi hoặc các lẹnh shell  
2: Các cuộc gọi hệ thống (các chức năng được cung cấp bởi kernel)  
3: Các cuộc gọi từ thư viện(các chức năng trong thư viện chương trình)  
4: Các tệp đặc biệt (thường được tìm thấy trong / dev)  
5: các tệp đặc biệt (thường được tìm thấy trong /etc/passwd  
6: Trò chơi  
7: Khác (bao gồm các gói và quy ước vĩ mô), ví dụ: man (7)  
8: Lệnh quản trị hệ thống (thường chỉ dành cho root)  
9: Kernel routines [Không chuẩn]  
### 1.8. man $section $file
- Khi mà một file có quá nhiều phần (section) thì ta dùng section để mở đúng được page
```
#man 1 mkdir
```
### 1.9 man man
- man cũng có manual page của nó  

```
#man man

```
### 1.10 mandb
- Nếu ta tin rằng 1 man page tồn tại nhưng không thể truy cập thì ta sử dụng lệnh
```
#mandb
```
