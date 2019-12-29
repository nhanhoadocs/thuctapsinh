### Command Line   
Biến PS1 là một chuỗi kí tự được hiển thị dưới dạng dấu nhắc trên dòng lệnh. Hầu hết các bản phân phối đặt PS1 thành một giá trị mặc định đã biết, ví dụ người dùng(tên user) và tên máy chủ:   
```
[root@server ~]#
```
Điều này có thể hữu ích nếu bạn đang làm việc trong nhiều vai trò và muốn luôn được nhắc nhở về việc bạn là ai và bạn đang dùng máy gì.
```
[root@server ~]# echo $PS1
[\u@\h \W]\$
```

PS1 là biến chính điều khiển dấu nhắc dòng lệnh của bạn. Các ký tự đặc biệt trong PS1 :  
- `\u` : Tên người dùng  
- `\h` : Tên máy chủ  
- `\w` : Thư mục làm việc hiện tại  
- `\!` : Số lịch sử của lệnh này  
- `\d` : Ngày

<img src="https://i.imgur.com/CHd6Xvn.png">
