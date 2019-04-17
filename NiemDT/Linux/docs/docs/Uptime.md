# Uptime
Câu lệnh `uptime` là câu lệnh cho biết hệ thống đã chạy được bao lâu
Lệnh này sẽ trả về các trường sau:
 * Thời điểm hiện tại
 * Trạng thái của hệ thống
 * Hệ thống đã chạy được bao lâu
 * Số user đang login 
 * Tải trung bình của hệ thống trong 1, 5, 15 phút cuối cùng

Cú pháp:
`uptime [option]`
```
niemdt@niemdt:~$ uptime
 14:55:55 up  1:19,  1 user,  load average: 0,43, 0,43, 0,36
```
* Option `-p` chỉ hiển thị thời gian hệ thống đã chạy 
```
niemdt@niemdt:~$ uptime -p
up 1 hour, 20 minutes
```
* Option `-s` trả về ngày và giờ hệ thống được bất
```
niemdt@niemdt:~$ uptime -s
2018-12-13 13:36:20
```
