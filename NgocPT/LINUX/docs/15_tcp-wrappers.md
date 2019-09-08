# TCP WRAPPERS 

# Mục lục
[1. Lịch sử ](#1)  
[2. Khái niệm](#2)  
[3. Cài đặt TCP Wrappers](#3)   
[4. Hạn chế quyền truy cập vào máy chủ Linux bằng cách sử dụng TCP Wrappers](#4)  


<a name="1"></a>

## 1. Lịch sử
TCP Wrapper được phát triển bởi một lập trình viên và nhà vật lý người Hà Lan Wietse Zweitze Venema vào năm 1990 tại Đại học Công nghệ Eindhoven. Ông đã duy trì nó cho đến năm 1995, và sau đó phát hành nó theo Giấy phép BSD vào năm 2001. Trong hướng dẫn ngắn gọn này, tôi sẽ giải thích cách hạn chế quyền truy cập vào máy chủ Linux bằng TCP Wrappers.

<a name="2"></a>

## 2. Khái niệm

TCP Wrapper là một hệ thống kiểm soát truy cập dựa trên máy chủ giúp mở rộng khả năng của inetd. TCP Wrapper là một hệ thống ACL (Access Control List) mạng dựa trên máy chủ, được sử dụng để lọc truy cập mạng vào các máy chủ Giao thức Internet trên các hệ điều hành (giống như Unix) như Linux.  
Nó quyết định máy chủ nào sẽ được phép truy cập vào một dịch vụ mạng cụ thể.

<a name="3"></a>

## 3. Cài đặt TCP Wrappers

TCP Wrappers có sẵn trong kho chính thức của hầu hết các hệ điều hành Linux.  
### Phân phối RedHat 
```
yum install tcp_wrappers
```
### Hệ thống Debian
```
sudo apt-get install tcpd
```

<a name="4"></a>

## 4. Hạn chế quyền truy cập vào máy chủ Linux bằng cách sử dụng TCP Wrappers

### Cấu hình
TCP Wrappers thực hiện kiểm soát truy cập với sự trợ giúp của hai tệp cấu hình: `/etc/hosts.allow` và `/etc/hosts.deny` .Hai tệp danh sách kiểm soát truy cập này quyết định liệu các máy khách cụ thể có được phép truy cập máy chủ Linux của bạn hay không.

#### Tệp /etc/hosts.allow

Tập tin này chứa danh sách các máy chủ hoặc mạng được phép hoặc không được phép. 

#### Tệp /etc/hosts.deny
Tệp này chứa danh sách máy chủ hoặc mạng không được phép truy cập máy chủ Linux của bạn.  

### Quy tắc TCP Wrappers :

`hosts.allow` sẽ được ưu tiên hơn `hosts.deny` : Nếu xảy ra trường hợp cả 2 file này đều allow và deny cùng 1 IP, thì IP này sẽ vẫn được allow.
Chỉ có 1 Rule cho mỗi dịch vụ trong `hosts.allow` và `host.deny`  

Nếu không có rule nào phù hợp trong 2 file thì kết nối SSH từ Client đến Server vẫn được thực hiện
Bất kì thay đổi nào trong 2 file đều có hiệu lực ngay lâp tức  
Cú pháp TCP Wrappers :
```
daemon : client [:option1:option2:...]
```
daemon : Dịch vụ ssh , ftp , portmap…

client : hostname , IP…

option : Hành động

### Để bảo mật máy chủ của bạn
Để bảo mật máy chủ Linux là chặn tất cả các kết nối đến và chỉ cho phép một vài máy chủ hoặc mạng cụ thể. Để làm như vậy, chỉnh sửa tệp /etc/hosts.deny :  
```
sudo vi /etc/hosts.deny
```

#### Thêm dòng sau. Dòng này từ chối kết nối với tất cả các dịch vụ và tất cả các mạng.
```
ALL: ALL
```
Sau đó, chỉnh sửa tệp /etc/hosts.allow :
```
vi /etc/hosts.allow
```
và cho phép các máy chủ hoặc mạng cụ thể của sự lựa chọn của bạn.
```
sshd : 192.168.184.140
```
Theo quy tắc trên, tất cả các kết nối đến sẽ bị từ chối cho tất cả các máy chủ ngoại trừ máy chủ 192.168.184.140

Bạn có thể xác minh điều này từ các tệp nhật ký của máy chủ Linux của bạn như hiển thị bên dưới.
``` 
cat /var/log/secure
```
### Cho phép tất cả các máy chủ ngoại trừ một máy chủ cụ thể :

Bạn có thể cho phép các kết nối đến từ tất cả các máy chủ, nhưng không phải từ một máy chủ cụ thể. Ví dụ, để cho phép các kết nối đến từ tất cả các máy chủ trong  mạng con 192.168.184 , nhưng không phải từ máy chủ 192.168.168.192 , hãy thêm dòng sau vào tệp /etc/hosts.allow .
```
ALL: 192.168.184. EXCEPT 192.168.184.192
```
