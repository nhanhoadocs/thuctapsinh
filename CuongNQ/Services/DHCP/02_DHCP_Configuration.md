# DHCP Configuration ( Basic )
## **1) Các file/thư mục quan trọng của dịch vụ DHCP**
- `/etc/dhcp/dhcpd.conf` : file cấu hình dịch vụ DHCP
- `/var/lib/dhcpd/dhcp.leases` : file chứa thông tin các IP động đang cấp qua DHCP
- `/var/log/message` : log mặc định chứa quá trình DHCP 4 bước
## **2) Cấu hình dịch vụ DHCP Server**
### **Mô hình thực tế**
<img src=https://i.imgur.com/IVzTiUR.png>

### **Mô hình LAB**
<img src=https://i.imgur.com/60smOhu.png>

| | IP | Ethernet |
|-|----|---------|
| **DHCP_Server** | `172.16.0.5/24` | `ens37` |
| **Ubuntu 19.04** | `?` | `ens37` |
| **Windows 10** | `?` | `ens37` |
### **Các bước triển khai**
- **B1 :** Kiểm tra xem gói chương trình `dhcp` đã được cài đặt chưa , nếu chưa thì cài bằng `yum` :
    ```
    # rpm -qa | grep dhcp
    # yum install -y dhcp
    ```
    <img src=https://i.imgur.com/GFPGMkj.png>
- **B2 :** Cấu hình dịch vụ DHCP
    - Chỉnh sửa file cấu hình `dhcpd.conf` :

        <img src=https://i.imgur.com/VLcP36j.png>

        - File cấu hình DHCP gồm 2 phần :
            - **Cấu hình toàn cục ( `global` )** : quy định những thông tin giá trị mặc định cho các khai báo lớp mạng ( subnet ) cấp pháp IP động DHCP .
            - **Cấu hình lớp mạng cấp phát IP động ( `scope` )** : quy định những giá trị thông tin cho việc cấp phát IP động thông qua DHCP .
        - Cấu hình **`global`** :
            ```
            option domain-name "linux.com";                       # Tên Domain
            option domain-name-servers  masterdns.linux.com;      # Khai báo DNS
            default-lease-time 600;                               # Thời gian mặc định cấp IP cho một client
            max-lease-time 7200;                                  # Thời gian tối đa cấp IP cho một client
            authoritative;                                        # Set master DHCP, tránh DHCP giả mạo
            log-facility local7;                                  # Nhật ký dhcp => /var/log/boot.log
            ```
        - Cấu hình **`scope`** :
            ```
            subnet 172.16.0.0 netmask 255.255.255.0 {
               range 172.16.0.11 172.16.0.254                     # Vùng địa chỉ IP cấp phát cho Clients
               option domain-name-servers masterdns.linux.com;    # DNS Server
               option domain-name "linux.com";                   # Tên Domain
               option routers 172.16.0.1;                         # Default-gateway         
               option broadcast-address 172.16.0.255;             # Địa chỉ broadcast của dải mạng
               default-lease-time 3600;                           # Thời gian mặc định cấp IP cho một client (ưu tiên hơn global)                        
               max-lease-time 7200;                               # Thời gian tối đa cấp IP cho một client (ưu tiên hơn global)
            }                                                      
            ```
- **B3 :** Khởi động dịch vụ `dhcpd` và kích hoạt tự khởi động khi boot :
    ```
    # systemctl start dhcpd
	# systemctl enable dhcpd
    ```
- **B4 :** Cấu hình **Firewalld** cho phép dịch vụ `dhcpd` :
    ```
    # firewall-cmd --add-service=dhcp --permanent
	# firewall-cmd --reload
    ```
- **B5 :** Kiểm tra trạng thái dịch vụ :
    ```
    #systemctl status dhcpd
    ```
    - Kiểm tra xem Server đã lắng nghe port `67` chưa 
        ```
        # netstat -lnup | grep 67
        ```
- **B6 :** Cấu hình DHCP cho client :
    - **Client Ubuntu**