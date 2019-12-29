### Cách SSH server từ một máy client  
1. Chuẩn bị
- 2 máy. (một máy coi là server và 1 máy coi là client)
- 2 máy này có thể ping được cho nhau.  
2. Các bước cài đặt
**Trên máy client**  
- Tạo một tài khoản user có tên là `client1`.
- Sử dụng lệnh `ssh-keygen` để thiết lập `private key` và `public key` cho user `client1`.
- Check trong thư mục /home/client1/ .ssh đã có file `id_rsa` chứa `private key` và `id_rsa.pub` `chứa public key`.  

<img src="https://i.imgur.com/QzKPEDQ.png">  

- Tiếp theo copy file chứa public key là `id_rsa.pub` lên server bằng lệnh: 
```
# shh-copy-id user_name@host
```  
Ở đây `user_name` là tên tài khoản trên server mà bạn muốn truy nhập vào. `host` là địa chỉ IP của server đó. Ví dụ tôi muốn SSH vào tài khoản admin trên server có địa chỉ IP là 192.168.152.134 thì tôi sẽ gõ lệnh: `ssh-copy-id admin@192.168.152.134`.  

<img src="https://i.imgur.com/z3gYFfR.png">  

Khi đó hệ thống sẽ hỏi mật khẩu đăng nhập của user `admin`. 

**Trên máy server**  

**Lưu ý**: SSH key sẽ không thể hoạt động nếu ta bật selinux. Ta sẽ tắt nó đi bằng cách sửa lại file `/etc/selinux/config`. Ta sửa `SELINUX=enforcing` thành `SELINUX=disabled`. Sau đó reboot lại server.  

<img src="https://i.imgur.com/AeyqcX1.png">  

Tiếp theo chỉnh sửa trong file `/etc/ssh/sshd_config`. Bật chế độ xác thực bằng public key và đọc public key từ file trong thư mục `/.ssh/authorized_keys`.  

<img src="https://i.imgur.com/8zb7HTM.png">

Sau đó restart lại bằng lệnh `service sshd restart`.

<img src="https://i.imgur.com/w3enT4V.png"> 
Bây giờ ta thử kiểm tra xem máy client đã truy cập vào được server chưa. 
<img src="https://i.imgur.com/yF65mas.png">  

Khi bạn đã khai báo public key từ user của client cho tài khoản root bên server nhưng bạn không muốn client đó truy cập bằng quyền root thì cần chỉnh sửa ở server.
Để client không được phép truy cập vào server dưới tài khoản root, ta sẽ cấu hình lại file `/etc/ssh/sshd_config` như sau:  

<img src="https://i.imgur.com/IRxuz5W.png">  

Như vậy sẽ đảm bảo an toàn cho hệ thống khi client không có quá nhiều quyền để thực thi.  