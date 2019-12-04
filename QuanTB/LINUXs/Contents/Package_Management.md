# PACKAGE MANAGEMENT

Phụ thuộc vào các distro khác nhau mà sẽ có những trình quản lý gói khác nhau như debian và rpm sẽ có các trình quản lý gói khác nhau

Các trình quản lý gói được chia làm 2 loại:
- **Trình quản lý gói cấp thấp**: `rpm`, `dpkg`
- **Trình quản lý gói cấp cao**: `yum`, `apt-get`

Đối với các trình quản lý gói cấp cao sẽ giúp ta kiểm tra và quản lý tất cả các phụ thuộc.

## Trình quản lý gói cấp thấp

|RPM|Debian|Note|
|---|------|----|
|rpm -i foo.rmp|dpkg --install foo.deb|Cài đặt package|
|rpm -e foo.rpm|dpkg --remove foo.deb|Gỡ cài đặt package|
|rpm -U foo.rpm|dpkg --install foo.deb|Cập nhận package|
|rpm -qil foo|dpkg --listfiles foo|Lấy thông tin về package đã cài đặt|

## Trình quản lý gói cấp cao

|RPM|Debian|Note|
|---|------|----|
|yum install foo|apt-get install foo|Cài đặt package|
|yum remove foo|apt-get remove foo|Gỡ cài đặt package|
|yum update foo|apt-get upgrade foo|Cập nhật package|
|yum list foo|apt-cache search foo|Tìm kiếm thông tin về package|
|yum list installed|-|Liệt kê tất cả các gói đã cài đặt|

