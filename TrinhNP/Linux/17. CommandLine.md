# Command Line

Biến `PS1` là chuỗi ký tự được hiển thị dưới dạng dấu nhắc trên dòng lệnh. Hầu hết, các phiên bản đều đặt `PS1` thành một giá trị mặc định đã biết. Ví dụ: tên người dùng và máy chủ tương ứng:

`[root@localhost ~]#`

Nó thật sự hữu dụng vì luôn hiển thị để người dùng biết họ đang làm việc ở chế độ người dùng nào.

Ta có thể tùy chỉnh bằng cách thay đổi giá trị của `PS1`.

Ta xem giá trị mặc định của `PS1`:
```
[root@localhost ~]# echo $PS1
[\u@\h \W]\$
```

Trong đó: 
- `\u` : tên user
- `\h` : hostname
- `\W` : thư mục đang làm việc
- `\$` : kí tự đại diện cho loại tài khoản

Để tùy biến ta chỉ cần thay đổi giá trị của `PS1`, ta sử dụng lệnh `export`. Ví dụ: 
```
[root@localhost ~]# export PS1='[\h@\u \W]\$'
[localhost@root ~]# 
```