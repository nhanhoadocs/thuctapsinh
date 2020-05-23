# Các loại bản ghi trên DNS

# 1. SOA (Start of Authority)
Trong mỗi tập tin cơ sở dữ liệu DNS phải có một và chỉ một record SOA (Start of Authority). Bao gồm các thông tin về domain trên DNS Server, thông tin về zone transfer.

### Cú pháp
```
[tên miền] IN SOA [tên-server-dns] [địa-chỉ-email] (serial number;refresh number;retry number;experi number;time-to-live number)
```

**Ví dụ**:
```
$TTL 86400
@ IN SOA dns-server.dangdohai.com. admin.dangdohai.com. (
                            2020030500 ;Serial
                            3600 ;Refresh
                            1800 ;Retry
                            604800 ;Expire
                            86400 ;Minimum TTL
)
```

### Trong đó:

- `dns-server.dangdohai.com.` - giá trị DNS chính của tên miền hoặc máy chủ.

- `admin.dangdohai.com.` chuyển đổi từ dạng `admin@dangdohai.com`, thể hiện chủ thể sở hữu tên miền này.

- `Serial`: áp dụng cho mọi dữ liệu trong zone và có định dạng YYYYMMDDNN với YYYY là năm, MM là tháng, DD là ngày, NN là số lần sửa đổi dữ liệu zone trong ngày. Luôn luôn phải tăng số này lên mỗi lần sửa đổi dữ liệu zone. Khi Slave DNS Server liên lạc với Master DNS Server, trước tiên nó sẽ hỏi số serial. Nếu số serial của Slave nhỏ hơn số serial của máy Master tức là dữ liệu zone trên Slave đã cũ và sau đó Slave sẽ sao chép dữ liệu mới từ Master thay cho dữ liệu đang có.

- `Refresh`: chỉ ra khoảng thời gian Slave DNS Server kiểm tra dữ liệu zone trên Master để cập nhật nếu cần. Giá trị này thay đổi tùy theo tuần suất thay đổi dữ liệu trong zone.

- `Retry`: nếu Slave DNS Server không kết nối được với Master DNS Server theo thời hạn mô tả trong refresh (ví dụ Master DNS Server bị shutdown vào lúc đó thì Slave DNS Server phải tìm cách kết nối lại với Master DNS Server theo một chu kỳ thời gian mô tả trong retry. Thông thường, giá trị này nhỏ hơn giá trị refresh).

- `Expire`: nếu sau khoảng thời gian này mà Slave DNS Server không kết nối được với Master DNS Server thì dữ liệu zone trên Slave sẽ bị quá hạn. Khi dữ liệu trên Slave bị quá hạn thì máy chủ này sẽ không trả lời mỗi truy vấn về zone này nữa. Giá trị expire này phải lớn hơn giá trị refresh và giá trị retry.
Minimum TTL: chịu trách nhiệm thiết lập TTL tối thiểu cho 1 zone.

# 2. NS (Name server)
- Bản ghi NS dùng để khai báo máy chủ tên miền cho một tên miền. Nó cho biết các thông tin về tên miền này được khai báo trên máy chủ nào. Với mỗi một tên miền phải có tổi thiểu hai máy chủ tên miền quản lý, do đó yêu cầu có tối thiểu hai bản ghi NS cho mỗi tên miền.

### Cú pháp của bản ghi NS:
    ```
    <tên miền> IN NS <tên của máy chủ tên miền>
    ```

- **Ví dụ**: 
    ```
    dangdohai.com. IN NS ns1.zonedns.vn.
    dangdohai.com. IN NS ns2.zonedns.vn.
    ```

    Với ví dụ này, tên miền *dangdohai.com* sẽ do máy chủ tên miền *ns1.zonedns.vn* và *ns2.zonedns.vn* quản lí. Điều này có nghĩa là các bản ghi như A, CNAME, MX, ... của tên miền *dangdohai.com* và các tên miền cấp dưới nó sẽ được khai báo trên máy chủ *ns1.zonedns.vn* và *ns2.zonedns.vn*

# 3. A
- Là 1 record căn bản và quan trọng, dùng để ánh xạ từ một domain thành địa chỉ IP cho phép truy cập website. Đây là chức năng cốt lõi của hệ thống DNS. 

### Cú pháp
```
domain IN A <địa chỉ IPv4 của máy>
```

**Ví dụ:**
Khai báo bản ghi A
```
dangdohai.com A 10.10.34.162
```
Tên miền con (subdomain)
```
sub.dangdohai.com A 10.10.34.162
```

# 4. AAA
Tương tự Record A nhưng dùng cho ipv6.

# 5. PTR (Poiter Records)
- Bản ghi PTR (pointer) trỏ một địa chỉ IP đến một bản ghi A trong chế độ ngược (reverse) và được sử dụng trong kiểu tên miền infrastructure TLD.

    <img src="..\images\Screenshot_22.png">

- Ví dụ về dạng thức một bản ghi PTR như sau:
    ```
    163.34.10.10.in-addr.arpa   IN      PTR     mail.dangdohai.com
    ```
    hoặc với ipv6
    ```
    0.0.0.0.0.0.0.0.0.0.0.0.d.c.b.a.4.3.2.1.3.2.1.0.8.c.d.0.1.0.0.2.ip6.arpa  IN PTR mail.dangdohai.com. 
    ```

# 6. SRV (Service)
- Bản ghi SRV được sử dụng để xác định vị trí các dịch vụ đặc biệt trong 1 domain, ví dụ tên máy chủ và số cổng của các máy chủ cho các dịch vụ được chỉ định.

- **Ví dụ:**
    ```
    _ldap._tcp.example.com. 3600  IN  SRV  10  0  389  ldap01.example.com.
    ```

    Một Client trong trường hợp này có thể nhờ DNS nhận ra rằng, trong tên miền example.com có LDAP Server là `ldap01` và có thể liên lạc qua cổng TCP 389.

    **Các trường trong record SRV** :
    - Tên dịch vụ service.
    - Giao thức sử dụng.
    - Tên miền (domain name).
    - TTL: Thời gian RR được giữ trong cache
    - Class: standard DNS class, luôn là IN
    - Ưu tiên: ưu tiên của host, số càng nhỏ càng ưu tiên.
    - Trọng lượng: khi cùng bực ưu tiên, thì trọng lượng 3 so với trọng lượng 2 sẽ được lựa chọn 60% (hỗ trợ load balancing).
    - Port của dịch vụ (tcp hay udp).
    - Target chỉ định FQDN cho host hỗ trợ dịch vụ.

# 7. CNAME (Canonical Name)
Cho phép tên miền có nhiều bí danh khác nhau, khi truy cập các bí danh sẽ cũng về 1 địa chỉ tên miền. Để sử dụng bản ghi CNAME cần khai báo bản ghi A trước.

### Cú pháp
```
alias-domain IN CNAME canonical domain.
```


**Ví dụ**: Bản ghi CNAME phổ biến nhất
```
www.dangdohai.com IN CNAME home.dangdohai.com.
```
Tên miền *www.dangdohai.com* sẽ là tên bí danh của tên miền *home.dangdohai.com*, 2 tên miền này đều trỏ về địa chỉ IP chung.

# 8. MX (Mail Exchange)
- Bản ghi MX có tác dụng xác định, chuyển thư đến domain hoặc subdomain đích. Bản ghi MX có dạng:
    ```
    dangdohai.com    MX    10    mail.dangdohai.com.
    mail.dangdohai.com    A    10.10.34.162
    ```

- Số càng thấp thì độ ưu tiên càng cao. Ví dụ:
    ```
    dangdohai.com MX 10 mail_1.dangdohai.com
    dangdohai.com MX 20 mail_2.dangdohai.com
    dangdohai.com MX 30 mail_3.dangdohai.com
    ```
    Tất cả các thư điện tử có cấu trúc địa chỉ *user@dangdohai.com* trước hết sẽ được gửi đến trạm chuyển tiếp thư điện tử *mail_1.dangdohai.com*. Chỉ trong trường hợp máy chủ *mail_1.dangdohai.com* không thể nhận thư thì các thư này mới lần lượt được chuyển đến trạm chuyển tiếp mail_2.dangdohai.com và mail_3.dangdohai.com

- Bản ghi MX không nhất thiết phải trỏ đến hosting-VPS-Server của người dùng. Nếu người dùng đang sử dụng dịch vụ mail của bên thứ 3 như Gmail thì cần sử dụng bản ghi MX do họ cung cấp.

# 9. TXT (Text)
Bản ghi TXT(text) được sử dụng để cung cấp khả năng liên kết văn bản tùy ý với máy chủ. Chủ yếu dùng trong mục đích xác thực máy chủ với tên miền.

# 10. DKIM (DomainKeys Identified Email)
- Là bản ghi dùng để xác thực người gửi bằng cách mã hóa một phần email gửi bằng một chuỗi ký tự, xem như là chữ ký.

- Khi email được gửi đi máy chủ mail sẽ kiểm so sánh với thông tin bản ghi đã được cấu hình trong DNS để xác nhận. Bản ghi DKIM có dạng:
    ```
    mail._domainkey.dangdohai.com     TXT  k=rsa;p=MIIBIjANBgkqhkiG9w0BA
    ```

# 11. SQF (Sender Policy Framework)
- Record SPF được tạo ra nhằm đảm bảo các máy chủ mail sẽ chấp nhận mail từ tên miền của khách hàng chỉ được gửi đi từ server của khách hàng. Sẽ giúp chống spam và giả mạo email

- Ví dụ:
    ```
    dangdohai.com   SPF     "v=spf1 ip4:10.10.34.0/24 -all" 3600 
    ```

- Tùy vào hệ thống DNS mà có thể hiển thị bản ghi SPF hoặc TXT Với bản ghi SPF, máy chủ tiếp nhận mail sẽ kiểm tra IP của máy chủ gửi và IP của máy chủ đã đăng kí bản ghi SPF example.com. Nếu Khách hàng có nhiều máy chủ mail nên liệt kê tất cả trong bản ghi SPF giúp đảm bảo thư đến được chính xác và đầy đủ.