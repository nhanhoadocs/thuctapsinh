Tìm hiểu về Cron
===
## Mục lục 
1. [Tổng quan](#1.-tổng-quan)
2. [Cách thức hoạt động](#2.-Cách-thức-hoạt-động)
3. [Cấu trúc file crontab](#3.Cấu-trúc-file-crontab)
4. [Ví dụ cụ thể](#4.-ví-dụ-cụ-thể)
5. [Tài liệu tham khảo](#4.-tài-liệu-tham-khảo)
## 1. Tổng quan
Cron là một tiện ích cho phép chạy các dòng lệnh theo một chu kì thời gian nào đó. Crond là một daemon process, điều này cho phép nó chạy ngầm mãi mãi trong hệ thống linux 

Crontab (hay Crontable) là bảng chứa các câu lệnh cài đặt của cron. Nhờ có crontab, ta có thể sử dụng để có thể chạy những công việc tự động theo một lịch trình cụ thể đã cài đặt từ trước.

## 2. Cách thức hoạt động
Một số câu lệnh thường dùng:
```
crontab -e  #tạo hoặc sửa file crontab 
crontab -l  #hiển thị file crontab 
crontab -r  #xóa file crontab
```
Thông thường, trên một số máy vps đã được cài sẵn tiện ích cron. Ta có thể kiểm tra bằng cách gõ `crontab -l`. Nếu máy thông báo lỗi cú pháp của crontab thì máy của bạn chưa được cài đặt tiện ích này.

Để cài đặt, bạn gõ lệnh như sau:
```
sudo yum -y install cronie
```

Khởi chạy crontab và tự khởi động khi đăng nhập:
```
systemctl start crond
systemctl enable crond
```

### 3. Cấu trúc file crontab

Một crontab file thường có 5 trường thiết lập thời gian như sau:
```
*     *     *     *     *   command
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +-- day of week (0 - 6) (Sunday=0)
|     |     |     +--- month (1 - 12)
|     |     +----- day of month (1 - 31)
|     +------- hour (0 - 23)
+--------- min (0 - 59)
```

Ví dụ:
- Chạy script 5 phút 1 lần:
```
*/5 * * * * sh simplescript.sh
```

- Chạy một script python vào 4h30 sáng thứ 5 hàng tuần:
```
30 4 * * 4 python3 pythonscript.py
```
> Lưu ý: để chạy các script, bạn phải thông báo môi trường chạy cho script đó.

### 4. Ví dụ cụ thể

Trong quá trình thực tập, tôi luôn phải gửi mail báo cáo cho người phụ trách để thông báo về tiến độ làm việc của mình vào tối mỗi tuần từ thứ 2 đến thứ 6 hàng tuần. Tuy nhiên, vào những lúc đó tôi hay đi chơi. Vì vậy, tôi đã sử dụng tiện ích cron để hỗ trợ gửi mail tự động vào đúng thời gian đó với một nội dung tôi đã soạn từ trước.

Đầu tiên, tôi viết sẵn một đoạn bash shell gửi email tự động có tên là `gui-baocao.sh`. Shell này sẽ có chức năng lấy văn bản từ một file txt có trước, thêm thông tin tiêu đề cho email rồi gửi email tới danh sách đối tượng đã cho trước.

Tiếp đến, tôi tiến hành soạn trước một báo cáo trên máy có tên là `baocao.txt`. 

Sau đó tiến hành thêm vào crontab và cài đặt chu kì thời gian cho nó như sau:
```
0 19 * * 1-5 sh /home/huan/gui-baocao.sh
```
Như vậy, mỗi tối tôi có thể đi chơi thoả mái mà báo cáo vẫn sẽ được gửi đúng giờ.

Sau này, khung giờ báo cáo của tôi thay đổi, tôi chỉ cần gửi báo cáo vào tối thứ 3 và thứ 6 hàng tuần. Vì vậy, tôi thay đổi file crontab của mình như sau:
```
0 19 * * 2,5 sh /home/huan/gui-baocao.sh
```

### 5. Tài liệu tham khảo
1. [Tìm hiểu về Cron](https://kb.iu.edu/d/afiz)
2. [Cài đặt Cron](https://www.tutorialspoint.com/unix_commands/crontab.htm)