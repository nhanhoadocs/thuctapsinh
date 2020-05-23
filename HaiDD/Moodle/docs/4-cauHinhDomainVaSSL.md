# Hướng dẫn cấu hình domain cho Moodle(phần 2)

Trong bài viết trước, Cloud365 đã hướng dẫn các bạn thực hiện 2 bước đầu tiên để cấu hình domain cho hệ thống Moodle.

Trong bài viết này, Cloud365 sẽ hướng dẫn các bạn thực hiện 2 bước còn lại.

# Các bước thực hiện cấu hình domain cho Moodle
Bước 1 và Bước 2 đã được Cloud365 trình bày trong bài viết trước.

- [x] **Bước 1**: Truy cập Moodle bằng địa chỉ IP

- [x] **Bước 2**: Trỏ domain về IP public của VPS cài đặt Moodle

- [ ] **Bước 3**: Xử lí cấu hình Domain trên Moodle

- [ ] **Bước 4**: Cài đặt Let's Encrypt cho hệ thống Moodle

---

## Thông tin VPS cài đặt Moodle
- Bước 1 và Bước 2 đã được Cloud365 trình bày trong bài viết trước.

- Domain đã được trỏ về IP public của VPS

Trong bài viết này, Cloud365 sẽ hướng dẫn xử lí cấu hình domain trên Moodle và cài đặt chứng chỉ Let's Encrypt cho hệ thống Moodle của bạn.

-----

## **Bước 3**: Xử lí cấu hình Domain trên Moodle
1. SSH tới VPS của bạn. 
    
    **Lưu ý:** Thông tin remote và ssh quản trị VPS đều được gửi trong mail đăng kí VPS của bạn

2. Sửa file `/var/www/html/moodle/config.php`
    ```
    vi /var/www/html/moodle/config.php
    ```

    Tìm đến dòng 
    ```
    $CFG->wwwroot   = 'http://<địa_chỉ_IP_public>';
    ```
    Sửa thành
    ```
    $CFG->wwwroot   = 'http://<domain>';
    ```

    Ở đây, ta đổi thành `$CFG->wwwroot   = 'http://e-learning.workfromhome.vn';`

    <img src="https://i.imgur.com/0KfI1y7.png">

3. Truy cập trang theo IP hay domain thì trình duyệt bây giờ sẽ hiển thị tên doamin mà bạn đăng kí

    <img src="https://i.imgur.com/bVRcFOv.png">

## **Bước 4:** Cài đặt Let's Encrypt cho hệ thống Moodle
Có thể thấy trang web của ta đang ở dạng `http`. Để tăng tính bảo mật, bạn nên thiết lập chứng nhận SSL cho trang của bạn. Ở đây, Cloud365 sẽ hướng dẫn bạn sử dụng Let's Encrypt để tạo chứng chỉ SSL miễn phí.

### 1. Cài đặt SSL Let's Encrypt

1. Thêm kho lưu trữ EPEL
    ```
    yum install epel-release
    ```

2. Cài đặt **Certbot Let’s Encrypt Client**
    ```
    yum -y install certbot python2-certbot-apache mod_ssl
    ```

3. Thiết lập chứng chỉ miễn phí từ **Let's Encrypt**
    ```
    certbot --apache -d e-learning.workfromhome.vn
    ```

    **OUTPUT**

    ```
    Saving debug log to /var/log/letsencrypt/letsencrypt.log
    Plugins selected: Authenticator apache, Installer apache
    Enter email address (used for urgent renewal and security notices) (Enter 'c' to
    cancel): dangdohai1996@gmail.com
    Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Please read the Terms of Service at
    https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
    agree in order to register with the ACME server at
    https://acme-v02.api.letsencrypt.org/directory
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    (A)gree/(C)ancel: A

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Would you be willing to share your email address with the Electronic Frontier
    Foundation, a founding partner of the Let's Encrypt project and the non-profit
    organization that develops Certbot? We'd like to send you email about our work
    encrypting the web, EFF news, campaigns, and ways to support digital freedom.
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    (Y)es/(N)o: Y
    Starting new HTTPS connection (1): supporters.eff.org
    Obtaining a new certificate
    Performing the following challenges:
    http-01 challenge for e-learning.workfromhome.vn
    Waiting for verification...
    Cleaning up challenges
    Created an SSL vhost at /etc/httpd/conf.d/moodle-le-ssl.conf
    Deploying Certificate to VirtualHost /etc/httpd/conf.d/moodle-le-ssl.conf

    Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    1: No redirect - Make no further changes to the webserver configuration.
    2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
    new sites, or if you're confident your site works on HTTPS. You can undo this
    change by editing your web server's configuration.
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
    Redirecting vhost in /etc/httpd/conf.d/moodle.conf to ssl vhost in /etc/httpd/conf.d/moodle-le-ssl.conf

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Congratulations! You have successfully enabled
    https://e-learning.workfromhome.vn

    You should test your configuration at:
    https://www.ssllabs.com/ssltest/analyze.html?d=e-learning.workfromhome.vn
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    IMPORTANT NOTES:
    - Congratulations! Your certificate and chain have been saved at:
    /etc/letsencrypt/live/e-learning.workfromhome.vn/fullchain.pem
    Your key file has been saved at:
    /etc/letsencrypt/live/e-learning.workfromhome.vn/privkey.pem
    Your cert will expire on 2020-06-24. To obtain a new or tweaked
    version of this certificate in the future, simply run certbot again
    with the "certonly" option. To non-interactively renew *all* of
    your certificates, run "certbot renew"
    - Your account credentials have been saved in your Certbot
    configuration directory at /etc/letsencrypt. You should make a
    secure backup of this folder now. This configuration directory will
    also contain certificates and private keys obtained by Certbot so
    making regular backups of this folder is ideal.
    - If you like Certbot, please consider supporting our work by:

    Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
    Donating to EFF:                    https://eff.org/donate-le

    - We were unable to subscribe you the EFF mailing list because your
    e-mail address appears to be invalid. You can try again later by
    visiting https://act.eff.org.
    ```

    Bây giờ khi truy cập trang Moodle của mình, bạn sẽ thấy vẫn là kết nối **Không bảo mật** và dòng chữ **Kết nối của bạn tới trang web này không đủ an toàn**, dù vẫn có chứng chỉ.

    <img src="https://i.imgur.com/BHZggJK.png">

    Bạn cần chuyển hướng tất cả truy vấn trang web đến `https`.

4. Redirect tất cả các truy vấn tới `https`. Chỉnh sửa file `/var/www/html/moodle/config.php`
    ```
    vi /var/www/html/moodle/config.php
    ```
    Tìm đến dòng 
    ```
    $CFG->wwwroot   = 'http://<domain>';
    ```
    Sửa thành `https`
    ```
    $CFG->wwwroot   = 'https://<domain>';
    ```

    Ở đây, ta đổi thành `$CFG->wwwroot   = 'https://e-learning.workfromhome.vn';`

    <img src="https://i.imgur.com/HmTLQwy.png">

### Kiểm tra
1. Truy cập thử lần lượt 
    - https://e-learning.workfromhome.vn

    - https://e-learning.workfromhome.vn

    - e-learning.workfromhome.vn

    Đều cho một kết quả giống nhau. Trang web đã được cài đặt chứng chỉ thành công và dòng chữ **Kết nối an toàn**

    <img src="https://i.imgur.com/471jiWd.png">

    Thông tin về chứng chỉ

    <img src="https://i.imgur.com/imNzryq.png">

2. Ngoài ra, bạn có thể truy cập SSLLabs theo đường dẫn https://www.ssllabs.com/ssltest/analyze.html?d=e-learning.workfromhome.vn

### 2. Thiết lập gia hạn tự động chứng chỉ
Chứng chỉ Let'Encrypt có thời hạn 90 ngày, nhưng nó khuyên bạn nên gia hạn chứng chỉ sau mỗi 60 ngày để hạn chế lỗi. Bạn hoàn toàn có thể đặt lịch và ra hạn bằng tay, nhưng cách tốt nhất là tự động hóa việc này.

1. **Cách 1** : **Let's Encrypt** cho phép bạn tự gia hạn chứng chỉ bằng cách chạy câu lệnh
    ```
    certbot renew --dry-run
    ```
    **OUTPUT**
    ```
    Saving debug log to /var/log/letsencrypt/letsencrypt.log

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Processing /etc/letsencrypt/renewal/e-learning.workfromhome.vn.conf
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    Cert not due for renewal, but simulating renewal for dry run
    Plugins selected: Authenticator apache, Installer apache
    Starting new HTTPS connection (1): acme-staging-v02.api.letsencrypt.org
    Renewing an existing certificate
    Performing the following challenges:
    http-01 challenge for e-learning.workfromhome.vn
    Waiting for verification...
    Cleaning up challenges

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    new certificate deployed with reload of apache server; fullchain is
    /etc/letsencrypt/live/e-learning.workfromhome.vn/fullchain.pem
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ** DRY RUN: simulating 'certbot renew' close to cert expiry
    **          (The test certificates below have not been saved.)

    Congratulations, all renewals succeeded. The following certs have been renewed:
    /etc/letsencrypt/live/e-learning.workfromhome.vn/fullchain.pem (success)
    ** DRY RUN: simulating 'certbot renew' close to cert expiry
    **          (The test certificates above have not been saved.)
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    IMPORTANT NOTES:
    - Your account credentials have been saved in your Certbot
    configuration directory at /etc/letsencrypt. You should make a
    secure backup of this folder now. This configuration directory will
    also contain certificates and private keys obtained by Certbot so
    making regular backups of this folder is ideal.
    ```

2. **Cách 2:** Thiết lập gia hạn tự động. Bạn có thể sử dụng câu lệnh
   - Chỉnh sửa `crontab` để tạo một công việc mới
        ```
        crontab -e
        ```

    - Thêm dòng sau vào và lưu lại
        ```
        0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew
        ```

## Kết luận
Trên đây là hướng dẫn của Cloud365 về cách cấu hình Domain và cài đặt đặt Let's Encrypt cho hệ thống Moodle.

Chúc các bạn thành công.