# Locate

https://quantrimang.com/tim-kiem-trong-moi-truong-dong-lenh-voi-lenh-locate-86119

https://www.tecmint.com/linux-locate-command-practical-examples/

## Cài đặt

Cài đặt locate trên Ubuntu và Debian

    $ sudo apt update
    $ sudo apt install mlocate

Cài đặt locate trên CentOS và Fedora

    $ sudo yum install mlocate

## Cách lệnh locate hoạt động

Lệnh locate tìm kiếm một pattern (mẫu) nhất định thông qua file cơ sở dữ liệu được tạo bởi lệnh `updatedb`. Các kết quả tìm thấy được hiển thị trên màn hình, mỗi kết quả trên một dòng.

Trong quá trình cài đặt gói `mlocate`, một cron job được tạo để chạy lệnh `updatedb` cứ sau 24 giờ. Điều này đảm bảo cơ sở dữ liệu được cập nhật thường xuyên. Để biết thêm thông tin về cron job, hãy kiểm tra file `/etc/cron.daily/mlocate`.

Cơ sở dữ liệu có thể được cập nhật thủ công bằng cách chạy lệnh `updatedb` với quyền root hoặc người dùng có quyền sudo:

    $ sudo updatedb

Quá trình cập nhật sẽ mất một chút thời gian, tùy thuộc vào số lượng file và thư mục, cũng như tốc độ hệ thống của bạn.

Các file được tạo sau khi cập nhật cơ sở dữ liệu sẽ không được hiển thị trong kết quả lệnh `locate`.

So với lệnh `find` mạnh hơn khi tìm kiếm hệ thống file, lệnh `locate` hoạt động nhanh hơn nhưng thiếu nhiều tính năng và chỉ có thể tìm kiếm theo tên file.

## Sử dụng

Ví dụ

    updatedb
    locate *.php

các option 

`-n`: Giới hạn số kết quả hiển thị

    locate -n 10 *.py

`-i`: Không phân biệt chữ hoa, thường

    locate -i readme.md

`-c`: Đếm kết quả

    locate -c .bashrc
    6
`-e`: Hiển thị các kết quả tại thời điểm đó (xem như dùng kết hợp với lênh `updatedb`)

