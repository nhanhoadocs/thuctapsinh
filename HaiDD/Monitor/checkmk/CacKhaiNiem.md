# Tổng hợp các khái niệm

## Agent
- Là một chương trình được cài đặt trên máy chủ cần theo dõi

- Các nhà sản xuất thiết bị mạng và nhiều thiết bị thường bao gồm một tác nhân được cài đặt sẵn mà Checkmk có thể dễ dàng truy vấn bằng giao thức SNMP được tiêu chuẩn hóa

- Các dịch vụ đám mây như AWS hoặc Azure cũng có các tính năng tương tự như các đại lý, nhưng chúng được gọi là ‘APIs và được Checkmk truy vấn thông qua HTTP.

- Máy chủ chạy Windows, Linux hoặc Unix chỉ có thể được giám sát bởi Checkmk nếu bạn cài đặt một trong các tác nhân CMK 

## Host
- Trong Checkmk một host thường là máy chủ, VM, thiết bị mạng, thiết bị hoặc bất cứ thứ gì khác có địa chỉ IP đang được Checkmk theo dõi

- Mỗi máy chủ luôn có một trong các trạng thái UP, DOWN hoặc UNREACH. 

- Ngoài ra còn có các máy chủ không có địa chỉ IP, chẳng hạn như các container Docker.

## Socket
- Socket là một điểm cuối (end-point) của liên kết truyền thông hai chiều (two-way communication) giữa hai chương trình chạy trên mạng. Các lớp Socket được sử dụng để biểu diễn kết nối giữa client và server, được ràng buộc với một cổng port (thể hiện là một con số cụ thể) để các tầng TCP (TCP Layer) có thể định danh ứng dụng mà dữ liệu sẽ được gửi tới.

## Site
- Để có thể thực hiện việc giám sát thì cần tạo ra một site để có thể sử dụng

- Một server có thể tạo ra được nhiều site

- Để đăng nhập được vào site thì cần có user để đăng nhập và user được phân thành 3 loại user: Administrator; Guest; Normal monitoring

- Có 2 user mặc định có quyền Administrator là omdadmin và cmkadmin

- Site là cách gọi của sản phẩm được tạo ra từ Multisite

## Multisite – Giao diện web
- Multisite là một giao diện web được checkmk áp dụng để thay thế cho nagios web.
- Nó được sử dụng để xem thông tin và kiểm soát hệ thống giám sát.
- Kết hợp WATO để có thể hỗ trợ việc cấu hình bằng website
- WATO là tập hợp nhiều modules được sử dụng để cấu hình cho checkmk server
- Mỗi khi có thay đổi cần chọn cập nhật thay đổi
- Có sẵn các agent giám sát được lưu trữ và hiển thị sẵn trên web
- Nó có phiên bản tối ưu hóa cho điện thoại

## WATO (Web Administration Tool)
- WATO là công cụ cấu hình Checkmk thông qua GUI
- WATO duy trì tất cả các cấu hình ở định dạng dữ liệu văn bản thông thường mà người dùng có kinh nghiệm có thể chỉnh sửa thủ công hoặc thậm chí tạo bằng các tập lệnh

    <img src="https://i.imgur.com/S0KXFM2.png">

## Service
- Trên mỗi máy chủ có một số service được theo dõi. 
- Một dịch vụ có thể là bất cứ thứ gì - ví dụ: hệ thống tệp, quy trình, cảm biến phần cứng, tổng đài - nhưng nó cũng có thể là một số liệu cụ thể như mức sử dụng CPU hoặc mức sử dụng RAM
- Mỗi dịch vụ có một trong các trạng thái OK, WARN, CRIT hoặc UNKNOWN.

## Passive check
- Passive check là việc thu thập thông tin từ Agent đối với Passive item (item bị động)
- Đối với Passive check thì Server sẽ request thông tin cần tìm kiếm đến các Agent theo các khoảng thời gian đã được cấu hình trong các item tương ứng, lấy thông tin monitor và báo về hệ thống ngay lập tức. Server khởi tạo kết nối, Agent luôn ở chế độ lắng nghe kết nối từ Server

## Active check
- Đây là kiểu kiểm tra tương ứng với Item Active (chủ động)
- Đặc tính của kiểu này là công việc chủ động request thông tin cần giám sát thuộc về Checkmk Agent. Kiểu kiếm tra này hay dùng khi Checkmk Server không thể kết nối trực tiếp đến Checkmk Agent (có thể do chính sách firewall...)
- Agent sẽ chủ động gửi request tới server nhằm lấy thông tin các item được server chỉ định sẵn. Sau khi lấy được danh sách item thì Agent sẽ xử lý động lập rồi gửi tuần tự thông tin về cho Server. Server sẽ không khởi tạo kết nối nào mà chỉ trả lời request item list và nhận lại thông tin được trả về.