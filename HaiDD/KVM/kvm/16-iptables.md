# Tìm hiểu iptables

## I. Khái niệm
Iptables là một gói phần mềm để tạo tường lửa cho máy linux của bạn nó có các chức năng lọc gói tin, nat gói tin qua đó để giúp làm nhiệm vụ bảo mật thông tin cá nhân tránh mất mát thông tin và áp dụng nhưng chính sách đổi với người sử dụng.

Iptables hoạt động bằng cách giao tiếp với packet filtering hooks trong Linux kernel's networking stack. Các hooks này là netfilter framework.

iptables đơn giản chỉ là một danh sách các rules được tổ chức theo dạng bảng. Mỗi một rule chứa một loạt các classifiers (iptables matches) và một connected action (iptables target).

Các firewall software khác chỉ đơn giản là sử dụng lại cơ chế hoặc cung cấp GUI interface để người dùng thao tác với iptables.

**Các tính năng chính**

- stateless packet filtering (IPv4 and IPv6)
- stateful packet filtering (IPv4 and IPv6)
- all kinds of network address and port translation, e.g. NAT/NAPT (IPv4 and IPv6)
- flexible and extensible infrastructure
- multiple layers of API's for 3rd party extensions

**stateful filter**: sẽ giữ 1 danh sách các connections đã được thiết lập, nó được cho là có hiệu quả hơn trong việc phát hiện các gói tin giả mạo và có thể thực hiện một loạt các functions của IPsec như tunnels và encryption.

**stateless filter**: không giữ danh sách ấy, mọi packet đều được process một cách độc lập với nhau. Nó được cho là sẽ xử lí gói tin nhanh hơn.

**Người dùng có thể làm gì với iptables?**

- Xây dựng một hệ thống tường lửa cho hệ thống dựa trên stateless và stateful packet filtering
- Triển khai một cụm cluster stateless và stateful firewall
- Dùng NAT và masquerading để chia sẻ kết nối internet
- Dùng NAT để xây dựng transparent proxies
- Thực hiệm một số tác vụ với packet như thay đổi TOS/DSCP/ECN trong IP header

