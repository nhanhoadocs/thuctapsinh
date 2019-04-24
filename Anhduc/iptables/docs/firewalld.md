# 1. Khái niệm
- Là một phiên bản firewall được cài mặc định trong các phiên bản linux. Mục đích của nó là cải thiện việc quản lý rules bằng cách cho phép thay đổi các cấu hình mà các kết nối hiện tại không bị ngắt 
- Nó hoạt động như một giao diện người dùng cho bộ lọc bộ lọc mạng của nhân Linux. Có hỗ trợ cho các cài đặt tường lửa IPv4, IPv6, Ethernet và IPSet
- Firewalld là một phần mềm quản lý tường lửa mặc định trong gia đình RHEL 7.
- Trong Firewalld, zone là một nhóm các quy tắc nhằm chỉ ra những luồng dữ liệu được cho phép, dựa trên mức độ tin tưởng của điểm xuất phát luồng dữ liệu đó trong hệ thống mạng
# 2. Lợi ích của việc sử dụng tường lửa
- Thay đổi có thể được thực hiện ngay lập tức trong môi trường thời gian chạy. Không cần khởi động lại dịch vụ hoặc daemon là cần thiết.
- Với việc sử dụng D-Bus interface, các dịch vụ, ứng dụng, người dùng rất dễ dàng để thực hiện các cấu hình đối với firewall bằng cách sử dụng firewall-cmd firewall-config firewall-applet
- FirewallD quản lý các quy tắc được thiết lập tự động, có tác dụng ngay lập tức mà không làm mất đi các kết nối và session hiện có
# 3.Cấu trúc 
![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/68747470733a2f2f692e696d6775722e636f6d2f43456b546158432e706e67.png)

Firewall có 2 tầng là core layer và D-Bus
- Core layer sẽ xử oksy các cấu hình và các backends như iptables, ip6tables, ebtables, ipset and the module loader.
- D-Bus interface cho phép người dùng có thể thay đổi và tạo ra các cấu hình firewall mới. Nó được sử dụng bởi tất cả những công cụ mà firewalld đưa ra như firewall-cmd, firewallctl, firewall-config and firewall-applet.
- firewall-offline-cmd không nói chuyện trực tiếp với firewall nhưng nó có thể thực hiện thay đổi cấu hình bằng các file config kết nối trực tiếp với firewalld