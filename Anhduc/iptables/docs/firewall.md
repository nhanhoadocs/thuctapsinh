# Tìm hiểu về firewalld
## mục lục 
## 1. Tổng quan về firewalld
### 1.1) Khái niệm và chứ năng của firewalldd

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
### 1.2) Cấu trúc của firewalld
Firewall bao gồm:
- Một hoặc nhiều hệ thống máy chủ kết nối tới router hoặc có chức năng như router
- Các phần mềm quản lý bảo mật hệ thống chạy trên máy chủ

Các thành phần của firewalld: 

- ![](https://github.com/duckmak14/linux/blob/master/iptables/images/2019-04-09_10-00.png)

- Screening Router: là chặng kiểm soát đầu tiên cho LAN
- DMZ: là vùng có nguy cơ bị tấn công 
- Gateway Host: Là cổng ra và mạng LAN và DMZ 
- IF1: interface giao tiếp với internet
- IF2: interface giao tiếp mạng lan 
