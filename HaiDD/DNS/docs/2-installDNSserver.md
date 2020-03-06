# Cài đặt DNS server trên CentOS-7

# I. Mô hình triển khai

<img src="..\images\Screenshot_11.png">

**Phân hoạch IP**:

|Hostname|IP|OS|
|--------|--|--|
|dns-server|10.10.34.161|CentOS-7|
|client|10.10.34.164|CentOS-7|

-> Thực hiện cấu hình bằng quyền `root.`


# II. Cài đặt trên DNS Server
## 1. Cài đặt gói bind
```
yum install -y bind bind-utils
```

## 2. Tạo file zone forward và zone reverse(bản ghi PTR)
### 2.1. Tạo forward DNS zone file cho tên miền `dangdohai.com`
- File lưu trữ thông tin mối quan hệ giữa địa chỉ IP và host name. Khi được truy vấn, nó cung cấp địa chỉ IP của host system bằng host name

- Tạo file :
    ```
    vim /var/named/dangdohai.com.fwd
    ```

- Thêm vào nội dung 
    ```
    $TTL 86400
    @ IN SOA dns-server.dangdohai.com. admin.dangdohai.com. (
                                          2020030500 ;Serial
                                          3600 ;Refresh
                                          1800 ;Retry
                                          604800 ;Expire
                                          86400 ;Minimum TTL
    )

    ;Name Server Information
    @ IN NS dns-server.dangdohai.com.

    ;IP Address for Name Server
    dns-server IN A 10.10.34.161

    ;Mail Server MX (Mail exchanger) Record
    dangdohai.com. IN MX 10 mail.dangdohai.com.

    ;A Record for the following Host name
    www  IN   A   10.10.34.162
    mail IN   A   10.10.34.163

    ;CNAME Record
    ftp  IN   CNAME www.dangdohai.com.
    ```

    <img src="..\images\Screenshot_13.png">

- **Trong đó**:
    - `TTL`: là viết tắt của Time-To-Live là khoảng thời gian(hoặc hops) mà gói tin tồn tại trên mạng trước khi bị router loại bỏ.
    - `IN`: là Internet
    - `SOA`: là viết tắt của Start of Authority. Về cơ bản nó xác định name server có thẩm quyền, trong trường hợp này là *dns-server.dangdohai.com* và thông tin liên lạc - *admin.dangdohai.com*
    - `NS`: là viết tắt của Name Server
    - `A`: là bản ghi A. Nó trỏ 1 domain/subdomain tới địa chỉ IP
    - `Serial`: áp dụng cho mọi dữ liệu trong zone và có định dạng YYYYMMDDNN với YYYY là năm, MM là tháng, DD là ngày, NN là số lần sửa đổi dữ liệu zone trong ngày. Luôn luôn phải tăng số này lên mỗi lần sửa đổi dữ liệu zone. Khi Slave DNS Server liên lạc với Master DNS Server, trước tiên nó sẽ hỏi số serial. Nếu số serial của Slave nhỏ hơn số serial của máy Master tức là dữ liệu zone trên Slave đã cũ và sau đó Slave sẽ sao chép dữ liệu mới từ Master thay cho dữ liệu đang có.
    - `Refresh`: chỉ ra khoảng thời gian Slave DNS Server kiểm tra dữ liệu zone trên Master để cập nhật nếu cần. Giá trị này thay đổi tùy theo tuần suất thay đổi dữ liệu trong zone.
    - `Retry`: nếu Slave DNS Server không kết nối được với Master DNS Server theo thời hạn mô tả trong refresh (ví dụ Master DNS Server bị shutdown vào lúc đó thì Slave DNS Server phải tìm cách kết nối lại với Master DNS Server theo một chu kỳ thời gian mô tả trong retry. Thông thường, giá trị này nhỏ hơn giá trị refresh).
    - `Expire`: nếu sau khoảng thời gian này mà Slave DNS Server không kết nối được với Master DNS Server thì dữ liệu zone trên Slave sẽ bị quá hạn. Khi dữ liệu trên Slave bị quá hạn thì máy chủ này sẽ không trả lời mỗi truy vấn về zone này nữa. Giá trị expire này phải lớn hơn giá trị refresh và giá trị retry.
    - `Minimum TTL`: chịu trách nhiệm thiết lập TTL tối thiểu cho 1 zone
    - `MX`: đây là bản ghi Mail exchanger. Nó chỉ định server nhận và gửi mail
    - `CNAME`: Là viết tắt của Canonical Name - tên miền chính. Nó sẽ map alias domain(tên miền phụ) tới tên miền khác.
    - `PTR`: là viết tắt của Pointer. Thuộc tính này phân giải địa chỉ IP thành domain.

### 2.2. Tạo reserse DNS zone file cho tên miền `dangdohai.com`
- File trả về tên miền đủ điều kiện(Fully Qualified Domain Name (FQDN)) của máy chủ liên quan tới địa chỉ IP của nó.

- Tạo file :
    ```
    vim /var/named/dangdohai.com.rev
    ```

- Thêm vào nội dung sau:
    ```
    $TTL 86400
    @ IN SOA dns-server.dangdohai.com. admin.dangdohai.com. (
                                    2020030500 ;Serial
                                    3600 ;Refresh
                                    1800 ;Retry
                                    604800 ;Expire
                                    86400 ;Minimum TTL
    )
    ;Name Server Information
    @ IN NS dns-server.dangdohai.com.
    dns-server     IN      A       10.10.34.161

    ;Reverse lookup for Name Server
    161 IN PTR dns-server.dangdohai.com.

    ;PTR Record IP address to Hostname
    162      IN      PTR     www.dangdohai.com
    163      IN      PTR     mail.dangdohai.com
    ```

    <img src="..\images\Screenshot_14.png">

### 2.3. Phân quyền cho 2 file vừa tạo
```
chgrp named /var/named/dangdohai.com.fwd
chgrp named /var/named/dangdohai.com.rev
```

## 3. Cấu hình file `/etc/named.conf`
- Tiến hành copy backup file cấu hình
    ```
    cp /etc/named.conf /etc/named.bak
    ```

**Ta tiến hành sửa file cấu hình:**
- Chỉnh sửa file cấu hình
    ```
    vim /etc/named.conf
    ```
- Thêm địa chỉ IP của DNS server vào phần `listen-on port 53`. Ở đây, là `10.10.34.161`

- Comment dòng `listen-on-v6 port 53` nếu không dùng ipv6. Ở đây, ta không dùng ipv6.

- `allow-query` : cho phép query DNS từ dải IP nào. Tức là máy chủ trong mạng nào được truy cập tới DNS server này. Ở đây ta sẽ để là `10.10.34.0/24`

    <img src="..\images\Screenshot_12.png">

- Một **forward lookup DNS zone** là vùng lưu trữ thông tin mối quan hệ giữa địa chỉ IP và host name. Khi được truy vấn, nó cung cấp địa chỉ IP của host system bằng host name. Ngược lại, **reverse DNS zone** trả về tên miền đủ điều kiện(Fully Qualified Domain Name (FQDN)) của máy chủ liên quan tới địa chỉ IP của nó.

    Để xác định reverse và forward lookup zones, thêm vào cuối file `named.conf` cấu hình dưới:

    ```
    //domain là "dangdohai.com"

    //forward zone
    zone "dangdohai.com" IN {
    type master;
    file "dangdohai.com.fwd";
    allow-update { none; };
    };

    //reverse zone
    zone "34.10.10.in-addr.arpa" IN {
    type master;
    file "dangdohai.com.rev";
    allow-update { none; };
    };
    ```

    <img src="..\images\Screenshot_15.png">

    **Trong đó:**

    - `type`: Quy định vai trò của server cho một zone(khu vực) cụ thể. Thuộc tính master cho biết đây là 1 server có thẩm quyền.

    - `file`: chứa thông tin về file forward / reverse zone của domain. Có thể để đường dẫn tương đối hoặc tuyệt đối.

    - `allow-update`: Thuộc tính này xác định các host system có được phép chuyển tiếp cập nhật DNS động. Trong trường hợp này không.

## 4. Kiểm tra và bật service
### Kiểm tra các file 
```
named-checkconf 
named-checkzone dangdohai.com /var/named/dangdohai.com.fwd
named-checkzone 10.10.34.161 /var/named/dangdohai.com.rev
```

Nếu không có lỗi gì thì kết quả hiển thị tương tự dưới đây:

<img src="..\images\Screenshot_16.png">

### Khởi động dịch vụ và cấu hình firewall
```
systemctl start named
systemctl enable named

firewall-cmd --add-service=dns --permanent
firewall-cmd --reload
```

## III. Trên Client
### 1. Thêm DNS server
- Chỉnh sửa file `/etc/resolv.conf` thêm vào nameserver vừa cấu hình
    ```
    nameserver 10.10.34.161
    ```

- Chỉnh sửa file cấu hình interface card mạng `/etc/sysconfig/network-scripts/ifcfg-eth0`. Trỏ DNS đến địa chỉ DNS server ta cấu hình bên trên.  
    ```
    DNS1=10.10.34.161
    ```

    <img src="..\images\Screenshot_17.png">

- Restart network
    ```
    systemctl restart NetworkManager
    ```

### 2. Kiểm tra hoạt động của Bind DNS server
- Cài đặt gói `bind-utils` để sử dụng lệnh `nslookup` và `dig`
    ```
    yum install -y bind-utils
    ```

- Kiểm tra bằng cách sử dụng các câu lệnh sau:
    ```
    nslookup dns-server.dangdohai.com
    nslookup mail.dangdohai.com
    nslookup www.dangdohai.com
    nslookup ftp.dangdohai.com
    ```

    <img src="..\images\Screenshot_18.png">

    ```
    nslookup 10.10.34.161
    ```

    <img src="..\images\Screenshot_19.png">

- Để chi tiết hơn, ta sử dụng [***lệnh `dig`***](4-digCommand.md).
    ```
    dig www.dangdohai.com
    ```

    <img src="..\images\Screenshot_20.png">

    ```
    dig -x 10.10.34.161
    ```

    <img src="..\images\Screenshot_21.png">