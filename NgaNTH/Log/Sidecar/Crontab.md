# Tìm hiểu về Crontab trong Linux  

## 1. Crontab là gì?  

Cron là cách để tạo và thực hiện các tác vụ nào đó tự động theo định kỳ ở chế độ nền. Trong đó `cron job` là tập hợp các tác vụ cần thực hiện. `Crontab` là nơi lưu trữ các cronjob, trên linux cũng có sẵn một chương trình cũng có tên là `crontab` để chỉnh sửa lịch trình.  

Ta có thể sử dụng crontab để tự động sao lưu,đồng bộ cập nhật dữ liệu.  

## 2. Cơ chế làm việc và cách sử dụng Crontab  

Một `crontab` là một tệp văn bản đơn giản chứa danh sách các lệnh có nghĩa và được chạy tại các thời điểm được chỉ định. Nó được chỉnh sửa bằng lệnh `crontab`.

> File crontab không thể được chỉnh sửa bởi bất kỳ ứng dụng file editor nào. Chỉ duy nhất nhất lệnh crontab là có thể sửa nó.  

Các lệnh trong file crontab được kiểm tra bởi trình cron daemon và thực thi chúng trong nền hệ thống.  
Một số lệnh thường dùng:  
- `crontab -e`: tạo và chỉnh sửa file crontab.  
- `crontab -l`: hiển thị file crontab
- `crontab -r`: xóa file crontab  
- `cd /etc/cron.d`: nếu crontab được register bằng system cron.  

Hầu hết tất cả VPS đều được cài đặt sẵn crontab, tuy nhiên vẫn có trường hợp VPS không có. Nếu bạn sử dụng lệnh `crontab -l` mà thấy output trả lại `-bash: crontab: command not found` thì cần tự cài crontab thủ công.  

## 3. Cài đặt Crontab  
- Trên Ubuntu/Debian:
```
sudo apt-get install cron
```  
- Trên CentOS/Red Hat Linux:
```
yum install cronie
```
Sau khi cài đặt xong, thử kiểm tra xem nó đã cài đặt thành công rồi hay chưa bằng lệnh:

```
service crond status
```
Nếu output như dưới đây thì là OK.  
```
crond (pid 4370) is running...  
```
Nếu crontab vẫn chưa chạy thì bạn tự khởi động crontab và thiết lập tự động chạy mỗi khi reboot như sau:
```
service crond start
chkconfig crond on  
```

## 4.Cấu trúc của Crontab  
Một lệnh crobtab thường gồm 3 phần:  
- Trường thời gian: gồm 5 chỉ số thời gian để xác định một lịch trình.  
- Trường user-name: Xác định tài khoản nào được phép chạy crontab này. Nếu không chỉ định sẽ sử dụng user mặc định đã register crontab.  
- Tác vụ cần thực thi: tác vụ này có thể là một lệnh hoặc nhiều lệnh. Nếu có nhiều lệnh sẽ cách nhau bởi dấu chấm phẩy.

<img src="https://i.imgur.com/f0TlVeE.png">  

Ví dụ: Nếu bạn để cả 5 chỉ số thời gian là * thì có nghĩa là tác vụ của bạn sẽ chạy từng phút.  
```
* * * * * /bin/execute/this/script.sh
```
Bất kì trường thời gian nào nếu bạn để là * thì có nghĩa trường đó sẽ chạy every ~(Every minute, every day …)  
Ví dụ: 
- Chạy script 30 phút 1 lần
```
0,30 * * * * /bin/execute/this/script.sh
```
- Chạy script 15 phút 1 lần:
```
0,15,30,45 * * * * /bin/execute/this/script.sh
Hoặc 
*/15 * * * * /bin/execute/this/script.sh
```
- Chạy script vào 3 giờ sáng mỗi ngày:
```
0 3 * * * /bin/execute/this/script.sh
```

## Một số lệnh crontab phổ biến  

```
@reboot     Run once, at startup
@yearly     Run once  a year     "0 0 1 1 *"
@annually   (same as  @yearly)
@monthly    Run once  a month    "0 0 1 * *"
@weekly     Run once  a week     "0 0 * * 0"
@daily      Run once  a day      "0 0 * * *"
@midnight   (same as  @daily)
@hourly     Run once  an hour    "0 * * * *"
```
Ví dụ: thực hiện script.sh hàng ngày vào lúc 0 giờ, 0 phút.
```
@daily /bin/execute/this/script.sh
```
## Tắt tính năng gửi mail mỗi khi chạy crontab  

Mặc định cron gửi email cho quản trị viên mỗi khi thực thi cron job. Nếu bạn muốn tắt chức năng gửi email này đi thì hãy thêm đoạn sau vào cuối dòng.  
```
>/dev/null 2>&1
```
Ví dụ: 
```
0 15 * * 1,4 sh /etc/script.sh >/dev/null 2>&1
```
## Tạo log file
Nhiều khi bạn muốn lưu lại log để khi kiểm tra xem việc crontab chạy có đúng ý hay không. Để lưu log vào file bạn làm như sau:
```
@daily /bin/execute/this/script.sh > /home/username/cronlogs/script_output.log
```  

## Bài tập ví dụ  
Viết script cập nhật thời gian vào một file.
Crontab thực thi 5 phút/lần.  

Bước 1:  
Tạo file script `testtime.sh`  
```
#!bin/bash
echo $(date) >> /home/test
```
=> Ý nghĩa: nhập thông tin thời gian vào trong file `test` nằm ở `/home/test`.  

Bước 2:  
Tạo file crontab thực hiện tác vụ nhập thông tin thời gian cứ 5 phút/lần  
```
crontab -e
*/5 * * * * sh /home/testtime.sh
```
Bước 3: Mở file test và xem kết quả  

<img src="https://i.imgur.com/jpPL0lT.png">