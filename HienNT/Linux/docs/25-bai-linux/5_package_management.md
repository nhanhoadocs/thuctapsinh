## Package Management System - Hệ thống quản lý gói 

- Các phần cốt lõi của các bản phân phối Linux và hầu hết các phần mềm bổ trợ của nó được cài đặt thông qua hệ thống quản lý gói. Mỗi gói chứa các tệp và các hướng dẫn khác để giúp phần mềm trên hệ thống hoạt động.  

## Phân loại  
  Mỗi họ khác nhau sẽ có các gói quản lý khác nhau nhưng đều được phân làm hai loại cơ bản: loại gói cấp độ cao và gói cấp độ thấp.

  <img src ="../../images/25 bai linux/package_management.png">  

## Những trình quản lý gói của Debian  
> ### Trình quản lý gói cấp thấp `dpkg`  
- Là viết tắt của `Debian Package`  
- Là phần mềm quản lý gói cơ bản với các tính năng: cài đặt, gỡ bỏ và dịch gói
- Tính năng nâng cao không được hỗ trợ: tải xuống các gói từ Internet hoặc tự động cài đặt các gói phụ thuộc.  
- Sử dụng `dpkg` để cài đặt các gói với bộ cài đặt có sẵn trên máy cục bộ.  
- Các câu lệnh:  
  \- Xem các phần mềm đã được cài đặt: 
  ```sh
  dpkg -l
  ```
  \- Xem danh sách các tệp được cài đặt bởi một gói:
  ```sh
  dpkg -L <tên tệp>
  ```
  \- Để biết gói nào đã cài đặt một tệp, ví dụ /etc/host.conf, chạy lệnh:
  ```sh
  dpkg -S /etc/host.conf
  ```
  \- Để cài đặt gói mới từ bộ cài đặt, ví dụ  zip_3.0-4_i386.deb, chạy lệnh:
   ```sh
    sudo dpkg -i zip_3.0-4_i386.deb
   ```
  \- Để gỡ bỏ một gói, ví dụ zip, chạy lệnh:
   ```sh
    sudo dpkg -r zip 
   ```
***Không nên sử dụng `dpkg` để gỡ gói vì các gói phụ thuộc không được gỡ có thể dẫn đến dư thừa***


> ### Trình quản lý gói cấp cao `apt-get`  
- Là phần mềm quản lý gói cấp cao được phát triển từ **A**dvanded **P**ackaging **T**ool.
- Một số ví dụ sử dụng `apt-get`  
\- Để cài đặt một gói, ví dụ nmap, chạy lệnh:
```sh
    sudo apt install nmap
```
\- Để gỡ bỏ một gói, ví dụ nmap, chạy lệnh:
```
    sudo apt remove nmap
```
\- Có thể cài đặt hay gỡ bỏ nhiều gói bằng cách xác định các gói bằng danh sách phân cách nhau bởi dấu trắng, ví dụ
```
  sudo apt install nmap ssh apache2
```
Ngoài ra, có thể sử dụng tùy chọn `–purge`  với lệnh `apt remove` để xóa cả các tệp cấu hình.

Chỉ mục gói của APT là cơ sở dữ liệu về các gói có trên repositories, được lưu trong tệp  `/etc/apt/sources.list` và thư mục  `/etc/apt/sources.list.d`.

Để cập nhật chỉ mục cục bộ với thay đổi trên repositories, chạy lệnh:
```
    sudo apt update
```
Để nâng cấp hệ thống, cập nhật chỉ mục như trên rồi chạy lệnh:
```
    sudo apt upgrade
```
Các lệnh apt được ghi nhật ký tại tệp `/var/log/dpkg.log`.

## II-Những trình quản lý gói của RedHat  
> ### 1.Trình quản lý gói cấp cao - `yum`
#### 1.1.Giới thiệu  
    Là viết tắt của **Y**ellowdog **U**pdater, **M**odified trình quản lý gói dựa trên RPM được sử dụng để cài đặt, gỡ bỏ, cập nhật hoặc tìm kiếm các phần mềm trong các bản phân phối Linux khác nhau bao gồm RHEL,CentOS,Fedora. `yum` sử dụng nhiều kho lưu trữ của bên thứ 3 để cài đặt các gói tự động bằng cách giải quyết các vấn đề phụ thuộc của chúng.  

#### 1.2. Sử dụng  
- Cài đặt gói bằng `yum install`   
Câu lệnh:   

     ```sh  
          yum install <packagename>
    ```  
Ví dụ cài đặt gói `httpd`:  
```sh
[root@hiennt ~]# yum install httpd
Loaded plugins: fastestmirror
Determining fastest mirrors
 * base: mirrors.vhost.vn
 * extras: mirrors.vhost.vn
 * updates: mirrors.vhost.vn
base                                                                                                                 | 3.6 kB  00:00:00
extras                                                                                                               | 3.4 kB  00:00:00
updates                                                                                                              | 3.4 kB  00:00:00
updates/7/x86_64/primary_db                                                                                          | 6.5 MB  00:00:06
Resolving Dependencies
--> Running transaction check
---> Package httpd.x86_64 0:2.4.6-89.el7.centos will be installed
--> Processing Dependency: httpd-tools = 2.4.6-89.el7.centos for package: httpd-2.4.6-89.el7.centos.x86_64
--> Processing Dependency: /etc/mime.types for package: httpd-2.4.6-89.el7.centos.x86_64
--> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.4.6-89.el7.centos.x86_64
--> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.4.6-89.el7.centos.x86_64
--> Running transaction check
---> Package apr.x86_64 0:1.4.8-3.el7_4.1 will be installed
---> Package apr-util.x86_64 0:1.5.2-6.el7 will be installed
---> Package httpd-tools.x86_64 0:2.4.6-89.el7.centos will be installed
---> Package mailcap.noarch 0:2.1.41-2.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

==================================================================================================================================================
 Package                            Arch                          Version                                    Repository                      Size
==================================================================================================================================================
Installing:
 httpd                              x86_64                        2.4.6-89.el7.centos                        updates                        2.7 M
Installing for dependencies:
 apr                                x86_64                        1.4.8-3.el7_4.1                            base                           103 k
 apr-util                           x86_64                        1.5.2-6.el7                                base                            92 k
 httpd-tools                        x86_64                        2.4.6-89.el7.centos                        updates                         90 k
 mailcap                            noarch                        2.1.41-2.el7                               base                            31 k

Transaction Summary
==================================================================================================================================================
Install  1 Package (+4 Dependent packages)

Total download size: 3.0 M
Installed size: 10 M
Is this ok [y/d/N]: y
Downloading packages:
(1/5): apr-util-1.5.2-6.el7.x86_64.rpm                                                                                     |  92 kB  00:00:02
(2/5): apr-1.4.8-3.el7_4.1.x86_64.rpm                                                                                      | 103 kB  00:00:03
(3/5): httpd-tools-2.4.6-89.el7.centos.x86_64.rpm                                                                          |  90 kB  00:00:03
(4/5): mailcap-2.1.41-2.el7.noarch.rpm                                                                                     |  31 kB  00:00:03
(5/5): httpd-2.4.6-89.el7.centos.x86_64.rpm                                                                                | 2.7 MB  00:00:05
--------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                             475 kB/s | 3.0 MB  00:00:06
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : apr-1.4.8-3.el7_4.1.x86_64                                                                                                     1/5
  Installing : apr-util-1.5.2-6.el7.x86_64                                                                                                    2/5
  Installing : httpd-tools-2.4.6-89.el7.centos.x86_64                                                                                         3/5
  Installing : mailcap-2.1.41-2.el7.noarch                                                                                                    4/5
  Installing : httpd-2.4.6-89.el7.centos.x86_64                                                                                                                  5/5
  Verifying  : httpd-tools-2.4.6-89.el7.centos.x86_64                                                                                                            1/5
  Verifying  : mailcap-2.1.41-2.el7.noarch                                                                                                                       2/5
  Verifying  : httpd-2.4.6-89.el7.centos.x86_64                                                                                                                  3/5
  Verifying  : apr-1.4.8-3.el7_4.1.x86_64                                                                                                                        4/5
  Verifying  : apr-util-1.5.2-6.el7.x86_64                                                                                                                       5/5

Installed:
  httpd.x86_64 0:2.4.6-89.el7.centos

Dependency Installed:
  apr.x86_64 0:1.4.8-3.el7_4.1         apr-util.x86_64 0:1.5.2-6.el7         httpd-tools.x86_64 0:2.4.6-89.el7.centos         mailcap.noarch 0:2.1.41-2.el7

Complete!
[root@hiennt ~]#
```
Theo mặc định thì `yum install` sẽ hỏi lại chúng ta chấp nhận hoặc từ chối trước khi vào cài đặt các gói. Để bỏ mặc định này, ta thêm option `-y`. Câu lệnh sẽ là:
```sh
yum -y install <packagename>
```

- Gỡ bỏ cài đặt gói(cùng với các phụ thuộc của gói) bằng `yum remove`  
Câu lệnh:  
```sh
yum remove <packagename>
```
Ví dụ gỡ bỏ gói `httpd`  
```sh
[root@hiennt ~]# yum remove httpd
Loaded plugins: fastestmirror
Resolving Dependencies
--> Running transaction check
---> Package httpd.x86_64 0:2.4.6-89.el7.centos will be erased
--> Finished Dependency Resolution

Dependencies Resolved

=====================================================================================================================================================================
 Package                            Arch                                Version                                          Repository                             Size
=====================================================================================================================================================================
Removing:
 httpd                              x86_64                              2.4.6-89.el7.centos                              @updates                              9.4 M

Transaction Summary
=====================================================================================================================================================================
Remove  1 Package

Installed size: 9.4 M
Is this ok [y/N]: y
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Erasing    : httpd-2.4.6-89.el7.centos.x86_64                                                                                                                  1/1
  Verifying  : httpd-2.4.6-89.el7.centos.x86_64                                                                                                                  1/1

Removed:
  httpd.x86_64 0:2.4.6-89.el7.centos

Complete!
[root@hiennt ~]#
```

- Cập nhật gói bằng `yum update`
Câu lệnh: 
```sh
yum update <packagename>
```  

- Liệt kê các gói bằng `yum list`  
\- Liệt kê tất cả các gói:
   ```sh
   yum list
   ```  
  \- Liệt kê tất cả các gói có sẵn:
   ```sh
   yum list | less
   ```  
   \- Liệt kê tất cả các gói đã cài đặt trên hệ thống:  
   ```sh
   yum list installed | less
   ```
  \- Để tìm kiếm gói cụ thể có tên bằng `yum list`:
   ```sh
   yum list <packagename>
   ```  

- Tìm kiếm gói bằng `yum search`  
Câu lệnh:  
```sh
yum search <packagename>
```
- Nhận thông tin về gói trước khi cài đặt  
Câu lệnh:  
```sh
yum info <packagename>
```  
- Kiểm tra có bao nhiêu gói đã cài đặt trên hệ thống có sẵn các bạn update:  
```sh
yum check-update
```  
- Cập nhật hệ thống:  
```sh
yum update
```
- Liệt kê các nhóm phần mềm có sẵn:
```sh
yum grouplist
```
- Cài đặt gói nhóm:
```sh
yum groupinstall 'ten-goi'
```  
Ví dụ cài nhóm DNS Name Server  
```sh
[root@test1 ~]# yum groupinstall 'MySQL Database'
Loaded plugins: fastestmirror
There is no installed groups file.
Maybe run: yum groups mark convert (see man yum)
Loading mirror speeds from cached hostfile
 * base: mirrors.123host.vn
 * extras: mirrors.123host.vn
 * updates: mirrors.123host.vn
Warning: group MySQL Database does not exist.
Maybe run: yum groups mark install (see man yum)
Error: No packages in any requested group available to install or update
[root@test1 ~]# yum groupinstall 'DNS Name Server'
......
```  
- Xóa bất kì nhóm cài đặt hiện có tại hệ thống:  
```sh
yum groupremove 'ten-nhom'
```
- Cập nhật gói nhóm  
```sh
yum groupupdate 'ten-goi'
```  
- Danh sách kho yum được kích hoạt  
```sh
yum repolist  
```
Ví dụ:
```sh
[root@hiennt ~]# yum repolist
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirrors.vhost.vn
 * extras: mirrors.vhost.vn
 * updates: mirrors.vhost.vn
repo id                                                                       repo name                                                                        status
base/7/x86_64                                                                 CentOS-7 - Base                                                                  10,019
extras/7/x86_64                                                               CentOS-7 - Extras                                                                   419
updates/7/x86_64                                                              CentOS-7 - Updates                                                                2,233
repolist: 12,671
```  
- Liệt kê các gói yum được kích hoạt và vô hiệu hóa  
```
yum repolist all
```
Ví dụ:  

<img src ="../../images/25 bai linux/yumrepolistall.png">  

- Cài đặt gói từ kho lưu trữ cụ thể:  
```sh
yum --enablerepo=base install <ten-goi>
```  
- Clean bộ nhớ cache bằng yum  
```sh
yum clean all
```  
- Xem lịch sử của yum
```sh
yum history all
```  
- Tải xuống tệp RPM gói  
Ngoài việc cài các gói có sẵn trong kho lưu trữ, chúng ta cũng có thể cài các gói bằng cách tải xuống các tệp. Lệnh download `yumdownloader` xuất phát từ gói `yum-utils` nên chúng ta phải cài gói này trước.  
```sh
yum install yum-utils -y
```
Sau khi cài đặt `yum-utils` chúng có thể tải RPM về hệ thống:
```sh
[root@hiennt ~]# yumdownloader unbound
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirrors.vhost.vn
 * extras: mirrors.vhost.vn
 * updates: mirrors.vhost.vn
unbound-1.6.6-1.el7.x86_64.rpm                                                                                                                | 673 kB  00:00:00
[root@hiennt ~]# ls -la unbound-1.6.6-1.el7.x86_64.rpm
-rw-r--r--. 1 root root 689232 Apr 25  2018 unbound-1.6.6-1.el7.x86_64.rpm
```

- Cài đặt tệp RPM cục bộ  
Các tệp `.rpm` có thể được cài đặt bằng lệnh `rpm` nhưng dùng `yum` cài đặt có thể tự động phát hiện và cài đặt các gói phụ thuộc. Để cài đặt gói RPM vừa tải xuống, chúng ta dùng lệnh:  
```sh
[root@test1 ~]# yum localinstall unbound-1.6.6-1.el7.x86_64.rpm
```

> ### 2.Trình quản lý gói cấp thấp - rpm  
#### 2.1.Giới thiệu  
- RPM là viết tắt của **R**edhat **P**ackage **M**anagement.  
- Các tập tin RPM thường kết thúc bằng `.rpm`  
- Trong các bản RedHat Linux, tên các tập tin RPM thường có cấu trúc như sau:  

   ```  
   <tên gói>-<phiên bản>-<số hiệu patch>.<hệ máy>.rpm  
   ```  
  Ví dụ tên gói: `unbound-1.6.6-1.el7.x86_64.rpm`  

  \- Một số gói dùng để phát triển phần mềm có dạng: 
  ```
  <tên gói>-devel-<phiên bản>-<số hiệu patch>.<hệ máy>.rpm.  
  ```  
#### 2.2.Cài đặt  
- Câu lệnh:  
  ```sh
  rpm <option> <tap-tin-rpm>  
  ```
  Các option:  
   `-i`: install package  
   `-U`: cập nhật  
   `-vh`: hiển thị chi tiết quá trình cài đặt các gói   

- Thông thường khi cài đặt có thể bạn sẽ gặp lỗi ‘dependencies’.
   ```  
   Example 1.2. Lỗi dependency
   error: failed dependencies:
   libatk.so.12 is needed by libglade2-1.99.7-3
   libgdk_pixbuf-1.3.so.14 is needed by libglade2-1.99.7-3
   libgdk-x11-1.3.so.14 is needed by libglade2-1.99.7-3
   libglib-1.3.so.14 is needed by libglade2-1.99.7-3  
   ```
- Bạn phải biết các tập tin libatl.so.12, libglib-1.3.so.14... nằm trong gói nào và cài đặt các gói đó trước. 
- Để biết các tập tin trong 1 gói sử dụng lệnh: 
  ```sh
  rpm -qpl <ten-tap-tin>
  ```  
  Trong đó:  
  `q` là query(truy vấn)  
  `p` là package(gói)  
  `l` là list(danh sách)  
- Liệt kê các gói phụ thuộc sử dụng option -qRP  
   ```sh
   rpm -qRP  
   ```
#### 2.3.Kiểm tra thông tin về gói  
   ```sh
   rpm -qpi <ten-tep.rpm>  
   ```  
#### 2.4. Gỡ cài đặt  
   ```sh
   rpm -e <ten-goi>
   ```  
- *Lưu ý tên gói không phải là tên tập tin rpm. Quá trình gỡ cài đặt có thể sẽ thất bại nếu việc gỡ cài đặt ứng dụng này có thể ảnh hương đến ứng dụng khác. Trong trường hợp đó, bạn phải gỡ cài đặt tất cả các ứng dụng cần đến ứng dụng bạn định gỡ cài đặt trước khi có thể gỡ cài đặt chính ứng dụng đó.*  

#### 2.5.Quản lý gói  
- Liệt kê danh sách tất cả các gói đã cài đặt:
   ```sh
   rpm -qa  
   ```​

- Kiểm tra gói <tên gói>có cài đặt chưa:
   ```sh
   rpm -q <tên gói>  
   ```
 
   ​
- Liệt kê danh sách tập tin của một gói:

  ```
  rpm -ql <tên gói>
  ```

- Cho biết gói nào chứa tập tin <tập tin>:
  ```
  rpm -qf <tập tin>  
  ```





## TÀI LIỆU THAM KHẢO  
- [https://uet.vnu.edu.vn/](https://uet.vnu.edu.vn/~thanhld/lects/netos/bai03-Package-Management.htm)
- [https://blogd.net/linux/](https://blogd.net/linux/cac-thao-tac-co-ban-voi-yum/)
- [http://svuit.vn/](http://svuit.vn/threads/rpm-va-yum-388/)
- 




