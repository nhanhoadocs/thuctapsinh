# Cài đặt phần mềm trong CentOS

## 1. RedHat Package Manager (RPM)
### a. Cài đặt một package
- Để tải một tập tin trên mạng ta dùng lệnh wget:  
``` 
wget link_dowload 
```
- Khi cài sẽ báo lỗi là phải cài gói phụ thuộc trước cài gói phụ thuộc với lệnh :
```
rpm [option][ten_goi]
```
Giải thích ý nghĩa các tùy chọn đã dùng:

-i <gói>                 cài đặt,  
-e <tên phần mềm>        gỡ bỏ (erase),  
-U <gói>                 cập nhật gói (gỡ gói cũ và cài gói mới),  
-q <tên phần mềm>        in ra tên, phiên bản, release, nếu đã được cài,  
-p <tên gói>             in ra thông tin của cả những gói chưa được cài, nhưng phải chỉ rõ    đường dẫn <tên gói>  

### b. Cập nhật một package (upgrade)
- Ta có thể dụng lệnh rpm với các tùy chọn:

-nodeps: lệnh rpm sẽ bỏ qua các gói phụ thuộc

-force: lệnh rpm sẽ bỏ qua lỗi xung đột 

### c. Gỡ bỏ một package (Erase)
- Lệnh để gỡ bỏ một package:
```
rpm -e [package]
```
- Dùng lệnh để kiểm tra kết quả:
```
[root@localhost ~]# rpm -qa |grep “package”
```
## 2. Yellowdog Updater Modified (YUM)
- Tìm một phần mềm nào đó:
```
#yum search tenphanmem
```
- Liệt kê tất cả các gói phần mềm đã được cài đặt trên máy:
```
#yum list installed
```
- Hiện thị danh sách các gói phần mềm có thể được cài đặt bằng yum:
```
#yum list hoặc yum list all
```
- Cài đặt gói phần mềm cụ thể:
```
#yum install tên_phần_mềm
```
- Hiển thị các gói phần mềm ko thể cài đặt:
```
#yum extras
```
## 3. Biên dịch phần mềm 
### Bước 1: Tải phần mềm 
Ví dụ:

![](../images/2019-06-04_17-10.png)

### Bước 2: Giải nén tập tin

| #unzip  | để giải nén | name_package.zip |
|----- | ----- | ----- |
| #tar -xvzf | đẻ giải nén | name_package.tar.gz |
| #tar -jvxf | để giải nén |name_package.tar.bz2 |
| #tar -x | để giải nén | name_package.tgz |

ví dụ :

![](../images/2019-06-04_17-19.png)

### Bước 3: Tạo thư mục để cài phần mềm 
- Tạo thư mục httpd trong thư mục /usr/local/
### Bước 4: Vào thư mục vừa giải nén để chuẩn bị biên dịch
### Bước 5: Cấu hình cho gói phần mềm  

`#–prefix` là nơi sẽ cài phần mềm vào giống như chọn đường dẫn để cài phần mềm trong windows.  
`#–with-included-apr`: trong tập tin INSTALL có hướng dẫn là tải apr và apr-util rồi copy vào /httpd-2.4.10/srclib/
### Bước 6: Biên dịch cho gói phần mềm:
```
#make
```
### Bước 7: Cài đặt gói phần mềm httpd vừa biên dịch:
```
#make install
```


| Biên Dịch Gói Tin |	Yum, Apt-get … |
|----- | ----- |
| – Có thể tùy chỉnh các tùy chọn của phần mềm theo ý muốn, tối ưu được hệ thống. | – Luôn luôn cài đặt mặc định các tùy chọn đã được thiết lập sẵn. |
| - Giúp Bạn nắm rõ hơn về hệ thống cần xây dựng những gì và các mối liên quan của phần mềm đang cài đặt. |	– Do tự động cài đặt, Bạn sẽ không quản lý được có tính năng phụ nào được thêm vào trong phần mềm khi dùng auto install. |
| – Sẽ khó khăn hơn trong quá trình cài đặt ứng dụng. | – Cài đặt ứng dụng dễ dàng khi có kết nối internet. |

### 4. Cài gói BIN
- Chuyển vào thư mục chứa packet,
- Gõ ./<tên packet>
- Gỡ bỏ, gõ: <path>/UNINSTALL    

