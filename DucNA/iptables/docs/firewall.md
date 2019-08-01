# Tìm hiểu về firewall
## mục lục 
## 1. Tổng quan về firewall
### 1.1) Khái niệm và chứ năng của firewall

![](https://github.com/duckmak14/linux/blob/master/iptables/images/Screenshot%20from%202019-04-09%2008-13-39.png)

Tường lửa là một thiết bị bảo mật mạng giám sát lưu lượng mạng đến và đi và quyết định xem có cho phép hoặc chặn lưu lượng cụ thể dựa trên một bộ quy tắc bảo mật.

Tường lửa sẽ tạo ra một rào cản giữa mạng nội bộ và internet để chặn các lưu lượng không đáng tin cậy 
 
Tại sao cần firewall?
- Khi truy cập internet thì tất cả các traffic đều được quyền truy cập vào máy tính của bạn nếu như nó không được bảo vệ ví dụ như virus. Một firewall có thể giúp ta thoát khỏi những gói tin đáng nghi ngờ.
Chức năng của firewall
- kiểm soát luồng thông tin từ giữa Intranet và Internet. 
- Bảo vệ tài nguyên 
- Xác thực quyền truy cập 
- Quản lý và kiểm soát lưu lượng mạng
- Ghi lại và báo cáo về các sự kiện
- Hoạt động như một trung gian
### 1.2) Cấu trúc của firewall
Firewall bao gồm:
- Một hoặc nhiều hệ thống máy chủ kết nối tới router hoặc có chức năng như router
- Các phần mềm quản lý bảo mật hệ thống chạy trên máy chủ

Các thành phần của firewall: 


![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/2019-04-09_10-00.png)


- Screening Router: là chặng kiểm soát đầu tiên cho LAN
- DMZ: là vùng có nguy cơ bị tấn công 
- Gateway Host: Là cổng ra và mạng LAN và DMZ 
- IF1: interface giao tiếp với internet
- IF2: interface giao tiếp mạng lan 
### 1.3) Phân loại firewall 
Firewall được phân thành hai loại chính đó là `Personal firewalls` và `Network firewall` . Hai loại này có sự khác nhau là `network firewall` có thể bảo vệ được một mạng lan với số lượng host lớn còn `Personal firewalls` chỉ có thể bảo vệ được một host mà thôi 

Trong network firewall sử dụng các công nghệ sau
- Packet filters: Là thiết bị được thiết kế để lọc gói tin dựa trên những đặc điểm đơn giản của gói tin. Packet filters tiêu biểu cho dạng statless vì nó không giữ bảng trạng thái các kết nối và không kiểm tra trạng thái các kết nối.
- Network Address Translations (NAT) firewalls: Thực hiện chức năng chuyển đổi địa chỉ IP public thành địa IP private và ngược lại, nó cung cấp cơ chế che dấu IP các host bên trong
- Circuit-level firewalls: Hoạt động tại lớp session của mô hình OSI, nó giám sát các gói tin “handshaking” đi qua firewall, gói tin được chỉnh sửa sao cho nó xuất phát từ circuit-level firewall, điều này giúp che dấu thông tin của mạng được bảo vệ.
- Stateful firewalls: Được kết hợp với các firewall khác như NAT firewall, circuit-level firewall, proxy firewall thành một hệ thống firewall, nó không những kiểm tra các đặc điểm của gói tin mà lưu giữ và kiểm tra trạng thái của các gói tin đi qua firewall, một ví dụ cho statefull firewall là sản phẩm PIX firewall của Cisco.
- Application: Hoạt động tại lớp ứng dụng của mô hình OSI, nó đóng vai trò như người trung gian giữa hai thiết bị đầu cuối. Khi người dùng truy cập dịch vụ ngoài internet, proxy đảm nhận việc yêu cầu thay cho client và nhận trả lời từ server trên internet và trả lời lại cho người dùng bên trong.
