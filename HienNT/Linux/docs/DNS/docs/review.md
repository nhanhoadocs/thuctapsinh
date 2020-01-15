# Tìm hiểu về DNS

<img src="../images/dns.png">

## Mục lục

## DNS 

### Định nghĩa

- DNS là viết tắt của **D**omain **N**ame **S**ystem - hệ thống tên miền. DNS được phát minh vào năm 1984 cho Internet với nhiệm vụ phân giải tên miền sang địa chỉ IP và ngược lại từ địa chỉ IP sang tên miền. 

- Trong những ngày đầu tiên của mạng Internet, tất cả các tên máy và địa chỉ IP tương ứng của chúng được lưu giữ trong file hosts.txt, file này được trung tâm thông tin mạng NIC ( Network Information Center ) ở Mỹ lưu giữ. Tuy nhiên khi hệ thống Internet phát triển, việc lưu giữ thông tin trong một file không thể đáp ứng nhu cầu phân phối và cập nhật. Do đó, hệ thống tên miền DNS đã phát triển dưới dạng các cơ sở dữ liệu phân bố, mỗi cơ sở dữ liệu này sẽ quản lý một phần trong hệ thống tên miền.

### Chức năng của DNS
- Tất cả các thiết bị trên Internet có thể giao tiếp được với nhau là nhờ có địa chỉ IP(IPv4 và IPv6). Khi bạn muốn truy cập vào 1 trang web như facebook.com, github.com, dantri.com.vn,...  thì bản chất thực sự của nó là truy cập vào địa chỉ IP của server chứa dữ liệu của các trang web này. Tuy nhiên không phải ai cũng có thể nhớ được đúng và nhớ được hết địa chỉ IP của các trang web, từ đó DNS đã xuất hiện.  

- DNS đóng vai trò như 1 người phiên dịch, dịch giữa địa chỉ IP và tên miền chứ không có tác dụng thay thế hoàn toàn cho địa chỉ IP. Bạn cũng có thể tải 1 website bằng cách nhập trực tiếp địa chỉ IP thay vì dùng tên miền nếu bạn biết và nhớ địa chỉ IP của trang web đó.  

  Ví dụ, khi bạn gõ “www.google.com” vào trình duyệt, máy chủ DNS sẽ lấy địa chỉ IP của máy chủ Google là “74.125.236.37”. Sau đó, bạn sẽ nhìn thấy trang chủ Google tải trang trên trình duyệt. Đó là quá trình phân giải DNS.

- Mỗi DNS còn có chức năng ghi nhớ những tên miền mà nó đã phân giải và ưu tiên sử dụng cho những lần truy cập sau.

- Nhờ DNS, bạn có thể sử dụng nhiều dịch vụ mạng như tìm kiếm thông tin, xem phim, chơi game, đăng nhập các website,…Có thể nói nếu không có DNS, con người không thể duyệt Internet nhanh chóng và dễ dàng như ngày nay.

### Các loại DNS Server và vai trò của nó

#### Root Name Servers



## TÀI LIỆU THAM KHẢO
