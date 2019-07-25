Một số cách để bảo mật SSH trên máy chủ Linux
===
## Mục lục
1. [Tổng quan](#1-Tổng-quan)
2. [Một số cấu hình](#2-Một-số-cấu-hình)
3. [Tài liệu tham khảo](#3-tài-liệu-tham-khảo)
## 1. Tổng quan
SSH là một trong những giao thức quan trọng trong việc kết nối và điều khiển máy chủ từ xa. Tuy nhiên việc không biết cấu hình kết nối SSH để bảo mật sẽ tiền ẩn nhiều nguy cơ bị tấn công trong đó có tấn công dò tìm mật khẩu. Vì vậy, người sử dụng nắm được ý nghĩa của một số dòng lệnh cấu hình trên file config để bảo mật cho máy chủ của mình.

File cấu hình của ssh sẽ nằm ở thư mục `/etc/ssh/` trong đó có 2 file như sau:
- **sshd_config**: file cấu hình dịch vụ OpenSSH server
- **ssh_confid**: file cấu hình OpenSSH client

> Trong bài này, chủ yếu ta sẽ khai thác cấu hình trên file **sshd_config**

Để thao tác với file sshd _config, bạn phải chạy với quyền root. Trên cửa sổ terminal, bạn gõ:
```
# vi /etc/ssh/sshd_config
```

## 2. Một số cấu hình

### 2.1 Thay đổi Port mặc định

Bình thường, port mặc định của SSH là 22. Để chuyển qua port khác, trên file sshd_config, tìm đến dòng `#port 22`, xoá `#` và đổi sang cổng khác, ví dụ:

```
Port 2222
```

Nếu máy chủ tồn tại firewall hay SElinux chặn cổng, tiến hành dừng những tiến trình đó lại.

Với firewall, gõ:

```
systemctl stop firewalld
```

Với SElinux, bạn vào tiến hành vào file config như sau:
```
# vi /etc/selinux/config
```

Tìm đến dòng `SELINUX=enforcing` và đổi nó thành:
```
SELINUX=disabled
```
Tham khảo thêm về SElinux tại [đây](https://vinasupport.com/selinux-la-gi-cach-vo-hieu-hoa-selinux-tren-centos/).

Cuối cùng restart lại sshd service như sau:
```
# systemctl restart sshd
```

Nếu không có thông báo gì là bạn đã restart thành công. Bây giờ tiến hành SSH vào máy chủ trên máy tính của bạn. Lưu ý thêm cờ **`-p`** và số hiệu cổng để SSH, ví dụ:
```
$ ssh root@172.16.2.167 -p 2222
```

### 2.2. Tắt chức năng truy cập vào root

Tại file sshd_config tìm đến dòng `PermitRootLogin no` và đổi nó thành `yes`. Khi đó, bạn sẽ không thể đăng nhập vào quyền root root. Bước này sẽ giúp bảo vệ người dùng root trên máy server. Nếu bạn muốn sử dụng quyền root, tiến hành ssh vào server với quyền user, sau đó gõ:
```
$ su root
```

### 2.3. Cho phép hoặc từ chối đăng nhập SSH ở một số user hoặc group

Trong trường hợp bạn muốn từ chối một số user không cho phép được ssh, trong file **sshd_config** thêm dòng như sau:
```
DenyUsers user1 user2
DenyGroup group1
```
Khi đó, chỉ user1, user2 và group1 sẽ không thể thực hiện kết nối ssh, các user và group khác có thể ssh đưuọc bình thường.

Tương tự, nếu bạn muốn cho phép một số user được quyền ssh, trong file **sshd_config** thêm dòng như sau:
```
AllowUsers user1 user2
AllowGroup group1
```
Khi đó user1, user2 và group1 sẽ được phép kết nối ssh. Các user và group khác sẽ không được phép ssh.

>Lưu ý: Khi bạn set quyền kết nối ssh cho user không phải root, kể cả khi trong file cấu hình có dòng cho phép đăng nhập vào tài khoản root `PermitRootLogin yes`, thì tài khoản root cũng không có quyền ssh.

## 3. Tài liệu tham khảo

1. [10 bước để bảo mật OpenSSH](https://blog.devolutions.net/2017/4/10-steps-to-secure-open-ssh)

2. [Tăng cường bảo mật OpenSSH](https://linux-audit.com/audit-and-harden-your-ssh-configuration/)