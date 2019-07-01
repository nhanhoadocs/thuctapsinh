# Package manager 

- Package manager là một tập hợp phần mềm dùng để quản lý việc cài đặt và nâng cấp các ứng dụng   
- Các gói có thể phụ thuộc vào nhau 
- package manager theo dõi các bản cập nhật và nâng cấp của các chương trình phần mềm 
- package manager là nơi lưu trữ chứa các phần mềm, các file cấu hình, và thông tin về các phụ thuộc 
- Các tính năng mà hầu hết các ứng dụng quản lý gói cung cấp là: 
    - Package download: cho phép người dùng tải về các gói từ một nhà cung cấp và lưu trữ trong kho lưu trữ 
    - Dependency resolution: cung cấp thông tin về các gói khác được yêu cầu bởi gói trong câu hỏi giúp quản lý cập nhật 
    - A standard binary package format: các gói được chuẩn hóa một cách thống nhất trên toàn hệ thống
    - Quality control: - Để  kiểm tra phần mềm có ổn định hay không và gây ít lỗi 
    - Additional system-related configuration and functionality: Cập nhật bản vá lỗi cho phần mềm được phân phối trong các gói 
- Tất  cả các hệ điều hành đều cung cấp 2 loại gói đó là gói loại cấp độ: cao và thấp 
- Ta cài đặt các gói từ nhà cung cấp 
- Các gói có thể hoạt độc lập nhưng có những gói còn hoạt động theo group 
- Một số gói ở cấp độ cao có thể dùng được gói ở cấp độ thấp nếu như cần tới
- Khi cài đặt một gói đơn lẻ có thể kết quả là hàng chục hoặc hàng trăm gói phục thuộc được cài đặt theo 


# Một số câu lệnh trong việc cài đặt các gói 
|              centOS              |              Ubuntu              |                   Hoạt động của lệnh                |
|--------------------------------|----------------------------------|-----------------------------------------------------|
|         rpm -i file.rpm        |      dpkg --install file.deb     |   Cài đặt một gói                                   |
|         yum install file       |      apt-get install flie        |   cài đăt một gói phụ thuộc vào kho lưu trữ         |
|         rpm -e file.rpm        |      dpkg --remove  file.deb     |   Gỡ một gói                                        |
|         yum remove file        |      apt-get remove file         |   Gỡ bỏ một gói phụ thuộc vào kho lưu trữ        |
|         rpm -U file.rpm        |      dpkg --install file.deb     |   Update một gói có phiên bản mới                   |
|         yum update file        |      apt-get upgrade file        |   update một gói sử dụng và phụ thuộc kho lưu trữ   |
|         yum update             |      apt-get dist-upgrade        |   update toàn bộ hệ thống                           |
|         yum list installed     |      dpkg --list                 |   hiển thị tất cả các gói đã cài đặt trong máy      |
|         rpm -qil file          |      dpkg --listfiles file       |   Nhận thông tin về gói đã cài đặt                  |
|         yum list file          |      apt-cache search file       |   Hiển thị hiển thị các gói có sẵn có foo trong tên |
|         yum list               |      apt-cache dumpavail         |   Hiển thị tất cả các gói có sẵn                    |
|         rpm -qf file           |      dpkg --search file          |   Hiển thị các gói mà một file thuộc về             |


# lưu ý: file ở câu lệnh là một gói một ứng dụng hoặc một phần mềm mà muốn cài đặt 

## Tham Khảo

https://github.com/duckmak14/linux/blob/master/finish/Packagemanagement.md
