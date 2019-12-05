# Một số lệnh cơ bản


### Change directory
Để thay đổi thư mục làm việc ta sử dụng lệnh `cd`\
Cú pháp `cd [path]`

Một số lệnh đặc biệt:

|Commands|Note|
|--------|----|
|`cd`|Trở về thư mục home|
|`cd /`|Trở về thư mục gốc (`/`)|
|`cd ..`|Trở về thư mục cha|
|`cd -`|Trở về thư mục trước đó|


### List file and directory
Để liệt kê các file và thư mục\
Cú pháp: `ls [options] [path]`

Các option:

|Options|Note|
|--------|----|
|-l|Liệt kê hiển thị theo danh sách|
|-a|Liệt kê tất cả các file và thư mục ẩn|


### System Shutdown

|Commands|Descriptions|
|--------|------------|
|halt|Dừng CPU|
|init 0|Tắt máy an toàn, dọn dẹp hệ thống trước khi tắt|
|init 6|Khởi động lại|
|poweroff|Tắt máy|
|reboot|Khởi động lại|
|shutdown|Tắt máy|

### Xác định vị trí ứng dụng hoặc tiện ích
Lệnh `which` giúp xác định vị trí của chương trình hoặc tiện ích trong hệ thống

Cú pháp: `which <name>`

Ngoài ra ta có thể sử dụng lệnh `whereis` để xác định, lệnh này sẽ tìm kiếm xâu hơn trong hệ thống để xác định vị trí