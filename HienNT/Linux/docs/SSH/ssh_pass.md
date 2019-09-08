[](/1)  

# Configuring SSH Key Authentication on Linux 

<img src ="../../images/25 bai linux/ssh_keys_social.png">

<a name="1"></a>  

## Tổng quan  
- OpenSSH server cung cấp 2 phương pháp xác thực:  
  - Xác thực bằng mật khẩu: sử dụng mật khẩu của user ssh vào để xác thực  
  - Xác thực bằng SSH Key: Đây là một phương pháp bảo mật thay thế cho việc sử dụng mật khẩu. Phương pháp này được khuyến nghị trên máy chủ VPS, cloud, server chuyên dụng hoặc thậm chí tại nhà.

### SSH Key là gì?

- SSH Keys là một phương thức xác thực đăng nhập với máy chủ thông qua truy cập SSH bằng việc đối chiếu giữa một cặp keys, bao gồm một khóa riêng tư (private key) và khóa công khai (public key) tương ứng. SSH Keys sử dụng giao thức xác thực hỏi và trả lời trong đó một bên trình bày một câu hỏi và một bên khác phải cung cấp một câu trả lời hợp lệ để được chứng thực.

- Thông thường, một user đăng nhập VPS thông qua username root và password của user đó. user có thể mất quyền truy cập VPS nếu bị quên hoặc để lộ mật khẩu hay bị dò tìm mật khẩu qua `Brute Force Attack`. Do đó, việc sử dụng SSH Keys sẽ bảo mật hơn rất nhiều so với phương pháp đăng nhập dùng mật khẩu truyền thống.

- Hiểu một cách đơn giản: `Private Key` giống như là chìa khóa được cấu hình trên máy client còn `Public Key` là ổ khóa được cấu hình trên server.  

### Các thành phần của SSH Key  
- Một SSH Key được tạo ra từ 3 thành phần chính:  
  - `Public Key` - Bạn sẽ copy ký tự key này bỏ vào file `~/.ssh/authorized_keys` trên server của bạn.
  - `Private Key` - thường được đặt tên là `id_rsa`. Khóa riêng được lưu trữ trên máy tính cục bộ của bạn và phải được giữ an toàn với các quyền được đặt để không user nào khác trên máy tính của bạn có thể đọc file `id_rsa`. 
  - `Keypharse` - Mật khẩu để mở `private key`, thường được đặt tên là `id_rsa.pub`. Khóa công khai được đặt trên máy chủ mà bạn định đăng nhập. Bạn có thể tự do chia sẻ khóa công khai của mình với người khác. Nếu người khác thêm khóa công khai của bạn vào máy chủ của họ, bạn sẽ có thể đăng nhập vào máy chủ đó. khi đăng nhập vào server nó sẽ hỏi cái này (Nếu không đặt pass cho private key thì có thể bỏ qua)  

Khi một trang web hoặc dịch vụ yêu cầu khóa SSH của bạn, họ đang đề cập đến khóa công khai SSH ( id_rsa.pub) của bạn. Chẳng hạn, các dịch vụ như `GitHub` và `Gitlab` cho phép bạn đặt khóa công khai SSH của mình trên máy chủ của họ để hợp lý hóa quá trình đẩy các thay đổi vào kho lưu trữ từ xa.

### Nguyên tắc hoạt động của ssh key  

`Private key` và `Public key` có liên hệ chặt chẽ với nhau để có thể nhận diện lẫn nhau. Khi tạo một SSH Key thì user sẽ có cả 2 loại key này. Sau đó user upload public key lên server của mình, `private key` của user sẽ lưu ở máy và khi đăng nhập vào server, user sẽ gửi yêu cầu đăng nhập kèm theo `Private Key` để gửi tín hiệu đến server, server sẽ kiểm tra xem `Private key` của user có khớp với `Public key` có trên server hay không, nếu có thì bạn sẽ đăng nhập được.

## Cấu hình xác thực SSH Key
### Mô hình  

<img src ="../../images/25 bai linux/ssh_key.png">  

### Các bước cấu hình    

- ***Bước 1:*** Trên máy `Client`, tạo cặp khóa SSH bằng cách chạy câu lệnh `ssh-keygen`

  ```sh
    # ssh-keygen
  ``` 
  Một số option của câu lệnh `ssh-keygen`  
  `-b` sau đó là số bit để định số bit cho key.  
  `-t` để định thuật toán tạo key. Có các loại sau: rsa, dsa, ecdsa, ed25519. Nếu không có option này thì mặc định sẽ là `rsa`  
  `-f` để chọn chọn vị trí lưu file key.  
  `-p` để thay đổi passphrase. Cú pháp `ssh-keygen -p -P pass_cũ -N pass_mới -f keyfile`  
  `-y` để tạo một public key từ 1 private key.  
  Sử dụng lệnh `ssh-keygen --help` để xem thêm các option khác.
  - Cung cấp tên tệp nơi bạn muốn lưu các khóa (có thể để trống nếu bạn cho nơi lưu là tệp mặc định `~/.ssh`)  
    ```sh
    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa):
    ```
    Nếu trước đây bạn đã tạo một cặp SSH Key, bạn có thể thấy một dấu nhắc giống như này:
    
    ```sh
    /root/.ssh/id_rsa already exists.
    Overwrite (y/n)?
    ```
    Nếu bạn chọn ghi đè khóa trên đĩa, bạn sẽ không thể xác thực bằng khóa trước đó nữa. Hãy thật cẩn thận khi chọn có, vì đây là một quá trình phá hủy không thể đảo ngược.  

  - Tiếp theo, bạn sẽ được nhắc nhập cụm mật khẩu cho khóa. Đây là cụm mật khẩu tùy chọn nếu bạn nhập mật khẩu thì bạn cần ghi nhớ nó và nhập vào trong mỗi lần thực hiện SSH lên server; bạn cũng có thể bỏ qua mật khẩu bằng cách bấm `Enter`.  

    ```sh
    Created directory '/root/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```

  - Bây giờ bạn có một khóa công khai và riêng tư mà bạn có thể sử dụng để xác thực. 

    ```sh
    Your identification has been saved in /root/.ssh/id_rsa.
    Your public key has been saved in /root/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:yUqNzCMCHtFkjuj6TUqWo1Xy+tgsU+aW3eJDMFNDn+Y root@client
    The key's randomart image is:
    +---[RSA 2048]----+
    | .oo ..          |
    |. =.  o. .       |
    |oo . . .+        |
    |o.. +o * .       |
    | oo o+* E        |
    |.  *oo.o         |
    |. *+o+..         |
    | *oX+ + .        |
    |. ===..o         |
    +----[SHA256]-----+
    ```  
  - Kiểm tra lại trong thư mục `~/.ssh`  
    ```sh
      # ls -ll ~/.ssh
    total 8
    -rw-------. 1 root root 1766 Jun 21 11:55 id_rsa
    -rw-r--r--. 1 root root  393 Jun 21 11:55 id_rsa.pub
    ```
  Ở đây file `id_rsa` là file chứa private key còn `id_rsa.pub` là file chứa public key.

- ***Bước 2:*** Đưa `public key` lên server ta muốn kết nối bằng SSH  
  - Có 2 cách để đưa `public key` lên server. 
    - Cách 1: đăng nhập vào server bằng user bạn muốn sử dụng để thực hiện SSH xác thực bằng SSH Key.  
      ```sh
        ➤ ssh nguyenthuyhien@192.168.136.135
      ```  
        - Tạo thư mục `.ssh` bằng lệnh `mkdir .ssh`
          ```sh
            $ mkdir .ssh
          ```  
        - Phân quyền cho thư mục `.ssh` mới tạo  
          ```sh
            $ chmod 700 .ssh
          ```  
        - Tạo file `authorized_keys` trong thư mục `.ssh` và phân quyền cho file `authorized_keys`  
          ```sh
            $ touch ~/.ssh/authorized_keys
            $ chmod 600 ~/.ssh/authorized_keys
          ```
        - Copy nội dung file `id_rsa.pub` trên client vào file `authorized_keys` vừa tạo trên server.

    - Cách 2: Trên máy client sử dụng lệnh `ssh-copy-id -i .ssh/id_rsa.pub [username]@[IP_Server]`. Đảm bảo user bạn sử dụng có thể ssh vào server.  
     
      <img src ="../../images/25 bai linux/sshid.png">  

      Với cách này thì hệ thống sẽ tự tạo thư mục `.ssh` và file `authorized_keys` trên máy server. Đường dẫn của file trên server sẽ là `/home/nguyenthuyhien/.ssh/authorized_keys`  

      - Phân quyền 700 cho thư mục `.ssh` và 600 cho file `home/nguyenthuyhien/.ssh/authorized_keys` 
- ***Bước 3:*** Disabled selinux  

  - Vào file `/etc/selinux/config` tìm dòng `SELINUX=enforcing` rồi sửa lại thành `SELINUX=disabled` sau đó `reboot` lại server.  

    ```sh
      # sudo sed "s|enforcing|disabled|g" /etc/selinux/config
      # reboot
    ```  

- ***Bước 4:***  Bật xác thực kết nối SSH Key và tắt xác thực bằng password trên server 
  - Vào chỉnh sửa file `/etc/ssh/sshd_config` và thay đổi các thông số 

    ```sh
    PubkeyAuthentication yes  #cho_phép_xác_thực_bằng_SSH_Keys
    AuthorizedKeysFile /home/nguyenthuyhien/.ssh/authorized_keys
    PasswordAuthentication no #Tắt_xác_thực_bằng_password
    ```
    <img src ="../../images/25 bai linux/sshkey1.png">  

  - Lưu và thoát file  

- ***Bước 5:*** Restart lại dịch vụ SSH để nhận cấu hình mới 

  ```sh
    # systemctl restart sshd
  ```  

- Bây giờ bạn có thể thử lại bằng cách SSH vào Server từ máy Client  

  ```sh
    [root@client ~]# ssh nguyenthuyhien@192.168.136.135
  Enter passphrase for key '/root/.ssh/id_rsa':
  Last login: Sat Aug 24 01:33:13 2019 from 192.168.136.136
  [nguyenthuyhien@server ~]$
  ```
  Nếu bạn dùng máy khác không phải client hoặc user khác không phải user vừa sử dụng ở trên để SSH vào server thì sẽ nhận được thông báo như này  

  ```sh
  Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
  ```

  - Để sử dụng xác thực SSH Key với các user khác, sử dụng câu lệnh:  
    ```sh
      # ssh-copy-id -i id_rsa.pub [username]@[IP_Server]
    ```
    Ví dụ: cho phép root user xác thực bằng SSH Key  
    ```sh
    # ssh-copy-id -i id_rsa.pub root@192.168.136.135
    ```
- Ngoài ra, bạn cũng có thể tạo ra `public key` từ một `private key` có sẵn bằng cách sử dụng lệnh 

  ```sh
    # ssh-keygen -y -f file_private_key > file_public_key_new
  ```
  Trong đó:  
  `file_private_key` là file chứa `private key` mà ta muốn tạo một public key từ key đó.  
  `file_public_key_new` là file mà ta sẽ lưu `public key` mới tạo ra.

## Một số file cấu hình khác  
### 1. File `~/.ssh/know_hosts`  
- Khi bạn ssh vào 1 server, file `know_hosts` mặc định sẽ được tạo ra trong thư mục `.ssh` chứa thông tin về các host đã đăng nhập, thuật toán mã hóa, host key trên máy client.   
VD: Nội dung trong file `~/.ssh/known_hosts` 
  ```sh
    # cat ~/.ssh/known_hosts
  192.168.136.132 ecdsa-sha2-nistp256 AAAAE2VjZHNhMHusHmLUGcryzen27N9eyTCQZiyBYCQwMeYAAABBBO2vRfBsv2IJOemfciffv/hXHAg48+XlBi9UDCHXAxFJJJ4OSBofzOg/mDq/Pam+q3gzv+Z5D4BFNJX1Tc5zK+k=
  ```  

### 2. File `~/.ssh/config`  
- Đây là file cấu hình dành cho máy SSH Client chứa thông tin cấu hình trước khi kết nối với remote host.  
- File `config` không được tự động tạo ra như những file khác (như `id_rsa` và `id_rsa.pub` khi thực hiện câu lệnh `ssh-keygen` hay `know_hosts` khi thực hiện SSH vào server) mà phải tạo thủ công trên máy client bằng các câu lệnh.  

  ```sh
    # touch ~/.ssh/config
  ```
  Cấp quyền 600 cho file `~/.ssh/config`  
  ```sh
    # chmod 600 ~/.ssh/config
  ```  
- Một số option hay dùng để cấu hình `ssh config` như sau:

  - `Host` - Tên viết tắt của máy chủ, bạn sẽ sử dụng để thay thế `[user]@[IP_Server]`. Một số lưu ý khi đặt tên host:  
    - `*` - khớp 0 hoặc nhiều ký tự. Ví dụ: `Host *` sẽ khớp với tất cả máy chủ, trong khi `Host 192.168.0.*` sẽ khớp với tất cả máy chủ trong mạng `192.168.0.0/24`.
    - `?` - khớp chính xác một ký tự. Ví dụ: `Host 10.10.0.?` sẽ phù hợp với tất cả các máy chủ trong phạm vi `10.10.0.[0-9]`.  
    - `!` - phù hợp với các host, ngoại trừ. Ví dụ, `Host 10.10.0.* !10.10.0.5` sẽ khớp với bất kỳ máy chủ nào trong mạng con `10.10.0.0/24` ngoại trừ `10.10.0.5`  
  - `HostName` - Địa chỉ ip của máy chủ  
  - `User` - User để ssh vào server.  
  - `IdentityFile` - Chính là public key của ssh, mặc định nó sẽ tìm trong `~/.ssh/id_rsa` nếu bạn không config.  
  - `ProxyCommand` - Command đặc biệt khi connect vào server  
  - `Port` - Port khi connect vào server, mặc định sẽ là 22  
  - `ServerAliveInterval` - Time out khi connect vào server.

Ví dụ: Cấu hình thay thế `root@192.168.136.132` thành `example` và đổi cổng mặc định `22` thành `4444`. File `~/.ssh/config` khi đó sẽ là    
  ```sh
  Host example
    Hostname 192.168.136.132
    User root
    port 4444
  ```
  Trên server, sửa port trong file `/etc/ssh/sshd_config` giống với port trong file `~/.ssh/config`. Cấu hình firewalld cho phép lắng nghe port mới(hoặc tắt hoàn toàn firewalld)
  Bây giờ thay vì phải gõ `ssh root@192.168.136.132` trên Client để SSH đến Server thì bạn chỉ cần gõ `ssh example` 
  ```sh
    # ssh example
  ```


## TÀI LIỆU THAM KHẢO 
- https://man.openbsd.org/sshd_config  
- [lam-viec-voi-nhieu-github-account-tren-mot-may-voi-ssh-key/](https://viziondary.com/git/lam-viec-voi-nhieu-github-account-tren-mot-may-voi-ssh-key/)