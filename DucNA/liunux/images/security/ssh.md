# 1. Khái niệm 
- SSH: là một giao thức cho phép người dùng điều khiển từ xa, kiểm soát và chỉnh sửa server qua internet. Giao thức ssh được tạo ra để thay thế cho giao thức telnet bở vì giao thức telnet không có mã hóa để đảm bảo độ an toàn người ta đã tạo ra giao thức ssh
# 2. Cách thức hoạt động của ssh 
- Giao thức ssh làm việc trên 3 bước 
    - Bước 1: xác định host của hệ thống tham gia giao thức shs
    - Bước 2: Mã hóa dữ liệu 
    - Bước 3: Xác thực người sử dụng để đăng nhập hệ thống 
- Định danh host
    - Mỗi một máy tính điều khiển SSH có một khóa định danh duy nhất.
    - Việc định danh host này được thực hiện qua việc trao đổi khóa 
- Mã hóa dữ liệu 
    - Sau khi hoàn tất việc thiết lập phiên làm việc bảo mật thì quá trình trao đổi dữ liệu được diễn ra thông qua bước trung gian đó là mã hóa 
- Xác thực người dùng để đăng nhập 
     - Ngay tại thời điểm này thì kênh trao đổi giữa 2 máy đã được thiết lập và bảo mật. 
     - Mỗi định danh và truy cập của người sử dụng có thể được cung cấp theo nhiều cách khác nhau 
     - Có 2 cách để xác thực người dùng đăng nhập: sử dụng `user` hoặc sử dụng một key để xác thực 
# 3. Cú pháp và cách cài đặt 
## Xác thực bằng `user`  
- Cú pháp 
```
ssh user@IP
```
- Trong đó thì user: là tên user ta muốn đăng nhập vào máy linux đó
- IP: là địa chỉ ip của máy ta muốn đăng nhập đến là gì 
- Cách xác thực này dễ dàng không phải cài đặt nhiều nhưng mỗi khi ta muốn đăng nhập thì ta lại cần làm lại tất cả các bước và nhập lại mật khẩu
## Xác thực bằng key 
- Với cách xác thực bằng key này ta chỉ cần phải cài đặt thiết lập một lần và từ lần sau trở đi ta không còn phải đăng nhập lại mật khẩu lần thứ 2
- Ví dụ: có 2 máy một là `server` và một máy là `client` thì ta phải cài đặt key của `client` rồi dùng `server` để đăng nhập vào. 
    - Bước 1: tạo key trên máy `client` ta sử dụng câu lệnh 
    ```
    ssh -keygen
    ```
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2006-44-30.png)
    - Dòng thứ 2 nó hỏi tạo ra thư mục để lưu key 
    - dòng thứ 4 thì nó hỏi có tạo mật khẩu để bảo vệ thư  mục key không ( ở đây để mặc định là không)
    - Các dòng tiếp theo là thông báo hoàn thành 
#### Một số optionn của câu lệnh `ssh-keygen`
- Dưới đây là một số option phổ biến có thể tìm hiểu kỹ hơn trong `ssh-keygen --help`
- `-t` Để định thuật toán tạo key và có các loại: rsa, dsa, ecdsa, ed25519. còn nếu để mặc định thuật toán sẽ là rsa
- `-p`: để thay đổi passphrasse 
- `-b`: để tạo số bit chỉ định cho key
- `-f` : để chọn vị trí lưu file key 
- `-y` để tạo ra `public key` từ một `private key`. Ta có thể kiểm tra bằng cách vào thư mục `.ssh` 
    - Trong thư mục ssh ta thấ y có 2 file. Thì 1 file là để chứa `private key` còn một file để chứa `public key` 
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2006-44-43.png)
    - Ta cần đưa `public key` lên server ta muốn kết nối ssh.
        - Tạo thư mục `.ssh` 
        - Cấp quyề n cho thư mục 
        - Tạo file `authorized_key` vào và cấp quyền cho file đó
        - Copy nội dung file `id_rsa.pub` Vào file `authorized_key` vừa tạo 
        - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2008-08-15.png)
        - Hoặc ta có thể dùng lệnh 
        ```
        [root@localhost .ssh]# ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.54.128
        ```
        - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2008-05-39.png)
        - Cách này đảm bảo có thể vào ssh 
### lưu ý: 
- SSH key sẽ không thể hoạt động nếu ta bật selinux sửa lại ở trong file `/etc/selinux/config` sử xong rồi reboot lại server 
- ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-20%2013-58-05.png)
- Để bật xác thực kết nôi SSH bằng key ta cần cấu hình một vài thông số trong file `/etc/ssh/sshd_config`. sử xong cần reboot lại mới có thể thay đổi được thông số 
```
service sshd restart
```

- ta cần chỉnh sửa 2 thông số
    - Pubkeyauthentication yes 
    - AuthorizedkeysFile .ssh/authorized_keys
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2008-13-29.png)
    - Sau khi sửa xong máy client sẽ đăng nhập mà không cần nhập pass
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-20%2014-12-03.png)
- Chỉ các máy nào có key thì mới được đăng nhập ta cần sửa dòng sau 
    - PasswordAuthentication no 
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2008-20-35.png)
- Nếu muốn cấp quyền không cho đăng nhập vào tài khoản root thì ta có thể sử dòng sau 
    - PermitRootLogin no
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-19%2008-19-53.png)
    - Kết quả sau khi sử nó sẽ không cho quyền đăng nhập 
    - ![](https://github.com/duckmak14/linux/blob/master/security/Screenshot%20from%202018-12-20%2014-15-45.png)
- Cũng như tài khoản root  ta có thể giới hạn được các tài khoản được phép sử dụng ssh bằng cách thêm những user vào sau  `AllowUsers`  có thể được dùng SSH để login vào

