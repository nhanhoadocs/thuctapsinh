Log là ghi lại nhật ký của hệ thống

Ứng dụng của log:
 * Tàm rõ nguyên nhân của một vấn đề
 * Giúp khắc phục sự cố nhanh hơn khi có sự cố
 * Giúp phát hiện và dự đoán các vấn đề có thể xảy ra với hệ thống.

Syslog là giao thức xử lý các file log. Các file log có thể được lưu trên chính máy đó hoặc được chuyển lên lưu tại một máy khác.

Một số đặc điểm:
 * Syslog có thể gửi qua TCP hoặc UDP
 * Dữ liệu được gửi dạng cleartext
 * Syslog mặc định dùng cổng 514

Rsyslog là một dịch vụ sử dụng giao thức syslog để đẩy log.

Một bản tin log có 3 phần

 * Phần đầu chỉ ra mức độ ưu tiên của bản tin log
 * Header: Xác định thời gian và hostname
 * Nội dung của bản tin log

Syslog facility levels: Mức độ nghiêm trọng của log đánh giá thông qua nguồn tạo log
Syslog severity levels: Đánh giá mức độ nghiêm trọng thông qua mức cảnh báo (debug, info,notice,..)
**Tạo thư mục log cho từng server**

Thêm vào cuối file `/etc/rsyslog.conf`

Sử dụng tên thư mục là IP

```
$template RemoteServer, "/var/log/%fromhost-ip%/%SYSLOGFACILITY-TEXT%.log"
*.* ?RemoteServer
```

Sử dụng tên thư mục là tên server

```
$template RemoteServer, "/var/log/%HOSTNAME%/%SYSLOGFACILITY-TEXT%.log"
*.* ?RemoteServer
```

Nếu muốn các file log lưu theo định dạng tên chương trình thay cho nguồn sinh ra log thì sử dụng `%PROGRAMNAME%.log` thay cho `%SYSLOGFACILITY-TEXT%.log`

**Cấu hình log cho http**

Trên Centos

File `vi /etc/httpd/conf/httpd.conf`

Thêm dòng

```
ErrorLog syslog:local2
CustomLog "| /usr/bin/logger -thttp_acces -plocal2.info" combined
CustomLog "| /usr/bin/logger -thttpd-error.log -plocal1.info" combined
```

Trên Ubuntu

File: `/etc/apache2/apache2.conf` thêm dòng

```
ErrorLog syslog:local1
```
File `/etc/apache2/sites-enabled/000-default.conf` thêm dòng

```
ErrorLog syslog:local1
CustomLog "| /usr/bin/logger -taccess -plocal1.info" combined
```
