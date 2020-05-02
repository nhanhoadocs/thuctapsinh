# User Envinronment (Về người dùng)

Linux là một hệ điều hành nhiều người dùng, nơi có nhiều hơn một người dùng có thể đăng nhập cùng một lúc. Lệnh `who` liệt kê những người dùng đang đăng nhập. Để xác định người dùng hiện tại, sử dụng lệnh whoami.
```
[root@localhost ~]# who
root     tty1         2019-12-10 08:04
root     pts/0        2019-12-10 08:07 (192.168.37.10)
```

Có 3 kiểu tài khoản trên một hệ thống Unix:

- *Tài khoản gốc (*Root account*)*: Là tài khoản ***Super User*** có toàn quyền trên hệ thống. Có thể chạy bất cứ lệnh nào mong muốn
- *Các tài khoản hệ thống*: Các tài khoản hệ thống được tạo sẵn để phục vụ các hoạt động riêng rẽ trên hệ thống, sửa đổi thông tin các User này có thể gây ra lỗi đối với toàn hệ thống.
- *Các tài khoản người dùng cá nhân*: Tài khoản này được cung cấp những tính năng mang tính tương đối trong hệ thống, bị giới hạn truy cập vào những vùng quan trọng.

## Một số file quản lí thông tin User:
Có các file chính quản lý người sử dụng sau:

- `/etc/passwd`: Giữ tài khoản người dùng và thông tin mật khẩu. File này giữ các thông tin quan trọng về các tài khoản trên hệ thống Unix.
- `/etc/shadow`: Giữ mật khẩu được biên thành mật mã của tài khoản tương ứng. Không phải tất cả các hệ thống đều hỗ trợ file này.
- `/etc/group`: File này giữ thông tin nhóm cho mỗi tài khoản.

## Một số lệnh trong Linux để quản lí các tài khoản cá nhân và nhóm
|Lệnh|Mô tả|
|--------------------------------|------------------|
|useradd <ten_user_moi> |Thêm một User mới|
|usermod [option] <username> |Chỉnh sửa thuộc tính tài khoản|
|userdel [option] <username>|Xóa tài khoản|
|groupadd [option] <groupname>|Thêm tài khoản Group mới|
|groupmod [option] <groupname>|Chỉnh sửa thuộc tính Group|
|groupdel [option] <groupname>|Xóa tài khoản Group|
|passwd <username>|Đổi mật khẩu User|
