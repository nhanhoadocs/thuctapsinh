# MỤC LỤC 
[1.Khái niệm](#1)

[2.Cài đặt](#2)

[3.Cấu trúc và thực hiện](#3)

[4.Mã trạng thái](#4)

[5.Thiết lập địa chỉ nguồn](#5)

[6.Định dạng trả về](#6)

[7.Giới hạn giá trị trả về](#7)

[8.Đọc danh sách từ file](#8)

[9.Ping theo lớp mạng](#9)

[10.Cài số lần ping](#10)



<a name="1">

# 1. Khái niệm 
- Cũng như lệnh `ping` thì `fping` được echo request (ICMP) sử dụng để xác đinh xem máy chủ đích có đang hồi đáp hay không. 
- Lệnh `fping` khác với ping nó cho phép người dùng chỉ ra nhiều địa chỉ đích trong 1 dòng lệnh, hoặc chỉ ra 1 tập tin chứa danh sách các địa chỉ mạng cần ping. 
- Thay cho việc gửi đến 1 địa chỉ đến khi nó hết giờ hoặc trả lời, fping sẽ gửi đi 1 gói tin và di chuyển sang mục tiêu kế tiếp theo kiểu Round-Robin 
- Ở chế độ mặc định, nếu 1 mục tiêu trả lời gói tin  echo, nó sẽ được ghi chú và xóa khỏi danh sách các mục tiê cần kiểm tra; Nếu 1 mục tiêu không phản hồi trong giới hạn thời gian quy định nó sẽ xem là không thể kết nối. 
- `fping` cũng hỗ trợ gửi 1 số lượng gói tin nhất định đến địa chỉ, hay lặp vô hạn giống như `ping` 
- không giống như `ping` lệnh `fping` có ý nghĩa khi được dùng trong các kịch bản, vì kết quả xuất ra của nó được thiết kế để dễ phân tích 
- `fping6` là một phiên bản khác của `fping`, khi nó được viết cho địa chỉ IPv6 thay vì IPv4 của `fping` 

<a name="2">

# 2. Cài đặt
- Không giống như `ping` lệnh `fping` cần được cài đặt 
- Đối với Debian và Ubuntu sử dụng lệnh APT-GET hoặc lệnh APT để cài đặt `fping` 
```
sudo apt-get install fping
[sudo] password for anhduc: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  dkms libgsoap-2.8.60 libqt5opengl5 libsdl-ttf2.0-0 libsdl1.2debian
  libvncserver1 virtualbox-dkms
Use 'sudo apt autoremove' to remove them.
The following NEW packages will be installed:
  fping
0 upgraded, 1 newly installed, 0 to remove and 207 not upgraded.
Need to get 32,1 kB of archives.
After this operation, 85,0 kB of additional disk space will be used.
Get:1 http://vn.archive.ubuntu.com/ubuntu bionic/universe amd64 fping amd64 4.0-6 [32,1 kB]
Fetched 32,1 kB in 37s (864 B/s) 
Selecting previously unselected package fping.
(Reading database ... 180561 files and directories currently installed.)
Preparing to unpack .../archives/fping_4.0-6_amd64.deb ...
Unpacking fping (4.0-6) ...
Setting up fping (4.0-6) ...
Processing triggers for man-db (2.8.3-2) ...
```
- Đối với RHEL và Centos 
```
 yum install fping
Loaded plugins: fastestmirror
Determining fastest mirrors
 * base: centos-hn.viettelidc.com.vn
 * extras: centos-hn.viettelidc.com.vn
 * updates: centos-hn.viettelidc.com.vn
base                                             | 3.6 kB     00:00     
extras                                           | 3.4 kB     00:00     
updates                                          | 3.4 kB     00:00     
(1/4): extras/7/x86_64/primary_db                  | 153 kB   00:00     
(2/4): base/7/x86_64/group_gz                      | 166 kB   00:00     
(3/4): updates/7/x86_64/primary_db                 | 1.3 MB   00:02     
(4/4): base/7/x86_64/primary_db                    | 6.0 MB   00:03     
No package fping available.
Error: Nothing to do
```
- Một số cách cài đặt khác 
    - đối với Fedora sử dụng DNF 
    ```
    sudo dnf install fping 
    ```
    - Đối với hệ thống Arch Linux, sử dụng lệnh Pacman để cài đặt fping vì nó có sẵn trong kho bản phân phối chính thức
    ```
    sudo pacman -S fping
    ```
    - Đối với hệ thống openSuse 
    ```
    sudo zypper install fping 
    ```
<a name="3">

# 3. Cấu trúc và cách thực hiện 
- Để ping nhiều máy chủ
cần nhập tên các máy chủ và có dấu cách 
```
fping dantri.com 8.8.8.8
dantri.com is alive
8.8.8.8 is alive
```
- Để hiển thị mục tiêu theo địa chỉ thay vì tên DNS
```
fping -A dantri.com 8.8.8.8
222.255.27.51 is alive
8.8.8.8 is alive
```
- In đầu ra với địa chỉ IP và tên máy chủ 
```
fping -A -d dantri.com 8.8.8.8
static.vnpt.vn (222.255.27.51) is alive
google-public-dns-a.google.com (8.8.8.8) is alive
```
- để quét phạm vi địa chỉ ip từ x.x.x.x đến x.x.x.x
```
fping -a -g 8.8.8.0 8.8.8.8 -r 1
8.8.8.8
```
- Chỉ in máy chủ lưu trữ 
```
fping -g 10.30.0.1/24
10.30.0.1 is unreachable
10.30.0.2 is unreachable
10.30.0.3 is unreachable
10.30.0.4 is unreachable
10.30.0.5 is unreachable
10.30.0.6 is unreachable
10.30.0.7 is unreachable
10.30.0.8 is unreachable
10.30.0.9 is unreachable
10.30.0.10 is unreachable
10.30.0.11 is unreachable
10.30.0.12 is unreachable
10.30.0.13 is unreachable
.
.
.
```
- đọc danh sách các mục tiêu từ 1 file. Tùy chọn này chỉ có người dùng root mới sử dụng được 
```
fping -f .bash_history
dhclient: Name or service not known
sudo: Name or service not known
vi: Name or service not known
ip: Name or service not known
mtr: Name or service not known
ping: Name or service not known
ip: Name or service not known
sudo: Name or service not known
ip: Name or service not known
p: Name or service not known
ip: Name or service not known
ping: Name or service not known
ip: Name or service not known
.
.
.
.

```
<a name="4">

# 4. Mã trạng thái 
Trong quá trình hoạt động, fping sẽ trả về các mã trạng thái sau 
- 0 => khi tất cả các máy tính cần ping đều có thể kết nối 
- 1 => khi có 1 vài địa chỉ không thể kết nối đến dược (unreachable)
- 2 => Khi có 1 vài địa chỉ IP không tìm thấy (not found)
- 3 => kho có các tham số dòng lệnh không hợp lệ 
- 4 => lỗi khi gọi hệ thống 

<a name="5">

# 5 Thiết lập địa chỉ nguồn 
a) Khi máy tính của chúng ta có nhiều giao tiếp mạng và nhiều địa chỉ IP cùng hoạt động, `fping` cho chúng ta chọn ra 1 giao tiếp và 1 đại chỉ ip trong các giao tiếp và địa chỉ đang có để thực hiện ping từ giao tiếp mạng và địa chỉ đó 
```
ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 54:ee:75:3b:33:b1 brd ff:ff:ff:ff:ff:ff
    inet 172.16.2.100/20 brd 172.16.15.255 scope global dynamic noprefixroute enp0s25
       valid_lft 22985sec preferred_lft 22985sec
    inet6 2001:ee0:4146:24f:a082:d01d:4de9:e74e/64 scope global temporary dynamic 
       valid_lft 1200sec preferred_lft 1200sec
    inet6 2001:ee0:4146:24f:9bfa:bea4:3ac4:a1dd/64 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 1200sec preferred_lft 1200sec
    inet6 fe80::6edf:a292:aff3:e59c/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```
```
fping -S 172.16.2.100 dantri.com
dantri.com is alive
```
b) Cấu hình dữ liệu gói 
- Lệnh `fping` cung cấp cho chúng ta chức năng để điều chỉnh dữ liệu sẽ được gửi trong quá trình ping. 
```
fping -b n địa_chỉ 
```
- n: là số byte dữ liệu ping sẽ gửi. kích thước nhỏ nhất là 12 cho phép không gian cho dữ liêu mà fping cần để thực hiện công việc của nó. Kích thước tối thiểu của cổng là 40 byte


<a name="6">

# 6. Định dạng kết quả trả về
- `fping` cung cấp cho chúng ta nhiều tuỳ chọn để có thể định dạng lại kết quả trả về này theo định dạng mà chúng ta muốn.
- Để hiển thị ra các địa chỉ còn sống ta sử dụng -a 
```
fping -a dantri.vn
dantri.vn
```
- Nếu chỉ sử dụng - q thì kết quả trả về sẽ không có gì 
```
anhduc@anhduc:~$ fping -q 8.8.8.8
anhduc@anhduc:~$ 
```
- Để chỉ hiển thị các ip mất kết nối ta sử dụng `-u`
```
anhduc@anhduc:~$ fping -u 8.8.8.5 8.8.8.8
8.8.8.5
```
- Để hiển thị các địa chỉ của các tên 
```
anhduc@anhduc:~$ fping -A dantri.com
222.255.27.51 is alive
```
- `-d` sẽ hiể thị kết quả ngược lại với `-A`
```
anhduc@anhduc:~$ fping -d 8.8.8.8
google-public-dns-a.google.com is alive
```
- Để hiển thị Round Trip time của các gói tin dùng -e
```
anhduc@anhduc:~$ fping -e 8.8.8.8
8.8.8.8 is alive (49.7 ms)
```

<a name="7">

# 7 Giới hạn số gói tin gửi đi 
- Để quy định số gói tin mà `fping` gửi đi 
```
anhduc@anhduc:~$ fping -c 2 8.8.8.8
8.8.8.8 : [0], 84 bytes, 49.8 ms (49.8 avg, 0% loss)
8.8.8.8 : [1], 84 bytes, 49.6 ms (49.7 avg, 0% loss)

8.8.8.8 : xmt/rcv/%loss = 2/2/0%, min/avg/max = 49.6/49.7/49.8
```

<a name="8">

# 8. Đọc danh sách địa chỉ từ file 
```
anhduc@anhduc:~/Desktop$ fping -f file
dantri.com is alive
8.8.8.8 is alive
```
<a name="9">

# 9.Ping theo lớp mạng 
```
anhduc@anhduc:~/Desktop$ fping -g 192.168.1.0/24
192.168.1.1 is unreachable
192.168.1.2 is unreachable
192.168.1.3 is unreachable
192.168.1.4 is unreachable
192.168.1.5 is unreachable
192.168.1.6 is unreachable
192.168.1.7 is unreachable
192.168.1.8 is unreachable
192.168.1.9 is unreachable
192.168.1.10 is unreachable
192.168.1.11 is unreachable
192.168.1.12 is unreachable
192.168.1.13 is unreachable
192.168.1.14 is unreachable
192.168.1.15 is unreachable
192.168.1.16 is unreachable
```
<a name="10">

# 10.Thiết lập số lần thử lại 
- với lệnh có cấu trúc `fping -r n addr` 
  - trong đó n là số lần thử lại ( để mặc định nó sẽ là 3). và không tính lần đầu tiên 
```anhduc@anhduc:~$ fping -r 3 -g 192.168.54.1 192.168.54.129
192.168.54.1 is alive
192.168.54.129 is alive
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.4
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.4
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.4
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.3
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.3
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.3
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.2
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.2
ICMP Host Unreachable from 192.168.54.1 for ICMP Echo sent to 192.168.54.2
``` 
