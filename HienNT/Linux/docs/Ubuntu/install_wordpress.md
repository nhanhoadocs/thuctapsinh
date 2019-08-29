# Cài đặt Wordpress trên Ubuntu 18.04

## Điều kiện
Trên Server có cài sẵn LAMP Stack  

## Các bước thực hiện  

### Bước 1: SSH vào Ubuntu Server 18.04 sử dụng user có quyền sử dụng lệnh sudo  

  ```sh
    ssh thuyhien@192.168.136.132
  ```

### Bước 2: Truy cập vào user root MariaDB tạo CSDL của Wordpress

  - Login vào MariaDB Server  
   
    ```sh
      $ sudo mysql -u root -p
    ```
  
  - Tạo CSDL với tên `demo`  

    ```sh
      > create database wordpress;
    ```
  
  - Tạo user `demo` quản lý CSDL `demo`

    ```sh
      > create user 'wordpress'@'localhost' identified by 'abc@123';
    ```

  - Gán quyền trên CSDL `demo` cho user `demo`

    ```sh
      > grant all on wordpress.* to 'wordpress'@'192.168.136.132' identified by 'abc@123';
    ```

  - Xác nhận lại các thay đổi  

    ```sh
      > flush privileges;
    ```

### Bước 3: Tải và cài đặt Wordpress  

  - Cài đặt gói hỗ trợ `php-dg`

    ```sh
      $ sudo apt install php-gd -y
    ```  

  - Cài đặt wget

    ```sh
      $ sudo apt install wget
    ```  

  - Tiến hành tải xuống WordPress với phiên bản mới nhất

    ```sh
      $ sudo wget http://wordpress.org/latest.tar.gz
    ```  

  - Giải nén file `latest.tar.gz`

    ```sh
      $ sudo tar xvfz latest.tar.gz
    ```

  - Copy các file trong thư mục WordPress tới đường dẫn /var/www/html  

    ```sh
      $ sudo cp -Rvf /home/thuyhien/wordpress/* /var/www/html
    ```
### Bước 4: Cấu hình Wordpress

  - Truy cập vào các file cài đặt của Wordpress

    ```sh
      $ cd /var/www/html
    ```  

  - File cấu hình wordpress là wp-config.php. Tuy nhiên tại đây chỉ có file wp-config-sample.php. Tiến hành sửa lại tên file cấu hình như sau:

    ```sh
      $ sudo mv wp-config-sample.php wp-config.php
    ```  

  - Mở file config với vi để sửa:

    ```sh
    $ sudo vi wp-config.php
    ```  

  Sửa những nội dung được gạch chân theo thông tin bạn đặt ở bước 2  

    <img src ="../../images/Ubuntu184/wordpress/image1.png">
      
  - Lưu file cấu hình và thoát.
  
### Bước 5: Hoàn tất cài đặt giao diện

  - Trên trình duyệt, gõ địa chỉ ip server trên thanh url, trình duyệt sẽ xuất hiện như hình dưới, điền các thông tin vào rồi ấn `Install Wordpress` 

    <img src ="../../images/Ubuntu184/wordpress/image2.png">  

  - Thiết lập thành công, bạn có thể đăng nhập vào Wordpress  

    <img src ="../../images/Ubuntu184/wordpress/image3.png">  

    <img src ="../../images/Ubuntu184/wordpress/image4.png"> 

### Màn hình sau khi bạn đăng nhập thành công vào Wordpress  

  <img src ="../../images/Ubuntu184/wordpress/image5.png"> 