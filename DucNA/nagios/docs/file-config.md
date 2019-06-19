Mô hình của file config 

![](../images/file-config/screen_6.png)

Sau khi có CGI thì nagios sẽ đọc file mainconfig và bắt đầu công việc của mình 

# Main Configuration File
Main Configuration File là nơi lưu trữ thông tin chính của nagios. có tên là `nagios.cfg` và được lưu trong ` /usr/local/nagios/etc/`. Các biến main file là 

1. Log File 
- Format : log_file = file-name
- Example: 
```
log_file = /usr/local/nagios/var/nagios.log
```
Biến này được dùng để chỉ định nơi tạo file log của nó. debug của file config cũng được lưu lại vào file log này 

2. Object Configuration File
- Format: cfg_file= <file_name>
- Example: 
```
cfg_file=/usr/local/nagios/etc/hosts.cfg
```
Biến này dùng để trỏ đến file Object Configuration File 

3. Object Configuration Directory
- 
# Link tham khảo 
https://nsrc.org/workshops/2008/walc/nagios/manual/nagios-3.pdf