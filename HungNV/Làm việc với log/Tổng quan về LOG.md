# Tổng quan về LOG 

**Giới thiệu**

Thư mục chứa log cung cấp cho ta 1 lịch sử trực quan về mọi thức đang diễn ra trong trung tâm hệ điều hành linux. Vì vậy, nếu có gì sai thì nó sẽ cung cấp 1 nơi để lưu lại các trạng thái để quản trị viên tìm ra thủ phạm. 

File log được ghi vào thư mục /var/log. 

### 1. Các thư mục và file log 

###### Các thư mục log được nhóm theo 4 nhóm như: 
+ Nhật ký ứng dụng 
+ Nhật ký sự kiện 
+ Nhật ký dịch vụ 
+ Nhật ký hệ thống 

###### Chi tiết các bản nhật ký: 

* `/var/log/syslog` hoặc `/var/log/message` : hiển thị thông báo và thông tin chung về hệ thống. Là 1 bản ghi dữ liệu của tất cả các hoạt động trên toàn cầu. Đối với ubuntu là syslog còn rhel là message 

* `/var/log/auth.log` hoặc `/var/log/secure` : Giữ nhật ký xác thực cho cả thông tin đăng nhập thành công hoặc thất bại và quy trình xác thực. 

* `/var/log/boot.log` : Thông điệp khởi động và thông tin khởi động 

* `/var/log/maillog` hoặc `/var/log/mail/log` : Dành cho nhật ký máy chủ thư, tiện dụng cho postfix, smtpd hoặc thông tin dịch vụ liên quan đến email đang chạy trên máy chủ. 

* `/var/log/ kern` : giữ trong nhật ký kernel và thông tin cảnh báo. 

* `/var/log/dmesg` :  kho lư trữ thông điệp  trình điều khiển thiết bị

* `/var/log/cron` : giữ 1 bản ghi các tin nhắn liên quan đến công việc  cron

* `/var/log/daemon.log` : theo dõi các dịch vụ chạy nền
t

* `/var/log/lastlog` : giữ thông tin đăng nhập cuối cùng của mọi người dùng.

*  `/var/log/yum.log` : giữ dữ liệu trên mọi cài đặt gói đã sử dụng lệnh yum .
 
* `/var/log/httpd` : thư mục chứa các tệp erro_log và access_log của daemon apache httpd. mọi lỗi mà httpd gặp phải đều được giữ trong tệp error_log., access_log giữ mọi thông tin yêu cầu đến thông qua http
 
 * `/var/log/wtmp` : chứa thông tin đăng nhập của các user login vào hệ thống. Để mở file này sử dụng cú pháp như sau : `utmpdump /var/log/wtmp | less`

### Chế độ rotate của log 

Để ngăn cản những files log ngày càng trở lên cồng kềnh và khó kiểm soát, 1 hệ thống quay vòng log file (a log file rotation scheme) được cài đặt. 

Hệ thống cron đưa ra các kệnh để thiết lập những log files mới, những file cũ được đổi tên bằng cách thay một con số ở hậu tố. 

Với loại quay vòng này, /var/log/messages của ngày hôm qua sẽ trở thành messages.1 của ngày hôm nay và một messages mới được tạo. Sự luân phiên này được cấu hình cho một số lượng lớn các file, và các log files cũ nhất sẽ được xoá khi sự luân phiên bắt đầu chạy.

Tiện ích thi hành rotatin là logrotate. File cấu hình mặc định là /etc/logrotate.conf. 

```
# see "man logrotate" for details
# rotate log files weekly   ( Hệ thống sẽ quay vòng log files hàng tuần)
weekly

# keep 4 weeks worth of backlogs     (Lưu lại những thông tin logs đáng giá trong 4 tuần)
rotate 4

# create new (empty) log files after rotating old ones 
create

# use date as a suffix of the rotated file  (Sử dụng định dạng Ngày tháng thêm vào để làm hậu tố của log files)
dateext

# uncomment this if you want your log files compressed
#compress

# RPM packages drop log rotation information into this directory   (Thông tin về sự quay vòng log của các gói RPM nằm trong /etc/logrotate.d)
include /etc/logrotate.d

# no packages own wtmp and btmp -- we'll rotate them here  (rotation được thiết lập cho 2 files: /var/log/wtmp và /var/log/btmp)
/var/log/wtmp {
    monthly
    create 0664 root utmp
        minsize 1M
    rotate 1
}

/var/log/btmp {
    missingok
    monthly
    create 0600 root utmp
    rotate 1
}

# system-specific logs may be also be configured here.
```

### Một số lệnh thường dùng khi đọc log. 

- In ra màn hình n dòng log cuối cùng 

```
tail -n [Đường dẫn file cần hiển thị]
```

- Xem file log realtime

```
tail -f /var/log/messages
```

- Đếm số dòng xuất hiện từ cần tìm trong file 

```
ack -c [từ cần tìm] [đường dẫn file hoặc thư mục]
```

* Sử dụng grep để lọc thông tin 

```
cat [file chứa log] | grep [từ cần lọc]
```

* Đọc định dạng file wtmp với utmpdump 

```
utmpdump /var/log/wtmp | less 
```

* Lọc ra tất cả các file chứa từ cần tìm 

```
grep -Rin "[từ cần tìm]" /var/log
```

