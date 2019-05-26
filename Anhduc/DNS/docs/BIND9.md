# Tổng quan về BIND 9
BIND9 là phần mềm nguồn mở thực hiện các giao thức Hệ thống tên miền (DNS) cho Internet, cung cấp khả năng thực hiện chuyển đổi tên thành ip. Tên BIND là viết tắt của tên Berkeley Berkeley Tên miền Internet, vì phần mềm có nguồn gốc từ đầu những năm 1980 tại Đại học California tại Berkeley. 

BIND cho đến nay là phần mềm DNS được sử dụng rộng rãi nhất trên Internet, cung cấp một nền tảng mạnh mẽ và ổn định trên đó các tổ chức có thể xây dựng các hệ thống máy tính phân tán với kiến ​​thức rằng các hệ thống đó tuân thủ đầy đủ các tiêu chuẩn DNS được công bố.

RNDC là viết tắt của Remote Name Daemon Control.Nó là một tiện ích dòng lệnh và nó kiểm soát hoạt động của một máy chủ tên. Tệp cấu hình của rndc được đặt tại /etc/rndc.conf

1. Cách cài đặt BIND 9 
```
yum install bind bind-utils
```
2. Thành phần và Cấu trúc của BIND 
- Theo mặc định thì `/etc/resolv.conf` là nơi mặc định sẽ lưu trữ địa chỉ cổng gateway mà ta đi qua để kết nối tới mạng. Các DNS server sẽ được liệt kê vào đây để forwarders
- Một name server sử dụng file `/etc/named.conf` để  xác định đường dẫn đến file cấu hình của DNS và xác định một vài chức năng của DNS. BIND 9 sẽ đọc file cấu hình nơi mà có các yêu cầu và các đường dẫn tới file cấu hình khác

3. file cấu hình `/etc/named.conf` và clauses được BIND sử dụng 
Các clauses

|clauses|Mô tả|
|-------|-----|
|`acl` | Access Control Lists. Là nơi Có danh sách kiểm soát BIND9 |
|`controls`   |Được sử dụng để xác định thông tin truy cập và điều khiển khi sử dụng các dịch vụ quản trị từ xa được sử dụng trong  tiên ích Remote Name Daemon Control  |
|`dlz`|dùng để xác định khu vực Dynamically Loaded|
|`include`|Được dùng để cho phép đưa các tệp bên ngoài vào tệp named.conf|
|`key`| Xác định các khóa được chia sẻ dùng để kiểm tra và xác định truy cập từ xa|
|`logging`|Được sử dụng để định dạng file log trong BIND |
|`lwres`| Xác định thuộc tính của bind khi chạy ở lightweight resolver|
|`option`| Là nơi được ghi cácđường dẫn tới các zone và view |
|`view`| Kiểm soát các chức năng của BIND |
|`zone`| Xác định vùng mà server sẽ hỗ trợ |

Trong file này thì cần các `zone` để có thể hoạt động được chính xác.
```
zone "." IN {
        type hint;
        file "named.ca";
};
```
Vùng này chỉ hoạt động nếu máy chủ hỗ trợ truy vấn đệ quy. Tập tin thiết lập tên của các máy chủ gốc và liệt kê địa chỉ của họ.Nếu mạng của bạn được kết nối với Internet, hãy named.caliệt kê các máy chủ tên Internet; mặt khác, nó liệt kê các máy chủ tên miền gốc cho mạng cục bộ của bạn
```
zone localhostin{
  type master;
  file "master.localhost";
};
```
Vùng này cho phép phân giải tên localhost thành địa chỉ IP host. Mọi truy vấn cho máy chủ đều được chuyển thành địa chỉ IP 

# Tìm hiểu về các statements
1. zone statements.
Cú pháp 
```
zone "zone_name" [class] {
    zone statements;
};
```
`statements type` : Dùng để xác định loại DNS mà chúng ta cấu hình 
- class : Phần lớn các class là IN tss

2. master statements 
chỉ có tác dụng với type slave zone và xác định địa chỉ ip port trong DNS server. Slave sẽ dùng địa chỉ IP đó để update zone file của mình 