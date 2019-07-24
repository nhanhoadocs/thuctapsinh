<a name= "Quản lý nhật ký" >

# Quản lý nhật ký

- Khái niệm log-nhật ký

    - Để có thông tin về các thao tác đã được thực hiện 
    - Để có thông tin về các sự kiện đã xảy ra 
    - Log-nhật ký là tập hợp các thông báo được hệ thống sinh ra, lưu trong các tệp nhật ký-log file. 
    - Các thông báo có thể là 
        - Thông báo của hệ thống 
        - Lỗi trong các thao tác của hệ thống 
        -  Quá trình đăng nhập, đăng xuất 
        - Thông báo từ một số ứng dụng

<img src="https://imgur.com/KVStG6M.jpg">


- syslog

    - Chương trình quản lý các thông báo từ các thành phần của hệ thống 
    - Được thực hiện bằng `syslogd daemon.` 
    - Khởi động cùng hệ thống 
     `/etc/init.d/syslog { start | stop | reload }` 
     - Cấu hình của syslog được lưu trong tệp 
     `/etc/syslog.conf`
     
     - Tệp cấu hình /etc/syslog.conf

- Các dòng của tệp cấu hình có dạng

<img src="https://imgur.com/H0qKoYB.jpg">


    -  Facility là nguồn gốc sinh ra thông báo 
    - “priority” là mức độ quan trọng của thông báo 
    - Action là thao tác thực hiện khi nhận được thông báo  Ghi vào tệp, gửi email.\,,

 <img src="https://imgur.com/ID53jKM.jpg">

 <img src="https://imgur.com/Uw79tuh.jpg">


  <img src="https://imgur.com/2NmnnWw.jpg">


 <img src="https://imgur.com/bdla2qJ.jpg">
