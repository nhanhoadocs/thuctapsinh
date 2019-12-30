# Hướng dẫn cài đặt LEMP + Wordpress trên CentOS 7 bằng Script  

## Mục đích
- Phân biệt được cách dùng lệnh `bash` và `./file_bash_script` để chạy file bash script.
- Biết cách cài đặt LEMP + Wordpress bằng script

## Hướng dẫn cài đặt LEMP + Wordpress bằng script

- Bước 1: Tải script về máy
Vào [link](../tools/CentOS-7) để tải script về máy

- Bước 2: Trong file `lemp.sh` tìm đến phần `server_name` sửa lại địa chỉ IP thành địa chỉ IP máy của bạn. Lưu và thoát file.

  <img src="../images/hd1.png">
  
- Bước 3: Chạy script:
  - Cách 1: Sử dụng câu lệnh `bash`

    ```sh
      bash path_script_file
    ```
  
   - Cách 2: Sử dụng `./`

     - Cấp quyền `execute` cho bash script file.  

       ```sh
         chmod +x path_script_file
       ```

     - Đi đến thư mục chứa script file để chạy script.

       ```sh
         ./script_file_name
       ```

- Bước 4: Nhập thông tin về database, user database, password user database sẽ được dùng cho wordpress. Không nhập password cho phần `Enter password`

  <img src="../images/hd.png">

- Bước 5: Kiểm tra: Trên thanh tìm kiếm của trình duyệt của bạn nhập vào địa chỉ `http://your-server-ip/wordpress`. Bây giờ bạn có thể set up trang Wordpress của bạn.

  <img src="../images/wordpress_test.png">