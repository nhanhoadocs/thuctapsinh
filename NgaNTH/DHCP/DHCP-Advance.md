### Tìm hiểu DHCP mở rộng  

**Renew và release IP trên máy client**  

 Lệnh `dhclient` truy vấn địa chỉ IP động được cấp phát từ DHCP server. `dhclient` có thể giải phóng địa chỉ IP đang được gán cho client đồng thời nhận một địa chỉ IP mới từ DHCP Server.  
Thông thường `dhcp` không show ra output những gì nó đang làm. Chúng ta sẽ sử dụng tùy chọn `-v` (verbose) để xem thông tin cụ thể.
Lúc trước ta đã cấp địa chỉ IP cho client ở interface `ens37`. Bây giờ ta tiến hành giải phóng (release) địa chỉ đó đi bằng tùy chọn `-r`. Sau đó kiểm tra lại bằng lệnh `ip a`

<img src="https://i.imgur.com/1MXa36C.png">  

Tùy chọn `-v` kích hoạt verbose log message.

<img src="https://i.imgur.com/hbfoJ8a.png">

**Client reservation**  
Trong trường hợp bạn muốn dành riêng 1 địa chỉ IP trong range IP DHCP cho một host cụ thể trong mạng thì bạn có thể khai báo địa chỉ MAC của card mạng gắn trên host đó.  
Ví dụ tôi muốn gắn địa chỉ IP `192.168.40.99` lên interface `ens37` của máy client có địa chỉ MAC `00:0c:29:91:a6:ff` thì tôi phải khai báo trong file cấu hình `/etc/dhcp/dhcpd.conf` phía máy server.  
<img src="https://i.imgur.com/ILB2Zpm.png">

Sau đó ta restart lại mạng và kiểm tra phía máy client địa chỉ IP được cập nhật:  
<img src="https://i.imgur.com/QviQS9C.png">  

Bạn cũng có thể thêm các option riêng như `option domain name` hoặc `option router`. 

**Đọc file log về dhcp**  

Muốn xem log ghi lại dịch vụ dhcp thì ta sẽ xem trong file `/var/log/messages/`. 
Ta thực hiện lệnh release địa chỉ IP gắn trên card `ens37` của máy client và mở file `/var/log/messages` bên phía máy server để đọc log dhcp. Sử dụng lệnh `tail -f` và `grep` để lọc kết quả: 

<img src="https://i.imgur.com/QMChKHh.png">

Nhìn vào nội dung file log ta có thể biết được thời gian thực hiện release, tên message `DHCPRELEASE`, địa chỉ IP `192.168.40.99`, địa chỉ MAC `00:0c:29:91:a6:ff`, tên host `centosclient` và thông qua interface `ens37`.  
Trước đó log cũng có ghi thông tin về các bản tin `DHCPREQUEST` và `DHCPACK` khi server thực hiện cấp IP cho client.  

