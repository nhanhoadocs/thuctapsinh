### Basic Security  
Mục lục  
1. [Password aging](#1)
2. [SSH](#2)


<a name="1"></a>  
**1. Password asing**  

`Password asing` là một phương pháp nhắc nhở người dùng tạo mật khẩu mới sau một khoảng thời gian xác định. Điều này sẽ làm tăng tính bảo mật cho hệ thống.  
Để xem thông tin mật khẩu của 1 user, ta sử dụng lệnh:  
```
# chage --list [user_name]
```
<img src="https://i.imgur.com/GzG7vq3.png">  

Ta thấy dòng đầu tiên `Last password change` là lần cuối thay đổi mật khẩu. 

Để thay đổi ngày hết hạn của mật khẩu, ta sử dụng lệnh
```
# chage -E year-month-day user_name
```
<img src="https://i.imgur.com/sczGwwr.png">  

Như ta thấy thì đến ngày 1/1/2030 thì tài khoản `@ngahong` sẽ không thể đăng nhập vào hệ thống. Nếu muốn đăng nhập thì phải liên hệ với người quản trị để kích hoạt lại.  

Dòng hiển thị cuối `Number of days of warning before password expires: 7` có nghĩa là cảnh báo trước khi hết hạn password trước 7 ngày. Để thay đổi số ngày này thì ta sử dụng lệnh: 
```
# chage -w [number_of_day] [user_name]
```
<img src="https://i.imgur.com/MA4dei0.png">  

<a name="2"></a>
**2. SSH**  
  
`SSH`- Secure Shell là một giao thức điều khiển từ xa cho phép người dùng truy cập và thao tác trên server ở xa thông qua Internet. Giao thức này giống với giao thức Telnet và một số giao thức khác nhưng nó thiết lập cơ chế bảo mật tốt hơn. Nó thực hiện mã hóa tất cả dữ liệu và câu lệnh được trao đổi giữa 2 máy.  
SHH hoạt động trên mô hình client-server cho phép chứng thực an toàn giữa 2 máy thừ xa và mã hóa dữ liệu được truyền giữa chúng. SSH vận hành trên TCP port 22 mặc định (có thể thay đổi nếu cần). Server sẽ nghe port 22 (hoặc bất kỳ port nào SSH được gán vào) cho những kết nối tới. Nó sẽ thiết lập kết nối an toàn khi chứng thực giữa client và môi trường shell đang mở thành công. Client bắt đầu kết nối SSH bằng cách tạo ra TCP handshake với server, bảo đảm có thể thiết lập kết nối đối xứng, xác thực thông tin của server có khớp dữ liệu cũ không, và so sánh thông tin đăng nhập của user kết nối để xác thực đúng kết nối. Có 2 giai đoạn để thiết lập kết nối: trước tiên cả 2 bên đống ý chuẩn mã hóa để bảo vệ giao tiếp. Thứ 2 user phải được xác thực. Nếu thông tin đăng nhập khớp user có quyền truy cập. 
Cú pháp thiết lập kết nối SSH `ssh user@địa_chỉ` Trong đó:
- `user` là tên của user ta muốn kết nối vào(có thể là root, client1, client2...)
- `Địa_chỉ` là địa chỉ của máy ta muốn kết nối vào có thể là địa chỉ IP hoặc domain name.  

Có 2 cách để xác thực kết nối SSH.  

- Sử dụng password của user mà ta muốn kết nối vào để xác thực.
- Sử dụng một cặp key(private key và public key) để xác thực.
### Sử dụng Password  
Cách xác thực này khá đơn giản khi ta thiết lập kết nối nó sẽ hỏi ta password của user ta muốn truy nhập vào. Nếu ta nhập đúng thì ta có thể kết nối vào được. Nó có ưu điểm rất lớn là dễ và không cần phải cấu hình trước bất kỳ điều gì. Nhưng với cách xác thực này cũng có nhược điểm của nó. Mỗi lần kết nối nó lại hỏi lại mật khẩu gây phiền phức và còn một nhược điểm khác liên quan tới vấn đề bảo mật đó là ta phải nhập mật khẩu mỗi lần kết nối nếu không may bị người khác biết được mật khẩu đó thì rủi ra là rất lớn.

### Sử dụng SSH Key   

<img src="https://i.imgur.com/YttazCh.png">  

SHH Key hoạt động trên mô hình Client-Server, kết nối được tạo bởi quá trình bắt tay giữa SSH Client và SSH Server.  
- *SSH Server*: là máy chủ, với máy chủ chạy hệ điều hành Linux thì yêu cầu phải cài openssh-server. Còn máy chủ chạy hệ điều hành Windows thường thì chúng ta dùng Remote desktop.  
- *SSH Client*: là máy muốn truy cập vào SSH Server. Trên những máy này bạn phải cài một ứng dụng có khả năng tạo kết nối SSH, trên linux  có openssh-client còn windows có Putty.  

**Public Key** - khóa chung, là một file text được lưu ở phía Server SSH, nó dùng để khi Client gửi Private Key (file lưu ở Client) lên để xác thực thì kiểm tra phù hợp giữa Private Key và Public Key này. Nếu phù hợp thì cho kết nối.  
**Private Key** - khóa riêng, là một file text bên trong nó chứa mã riêng để xác thực (xác thực là kiểm tra sự phù hợp của Private Key và Public Key). Máy khách kết nối với máy chủ phải chỉ ra file này khi kết nối SSH thay vì nhập mật khẩu. Hãy lưu file Private key cận thận, bất kỳ ai có file này có thể thực hiện kết nối đến máy chủ của bạn.  
**PassPhrase**: là mật khẩu dùng để nhận diện Public Key và Private Key khi tạo SSH connection, cũng được dùng để lấy lại Public Key.  

### Các bước cấu hình  
Sử dụng lệnh `ssh-keygen`:  

<img src="https://i.imgur.com/BIzVMrE.png">  

Ta thấy khi tạo key nó hỏi ta chỗ lưu file. Bạn có thể chọn chỗ lưu nhưng thường sẽ để mặc định bằng cách nhấn `enter` Và sẽ được hỏi `passphrase` bạn có thể nhập hoặc không để bảo vệ private key của bạn. Nếu bạn nhập thì hãy nhớ mật khẩu này. 
Một số option của lệnh `ssh-keygen`:  
- `b` sau đó là số bit để định số bit cho key.
- `t` để định thuật toán tạo key. Có các loại sau: `rsa`, `dsa`, `ecdsa`, `ed25519`. Nếu không có option này thì mặc định sẽ là `rsa`.
- `f` để chọn chọn vị trí lưu file key.
- `p` để thay đổi `passphrase`. Cú pháp `ssh-keygen -p -P pass_cũ -N pass_mới -f keyfile`.
- `y` để tạo một public key từ 1 private key. Đây là một số option thông dụng để biết thêm các option khác ta sử dụng lệnh `ssh-keygen --help`.Ta kiểm tra bằng cách cd vào thư mục `.ssh` và kiểm tra trong xem đã có file chưa.  

<img src="https://i.imgur.com/YcBrBnK.png">  

Trong thư mục này chúng ta quan tâm đến 2 file đó là `id_rsa` là file chứa `private key` và file `id_rsa.pub` là file chứa `public key`. Tiếp theo ta cần đưa `public key` lên server ta muốn kết nối ssh.   
Có 2 cách để ta đưa public key lên trên server.  
Cách thủ công:  
Ta đăng nhập vào server mà cụ thể là đăng nhập vào user ta muốn truy nhập ssh vào. Ở đây tôi đăng nhập vào tài khoản `admin` trên máy server có địa chỉ 192.168.152.10.  

Trên server tạo thư mục `.ssh` và sử dụng lệnh chmod 700 .ssh cho thư mục.
Trong thư mục ssh tạo file `authorized_keys` và cấp quyền 600 cho file.

<img src="https://i.imgur.com/0eZeVZa.png">

Copy nội dung của file `id-rsa.pub` của client sang file authorized_keys của server .Có thể sử dụng câu lệnh `ssh-copy-id -i .ssh/id-rsa.pub user@host`.

Lưu ý: SSH key sẽ không thể hoạt động nếu ta bật selinux sửa lại ở trong file `/etc/selinux/config` ta sửa từ `SELINUX=enforcing` thành `SELINUX=disabled`. Sau đó reboot lại server.  

<img src="https://i.imgur.com/XKbAnTf.png"> 

Để bật xác thực kết nối SSH bằng key ta cần cấu hình một vàì thông số trong file `/etc/ssh/sshd_config`.  

- `PubkeyAuthentication yes`
- `AuthorizedKeysFile .ssh/authorized_keys`  

<img src="https://i.imgur.com/QRqkhOE.png">

Lưu ý: mỗi lần làm việc với file /etc/ssh/sshd_config xong ta cần thực hiện lệnh `service sshd restart` thì thay đổi của ta mới được update. Ta cần sửa một số thông số sau:  
<img src="https://i.imgur.com/AoSyIVY.png">


Để không cho phép client ssh vào tài khoản root và chỉ sử dụng SSH Key để truy cập vào Server mà không dùng Password, ta tiến hành cấu hình lại file `/etc/ssh/sshd_config`  
<img src="https://i.imgur.com/J3HbnBl.png">   

Bây giờ ta có thể SSH vào server với tài khoản admin@192.168.152.10 từ máy client mà không cần nhập password.  
  
<img src="https://i.imgur.com/jLO42ZB.png">

Như vậy ta đã tìm hiểu được cách truy cập vào 1 server từ một máy client bằng cách sử dụng key. Phương pháp này đảm bảo tính bảo mật của hệ thống, tránh các cuộc tấn công nguy hiểm khi 1 attacker chiếm được password.


