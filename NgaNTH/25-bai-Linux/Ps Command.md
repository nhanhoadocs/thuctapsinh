### Tìm hiểu Lệnh Ps trong Linux  



`ps` (process status) là một tiện ích để xem thông tin các tiến trình đang chạy trong hệ thống. Tiện ích `ps` sẽ đọc thông tin tiến trình từ một file ảo nằm trong thư mục `/proc`.  
Cấu trúc:  
```
ps  [option]
```
**Lệnh hiển thị tất cả các thông tin**  
```
ps -l
```
<img src="https://i.imgur.com/Id2iDkK.png">
Trong đó:

F - giá trị Flag   
S - STAT  
UID - User ID  
PID - Process ID  
PPID - Parent Process ID
TTY - thông tin terminal mà người dùng đăng nhập
TIME - lượng CPU tính bằng phút giây mà tiến trình đó chạy  
CMD - lệnh thực thi tiến trình  

**Lệnh hiển thị mọi tiến trình trong hệ thống**  
```
# ps -e
# ps -ef
# ps -eF
# ps -ely
```
<img src="https://i.imgur.com/YOkXMOs.png">

**Hiển thị tiến trình dưới dạng cây phân cấp**
```
# ps -ejH
# ps axjH
```
<img src="https://i.imgur.com/TATgroj.png">

**Hiển thị luồng (Display info about threads)**
```
# ps -eLf
# ps -axms
```

**Troubleshoot  with ps**  

- Sắp xếp tiến trình theo thời gian bắt đầu:
```
ps -ef --sort=start_time
```
<img src="https://i.imgur.com/wpYlVOo.png">  

- Sắp xếp tiến trình theo sử dụng bộ nhớ  
```
# ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
```
<img src="https://i.imgur.com/VDo1UWC.png">

- Real time monitoring  
    + Sử dụng lệnh *watch* để xem tiến trình nào đang làm high cpu:  
```
# watch -n 1 'ps -aux | sort -nrk 4 | head'
```
<img src="https://i.imgur.com/Ae8SC5d.png">

Lưu ý: `n` là chỉ định khoảng thời gian, cứ sau 1s thực hiện 1 dòng.  
Nhấn Ctrl + C để exit.  
Hoặc ta có cách khác:  

```
# watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu'  
```
<img src="https://i.imgur.com/Rf0VdwN.png">

- Xem tiến trình nào đang chiếm bộ nhớ: 
```
# watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem' 
```  

<img src="https://i.imgur.com/V2mLWLF.png">

- Hiển thị có bao nhiêu tiến trình được tạo bởi mỗi người dùng:  
```
# ps -ef | cut -d " " -f 1 | sort -n | uniq -c | sort -nr
```
<img src="https://i.imgur.com/zsE6G4K.png">

- Hiển thị tất cả các tiến trình Zombie:  
```
# ps aux | grep "defunct"
# ps aux | grep Z
```
- Hiển thị tiến trình bị kẹt trong D state IOWait (Display process stuck in D state IOWait)  
```
ps aux | awk '{if ($8 ~ "D") print $0}'
```
- Đếm số lượng thread được tạo bởi 1 tiến trình xác định:  
```
# ps - T 7374 | cut -d " " -f 2 | wc -l
```
<img src="https://i.imgur.com/XDsD51l.png">

CHÚ Ý:  
`ps -e` và `ps e` là 2 lệnh khác nhau.  
`ps -ef` và `ps aux` có cùng bản chất.  

`pgrep` và `pkill` nhìn các tiến trình hiện tại đang chạy và liệt kê các ID tiến trình (PID), cái mà được chọn theo tiêu chí *stdout*.
Ví dụ dưới đây chỉ liệt kê tiến tình gọi *sshd* và người thực hiện là *root*.  
```
# pgrep -u root sshd
```
<img src="https://i.imgur.com/cQsHo4U.png">

**Killing the process**  
Để kill một tiến trình thì bạn phải biết PID của tiến trình, sau đó sử dụng `SIGKILL` hoặc tùy chọn `9` để chấm dứt tiến trình.  
```
# kill -9 <pid_of_mysql>  
```


Tài liệu tham khảo:  
- https://news.cloud365.vn/ps-command-tim-hieu-va-huong-dan-su-dung/  
- https://8gwifi.org/docs/linux-ps-commands.jsp  

