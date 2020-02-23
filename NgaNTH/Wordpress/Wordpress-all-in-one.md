## Cài đặt Wordpress trên 1 node  
Mục lục  
[1. Tổng quan](#1)  
[2. Cài đặt Wordpress](#2)  
 - [Tạo cơ sở dữ liệu và tài khoản cho Wordpress](#3)
 - [Tải và cài đặt Wordpress](#4)
 - [Cấu hình Wordpress](#5)
 - [Hoàn tất phần cài đặt giao diện](#6)
 - [Phân quyền cho thư mục Wordpress](#7)

<a name="1"></a>

### 1. Tổng quan  
WordPress là một phần mềm nguồn mở (Open Source Software) được viết bằng ngôn ngữ lập trình website PHP và sử dụng hệ quản trị cơ sở dữ liệu MySQL. WordPress được ra mắt lần đầu tiên vào ngày 27/5/2003 bởi tác giả Matt Mullenweg và Mike Little. Hiện nay WordPress được sở hữu và phát triển bởi công ty Automattic có trụ sở tại San Francisco, California thuộc hợp chủng quốc Hoa Kỳ.  

**Tại sao lại chọn Wordpress**  
- Nói một cách đơn giản `Wordpress`là một công cụ giúp bạn làm một trang web, blog hoặc tin tức cho riêng bạn. Và đây là một trong những CMS (Content Management System) tốt nhất bạn có thể chọn sử dụng để tạo trang web cho riêng mình.  
- WordPress được phát triển nhằm phục vụ đối tượng người dùng phổ thông. Không cần có quá nhiều kiến thức về lập trình hay website nâng cao. Vì các thao tác trong WordPress rất đơn giản. Giao diện quản trị trực quan, giúp bạn có thể nắm rõ cơ cấu quản lý một website WordPress trong thời gian ngắn.  
- Nhưng WordPress cũng đủ mạnh và linh hoạt để phục vụ cho những ai đã am hiểu công nghệ. Hoặc chạy trang web cho việc kinh doanh.  
- Nếu bạn đang muốn bắt đầu tạo lập một trang Web, hay Blog thì WordPress chính là sự lựa chọn thích hợp.
Đây cũng là sự lựa chọn của hơn 25% trong mười triệu trang web hàng đầu hiện nay. Các trang web nổi tiếng thế giới như: echCrunch, Mashable, CNN, BBC America, Variety, Sony Music, MTV News, Bata, Quartz….  

<a name="2"></a>

### 2. Cài đặt Wordpress  

Mô hình:  
- Máy ảo CentOS 7 có cài LAMP. Nếu bạn chưa cài đặt thì có thể tham khảo tại [đây](https://github.com/ngahong/Thuc-tap-Nhan-Hoa/blob/master/Linux/Wordpress/Cai%20dat%20LAMP.md)
- Có kết nối internet.  
<img src="https://i.imgur.com/P540dTz.png">  

Các bước cài đặt 

<a name="3"></a>

**Bước 1: Tạo cơ sở dữ liệu và tài khoản cho Wordpress**

- Đăng nhập vào CSDL root user. Nếu bạn không thiết lập mật khẩu cho root thì có thể bỏ đi tùy chọn `-p`.   
```
mysql -u root -p  
```  
- Tạo CSDL, ở đây ta sẽ tạo CSDL có tên là `wordpress`  
```
create database wordpress;  
```
- Tạo 2 tài khoản để quản lý CSDL 
```
create user wordpressuser@localhost identified by 'matkhau';
create user 'wordpressuser'@'%' identified by 'matkhau';
 ```  
 - Cấp quyền quản lý cho 2 user vừa tạo 

```
 grant all on wordpress.* to 'wordpressuser'@'localhost' identified by 'matkhau';
 grant all on wordpress.* to 'wordpressuser'@'%' identified by 'matkhau';
``` 
- Xác thực lại những thay đổi về quyền  
```
FLUSH PRIVILEGES;
```  
- Sau khi hoàn tất thoát khỏi MariaDB  
```
exit 
```  
<a name="4"></a>

**Bước 2: Tải và cài đặt Wordpress**  
- Cài gói hỗ trợ `php-gd`  
```
yum install php-gd
```
- Cài đặt `wget`  
```
yum install wget
```
- Tiến hành tải xuống Wordpress với phiên bản mới nhất  
```
wget http://wordpress.org/latest.tar.gz
```  
- Giải nén file `latest.tar.gz`  
```
tar xvfz latest.tar.gz  
```  
> Lưu ý: giải nén sẽ ra thư mục wordpress có đường dẫn `/root/wordpress`.
- Copy các file trong thư mục WordPress tới đường dẫn `/var/www/html`  
```
cp -Rvf /root/wordpress/* /var/www/html
```  
<a name="5"></a>

**Bước 3: Cấu hình Wordpress**  
- Truy cập vào các file cài đặt của Wordpress  
```
cd /var/www/html
```  
- File cấu hình wordpress là `wp-config.php`. Tuy nhiên tại đây chỉ có file `wp-config-sample.php`. Tiến hành copy lại file cấu hình như sau:  
```
cp wp-config-sample.php wp-config.php
```  
- Mở file `wp-config.php` và dùng `vi` để chỉnh sửa nội dung tệp. Sửa những nội dung ở ô đỏ theo thông tin bạn đặt ở bước 1  

<img src="https://i.imgur.com/SILRTG3.png">

Lưu file cấu hình và thoát.  
<a name="6"></a>

**Bước 4: Hoàn tất phần cài đặt giao diện**  
- Trên trình duyệt, gõ địa chỉ ip server trên thanh url, trình duyệt sẽ xuất hiện như hình dưới, bạn điền các thông tin rồi ấn `Install Wordpress`.

<img src="https://i.imgur.com/XOH0y1J.png">  

Kết quả hiện ra sau khi bạn ấn `Install Wordpress`.  

<img src="https://i.imgur.com/OdSD4im.png">  

<img src="https://i.imgur.com/9PitUnv.png">  

Giao diện Wordpress sau khi đăng nhập thành công  
<img src="https://i.imgur.com/kduoCRb.png">  
<a name="7"></a>

**Bước 5: Phân quyền cho thư mục Wordpress**   
Khi bạn thực hiện thao tác upload ảnh hay đăng các bài viết, sẽ xuất hiện lỗi sau:  

<img src="https://i.imgur.com/XK6qpxh.png">

Bạn cần tiến hành phân quyền thư mục wordpress cho user apache để cho user này được phép tạo các thư mục và lưu các tệp tải lên. Trên của sổ terminal, ta gõ lệnh như sau:
```
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/ 
```
Sau đó ta sẽ upload ảnh và viết bài như bình thường  
<img src="https://i.imgur.com/h0TE29f.png">  
