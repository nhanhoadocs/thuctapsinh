# File Integrity Check Script

Khi sử dụng một máy chủ, ta cần theo dõi tính toàn vẹn của tệp. Khi file bị thay đổi ta cần được cảnh báo để có giải pháp xử lý.

Thông thường, ta sẽ có các máy chủ thực hiện giám sát. Tuy nhiên, ta không cần thiết phải sử dụng giải pháp lớn cho vấn đề này. 

Ở đây, ta sẽ sử dụng một script đơn giản.

-----
## Ý tưởng
- Ta sẽ sử dụng `md5sum` check mã md5 của file cần theo dõi và lưu lại vào 1 file.

- Cứ một khoảng thời gian (ví dụ: 30 phút, 1 giờ, ...) ta sẽ check lại xem mã md5 của file đó có bị thay đổi hay không. Nếu có sẽ gửi mail cảnh báo.

## Thực hiện
### Yêu cầu
- Sử dụng user `root`
- Giám sát sự thay đổi của file `/etc/passwd`
- Sử dụng crontab để đặt cronjob cảnh báo

### Các bước thực hiện
- Cài đặt dịch vụ gửi mail. Ở đây, tôi cài đặt dịch vụ mail `ssmtp`. [Xem hướng dẫn cài đặt](https://github.com/danghai1996/thuctapsinh/blob/master/HaiDD/Mail/SSMTP/installAndConfigSSMTPOnUbuntu18.md)

- Tạo 1 file để lưu mã MD5 của file `/etc/passwd`
    ```
    touch /opt/passwd.md5
    ```

- Tạo file script với nội dung sau. Ở đây, tôi có đặt file script tại `/root/checkuser.sh`
    ```sh
    #!/bin/bash
    MAIL="youremail@gmail.com"

    if md5sum -c /opt/passwd.md5; then
            echo "OK"
    else
            (echo "Subject:File changed"; echo "File /etc/passwd changed on $HOSTNAME!";) | /usr/sbin/sendmail $MAIL
            md5sum /etc/passwd > /opt/passwd.md5
    fi
    ```

- Phân quyền:
    ```
    chmod +x /root/checkuser.sh
    ```

- Đặt crontab. Ở đây, ta sẽ để 30 phút kiểm tra một lần. Bạn có thể để khoảng thời gian nhỏ để test sự hoạt động của script và crontab.
    ```
    crontab -e
    ```
    Thêm cronjob:
    ```
    */30 * * * * /root/checkuser.sh > /dev/null 2>&1
    ```

### Kiểm tra
- Thử thêm một user vào hệ thống
    ```
    useradd testuser
    ```

- Sau khi đến thời gian cronjob chạy, bạn sẽ nhận được mail tương tự như sau: (Bạn nên chỉnh thời gian crontab xuống còn 2, 3 phút để kiểm tra cho đỡ tốn thời gian)
   
   <img src="https://i.imgur.com/Xc8GlUR.png">