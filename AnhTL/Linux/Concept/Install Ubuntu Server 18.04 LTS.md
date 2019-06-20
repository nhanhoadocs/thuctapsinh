# Install Ubuntu Server 18.04 LTS

**Các bước chuẩn bị**
- File iso của Ubuntu Server 18.04. Link download tại đây: http://releases.ubuntu.com/18.04/
- Máy ảo VirtualBox, VMWare hoặc có thể ghi file iso ra đĩa và cài trên máy tính thật.

**Hướng dẫn cài đặt Ubuntu Server 18.04 LTS**
- Sau khi boot vào máy chủ với file iso hoặc đĩa cài đặt Ubuntu Server, chúng ta thực hiện các bước cài đặt như sau:

**B1: Lựa chọn ngôn ngữ**

=> Chọn ngôn ngữ mặc định là “English” hoặc ngôn ngữ nào mà bạn mong muốn.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-1.png)

**B2: Kiểu bàn phím**

=> Chọn mặc định là English US

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-2.png)

**B3: Ubuntu Platform**

=> Chọn “Install Ubuntu”

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-3.png)

**B4: Cấu hình Network**

=> Để mặc định => Bấm [ Done ] để tiếp tục
- Trên màn hình tiếp theo, chọn ít nhất một card mạng để định cấu hình, nó sẽ tự động cài đặt địa chỉ IP nếu có máy chủ DHCP trong môi trường của bạn.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-4.png)

**B5: Cấu hình Proxy Server**

=> Có thể cấu hình hoặc, bỏ trống.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-5.png)

**B6: Cấu hình Ubuntu Mirror**

=> Đây là dường dẫn tên miền đặt máy chủ có chứa các package của Ubuntu, phục vụ cho việc cài đặt, nâng cấp Ubuntu.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-6.png)

- Vì mình ở Việt Nam nên muốn cài đặt và nâng cấp các package của Ubuntu được nhanh chóng nên mình thay đổi bằng địa chỉ Server đặt ở VN là http://opensource.xtdv.net/ubuntu

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-7.png)

**B7: Phân vùng ổ đĩa và hệ thống tệp tin**

=> Chọn **Use An Entire Disk** nếu bạn là người mới bắt đầu, còn nếu bạn là 1 "Linux System Professional" thì có thể lựa chọn tùy chọn **Manual** để phân vùng ổ đĩa.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-8.png)

- Chọn ổ đĩa để cài đặt.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-9.png)

- Thông tin phân vùng ổ đĩa => Chọn [ Done ] để tiếp tục.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-10.png)

- Một cảnh báo sẽ hiển thị, xác nhận ổ đĩa sẽ được format => Chọn [ Continue ] để tiếp tục.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-11.png)

- Cấu hình thông tin đăng nhập vào hệ thống bao gồm:
  - Your name: Tên của bạn
  - Your server’s name: Tên Server
  - Pick a username: Tên đăng nhập
  - Choose a password: Mật khẩu
  - Confirm your password: Nhập lại mật khẩu của bạn

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-12.png)

**B8: Cài đặt OpenSSH để có thể đăng nhập vào Server bằng giao thức SSH**

=> Tích vào ô “Install OpenSSH server” bằng cách sử dụng phím [ Space ]

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-13.png)

- Một số loại phần mềm có sẵn để bạn có thể cài đặt, ở đây mình ko có nhu cầu cài đặt cài nào trong đây. Các bạn có thể chọn nếu muốn cài, sử dụng phím [ Space ] để lựa chọn.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-14.png)

- Quá trình cài đặt sẽ được bắt đầu.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-15.png)

- Sau khi cài đặt xong => Chọn [ Reboot Now ] để reboot lại máy chủ.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-16.png)

- Gỡ bỏ đĩa cài đặt => bấm phím [ Enter ] để boot vào HDH

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-17.png)

- Kết quả sau khi reboot, chúng ta thực hiện login vào Server bằng tài khoản đã tạo ở các bước trên.

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-18.png)

- Sau khi đăng nhập thành công vào Server

![](https://vinasupport.com/uploads/bai-viet/Ubuntu/Server-1804/Huong-Dan-Cai-Dat-Ubuntu-Server-18-04-Step-19.png)

Như vậy quá trình cài đặt Ubuntu Server 18.04 LTS đã kết thúc.

# END


