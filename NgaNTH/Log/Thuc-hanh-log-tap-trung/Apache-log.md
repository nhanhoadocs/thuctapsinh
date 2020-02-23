## Thực hành đẩy log Apache về Rsyslog Server  

### 1. Mô hình lab  

<img src="https://i.imgur.com/q39MX9z.png">  

IP Planning  

<img src="https://i.imgur.com/AEqbXpJ.png">  

### 2. Triển khai
### Trên client1

- Cài đặt dịch vụ Apache và cấu hình trong file `etc/rsyslog.conf` để đẩy log về server có địa chỉ IP là `192.168.152.134` trên port `514`.  
```
yum install -y httpd  
```  
và 
```
[root@client1 ~]# vi /etc/rsyslog.conf
*.* @@192.168.152.134:514
```  
- Kiểm tra dịch vụ web   

<img src="https://i.imgur.com/ZL7l35T.png">   

**Cấu hình đẩy log Apache về Rsyslog Server**  

### Cách 1: Sử dụng Rsyslog  

Tạo và thêm cấu hình sau vào file apache.conf:
```
$ModLoad imfile #Dòng này chỉ thêm một lần

# Apache error file: 
$InputFileName /var/log/httpd/error_log #Đường dẫn file log muốn đẩy
$InputFileTag errorlog #Tên file 
$InputFileSeverity info #Các log từ mức info trở lên được ghi lại
$InputFileFacility local3 #Facility log
$InputRunFileMonitor

# Apache access file:
$InputFileName /var/log/httpd/access_log
$InputFileTag accesslog
$InputFileSeverity info
$InputFileFacility local4
$InputRunFileMonitor

$InputFilePollInterval 10 #Cứ sau 10 giây lại gửi tin nhắn
```  
- Restart rsyslog  
```
systemctl restart rsyslog
```  
- Sử dụng lệnh `tcpdump` ở terminal máy chủ để bắt các gói tin đẩy về server. Đồng thời truy cập địa chỉ IP máy client trên trình duyệt web. Ta thấy kết quả các gói tin mà tcpdump bắt được:  

<img src="https://i.imgur.com/DiFiz2u.png">  

Như các bạn thấy các gói tin local được đẩy về Rsyslog Server.  
Kiểm tra trên Rsyslog server  

<img src="https://i.imgur.com/FGh68Du.png">  

### Cách 2: Sử dụng **Logger**  

Unix/Linux cung cấp lệnh `logger` là một lệnh thực sự hữu ích để giải quyết hệ thống ghi log. Lệnh logger gửi các thông báo ghi log tới `syslogd deamon`, và do đó kích thích hệ thống ghi log.  

- Thêm 2 dòng sau vào cuối file `/etc/httpd/conf/httpd.conf`  
```
ErrorLog "|/bin/sh -c '/usr/bin/tee -a /var/log/httpd/httpd-error.log | /usr/bin/logger -thttpd -plocal1.info'"
CustomLog "| /bin/sh -c '/usr/bin/tee -a /var/log/httpd/httpd-access.log | /usr/bin/logger -thttpd -plocal2.info'" combined
```  
Lưu ý:  
- `ErrorLog` trả về server file `local1.info`  
- `AccessLog` trả về server file `local2.info` 
Sau đó restart dịch vụ httpd  
```
systemctl restart httpd
```  
- Dùng `tcpdump` để kiểm tra  

<img src="https://i.imgur.com/Ae3gBC9.png">  

Kiểm tra trong thư mục `var/log` của Rsyslog Server  

<img src="https://i.imgur.com/TzzhJZF.png">  

**Chú ý 2 định dạng cấu hình file log client đẩy về server**  
- Định dạng 1: `%PROGRAMNAME%.log` – tên theo các chương trình  
    - Với cách sử dụng Logger định dạng này log apache được đẩy về server sẽ có tên `httpd.log`
    - Theo cách cấu hình Rsyslog tên file log đẩy về sẽ là: `errorlog.log` và `accesslog.log` như cấu hình ở trên.  

- Định dạng 2: `%SYSLOGFACILITY-TEXT%.log` tên theo cơ sở sinh ra log.  
    - Log apache được đẩy về theo cách sử dụng Logger: tên file chứa log sẽ là `local1.log` và `local2.log`.  
    - Theo cách dùng Rsyslog, tên file chứa log sẽ là `local3.log` ứng với `errorlog`, `local4.log` ứng với `accesslog`.  

Tài liệu tham khảo:  https://news.cloud365.vn/rsyslog-apachelog-lab-phan-2-huong-dan-cau-hinh-day-log-apache-ve-ryslog-server/