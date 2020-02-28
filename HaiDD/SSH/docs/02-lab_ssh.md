# Lab SSH Keypair

**Server**: `192.168.37.15`

**Client**: `192.168.37.11`


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


----------------------------

# 2. Tạo khóa trên Client
## Phía Client
### 1. Window

- Nếu bạn dùng Windows, có thể dùng PuTTY hoặc MobaXterm để gen ssh keys. Ở đây mình dùng MobaXterm. Chọn loại key là RSA và click generate.

    <img src="..\images\Screenshot_14.png">

- Di chuột liên tục tại khoảng trống

    <img src="..\images\Screenshot_15.png">

- Copy toàn bộ nội dung trong ô “*Public key for pasting into OpenSSH authorized_keys file:*” và lưu lại dưới tên `authorized_keys` rồi gửi lên Server. Đây là Public Key dành riêng cho OpenSSH. Nút “**Save public key**” sẽ cho một Public Key dạng khác, ta không cần quan tâm đến nút này.

    <img src="..\images\Screenshot_16.png">

- Nhập passphrase và chọn **Save Private key**. Việc tạo bộ khóa hoàn tất.

    <img src= "..\images\Screenshot_17.png">

- Đăng nhập, bạn mở session mới, nhập địa chỉ ssh server, chọn **Advanced SSH settings** -> **Use private key** rồi chọn tới `private key` đã save.

    <img src="..\images\Screenshot_18.png">

### 2. Linux
#### **Bước 1:** Tạo key bằng câu lệnh `ssh-keygen -t rsa`

<img src="..\images\Screenshot_19.png">

#### **Bước 2:** Đẩy public key lên server vào file `/root/.ssh/authorized_keys`. 
Cách nhanh nhất để copy Public Key trên CentOS là sử dụng tiện ích `ssh-copy-id` vì nó khá đơn giản . Nếu không có sẵn `ssh-copy-id` , cần phải copy 1 cách thủ công .
    
- **Cách 1**: Copy Public Key sử dụng ssh-copy-id : 

    Công cụ `ssh-copy-id` thường có sẵn trên nhiều hệ điều hành . Nếu dùng cách này , cần có kết nối SSH bằng mật khẩu từ client đến Server
    ```
    ssh-copy-id username@remote_host
    ```
    <img src="..\images\Screenshot_20.png">

    Điều này có nghĩa máy tính hiện tại đang không nhận ra máy chủ đầu xa . Hiện tượng này sẽ xảy ra trong lần đầu kết nối tới 1 host mới . Gõ `yes` hoặc `ENTER` để tiếp tục .

    Tiếp theo , công cụ sẽ dò quét file `id_rsa.pub` trên máy vừa tạo ra . Nếu tìm thấy , nó sẽ hỏi mật khẩu của user SSH :

    <img src="..\images\Screenshot_21.png">

    Nhập mật khẩu và gõ ENTER . Công cụ sẽ kết nối tới Server bằng tài khoản được cung cấp . Sau đó nó sẽ copy nội dung file `/.ssh/id_rsa.pub` vào 1 file tên là `authorized_keys` trong thư mục `/.ssh` của Server

    <img src="..\images\Screenshot_22.png">

    Tại bước này , key `id_rsa.pub` đã được upload lên Server .

    <img src="..\images\Screenshot_23.png">

- **Cách 2:** Copy Public Key sử dụng SSH

    Nếu không có sẵn tiện ích ssh-copy-id , có thể sử dụng phương pháp truyền thống để copy public key sang Server.

    Sử dụng lệnh pipe sau:
    ```
    cat ~/.ssh/id_rsa.pub | ssh root@192.168.37.15 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
    ```

    Sau khi nhập password , nội dung file `id_rsa.pub` sẽ được copy sang file `~/.ssh/authorized_keys`.

- **Cách 3:** Copy thủ công

    Nếu không có cách nào để truy cập Server qua SSH , có thể thực hiện copy thủ công qua USB hay bất cứ cách nào khác .

    Xem nội dung file `id_rsa.pub` và copy :
    ```
    cat ~/.ssh/id_rsa.pub
    ```

    Truy cập máy Server:
    ```
    mkdir -p ~/.ssh

    # public_key_string là phần copy được từ id_rsa.pub
    echo public_key_string >> ~/.ssh/authorized_keys   
    chmod -R go= ~/.ssh

    # tùy chọn này sẽ gỡ bỏ hết các permission về Group và Others trong thư mục /.ssh
    chmod -R go= ~/.ssh
    ```

**Bước 3:** Xác thực trên CentOS Server và sử dụng ssh key
- Thực hiện ssh vào Server
    ```
    ssh -i /root/.ssh/id_rsa root@192.168.37.15
    ```

- Nếu đã tạo passphrase thì ở bước này phải nhập thêm passphrase , nếu không thì có thể truy cập được luôn .

    <img src="..\images\Screenshot_25.png">

**Bước 4:** Tắt xác thực mật khẩu trên Server

- Mặc định , tồn tại song song cả 2 chế độ xác thực qua **SSH Key** và xác thực qua mật khẩu . Vì vậy , vẫn có khả năng Server bị tấn công bằng Brute Force.

- Trên Server , mở file cấu hình `sshd` :
    ```
    vi /etc/ssh/sshd_config
    ```

- Sửa phần `PasswordAuthentication` thành `no`:

    <img src="..\images\Screenshot_26.png">

- Restart dịch vụ SSH :
    ```
    systemctl restart sshd.service
    ```

- Sau đó , thực hiện kết nối SSH . Server sẽ hoàn toàn xác thực bằng SSH Key đã add trước đó mà không thể xác thực qua mật khẩu nữa.