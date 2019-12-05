Sau khi cài đặt Linux System, một trong các bước đầu tiên mà bất cứ người dùng nào kể cả các kỹ sư công nghệ "siêu khủng" đều nên và sẽ làm là gán địa IP tĩnh (static IP) trên NIC/Ethernet card, thứ giúp họ có thể truy cập đến hệ thống của họ thông qua mạng

Bài viết này sẽ cung các phương pháp khác nhau giúp bạn làm sao Config Static IP trong **Centos 8 / RHEL8**

# Phương pháp 1: Config Static IP sử dụng NetworkManager
## 1.1 Config network interface bằng việc sử dụng command-line tool (nmcli)

### **1.1.1 Vậy thì nmcli là gì ?**

**nmcli** (NetworkManager Command Line Interface) là 1 tiện ích dòng lệnh giúp cấu hình cài đặt IP thông qua NetworkManager

Với công cụ dòng lệnh nmcli, bạn có thể tạo, hiển thị, chỉnh sửa, xóa, kích hoạt và hủy kích hoạt các kết nối mạng, cũng như kiểm soát và hiển thị trạng thái thiết bị mạng.

Để hiển thị các thiết bị mạng sẵn có:

    #nmcli device

![Imgur](https://i.imgur.com/lSAYHoG.png)

![Imgur](https://i.imgur.com/nu4d8Dp.png)

**nmcli device** sẽ hiển thị ra cho ta toàn bộ các thiết bị mạng sẵn có trên hệ thống và trạng thái của chúng. Để từ đó ta có thể biết mình cần và có thể làm gì với các thiết bị mạng này.

Có 2 thuật ngữ mà tôi muốn bạn hiểu rõ ở đây là:
- **Managed**

      có nghĩa thiết bị bị đó đặt dưới sự kiểm soát của NetworkManager và thiết bị này có thể "connected" (đã được config và active) hay "disconnected (chưa được config nhưng sẵn sàng để active trở lại)
- **Umanaged**

      Trạng thái này nghĩa là thiết bị chưa được đặt dưới quyền kiểm soát của NetworkMangaed

Để hiểu rõ thêm về nmcli và các option của chúng, bạn có thể làm như sau:
    
    nmcli --help

![Imgur](https://i.imgur.com/CqcLRvE.png)

Hoặc sử dụng 

    man nmcli

### **1.1.2 Chỉ định Static IP bằng cách sử dụng nmcli**

Quay trở lại với mục đích chính của bài viết này, giờ tôi sẽ hướng dẫn bạn các làm sao chỉ định Static IP với **nmcli**

Trong hướng dẫn này tôi sẽ đặt

    IP addres: 192.168.91.70
    Gateway: 192.168.91.2
    Subnetmask: 255.255.255.255 (/24)
    Dns-nameserver là 8.8.8.8

Thực hiện lần lượt các câu lệnh sau

    # nmcli con mod ens33 ipv4.addresses 192.168.91.70/24

    # nmcli con mod ens33 ipv4.gateway 192.168.91.2

    # nmcli con mod ens33 ipv4.method manual

    # nmcli con mod ens33 ipv4.dns “8.8.8.8”

    # nmcli con up ens33

    # ip addr show ens33

**Kết quả:** 
![Imgur](https://i.imgur.com/0H4OJqV.png)
Khá nhanh và đơn giản phải không nào.

**1 chút chú ý nhỏ:**
- 1 số keyword thay thế

        "con" thay thế cho "connection"
        "mod" thay thế cho "modify"
- Do đó nếu viết đầy đủ thì lệnh của chúng ta sẽ ở dạng:

    nmcli connection modify command

# Phương pháp 2: Config  IP không sử dụng NetworkManager
## 2.1 Sửa file cấu hình network bằng tay
Mỗi Network interface (NI) đều có 1 file script cấu hình nằm bên trong folder **/ete/sysconfig/network-scripts**

Tất cả file script cấu hình của các NI đều bắt đầu bằng **ifcfg-** và theo sau là tên của Interface.

Đây là file script cấu hình card ens33 trên máy tính của tôi
![Imgur](https://i.imgur.com/31Jvyck.png)


Có 1 số cấu hình bên trong mà bạn cần quan tâm khi cấu hình Static IP:

    1. BOOTPROTO - đặt "none" vì ở ta muốn sử dụng Statc IP. Trong trường hợp bạn muốn nhận IP từ DHCP server thì chỉ cần thay "none" bằng "dhcp"
    2. IPADDR - Ta chỉ định địa chỉ IP ở đây
    3. PREFIX - Xác định Network Prefix (ví dụ: /24)
    4. GATEWAY - Xác định Default Gateway cho mạng
    5. DNS - Ta có thể sử dụng tùy chọn này để xác định nhiều DNS Server (Bắt đầu từ 1)

Sau khi sửa đổi file script cấu hình của mạng, điều bạn cần làm bây giờ là **down interface** và sau đó **up** nó trở lại.

**1 chút chú ý nhỏ:**

- Tốt nhất bạn không nên cấu hình, sửa đổi IP khi đang kết nối SSH tới máy chủ thông qua interface mới đề cập bên trên vì điều này sẽ khiến kết nối SSH của bạn bị dừng lại.
- Để down và up interface, ta có thể tận dụng lại **nmcli**
    
        #nmcli connection down ens33 && nmcli connection up ens33
    Hoặc nếu không:

        #ifdown ens33 && ifup ens33

# Kết
Như vậy tôi đã hướng dẫn 2 phương pháp giúp bạn cấu hình Static IP trên CentOs 8.

Chúc các bạn thành công và một lần nữa **"Đừng config khi đang SSH"**