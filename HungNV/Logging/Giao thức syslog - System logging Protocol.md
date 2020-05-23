# Giao thức syslog - System logging Protocol

Là giao thức được sử dụng để gửi thông điệp nhật ký hệ thống hoặc sự kiện đến một máy chủ cụ thể, được gọi là máy chủ syslog.
Nó chủ yếu được sử dụng để thu thập các  bản ghi thiết bị khác nhau ở cùng một vị trí trung tâm để xem xét và theo dõi. 

### 1. Đặc điểm

- Sử dụng cổng 514 để liên lạc 
- Là giao thức client-server  dùng để chuyển log và thông điệp đến máy nhận log. máy nhận log thường được gọi là syslogd, syslog daemon hoặc syslog server. 
- Syslog được phát triển năm 1980 bởi Eric Allman và là một phần của dự án Sendmail, và ban đầu chỉ được sử dụng duy nhất cho Sendmail
- Chuẩn syslog , mỗi thông báo đều được dán nhãn và được gán các mức độ nghiêm trọng. Các loại phần mềm có thể sinh ra thông báo như: auth, authPriv, cron, ftp, dhcp, mail, syslog,...

### 2. Các nguồn tạo log và mức độ cảnh báo 

File cấu hình mặc định của syslog nằm ở /etc/rsyslog.conf

##### Cấu hình syslog gồm 2 trường : 

###### Trường 1 : seletor 

Chỉ ra nguồn tạo log và mức ảnh báo của log đó.

**Các nguồn tạo log (Facility level)**

|Nguồn tạo log| Ý nghĩa|  
|-------------|--------|
| kernel | Những log mà do kernel sinh ra | 
|user|Log ghi lại cấp độ người dùng  |  
|mail|Log của hệ thống mail |  
|daemon|Log của các tiến trình trên hệ thống|  
|auth|Log từ quá trình đăng nhập hệ hoặc xác thực hệ thống|  
|syslog|Log từ chương trình syslogd|  
|lpr|Log từ quá trình in ấn|  
|news|Thông tin từ hệ thống|  
|uucp|Log UUCP subsystem|  
|authpriv|Quá trình đăng nhập hoặc xác thực hệ thống|
|ftp|Log của FTP deamon|  
|ntp|Log từ dịch vụ NTP của các subserver|  
|security|Kiểm tra đăng nhập|  
|console|Log cảnh báo hệ thống|  
|local 0 -local 7|Log dự trữ cho sử dụng nội bộ|  


**Mức cảnh báo của log (Severity Level)**

|Code|	Mức cảnh báo|	Ý nghĩa|
|----|--------------|----------|
|0|	emerg|	Thông báo tình trạng khẩn cấp|
|1|	alert|	Hệ thống cần can thiệp ngay|
|2|	crit|	Tình trạng nguy kịch|
|3|	error|	Thông báo lỗi đối với hệ thống|
|4|	warn|	Mức cảnh báo đối với hệ thống|
|5|	notice|	Chú ý đối với hệ thống|
|6|	info|	Thông tin của hệ thống|
|7|	debug|	Quá trình kiểm tra hệ thống|

> Muốn lưu log với mức cảnh báo nào thì .[tên cảnh báo đó]. 
VD: Muốn lưu log với tất cả mức cảnh báo như sau: mail.*

### 3. Cấu hình syslog

**Ip planning**

| Tên máy  | hệ điều hành | địa chỉ ip | 
|----------|--------------|------------|
|  Syslog server | CentOs 7  |192.168.161.207| 
|  Syslog client |  CentOs 7 |192.168.161.208|

##### Triển khai cấu hình 

**Trên syslog client**

vào file /etc/rsyslog.conf và thêm dòng sau vào cuối file với nội dung như sau: 

```
*.info;mail.*;authpriv.*;cron.*;security.*;console.*   @192.168.161.207
```

- @192.168.161.207 : là ip của máy server (thay ip bằng ip server của bạn)
- tất cả nguồn tạo log đều có mức cảnh báo là info trừ những nguồn tạo log như mail, cron, authpriv, secure đặt với tất cả các mức cảnh báo. 

  
**Trên syslog server**

vào file /etc/rsyslog.conf và chỉnh sửa như sau : 

- Tiến hành bỏ command như sau :

```
# Provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514

# Provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514
```
Thao tác này cho phép client và server giao tiếp với nhau qua TCP và UDP bằng cổng 514.

* Tiếp theo ta thêm đoạn sau vào cuối dòng cấu hình: 

```
$template RemoteServer, "/var/log/%fromhost-ip%/%SYSLOGFACILITY-TEXT%.log"
*.* ?RemoteServer
```
Thao tác này để khi log bắn về server, thư mục lưu log sẽ lưu bằng ip của client 

còn nếu muốn khi log bắn về server sẽ lưu thư mục với tên của máy thì thay đoạn trên bằng đoạn sau: 

```
$template RemoteServer, "/var/log/%HOSTNAME%/%SYSLOGFACILITY-TEXT%.log"
*.* ?RemoteServer
```
Làm xong bước này ta tiến hành restart lại rsyslog. 
```
systemctl restart rsyslog 
```

Sau đó ta kiểm tra xem trong file log đã hiển thị file có tên là ip của máy client chưa.

![Imgur](https://i.imgur.com/sPJz3cQ.png)

Nếu đã hiển thị thành công như trên, để đọc log của client, ta chỉ cần vào file có tên là địa chỉ ip của client đó đọc như bình thường. 

![Imgur](https://i.imgur.com/UFTtrTW.png)

Ta thấy ở đây file log trả về dựa trên cơ sở sinh log. 

Như vậy, ta đã cấu hình thành công rsyslog. 