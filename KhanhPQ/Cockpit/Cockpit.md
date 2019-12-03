Có khá nhiều kỹ sư hệ thống đã chia sẻ rằng:
 >"Cockpit là 1 công cụ tuyệt vời, phải có cho các sysadmin và các developer". 

    - Thực chất Cockpit là gì?
    - Nó có ưu điểm gì?
    - Trông nó như thế nào ?
    - Cài đặt nó ra làm sao?

Hãy để tôi giới thiệu cho các bạn những điều này trong bài viết dưới đây.
## 1. Cockpit là gì ?
**Cockpit** là một **Web based GUI tool** hữu ích, thông qua đó các sysadmin có thể giám sát và quản lý các máy chủ Linux của họ, nó cũng có thể được sử dụng để quản lý network và storage trên các máy chủ, container, máy ảo và kiểm tra các log của hệ thống và ứng dụng.

**Cockpit** có sẵn cho các hệ thống CentOS và RHEL. 

Gần đây CentOS 8 và RHEL 8 được phát hành trong đó **cockpit** được giữ lại làm công cụ quản lý máy chủ mặc định. 

Package của nó có sẵn trong package repository mặc định của CentOS 8 và RHEL 8 . 
## 2. Một số ưu điểm của Cockpit
- Dễ sử dụng bởi thao tác trên web browser và dùng chuột hoặc chuyển đổi sử dụng terminal khi muốn.
- Dễ dàng start các container, quản lý lưu trữ, cấu hình mạng và kiểm tra nhật ký.
- Thân thiện với những người sử dụng Linux và hữu ích với các quản trị viên dày dạn kinh nghiệm.
- Cài đặt dễ dàng.
- Và đặc biệt, nó **FREE**
## 3. Cài đặt Cockpit
Thao tác cài đặt **cockpit** trên CentOS 8 khá đơn giản

***B1*** : Thực thi câu lệnh dnf để cài đặt **cockpit**

    dnf install cockpit -y
***B2*** : Enable và start cockpit service

    systemctl start cockpit.socket
    systemctl enable cockpit.socket

***B3*** : "Thông" port cho **cockpit** 

    firewall-cmd --permanent --add-service=cockpit
    firewall-cmd --reload

***B4*** : Kiểm tra lại xem cockpit service đã chạy hay chưa

    systemctl status cockpit.socket
    netstat -tulnp

![Imgur](https://i.imgur.com/TejRkbf.png)

**KẾT QUẢ**: Như vậy là ta đã cài đặt cockpit trên máy chủ thành công

- Tiến hành đăng nhập qua web browser thông qua **tài khoản root**:

        192.168.91.70:9090

![Imgur](https://i.imgur.com/ksYqN82.png)

- Đăng nhập xong, ta sẽ thấy 1 giao diện web giúp ta thao tác với chính máy server
![Imgur](https://i.imgur.com/6EIgRIc.png)

## 4. Một số chức năng (page) trên giao diện web
### 4.1 SYSTEM
Ngay khi đăng nhập thành công, bạn sẽ được chào đón bằng SYSTEM PAGE - page sẽ giúp bạn:

    - Biết được thông tin hệ thống
    - Theo dõi tài nguyên hệt thống
    - Điều chỉnh trạng thái 
![Imgur](https://i.imgur.com/scIDJnv.png)

### 4.2 LOGS
Đúng như cái tên thì page này cho phép bạn theo dõi log của các ứng dụng cũng như của chính hệ thống
![Imgur](https://i.imgur.com/KAcnY2m.png)

### 4.3 NETWORK
Ta sẽ theo dõi Network log và thao tác với network thông qua page này

![Imgur](https://i.imgur.com/vqmjuUk.png)

### 4.4 ACCOUNTS
Thao tác (thêm,xóa,sửa,...) với các tài khoản sẽ được thực hiện ở đây

![Imgur](https://i.imgur.com/ecPBtJM.png)

### 4.5 SERVICES
Theo dõi và thao tác với các service có trên hệ thống
![Imgur](https://i.imgur.com/1cvfGXn.png)
Ta hoàn toàn có thể bật, tắt, khởi động lại dịch vụ thống qua page này
![Imgur](https://i.imgur.com/K142ogq.png)
### 4.6 APPLICATIONS
![Imgur](https://i.imgur.com/lTOPhTz.png)
### 4.7 DIAGNOSTIC REPORTS
Thu thập thông tin cấu hình hệ thống và các chẩn đoán sự cố.
![Imgur](https://i.imgur.com/eYqaJWc.png)
### 4.8 KERNEL DUMP
![Imgur](https://i.imgur.com/iWzk8np.png)
### 4.9 SELINUX
Bật tắt SELinux
![Imgur](https://i.imgur.com/cTGv3Tr.png)
### 4.10 SOFTWARE UPDATES
Update hệ thống
![Imgur](https://i.imgur.com/CERKNSU.png)
### 4.11 TERMINAL
Thao tác với terminal
![Imgur](https://i.imgur.com/E6pu4gc.png)
