<img src ="../../../images/25 bai linux/phpMyAdmin-quick-start-complete-tutorial-for-begineers.jpg">  

# phpMyAdmin  
## phpMyAdmin là gì?
- phpMyAdmin là một công cụ phần mềm miễn phí được viết bằng PHP nhằm xử lý việc quản trị CSDL trên Web. phpMyAdmin hỗ trợ quản lý CSDL của cả MySQL và MariaDB. 
- Nó có thể được cấu hình để quản lý cơ sở dữ liệu cục bộ (trên cùng hệ thống) hoặc cơ sở dữ liệu từ xa (qua mạng).
- Các hoạt động thường được sử dụng (quản lý cơ sở dữ liệu, bảng, cột, quan hệ, chỉ mục, người dùng, quyền, v.v.) có thể được thực hiện thông qua giao diện người dùng, trong khi bạn vẫn có khả năng thực hiện trực tiếp bất kỳ câu lệnh SQL nào.  

## Điều kiện tiên quyết

- LAMP (Linux, Apache, MySQL và PHP) được cài đặt trên máy chủ CentOS.
- Đăng nhập như một người dùng với đặc quyền sudo hoặc user root.

## Cài đặt phpMyAdmin  
### **Bước 1: Cài đặt Kho lưu trữ EPEL**  

(Nếu đã cài đặt EPEL, bạn có thể bỏ qua bước này.)
CentOS 7 không có quyền truy cập vào phpMyAdmin trong kho phần mềm mặc định của nó. Bạn sẽ cần có quyền truy cập vào kho lưu trữ EPEL - Gói bổ sung cho Enterprise Linux.

- Gõ như sau tại dấu nhắc lệnh, sau đó nhấn enter:  
  ```sh
  yum install -y epel-release  
  ```
- Làm mới và cập nhật kho EPEL:
  ```sh
  yum –y update  
  ```

### **Bước 2: Cài đặt phpMyAdmin trên CentOS 7**

- Để cài đặt PHPMyAdmin trên CentOS, sử dụng lệnh:
  ```sh  
  yum -y install phpmyadmin
  ```

### **Bước 4: Cấu hình và bảo mật phpMyAdmin**  

**Hạn chế địa chỉ IP**  

- Được sử dụng để cấp quyền truy cập từ xa cho một máy trạm. Theo mặc định, phpMyAdmin được cấu hình để server được cài đặt có quyền truy cập.   
- Bên trong *`config file - /etc/httpd/conf.d/phpMyAdmin.conf`*, có 4 dòng tham chiếu đến `Require ip`, hoặc `Allow from IP`. Theo mặc định IP được đặt là 127.0.0.1. Để cho phép các hệ thống khác truy cập ứng dụng phpMyAdmin này, thêm (hoặc thay đổi) địa chỉ IP này thành địa chỉ IP của máy tính bạn muốn cấp quyền truy cập.  

    <img src ="../../../images/25 bai linux/allow ip.png">  

**Thay đổi Alias**    
- Đọc *`config file - /etc/httpd/conf.d/phpMyAdmin.conf`* , gần đầu file bạn sẽ thấy 2 dòng  
  ```sh
  Alias /phpMyAdmin /usr/share/phpMyAdmin
  ```
  ```sh
  Alias /phpmyadmin /usr/share/phpMyAdmin
  ```
- Chỉnh sửa config file:  
  - Thêm dấu **"#"** trước 2 dòng phía trên để chương trình xem chúng là nhận xét thay vì hướng dẫn:  
    ```sh  
    #Alias /phpMyAdmin /usr/share/phpMyAdmin
    #Alias /phpmyadmin /usr/share/phpMyAdmin  
    ```  
  - Thêm vào 1 dòng hướng dẫn riêng của bạn:  
    ```sh
    Alias /MySecretLogin /usr/share/phpMyAdmin  
    ```  
  - Thoát và lưu cấu hình  

- Khởi động lại dịch vụ Apache để nhận cấu hình mới  
  ```sh
  systemctl restart httpd
  ```  

### **Bước 5: Xác minh phpMyAdmin đang hoạt động**  

Đến màn hình đăng nhập,nhập **`https://IP_OR_DOMAIN/MySecretLogin`**  
Kết quả: 

<img src ="../../../images/25 bai linux/check.png">  

Đăng nhập bằng user và password của MySQL/MariaDB, màn hình xuất hiện:  

<img src ="../../../images/25 bai linux/result.png">  

## Làm việc với phpMyAdmin  
Các thao tác làm việc trên phpMyAdmin gần giống với MySQL Workbench, có thể tham khảo thêm [tại đây](https://news.cloud365.vn/mariadb-cac-thao-tac-co-ban-voi-mysql-workbench/)






## TÀI LIỆU THAM KHẢO  
- https://www.phpmyadmin.net/
