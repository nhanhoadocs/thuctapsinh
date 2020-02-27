# Lab SSH

Server: 192.168.37.15
Client: 192.168.37.11


# 1. Tạo khóa trên server
## Phía server
- Tạo 1 cặp ssh keys
    ```
    ssh-keygen -t rsa
    ```

    <img src="..\images\Screenshot_3.png">

- Chọn nơi lưu key: (ở đây, ta sẽ để ở thư mục home của root `/root/.ssh/id_rsa`)
    - Keys được tạo sẽ được lưu tại thư mục của user tạo keys. (**Ví dụ**: tạo keys bằng tài khoản `root` thì keys sẽ được lưu tại `/root/tên_file`)
    - Gõ ENTER để lưu cặp key vào thư mục con .ssh/ nằm trong thự mục home của user hiện hành 

    <img src="..\images\Screenshot_4.png">

- Đây là tùy chọn thêm 1 chuỗi mật khẩu , được khuyến nghị để tăng tính bảo mật . Nếu nhập chuỗi passphrase này , bạn sẽ phải gõ thêm chúng bất kỳ lúc nào sử dụng key ( chỉ trừ khi sử dụng phần mềm để SSH đã lưu trữ passphrase ) . Nếu không muốn sử dụng passphrase , có thể ENTER để bỏ qua. Ta nhập passphrase `hai1996` 

    <img src="..\images\Screenshot_5.png">

- Phân quyền cho cặp key.
    - **Lưu ý**: nếu bạn không chỉnh sửa cấu hình ssh thì bạn phải chuyển public keys tới thư mục mặc định (`~/.ssh/authorized_keys`) thì server mới có thể xác nhận.
    ```
    mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

    chmod 600 /root/.ssh/authorized_keys

    chmod 700 .ssh
    ```

- Cấu hình file `/etc/ssh/sshd_config` để khai báo thư mục đặt key, cũng như cho phép user `root` login.
    ```
    vi /etc/ssh/sshd_config
    ```

    <img src="..\images\Screenshot_6.png">

- Restart service ssh
    ```
    systemctl restart sshd
    ```

## Phía Client
### 1. Window
Nếu bạn sử dụng Windows để SSH đến, tiến hành copy file private key ra máy và load bằng PuTTY hoặc MobaXterm. Ở đây mình dùng MobaXterm để load private key.

- Trên MobaXterm, ta vào **Tools** -> **MobaKeyGen**
    <img src="..\images\Screenshot_7.png">

- Chọn file private key

    <img src="..\images\Screenshot_8.png">

- Nhập `passphrase`

    <img src="..\images\Screenshot_9.png">

- Sau đó, lưu lại dưới dạng `ppk`
    
    <img src="..\images\Screenshot_10.png">

- SSH vào server :

    <img src="..\images\Screenshot_11.png">

- Nếu có passphrase thì bạn sẽ phải nhập passphrase
    <img src="..\images\Screenshot_12.png">

### 2. Linux
- Copy file private key và phân quyền cho nó (phải đặt quyền 600 vì mặc định 644 thì key sẽ không được phép sử dụng)
    ```
    chmod 600 id_rsa
    ```

- Sử dụng lệnh sau để ssh tới server dùng private key đã phân quyền:
    ```
    ssh -i id_rsa root@192.168.37.15
    ```

    <img src="..\images\Screenshot_13.png">