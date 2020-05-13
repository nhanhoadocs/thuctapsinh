# Lệnh `ps` (Process status)

Lệnh `ps` liệt kê các process đang chạy và PID của chúng cùng một số thông tin khác phụ thuộc vào các tùy chọn khác nhau.

Nó sẽ đọc thông tin quá trình từ các tệp ảo trong hệ thống `/proc`. 

`ps` có nhiều option để có thể chọn lọc đầu ra theo nhu cầu.

## Cú pháp
```
ps [option]
```

## Ý nghĩa một số trường thông tin
|Tên|Ý nghĩa|
|-|-|
|CMD|Câu lệnh thực thi tiến trình|
|%CPU|Lượng cpu sử dụng|
|%MEM|Lượng Ram tiêu thụ|
|PID|Mã tiến trình|
|PPID|Mã của tiến trình cha|
|UID|Mã người dùng|
|USER|Tên người dùng|
|PRI|Độ ưu tiên của tiến trình|
|RSS|Lượng bộ nhớ sử dụng thực|
|VSZ or SZ|Lượng bộ nhớ ảo sử dụng|
|S or STAT|Chứa đoạn mã code mô tả trạng thái của tiến trình|
|Start or STIME|Thời gian mà câu lệnh đó khởi động. Nhỏ hơn 24h là “HH:MM:SS”, lớn hơn là “Mmm dd”|
|TTY|Terminal liên quan tới tiến trình|

----

## 1. Xem thông tin shell hiện tại
```
ps
```
OUTPUT
```
  PID TTY          TIME CMD
 1928 pts/2    00:00:00 ps
 2064 pts/2    00:00:00 bash
```

Thông tin trong bảng:
|Tên|Ý nghĩa|
|-|-|
|`PID`|Id của tiến trình|
|`TTY`|Thông tin terminal mà người dùng đăng nhập|
|`TIME`|Lượng CPU tính bằng phút giây mà tiến trình đó chạy|
|`CMD`|Câu lệnh để thực hiện process đó|

**Lưu ý:** Một số tiến trình ghi TIME là 00:00:00 (như trong ví dụ) thì các tiến trình đó không sử dụng bất cứ thời gian CPU nào. Thường đó sẽ là tiến trình cha (Parent process), các tiến trình con sẽ sử dụng nó để thực thi.

## 2. Xem thông tin đầy đủ của tiến trình
### Cú pháp tiêu chuẩn
```
ps -ef
ps -eF
ps -ely
```

<img src = "https://i.imgur.com/x1GKgWd.png">

<img src = "https://i.imgur.com/R1K5Rpm.png">

<img src = "https://i.imgur.com/UTFRvbI.png">

### Cú pháp BSD
```
ps ax
ps aux
```

<img src="https://i.imgur.com/WqMsQ8M.png">

<img src="https://i.imgur.com/PRRZO3V.png">

## 3. In các tiến trình theo dạng cây phân cấp
Vì các tiến trình được phân cấp theo cha – con nên ta có thể theo dõi thông tin đó theo câu lệnh sau:
```
ps -ejH
ps axjf
```

<img src="https://i.imgur.com/Np5yB0m.png">

<img src="https://i.imgur.com/uT5Yo0G.png">

## 4. Hiển thị thông tin về luồng (Thread)
Ngoài thông tin về tiến trình, bạn có thể xem các thông tin về luồng bằng câu lệnh:
```
ps -eLf
ps axms
```

## 5. Xem các tiến trình theo user
```
ps -fG [tên user]
```

<img src="https://i.imgur.com/SqxqrQB.png">

## 6. Xem thông tin các tiến trình chạy dưới quyền root
```
ps -U root -u root u
```

<img src="https://i.imgur.com/erSaIe7.png">

## 7. Xem các thông tin theo các thông số cụ thể
Ngoài những thông tin có sẵn của các option (tuỳ chọn), ta có thể thêm một số trường thông tin khác để đưa ra ngoài bằng tuỳ chọn `-o`. Ví dụ, ta muốn xem thông tin `pid`, `ppid`, `cmd`, `%mem`, `%cpu` của tất cả các tiến trình đang chạy bằng lệnh:

```
ps -eo pid,ppid,cmd,%mem,%cpu
```

<img src="https://i.imgur.com/V97TnMd.png">

## 8. Hiển thị các process và tiến trình con của nó
```
ps -aef --forest
```

**Ví dụ:** Để xem các tiến trình con có tên là apache, ta làm như sau
```
ps -aef --forest | egrep apache
```

<img src="https://i.imgur.com/2WDy3Sv.png">

## 9. Hiển thị các process sử dụng nhiều RAM nhất theo thứ tự từ cao xuống thấp.
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
```

Mặc định head sẽ lấy 10 dòng đầu, tức là 9 process. Để xác định số process muốn hiển thị, ta thêm tùy chọn `-n <số tiến trình + 1>` sau `head`

<img src="https://i.imgur.com/3yJ9yVc.png">

## 10. Hiển thị các process sử dụng nhiều CPU nhất từ cao tới thấp
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head
```
<img src="https://i.imgur.com/v9Y5N6B.png">

## 11. Theo dõi xem process nào đang sử dụng nhiều CPU nhất
```
watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu'
```
Kết quả của lệnh trên sẽ hiển thị giống như bên dưới, dữ liệu được cập nhật 1 giây một lần.

<img src="https://i.imgur.com/S3SPbUz.png">

Để thoát khỏi cửa sổ trên, nhấn tổ hợp phím CTL + C để thoát.

## 12. Theo dõi xem process nào đang sử dụng nhiều RAM nhất
```
watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem'
```
Tương tự như với theo dõi process sử dụng nhiều CPU nhất

<img src="https://i.imgur.com/UyGw6kU.png">

## 13. Kiểm tra xem có process nào bị treo bởi trạng thái IOWait
Đây là trạng thái mà tiến trình gặp phải khi xuất hiện hiện tượng IOWait cao (thường là do ổ cứng bị quả tải về I/O). Lệnh này hữu ích khi kiểm tra xem hoạt động của database có bị chậm hay không.

Ta dùng một trong các cách bên dưới để kiểm tra

```
ps aux | awk '{if ($8 ~ "D") print $0}'
```

hoặc

```
watch -d -n 1 "(ps aux | awk '\$8 ~ /D/ { print \$0 }')"
```

Note:
- Giám sát VM KVM: `ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head`