Tìm hiểu về Cron
===
## Mục lục 
1. [Tổng quan](#1.-tổng-quan)
2. [Cách thức hoạt động](#2.-Cách-thức-hoạt-động)
3. [Cấu trúc file crontab](#3.Cấu-trúc-file-crontab)
4. [Tài liệu tham khảo](#4.-tài-liệu-tham-khảo)
## 1. Tổng quan
Cron là một tiện ích cho phép chạy các dòng lệnh theo một chu kì thời gian nào đó.

Crontab (hay Crontable) là file chứa các câu lệnh cài đặt của cron.

## 2. Cách thức hoạt động
Một số câu lệnh thường dùng:
```
crontab -e  #tạo hoặc sửa file crontab 
crontab -l  #hiển thị file crontab 
crontab -r  #xóa file crontab
```
Cài đặt:
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
*/5 * * * * command
```

- Chạy script vào 4h30 sáng thứ 5 hàng tuần:
```
30 4 * * 4 command
```
### 4. Tài liệu tham khảo
1. [Tìm hiểu về Cron](https://kb.iu.edu/d/afiz)
2. [Cài đặt Cron](https://www.tutorialspoint.com/unix_commands/crontab.htm)