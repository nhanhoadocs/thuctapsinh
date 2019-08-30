
<img src ="../../images/25 bai linux/ssh_header.jpg">  

## Mục lục  

<a name = "1"></a>

## 1. Khái niệm về SSH  

- SSH là viết tắt của `Secure Shell` là một giao thức hoạt động ở tầng ứng dụng trong mô hinh OSI được sử dụng để truy cập và thao tác trên server từ xa thông qua Internet.  

- SSH mặc định sử dụng port 22(port TCP) và sử dụng các dịch vụ của giao thức TCP/IP.  

- SSH là giải pháp thay thế các giao thức không bảo mật trước đây như telnet, rsh, rexec,..  

<a name ="2"></a>
## 2. Hoạt động của SSH - Cách SSH sử dụng để thiết lập session  

<a name ="2.1"></a> 
### 2.1. Mô hình  

  <img src ="../../images/25 bai linux/tcpdump_wireshark.png">  

#### Mô tả:  

<a name ="2.2"></a>  
### 2.2. Kết nối SSH từ client lên server    

- Cú pháp để thực hiện SSH từ Client lên server là: 
 
  ```sh
     ➤ ssh user@[IP_Server]
  ```  

- Đứng ở máy client SSH vào máy server. Sử dụng Wireshark sẽ cho thấy quá trình client và server giao tiếp với nhau  

  <img src ="../../images/25 bai linux/wireshark.gif">  

  - Khi kết nối đến server  

    ```sh
      ➤ ssh root@192.168.136.135
    ```  

    Các gói tin bắt được  

    <img src ="../../images/25 bai linux/wireshark1.png">  

    Trong bước này client và server thực hiện quá trình bắt tay 3 bước để thương lượng phiên kết nối. Sau khi 1 kết nối đã được tạo ra, server sẽ gửi 1 tin nhắn `New Keys` tới máy client để yêu cầu người dùng chuyển từ khóa công khai sang khóa bí mật. Sau khi phía người dùng chấp nhận sử dụng khóa chung của server nhưng không nhập vào password, các gói tin gửi tới server lúc này đều sẽ được mã hóa.  

    Tham khảo thêm [tại đây](https://nanxiao.me/en/use-network-analyzer-to-learn-ssh-session-establishment/) 

  - Nhập vào password của user  

    ```sh
      root@192.168.136.135's password:
    ```  

    Các gói tin bắt được  

    <img src ="../../images/25 bai linux/wireshark2.png">  
  
    Các gói tin là các dữ liệu được mã hóa. Nếu mật khẩu được nhập chính xác, toàn bộ phiên SSH đã sẵn sàng và bạn có thể bắt đầu quản trị server từ xa.  

<a name ="3"></a>
## 3. Cấu hình SSH  

- SSH được sử dụng với tên dịch vụ là `sshd`  

  - Kiểm tra trạng thái SSH

    ```sh
      # systemctl status sshd
    ```  

  - Khởi động SSH  

    ```sh
      # systemctl start sshd
    ```  
  - Để SSH khởi động cùng OS  

    ```sh
      # systemctl enable sshd
    ```

  - Dừng dịch vụ SSH  

     ```sh
       # systemctl stop sshd
    ```  

    Khi đó SSH vào sẽ bị báo lỗi  

    ```sh
    ssh: connect to host 192.168.136.135 port 22: Connection refused
    ```

  - Kiểm tra port SSH sử dụng  

    ```sh
      # netstat -plnt | grep sshd
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      18880/sshd
    tcp6       0      0 :::22                   :::*                    LISTEN      18880/sshd
    ```  
  Mặc định SSH chạy trên port 22 và có thể chỉnh sửa được.  

- Đường dẫn file cấu hình của SSH:  `etc/ssh/sshd_config` 

- Đổi port cho SSH: 

  ```sh
    # sed -i "s|#Port 22|Port 9999|g" /etc/ssh/sshd_config
  ```  

  - Tắt firewalld/selinux hoặc cho phép chạy trên port mới sửa  

    ```sh
      # systemctl stop sshd
      # setenforce 0
    ```
  - Khởi động lại dịch vụ và kiểm tra port  

    ```sh
      # systemctl restart sshd
      # netstat -plnt | grep sshd
      tcp        0      0 0.0.0.0:9999            0.0.0.0:*               LISTEN      15864/sshd
      tcp6       0      0 :::9999                 :::*                    LISTEN      15864/sshd
    ```  
- Thêm/xóa port 

  Cài đặt gói `policycoreutils-python-2.2.5-11.el7_0.1.x86_64` để sử dụng câu lệnh `semanage`

  ```sh  
    # yum install policycoreutils-python
  ```

  - Câu lệnh xóa port

    ```sh
      # semanage port -d -t ssh_port_t -p tcp 
    ```  

  - Thêm port mới







## TÀI LIỆU THAM KHẢO
- https://www.linuxtechi.com/capture-analyze-packets-tcpdump-command-linux/
- https://www.comparitech.com/blog/information-security/ssh-encryption/
- https://www.quora.com/What-is-SSH-and-how-does-it-work
- https://www.slashroot.in/secure-shell-how-does-ssh-work
- https://www.hostinger.com/tutorials/ssh-tutorial-how-does-ssh-work
- https://www.youtube.com/watch?v=zlv9dI-9g1U
- https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process


