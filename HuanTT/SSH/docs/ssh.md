Tìm hiểu và đăng nhập vào server sử dụng SSH key pair
===
## Mục lục
- [1.Tổng quan về SSH](#1.Tổng-quan-về-SSH)
- [2.2.Tạo kết nối SSH bằng mật khẩu](#2.Tạo-kết-nối-SSH-bằng-mật-khẩu)
- [3.Tạo kết nối SSH sử dụng key pair](#3.Tạo-kết-nối-SSH-sử-dụng-key-pair)
    - [3.1.Giải thích cơ chế key pair](#3.1.Giải-thích-cơ-chế-key-pair)
    - [3.2.Tạo key pair](#3.2.Tạo-key-pair)
    - [3.3.Gửi key public](#3.3.Gửi-key-public)
        - [3.3.1.Dùng ssh-copy-id để gửi](#3.3.1.Dùng-ssh-copy-id-để-gửi)
        - [3.3.2.Giải thích quy trình gửi](#3.3.2.Giải-thích-quy-trình-gửi)
    - [3.4.Một số lưu ý](#3.4.Một-số-lưu-ý)
- [4.Tài liệu tham khảo](#4.Tài-liệu-tham-khảo)
## 1.Tổng quan về SSH
SSH (Secure Shell) là một giao thức được mã hoá để quản trị và giao tiếp với các máy chủ. Trong khi làm việc với máy chủ, bạn sẽ phải làm việc trên cửa sổ Terminal trên máy tính của bạn thông qua SSH. Bài viết này sẽ hướng dẫn bạn cài đặt khoá SSH trên máy chủ **CentOS 7** và thực hiện giao tiếp SSH với máy chủ thông qua phương pháp key pair.
## 2.Tạo kết nối SSH bằng mật khẩu

Để thực kiện được kết nối SSH với máy chủ, bạn phải chắc chắn ràng máy tính của bạn ping thông với máy chủ. Để kiểm tra, bạn gõ trên máy chủ của bạn:

```
$ ip a
```

Khi đó bạn sẽ thấy được địa chỉ ip chính xác của máy chủ là bao nhiêu. Ở đây, máy server có địa chỉ là 172.16.2.160.

![image](images/ssh01.png "img01")

> Bạn có thể tiến hành đặt địa chỉ tĩnh cho máy Server của bạn để cố định địa chỉ ip.

Trên máy tính của bạn gõ:
```
$ ping <địa chỉ ip>
```

![image](images/ssh02.png "img02")

Khi ping thông được tới máy chủ, ta có thể tiến hành thực hiện kết nối SSH. Ta gõ trên cửa sổ Terminal của bạn:

```
$ ssh <người dùng>@<địa chỉ ip>
```

![image](images/ssh03.png "img03")

Nếu là lần kết nối đầu tiên, thì nó sẽ hỏi lại bạn có muốn tiếp tục hay không. Bạn chỉ cần gõ YES, sau đó nhập pass. Như vậy, bạn đã thục hiện xong việc kết nối.

## 3.Tạo kết nối SSH sử dụng key pair
### 3.1.Giải thích cơ chế key pair
Đôi khi việc sử dụng password để đăng nhập rất là phức tạp và tiềm ẩn khả năng bị tấn công cao. Vì vậy, bạn có thể thực hiện việc kết nối thông qua sử dụng cơ chế key pair.

![image](images/ssh04.png "img04")

Cơ bản thì ở máy server 1 sẽ tiến hành tạo cặp key là private key và public key. Sau đó máy 1 sẽ gửi key public tới máy 2 và giữ lại private key. Khi muốn thực hiện đăng nhập từ xa, máy 1 sẽ gửi yêu cầu kèm key private tới máy 2. Máy 2 sẽ tiến hành kiểm tra Private key có trùng với Public Key không. Nếu có thì sẽ đăng nhập thành công.
### 3.2.Tạo key pair

Đầu tiên, bạn phải tiến hành tạo SSH key trên máy. Ở đây mình sẽ tạo key trên máy 1. Trên Terminal, bạn gõ:

```
$ ssh-keygen
```

![image](images/ssh05.png "img05")

Lập tức trên terminal xuất hiện một số yêu cầu sau:

```
Enter file in which to save the key (/root/.ssh/id_rsa): 
```

Bạn sẽ điền tên của file key. Thư mục lưu trữ file key đó là thư mục `/root/.ssh/`. Nếu bạn không nhập bất cứ gì, tên file sẽ mặc định là id_rsa.

```
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
```

Tiếp theo là mật khẩu cho key. Bước này sẽ khiến bạn phải xác thực lại key bằng mật khẩu.Nếu không muốn nhập mật khẩu, nhấn Enter để bỏ qua.

Như vậy, bạn đã tạo xong key trên máy 1. Bầy giờ thì tiến hành gửi key public tới máy 2.

### 3.3.Gửi key public
Nói chung bước này khá là nhiều bước tuy nhiên có một cách khá đơn giản để thực hiện một mớ các thao tác này đó là sử dụng tiện ích ssh-copy-id. Ngoài ra nếu bạn không muốn sử dụng tiện ích này thì cũng có thể thực hiện: Sao chép key qua SSH sử dụng mật khẩu hoặc sao chép thủ công.

Trên đây mình sẽ sử dụng tiện ích ssh-copy-ip và tìm hiểu cách thức thực hiện của nó.
### 3.3.1.Dùng ssh-copy-id để gửi
Đầu tiện, trên cửa sổ Terminal của máy 1, gõ lệnh:

```
$ ssh-copy-id <người dùng>@<địa chỉ ip>
```

> Nếu bạn có đặt tên file key khác thì bạn phải thêm cờ -i và tên file đó:
```
$ ssh-copy-id -i <tên key> <người dùng>@<địa chỉ ip>
```
![image](images/ssh06.png "img06")
Trên Terminal sẽ hiện một loại các dòng lệnh, trong đó có các yêu cầu sau.

```
Are you sure you want to continue connecting (yes/no)?
```

Máy yêu cầu cần xác thực bạn có muốn tiếp tục kết nối hay không. Bạn chỉ cần gõ YES.

```
root@172.16.2.160's password: 
```

Tiếp tục, máy yêu cầu bạn nhập mật khẩu cho máy nhận public key (máy 2), nhập mật khẩu vào là bạn đã hoàn thành xong việc gửi public key tới máy nhận.

Bây giờ, trên cửa sổ Terminal của máy 1, gõ lệnh:

```
$ ssh <người dùng>@<địa chỉ ip>
```

Bây giờ bạn đã hoàn toàn đăng nhập vào máy server mà không cần nhập mật khẩu.

> nếu bạn đặt tên file key khác, bạn có thể ssh thông qua câu lênh như sau:
```
$ ssh -i <địa chỉ key> <người dùng>@<địa chỉ ip>
```


### 3.3.2.Giải thích quy trình gửi

Sau khi thực hiện copy và ssh thành công, trên máy server 2 sẽ có một số thay đổi như sau.

Đầu tiên, trên terminal của máy 2 (hoặc máy 1 đã SSH) gõ:
```
$ cd /root
$ ll -a
```
Terminal sẽ hiện lên như sau:

![image](images/ssh07.png "img07")

Bạn có thể thấy có 1 thư mục tên là `.ssh` được tạo ra được cấp quyền là 700 (700 là gì thì tìm hiểu về chmod).

Đổi đường dẫn tới thư mục này:
```
$ cd .ssh
$ ll
```
![image](images/ssh08.png "img08")
Ta thấy có 2 file ở trong thư mục này với các chức năng sau:
- authorized_keys: được cấp quyền 600, lưu trữ thông tin về key public được gửi.
- known_hosts: cấp quyền 644, lưu trữ thông tin nhưng máy đã từng đăng nhập bằng.
Như vậy, ta có thể thấy, tiện ích ssh-copy-id đã giúp thực hiện một mớ các thao tác phức tạp về lại một câu lệnh đơn giản và tiện lợi.

### 3.4.Một số lưu ý

Nếu tên file key khác với tên mặc định (không phải id_rsa) bạn phải thêm cờ -i và địa chỉ của file key. Ví dụ:
```
$ ssh-copy-id -i abc123 root@172.16.2.167
```

Nếu bạn muốn tắt tính năng đăng nhập bằng mật khẩu, chỉ đăng nhập bằng key pair. Bạn phải tiến hành tắt tính năng đó trên file config theo các bước sau:
- di chuyển đến thư mục chứa file config
```
$ cd /etc/ssh/
$ ls
```
- tìm file sshd_config và sửa nó với vi
```
$ vi sshd_config
```

- Trong file đó, tìm đến dòng PasswordAuthentication và đổi nó thành NO.
```
...
PasswordAuthentication no
...
```
- Sau đó thoát ra ngoài bằng `ESC` -> gõ `:wq` (tham khảo thêm tài liệu về Vim). Tiến hành restart lại sshd:

```
$ sudo systemctl restart sshd.service
```

## 4.Tài liệu tham khảo

https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-centos7

https://www.ssh.com/ssh/copy-id