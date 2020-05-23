# Các bảng và chức năng trong iptables

Trong kiến trúc của iptable có sử dụng các bảng để quy định các chain cùng thực hiện các chức năng trong một không gian nhất định với công việc nhất định. Hiện tại, iptable cung cấp cho chúng ta 5 loại table (để có thể sử dụng được các table, trong kernel ta cần phải có module của nó). Một số module:
- `iptables_nat module` cần cho một số loại NAT.

- `ip_conntrack_ftp module` cần cho việc thêm vào giao thức FTP.

- `ip_conntrack module` giữ trạng thái liên kết với giao thức TCP.

- `ip_nat_ftp module` cần được tải cho những máy chủ FTP sau một firewall NAT

**CHÚ Ý**: file `/etc/sysconfig/iptables` không cập nhật những module tải về, vì vậy chúng ta phải thêm những trạng thái đó vào file `/etc/rc.local` và chạy nó tại cuối mỗi lần boot lại.   

Những mẫu trong phần này bao gồm những trạng thái được lưu trong file `/etc/rc.local`:

```
#File:/etc/rc.local

#Module to track the state of connections modprobe ip_conntrack

#Load the iptables active FTP module, requires ip_conntrack modprobe

#ip_conntrack_ftp

#Load iptables NAT module when required modprobe iptable_nat

#Module required for active an FTP server using NAT modprobe ip_nat_ftp
```

## NAT table
Cho phép route các gói tin đến các host khác nhau trong mạng bằng cách thay đổi IP nguồn và IP đích của gói tin. Table này quy định và cho phép các kết nối có thể truy cập tới các dịch vụ không được truy cập trực tiếp. Bao gồm 3 thành phần:

- `PREROUTING chain` – Thay đổi gói tin trước khi định tuyến, điều này có nghĩa là việc dịch gói tin sẽ xảy ra ngay lập tức sau khi gói tin đến hệ thống. Điều này thực hiện thay đổi địa chỉ IP đích thành một địa chỉ nào đó sao cho phù hợp với việc định tuyến trên máy chủ cục bộ - DNAT.
- `POSTROUTING chain` – Thay đổi gói tin sau khi định tuyến, điều này có nghĩa là dịch gói tin khi gói tin ra khỏi hệ thống. Điều này thực hiện thay đổi địa chỉ IP nguồn của gói tin thành một địa chỉ nào đó phù hợp với việc định tuyến trên máy chủ đích - SNAT.
- `OUTPUT chain` – thực hiện NAT cho các gói tin được thực hiện cục bộ trên firewall.

## FILTER table
Đây là table được sử dụng mặc định bởi `iptables` khi bạn tạo các `chain` mà không khai báo cho `chain` đó thuộc vào table nào. Table hoạt động với việc quy định việc quyết định có cho phép gói tin được chuyển đến địa chỉ đích hay không. Bao gồm 3 thành phần:
- `INPUT chain`: Các gói tin đến firewall. Áp dụng đối với các gói tin đến máy chủ cục bộ.

- `OUTPUT chain`: Các gói tin đi ra khỏi firewall. Áp dụng với các gói tin được tạo ra cục bộ và đi ra khỏi máy chủ.

- `FORWARD chain`: Áp dụng đối với các gói tin được định tuyến đi qua máy chủ.

## MANGLE table
Table này liên quan đến việc sửa header của gói tin, ví dụ chỉnh sửa giá trị các trường TTL, MTU, Type of Service.

Bao gồm các thành phần sau:
- PREROUTING chain
- OUTPUT chain
- FORWARD chain
- INPUT chain
- POSTROUTING chain

## RAW Table
Bảng này được sử dụng chủ yếu dành cho việc cấu hình sử dụng chain có sẵn. Bao gồm:
- PREROUTING chain
- OUTPUT chain

## Security Table
Đây là bảng được sử dụng cho **Mandatory Access Control (MAC)** - kiểm soát truy cập bắt buộc đối với các rule về network.

MAC được triển khai bởi **Linux Security Modules** được biết đến như là SELinux. Gói tin được chuyển đến table này sau khi đi qua **FILTER table** và cho phép một vài **Discretionary Access Control (DAC)** - kiểm soát truy cập tùy ý trong **FILTER table** gây ảnh hưởng trước các MAC rule. Table này cung cấp các chain có sẵn là:
- INPUT chain.
- OUTPUT chain.
- FORWARD chain.