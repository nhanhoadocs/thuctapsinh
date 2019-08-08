# Hostname 
hostname là chương trình để đặt hoặc hiển thị tên máy chủ, tên miền hoặc nut hiện tại của hệ thống.  
Trong linux, hostname tồn tại dưới dạng FQDN (Fully Qualified Domain Name). FQDN gồm 2 thành phần Hostname và Primary Dns Sufix (tên địa phương và tên miền).
### 1. Xem thông tin về tên hostname 
Có thể sử dụng 1 trong 2 lệnh sau: `hostname` hoặc `cat /etc/hostname`
```
[root@host ~]# hostname
host.viethung.com
```
```
[root@host ~]# cat /etc/hostname
host.viethung.com
```
### 2. Đổi hostname
**1. Đổi hostname tạm thời**  
Sử dụng lệnh  `hostname [tên host]`  để đối sau đó sử dụng lệnh `bash` để hiển thị hostname hiện tại mà không cần reboot. Với lệnh này, hostname chỉ đổi tạm thời và sẽ trở về mặc định khi khởi động lại.
``` 
[root@host ~]# hostname host.viethung.com
[root@host ~]# bash
```
**2. Sử dụng lệnh để đổi tên host vĩnh viễn**  
Để đổi tên host ta sử dụng lệnh  `hostnamectl set-hostname [tên host]`  sau đó dùng lệnh  `bash` để hiển thị hostname hiện tại. Sau đó kiển tra lại với lệnh  `hostname`.
```
[root@host ~]# hostnamectl set-hostname host.viethung.com
[root@host ~]# bash
[root@host ~]# hostname
host.viethung.com
```
**3. Truy cập vào file *hosts* và *hostname* để chỉnh sửa tên host**.  
 * Chỉnh sửa file *hosts* tương tự như sau:
```
[root@host ~]# vi /etc/hosts
Xóa hết phần còn lại và để lại phần localhost ở dòng chứa địa chỉ ip và thêm tên host muốn sử dụng:
127.0.0.1   localhost host.viethung.com
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
```
* Chỉnh sửa file *hostname*, tên host trùng với tên sử dụng ở file *hosts*
```
[root@host ~]#vi /etc/hostname
sau đó chỉnh sửa thành:
host.viethung.com
```
* Sau khi chỉnh sửa 2 file, ta sử dụng lệnh `bash` để cập nhật hostname mới và kiểm tra lại với lệnh `hostname`
```
[root@host ~]# bash
[root@host ~]# hostname
host.viethung.com
```
> Ta có thể thực hiện lệnh `ping` để kiểm tra hostname hoặc sử dụng lệnh `hostnamectl` để kiểm tra:
```
[root@host ~]# hostnamectl
 static hostname: host.viethung.com
         Icon name: computer-vm
           Chassis: vm
        Machine ID: c6e010bc676a45038d70eb616f94ff5c
           Boot ID: c0d2dd3d38bb4fe2bee961ba8248a0fe
    Virtualization: vmware
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:ce
```      
```
[root@host ~]# ping host.viethung.com
PING localhost (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.049 ms
64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.065 ms
64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.078 ms
64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.044 ms
64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.045 ms
...
```
                                   
                                  --------------    Hết   ---------------  










 