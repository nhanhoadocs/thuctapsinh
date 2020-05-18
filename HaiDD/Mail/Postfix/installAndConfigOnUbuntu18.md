# Cài đặt và cấu hình Postfix trên Ubuntu 18.04

Đăng nhập và sử dụng user `root`

- Update và cài đặt Postfix
    ```
    apt-get update
    apt-get -y install postfix
    ```

- Chọn **Internet site**

    <img src="https://i.imgur.com/mHF40xe.png">

- Đặt System mail name:
    
    <img src="https://i.imgur.com/xcsQX2Q.png">

- Sau khi cài đặt. Postfix sẽ tự động khởi động. Kiểm tra service
    ```
    service postfix status
    ```

- File cấu hình Postfix:
    ```
    /etc/postfix/main.cf
    ```

- Nếu cần cấu hình lại, ta có thể sử dụng lệnh
    ```
    dpkg-reconfigure postfix
    ```

- Kiểm tra port sử dụng 
    ```
    netstat -na | grep LISTEN | grep 25
    netstat -na | grep LISTEN | grep 587
    ```

- Kiểm tra việc cấu hình và phân quyền file
    ```
    postfix check
    ```

- Thử gửi 1 mail đến mail của bạn.
    ```
    sendmail -v yourmail@example.com
    ```
    Sau đó, bạn sẽ nhập nội dung mail. Sau đó đặt dấu chấm trên 1 dòng cuối để kết thúc nội dung mail.

- Bạn có thể tìm thấy log gửi mail bằng cách dùng `grep`
    ```
    grep yourmail@example.com /var/log/mail.log
    ```

- Ta sẽ thấy mail nhận được trong hộp thư. Nếu không thấy, bạn có thể kiểm tra trong mục thư rác.
    
    <img src="https://i.imgur.com/sS6EpbO.png">

- Ta có thể xem hàng đợi tin nhắn bằng cách sử dụng một trong các lệnh
    ```
    mailq | less
    postqueue -p | less
    ```

- Để xem các thông số cấu hình hiện tại
    ```
    postconf
    postconf -d
    ```

- Để xem một thông số cụ thể nào đó, ta sử dụng thêm `grep`. Ví dụ: xem `message_size_limit`
    ```
    postconf | grep message_size_limit
    ```

- Nếu server có nhiều IP, ta cần chỉ định việc gửi mail xuất phát từ IP nào. Mở file cấu hình `/etc/postfix/main.cf`. Thêm dòng sau:
    ```
    smtp_bind_address = <IP_chỉ_định>
    ```

- Chỉ định interface mà Postfix sẽ sử dụng. Ví dụ như `localhost`
    ```
    #inet_interfaces = all              <-- Mặc định
    inet_interfaces = 127.0.0.1
    ```