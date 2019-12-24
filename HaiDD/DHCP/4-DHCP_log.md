# File DHCP log

### 1. Danh sách địa chỉ IP đã cấp phát bởi DHCP
Để xem những địa chỉ IP đã được cấp phát bởi DHCP Server trên CentOS ta có thể xem ở file: `/var/lib/dhcpd/dhcpd.leases`

<img src = "https://i.imgur.com/oi6kw4n.png">

### 2. Quá trình cấp phát của dịch vụ DHCP
File log qúa trình cấp phát của dịch vụ DHCP thì xem log tại file log `message`:
```
[root@localhost log]# tail /var/log/messages | grep -i "dhcp"

Dec 24 09:36:22 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:40 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:40 localhost dhcpd: server.danghai.dhcp: host unknown.
Dec 24 09:36:40 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:59 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:36:59 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:09 localhost dhcpd: DHCPREQUEST for 192.168.24.135 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:09 localhost dhcpd: DHCPACK on 192.168.24.135 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:15 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:37:15 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
```

### 2. Log của DHCP
Có thể xem Log của DHCP tại `/var/log/boot.log`

Sử dụng lệnh `tailf` để theo dõi sự thay đổi của file log
```
[root@localhost log]# tailf /var/log/boot.log | grep -i "dhcp"

Dec 24 09:43:44 localhost dhcpd: server.danghai.dhcp: host unknown.
Dec 24 09:43:44 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:43:52 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:43:52 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:00 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:00 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:17 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:17 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:26 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:44:26 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:47:38 localhost dhcpd: DHCPREQUEST for 192.168.24.135 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:47:38 localhost dhcpd: server.danghai.dhcp: host unknown.
Dec 24 09:47:38 localhost dhcpd: DHCPACK on 192.168.24.135 to 00:0c:29:a2:90:c8 via ens37
Dec 24 09:48:04 localhost dhcpd: DHCPREQUEST for 192.168.24.136 from 00:0c:29:a2:90:c8 via ens37
Dec 24 09:48:04 localhost dhcpd: DHCPACK on 192.168.24.136 to 00:0c:29:a2:90:c8 via ens37
```

Xem thêm tại [đây](https://linux.die.net/man/5/dhcpd.conf) .