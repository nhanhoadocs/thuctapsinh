# Firewalld
## **1) Khái niệm**
- **FirewallD** là giải pháp tường lửa mạnh mẽ, toàn diện được cài đặt mặc định trên **CentOS/RHEL 7** , nhằm thay thế **Iptables** với những khác biệt cơ bản :
    - **FirewallD** sử dụng “**zones**” và “**services**” thay vì “**chain**” và “**rules**” trong **Iptables** .
    - **FirewallD** quản lý các quy tắc được thiết lập tự động , có tác dụng ngay lập tức mà không làm mất đi các kết nối và session hiện có.
## **2) Các khái niệm cơ bản trong FirewallD**
### **2.1) Zone**
- Trong **FirewallD** , **zone** là một nhóm các quy tắc nhằm chỉ ra những luồng dữ liệu được cho phép , dựa trên mức độ tin tưởng của điểm xuất phát luồng dữ liệu đó trong hệ thống mạng . Để sử dụng , bạn có thể lựa chọn **zone** mặc định , thiết lập các quy tắc trong **zone** hay chỉ định network interface để quy định hành vi được cho phép .
- Các **zone** được xác định trước theo mức độ tin cậy , theo thứ tự từ “ít-tin-cậy-nhất” đến “đáng-tin-cậy-nhất”:
    - `drop` : ít tin cậy nhất – toàn bộ các kết nối đến sẽ bị từ chối mà không phản hồi , chỉ cho phép duy nhất kết nối đi ra .
    - `block` : tương tự như drop nhưng các kết nối đến bị từ chối và phản hồi bằng tin nhắn từ icmp-host-prohibited ( hoặc icmp6-adm-prohibited ).
    - `public` : đại diện cho mạng công cộng , không đáng tin cậy . Các máy tính/services khác không được tin tưởng trong hệ thống nhưng vẫn cho phép các kết nối đến trên cơ sở chọn từng trường hợp cụ thể .
    - `external` : hệ thống mạng bên ngoài trong trường hợp bạn sử dụng tường lửa làm gateway, được cấu hình giả lập NAT để giữ bảo mật mạng nội bộ mà vẫn có thể truy cập.
    - `internal` : đối lập với `external zone` , sử dụng cho phần nội bộ của gateway. Các máy tính/services thuộc zone này thì khá đáng tin cậy .
    - `dmz` : sử dụng cho các máy tính/service trong khu vực **DMZ ( Demilitarized )** – cách ly không cho phép truy cập vào phần còn lại của hệ thống mạng , chỉ cho phép một số kết nối đến nhất định .
    - `work` : sử dụng trong công việc, tin tưởng hầu hết các máy tính và một vài services được cho phép hoạt động.
    - `home` : môi trường gia đình – tin tưởng hầu hết các máy tính khác và thêm một vài services được cho phép hoạt động .
    - `trusted` : đáng tin cậy nhất – tin tưởng toàn bộ thiết bị trong hệ thống .
### **2.2) Hiệu lực của các quy tắc**
- `Runtime` ( mặc định ) : có tác dụng ngay lập tức , mất hiệu lực khi reboot hệ thống .
- `Permanent` : không áp dụng cho hệ thống đang chạy, cần reload mới có hiệu lực , tác dụng vĩnh viễn cả khi reboot hệ thống .
## **3) Cài đặt Firewalld**
- **FirewallD** được cài đặt mặc định trên **CentOS 7** . Cài đặt nếu chưa có :
    ```
    # yum install firewalld
    ```
- Khởi động **firewalld** :
    ```
    # systemctl start firewalld
    ```
- Thiết lập **firewalld** khởi động cùng hệ thống :
    ```
    # systemctl enable firewalld
    ```
- Khởi động lại **firewalld** :
    ```
    # systemctl restart firewalld
    hoặc
    # firewall-cmd --reload
    ```
- Tạm dừng và vô hiệu hóa **firewalld** :
    ```
    # systemctl stop firewalld
    # systemctl disable firewalld
    ```
- Kiểm tra tình trạng **firewalld** :
    - **Cách 1 :**
        ```
        # systemctl status firewalld
        ```
        <img src=https://i.imgur.com/h6jsGRV.png>

    - **Cách 2 :**
        ```
        # firewall-cmd --state
        ```
        <img src=https://i.imgur.com/l30B3Zg.png>

    - **Cách 3 :**
        ```
        # systemctl is-active firewalld
        # systemctl is-enabled firewalld
        ```
        <img src=https://i.imgur.com/xCjtIJr.png>

## **4) Cấu hình Firewalld**
### **4.1) Thiết lập các Zone**
- Liệt kê tất cả các **zone** trong hệ thống :
    ```
    # firewall-cmd --get-zones
    ```
    <img src=https://i.imgur.com/ohqTmol.png>

- Kiểm tra **zone** mặc định :
    ```
    # firewall-cmd --get-default-zone
    ```
    <img src=https://i.imgur.com/2qTDNMR.png>

- Kiểm tra **zone active** ( được sử dụng bởi card mạng )
    - Vì **FirewallD** chưa được thiết lập bất kỳ quy tắc nào nên **zone** mặc định cũng đồng thời là zone duy nhất được kích hoạt , điều khiển mọi luồng dữ liệu .
    ```
    # firewall-cmd --get-active-zones
    ```
    <img src=https://i.imgur.com/YGV0Eo2.png>

- Thay đổi **default zone** (  vd thành `home` ) :
    ```
    # firewall-cmd --set-default-zone=home
    ```
    <img src=https://i.imgur.com/ZnnTDBL.png>

### **4.2) Thiết lập các rule**
- Liệt kê toàn bộ các **rule** của các **zones** :
    ```
    # firewall-cmd --list-all-zones
    ```
- Liệt kê toàn bộ các **rule** trong **default zone** và **active zone** :
    ```
    # firewall-cmd --list-all
    ```
    <img src=https://i.imgur.com/cgZHlHQ.png>

- Liệt kê toàn bộ các quy tắc trong một **zone** cụ thể , ví dụ `home` :
    ```
    # firewall-cmd --zone=home --list-all
    ```
- Liệt kê danh sách **services/port** được cho phép trong **zone** cụ thể :
    ```
    # firewall-cmd --zone=puclic --list-services
    # firewall-cmd --zone=public --list-ports
    ```
    <img src=https://i.imgur.com/NR3vpYm.png>

### **4.3) Thiết lập cho services**
- Xác định các **services** trên hệ thống :
    ```
    # firewall-cmd --get-services
    ```

    <img src=https://i.imgur.com/Xp6852t.png>
    
    - Thông tin về **services** được lưu trữ tại `/usr/lib/firewalld/services`
- Thiết lập cho phép **services** trên **firewalld** , sử dụng `--add-service` :
    ```
    # firewall-cmd --zone=public --add-service=http
    success
    # firewall-cmd --zone=public --add-service=http --permanent
    success
    ```
- Thực hiện kiểm tra xem **service** đã được cho phép chưa :
    ```
    # firewall-cmd --zone=public --list-services
    ```
- Vô hiệu hóa **services** trên **firewalld** , sử dụng `--remove-service` :
    ```
    # firewall-cmd --zone=public --remove-service=http
    # firewall-cmd --zone=public --remove-service=http --permanent
    ```
### **4.4) Thiết lập cho port**
- Mở **port** với tham số `--add-port` :
    ```
    # firewall-cmd --zone=public --add-port=9999/tcp
    # firewall-cmd --zone=public --add-port=9999/tcp --permanent
    ```
- Mở 1 **dải port** :
    ```
    # firewall-cmd --zone=public --add-port=4990-5000/tcp
    # firewall-cmd --zone=public --add-port=4990-5000/tcp --permanent
    ```
- Kiểm tra lại các **port** đã mở :
    ```
    # firewall-cmd --zone=public --list-ports
    ```
- Đóng **port** với tham số `--remove-port` :
    ```
    # firewall-cmd --zone=public --remove-port=9999/tcp
    # firewall-cmd --zone=public --remove-port=9999/tcp --permanent
    ```
## **5) Cấu hình nâng cao**
### **5.1) Tạo Zone riêng**
- Mặc dù, các **zone** có sẵn là quá đủ với nhu cầu sử dụng , vẫn có thể tạo lập **zone** của riêng mình để mô tả rõ ràng hơn về các chức năng của chúng . 
- **VD :** Có thể tạo riêng một **zone** cho webserver `publicweb` hay một **zone** cấu hình riêng cho DNS trong mạng nội bộ `privateDNS` . Cần thiết lập `permanent` khi thêm một **zone** :
    ```
    # firewall-cmd --permanent --new-zone=publicweb
    success
    # firewall-cmd --permanent --new-zone=privateDNS
    success
    # firewall-cmd --reload
    success
    ```
    - Kiểm tra lại :
    ```
    # firewall-cmd --get-zones
    ```
    - Khi đã có **zone** thiết lập riêng , có thể cấu hình như các **zone** thông thường : thiết lập mặc định , thêm quy tắc :
    ```
    # firewall-cmd --zone=publicweb --add-service=ssh --permanent
    # firewall-cmd --zone=publicweb --add-service=http --permanent
    # firewall-cmd --zone=publicweb --add-service=https --permanent
    ```
### **5.2) Định nghĩa services riêng trên FirewallD**
- Khi có một **service** mới thêm vào hệ thống , có 2 phương án :
    - Mở **port** của **service** đó trên **FirewallD**
    - Tự định nghĩa **service** đó trên **FirewallD** <br>( **VD :** có thể tự định nghĩa port cho `Nhanhoa Admin Port` là `9999` )
- Tạo file định nghĩa riêng từ file chuẩn ban đầu :
    ```
    # cp /usr/lib/firewalld/services/ssh.xml /etc/firewalld/services/nhanhoa-admin.xml
- Chỉnh sửa để định nghĩa **servies** trên **FirewallD** :
    ```
    # vi /etc/firewalld/services/nhanhoa-admin.xml
    ```
    <img src=https://i.imgur.com/2FGVgTt.png>
- Lưu lại và khởi động lại **FirewallD** :
    ```
    # firewall-cmd --reload
    ```
- Kiểm tra lại danh sách các **services** :
    ```
    # firewall-cmd --get-services
    ```
    <img src=https://i.imgur.com/wHjyZmM.png>