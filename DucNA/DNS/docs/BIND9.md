# Mục lục 
0. [Tổng quan về BIND 9](#a)
1. [Cài đặt BIND 9](#b)
2. [Thành phần của BIND 9](#c)
3. [File cấu hình named.conf](#d)
4. [Tìm hiểu một số statement](#e)

<a name="a">

# Tổng quan về BIND 9</a>
BIND9 là phần mềm nguồn mở thực hiện các giao thức Hệ thống tên miền (DNS) cho Internet, cung cấp khả năng thực hiện chuyển đổi tên thành ip. Tên BIND là viết tắt của tên Berkeley Berkeley Tên miền Internet, vì phần mềm có nguồn gốc từ đầu những năm 1980 tại Đại học California tại Berkeley. 

BIND cho đến nay là phần mềm DNS được sử dụng rộng rãi nhất trên Internet, cung cấp một nền tảng mạnh mẽ và ổn định trên đó các tổ chức có thể xây dựng các hệ thống máy tính phân tán với kiến ​​thức rằng các hệ thống đó tuân thủ đầy đủ các tiêu chuẩn DNS được công bố.

RNDC là viết tắt của Remote Name Daemon Control.Nó là một tiện ích dòng lệnh và nó kiểm soát hoạt động của một máy chủ tên. Tệp cấu hình của rndc được đặt tại /etc/rndc.conf

<a name="b">

1. Cách cài đặt BIND 9 </a>
```
yum install bind bind-utils
```

<a name="c">
2. Thành phần và Cấu trúc của BIND </a>
- Theo mặc định thì `/etc/resolv.conf` là nơi mặc định sẽ lưu trữ địa chỉ cổng gateway mà ta đi qua để kết nối tới mạng. Các DNS server sẽ được liệt kê vào đây để forwarders
- Một name server sử dụng file `/etc/named.conf` để  xác định đường dẫn đến file cấu hình của DNS và xác định một vài chức năng của DNS. BIND 9 sẽ đọc file cấu hình nơi mà có các yêu cầu và các đường dẫn tới file cấu hình khác
- File log truy vấn của DNS được lưu ở trong `/var/log/messages`
- Bật kiểm soát đăng nhập `rndc querylog` sẽ lưu trong file log 


<a name="d">

3. file cấu hình `/etc/named.conf` và clauses được BIND sử dụng </a>

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


<a name="e">

# Tìm hiểu về các statements</a>
1. zone statements.
Cú pháp 
```
zone "zone_name" [class] {
    zone statements;
};
```
`statements type` : Dùng để xác định loại DNS mà chúng ta cấu hình 
- Các khái niệm về các kiểu DNS. với statements `type`

| type|   khái niệm   |
|-------|-----|
|master| Là nơi có những bản chính của dữ liệu được lưu trữ |
|salve| Là nơi có những bản sao dữ liệu của master |
|hint| Là vùng gợi ý tìm đến root name server. Nếu ko có gợi ý nó sẽ dùng default |
| forward| là máy chủ được giao cho |

2. logging statement 
Có chức năng cấu hình file log của DNS. 
Cú pháp 
```
logging {
	logging statement;
};
```
Nếu không có statement logging mặc định của nó sẽ là 
```
logging {
     category default { default_syslog; default_debug; };
     category unmatched { null; };
};
```
- Messages: có mức độ ưu tiên thấp nhất trong các channel 
- Mỗi một channel sẽ có một file log để lưu trữ riêng. Cần phải chỉ ra file đó mỗi khi tạo ra channel và được lưu trong `/var/log`


# Link tham khảo 

http://www.zytrax.com/books/dns/

https://ftp.isc.org/isc/bind9/cur/9.11/doc/arm/Bv9ARM.ch06.html

https://www.cyberciti.biz/faq/start-stop-restart-bind9-linux-command/

https://www.cyberciti.biz/faq/howto-enable-dns-linux-unix-server-logging/