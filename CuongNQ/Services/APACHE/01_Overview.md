# Tổng quan về Apache
## **1) Web Server là gì**
- **Web Server** là 1 dịch vụ mạng hướng nội dung của người dùng lên giao diện Web .
- **Web Server** còn được gọi là **HTTP server** và chúng sử dụng giao thức **HTTP - hypertext transport protocol** .
- Các **Web Server** có thể cài lên CentOS 7 là :
    - **Apache HTTP Server**
    - **Apache Tomcat**
    - **nginx**
## **2) Apache HTTP Server** <img src=https://i.imgur.com/aeHvD7d.png align=right width=35%>
- Trang chủ : http://httpd.apache.org/
- **Apache** là phần mềm máy chủ mã nguồn mở đa nền tảng miễn phí .
- Ra đời năm `1995` bởi **Robert McCool**
- Phiên bản ổn định : `2.4.39` ( `tháng 4-2019` )
- **Apache** được phát triển và duy trì bởi một cộng đồng các nhà phát triển dưới sự bảo trợ của **Quỹ phần mềm Apache ( Apache Software Foundation )** . 
- Phần lớn các phiên bản **Apache** chạy trên bản phân phối Linux , nhưng các phiên bản hiện tại cũng chạy trên Microsoft Windows và nhiều hệ thống tương tự Unix . Các phiên bản trước đây cũng chạy trên OpenVMS , NetWare và các hệ điều hành khác .
- **Apache** đang chiếm đến khoảng `46%` thị phần websites trên toàn thế giới .
## **3) Các lệnh cơ bản về Apache**
### **3.1) Cài đặt Apache**
- **B1 :** Cài đặt repo `Epel` :
    ```
    # yum install -y epel-release
    ```
- **B2 :** Cài đặt gói `httpd` :
    ```
    # yum install -y httpd
    ```
    - Mặc định khi cài qua `yum` , trên CentOS `6` sẽ cài Apache `2.2` , còn trên CentOS `7` sẽ cài `2.4` .
### **3.2) Cài đặt các gói thư viện bổ sung**
- **APR `1.7.0`**
    ```
    # wget https://www.apache.org/dist/apr/apr-1.7.0.tar.gz
    ```
- **APR-util `1.6.1`**
    ```
    # wget https://www.apache.org/dist/apr/apr-util-1.6.1.tar.gz
    ```
### **3.3) Gỡ cài đặt Apache**
```
# yum remove httpd -y
```
### **3.4) Kiểm tra version Apache đã cài**
```
# usr/sbin/httpd -v
```
<img src=https://i.imgur.com/uDsq2tw.png>

## **4) Cài đặt Apache từ Source**
- **B1 :** Download source **`httpd`** về từ Internet và lưu vào thư mục `/var/tmp`
    ```
    # cd /var/tmp
    # wget https://archive.apache.org/dist/httpd/httpd-2.4.35.tar.gz
    # tar -zxvf httpd-2.4.35.tar.gz
    ```
    > Có thể thay `2.4.35` bằng số khác để tải về các phiên bản khác
- **B2 :** Cài đặt các gói thư viện bổ sung
    - **APR `1.7.0`**
        ```
        # wget https://www.apache.org/dist/apr/apr-1.7.0.tar.gz
        # cd apr-1.7.0/
        # ./configure
        # make && make install
        ```
    - **Expat-devel `2.1.0`**
        ```
        # wget http://mirror.centos.org/centos/7/os/x86_64/Packages/expat-devel-2.1.0-10.el7_3.x86_64.rpm
        # rpm -ivh expat-devel-2.1.0-10.el7_3.x86_64.rpm
        ```
    - **APR-util `1.6.1`**
        ```
        # wget https://www.apache.org/dist/apr/apr-util-1.6.1.tar.gz
        # cd apr-util-1.6.1/
        # ./configure --with-apr=/usr/local/apr/bin/apr-1-config
        # make && make install
        ```
    - **PCRE `8.4.3`** ( **`8.21`** trở xuống cho **Apache `2.2`**)
        ```
        # wget -O pcre-8.43.tar.gz https://sourceforge.net/projects/pcre/files/pcre/8.43/pcre-8.43.tar.gz/download
        # cd pcre-8.43/
        # ./configure
        # make && make install
        ```
- **B3 :** Biên dịch file `httpd` và cài đặt :
    ```
    # cd httpd-2.4.35/
    # ./configure
    # make && make install
    ```
- **B4 :** Khởi động dịch vụ `httpd` :
    ```
    # systemctl start httpd
    ```
## **5) Các file/thư mục quan trọng của Apache**
- `/var/html/` : là thư mục gốc chứa các file `htm` , `html` , `images` .... tạo thành nội dung cho trang web
- `/etc/httpd/` : thư mục chứa tất cả các file cấu hình cho **Apache** :
    - `/etc/httpd/conf/httpd.conf` : file cấu hình chính của dịch vụ Apache
    - `/etc/httpd/conf.d/` : thư mục chứa các cấu hình bổ sung cho Apache
        - `/etc/httpd/conf.d/vhost.conf` : file cấu hình virtual host
    - `/etc/httpd/conf.modules.d/` : thư mục chứa file cấu hình của các modules
- `/var/log/httpd/error_log` : file chứa log lỗi dịch vụ
- `/var/log/httpd/access_log` : file chứa log đăng nhập
