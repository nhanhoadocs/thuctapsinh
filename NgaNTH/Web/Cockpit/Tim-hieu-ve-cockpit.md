# Tìm hiểu về cockpit

## 1. Giới thiệu Cockpit  
`Cockpit` có thể hiểu là bảng điều khiển dựa trên web thân thiện với người dùng, cung cấp một số cách rất dễ dàng để quản trị các hệ thống Linux - thông qua web. Bạn có thể giám sát tài nguyên hệ thống, thêm hoặc xóa tài khoản, giám sát việc sử dụng hệ thống, tắt hệ thống và thực hiện nhiều tác vụ khác - tất cả thông qua kết nối web rất dễ truy cập. Nó cũng rất dễ cài đặt và sử dụng.  
Mặc dù thao tác trên Linux chủ yếu thông qua CLI, truy cập vào hệ thống từ xa bằng các công cụ như PuTTY không phải là lúc nào cũng cung cấp đầu ra lệnh hữu ích nhất. Linux Cockpit cung cấp các biểu đồ và các biểu mẫu dễ sử dụng để xem hiệu suất và thực hiện các thay đổi cho hệ thống của bạn.  

Linux Cockpit cho phép bạn xem nhiều khía cạnh của hiệu năng hệ thống và thực hiện thay đổi cấu hình, mặc dù danh sách tác vụ có thể phụ thuộc vào đặc trưng cụ thể của Linux mà bạn đang sử dụng. Một số loại chức năng bao gồm:  
- Giám sát hoạt động của hệ thống (CPU, memory, disk IO, network traffics) - **System**.  
- Xem các mục nhật ký hệ thống - **Logs**    
- Xem hoạt động network (nhận và gửi) - **Network**   
- Xem tài khoản người dùng - **Accounts**
- Kiểm tra trạng thái dịch vụ hệ thống - **Service**  
- Kéo thông tin lên các ứng dụng đã cài đặt - **Applications**  
- Xem và cài đặt các bản cập nhật có sẵn (nếu đăng nhập bằng root) và khởi động lại hệ thống nếu cần - **Software Updates**  
- Mở và sử dụng cửa sổ terminal - **Terminal**  
Một số cài đặt Linux Cockpit sẽ cho phép chạy các diagnostic report (báo cáo chuẩn đoán), kết xuất kernel, kiểm tra các cài đặt SELinux và liệt kê subscriptions (đăng ký).  

## 2. Cài đặt Linux Cockpit  
Một số bản Linux gần đây (ví dụ như RHEL) có thể đã được cài đặt Linux Cockpit và sẵn sàng để sử dụng. Trên các distro khác, ta cũng có thể thực hiện một vài bước đơn giản để cài đặt và truy cập đến nó.  

### Ubuntu 18.4  

1. Chạy lệnh cài cockpit  
```
apt-get install cockpit
```  
2. Kiểm tra cockpit
```
man cockpit
```
3. Kích hoạt cockpit  
```
systemctl enable --now cockpit.socket  
```
4. Kiểm tra cổng 9090 đã hoạt động chưa  
```
netstat -a | grep 9090
```
5. Kích hoạt lại cockpit  
```
systemctl enable --now cockpit.socket 
```
6. Cho phép hoạt động trên cổng 9090  
```
ufw allow 9090
```

### CentOS 7  

1. Cài đặt Cockpit package 
```
yum install -y cockpit cockpit-networkmanager cockpit-dashboard cockpit-storaged cockpit-packagekit
```
2. Kích hoạt Cockpit service
```
systemctl enable --now cockpit.socket
```
3. Firewall  
```
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
```  
4. Mở trình duyệt và gõ địa chỉ IP của host cài dịch vụ Cockpit kèm port `9090`  

Bạn sẽ thấy một cửa sổ hiện ra và yêu cầu bạn nhập `user name` và `password`. Sau khi bạn điền đầy đủ thông tin (Ở đây tôi đăng nhập dưới quyền root) và ấn `Login` thì bạn sẽ nhận được kết quả trả về giao diện quản lý hệ thống thông qua Cockpit  

<img src="https://i.imgur.com/couv5pl.png"> 

- Quan sát trong mục `System` bạn có thể thấy được thông tin của CPU, memory/swap, disk IO, Network traffic  

 <img src="https://i.imgur.com/66O8kXd.png">

- Ở mục `Logs` ta cũng có thể xem các message cũng như lọc từ Severity và Service  

<img src="https://i.imgur.com/1dUsoSS.png">  

- Trong `Storage` ta cũng có thể xem thông tin về `Filesystems` và các Storage Log  

<img src="https://i.imgur.com/0dEq3FM.png">  

- Mục `Networking` giúp ta xem thông tin về Network, lưu lượng nhận/ gửi các gói tin, Tên card mạng, địa chỉ IP, các Networking Log...  

<img src="https://i.imgur.com/1S2n1yL.png">  

- Với mục `Account` sẽ cho phép bạn xem thông tin tài khoản người dùng cũng như tạo một tài khoản mới bằng cách click vào `Create New Account`  

<img src="https://i.imgur.com/DkToouh.png">  

Ngoài ra Linux Cockpit còn rất nhiều tính năng khác giúp bạn giám sát và quản trị hệ thống của mình. Hãy thử cài đặt và khám phá những tiện ích của nó nhé. 