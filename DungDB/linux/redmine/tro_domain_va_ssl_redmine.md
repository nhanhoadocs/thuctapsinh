# Hướng dẫn cài đặt SSL bằng let's encrypt cho Redmine server

### Chuẩn bị

Trước hết bạn cài đặt redmine theo như hướng dẫn [**ở đây**](https://news.cloud365.vn/huong-dan-cai-dat-redmine-tren-centos-7/)

Trong hướng dẫn dưới đây chúng tôi sử dụng domain: `workfromehome.vn`. Trong bài này, tôi đã tạo subdomain `redmine.workfromehome.vn` cho domain `workfromehome.vn` trỏ về IP của máy cài dịch vụ Redmine.

## 1. Khắc phục lỗi hiển thị IP server sau khi trỏ domain

Sau khi bạn trỏ domain về IP của mình. Nếu bạn truy cập vào domain và gặp trường hợp trên thanh địa chỉ của trình duyệt không hiển thị tên domain mà hiển thị IP của server như trong hình sau.

![Imgur](https://i.imgur.com/LOtYkND.png)

Bạn thực hiện theo như hướng dẫn bên dưới để khắc phục.

Đầu tiên, vào thư mục `/etc/httpd/conf.d`. Thư mục này đặt các file cấu hình Virtual host của bạn.

    # cd /etc/httpd/conf.d

Tại đây có một số file `.conf`.

Nếu bạn đã thực [hiện theo bài hướng dẫn trước](https://news.cloud365.vn/huong-dan-cai-dat-redmine-tren-centos-7/). Bạn tiếp tục thực hiện như sau:

Đổi tên file `passenger.conf` thành `redmine.conf`

    # mv passenger.conf redmine.conf

Sau đó chỉnh sửa nội dung file `redmine.conf`

    # nano redmine.conf

Tại dòng: Servername "IP của bạn". 

![Imgur](https://i.imgur.com/Z3ZPLwL.png)

Sửa lại thành: Servername "tên domain của bạn".

![Imgur](https://i.imgur.com/wyTVE7Y.png)

Bây giờ, khi bạn truy cập vào domain của mình, nó sẽ không hiển thị IP server của bạn nữa. 

![Imgur](https://i.imgur.com/yoUAq2x.png)

## 2. Cài đặt SSL bằng let's encrypt trên Redmine

### Giới thiệu Let's Enscrypt

Let's Encrypt là nhà cung cấp chứng chỉ SSL miễn phí, tự động, hoạt động vì lợi ích của cộng đồng. Nó được quản lý bởi Internet Security Research Group (ISRG).

Let's Encrypt cung cấp cho những người quản trị website một chứng nhận số cần thiết để kích hoạt HTTPS (SSL hoặc TLS) cho website của mình, hoàn toàn miễn phí, và theo cách thân thiện nhất có thể. Tất cả dựa trên mục tiêu tạo ra một môi trường Web an toàn, riêng tư và tôn trọng người dùng hơn.

Let's Encrypt cung cấp chứng chỉ SSL loại Domain Validation, tức là sau khi cài đặt, trang web của bạn sẽ có một ổ khóa màu xanh trên thanh địa chỉ của trình duyệt, khi người dùng truy cập vào.

Lợi ích khi sử dụng Let's Encrypt:

- Miễn phí: Chỉ cần sở hữu một tên miền, bạn có thể sử dụng Let's Encrypt để có được chứng chỉ tin cậy mà không tốn một xu nào.
Tự động: Phần mềm chạy trên máy chủ web có thể tương tác với Let's Encrypt để có được chứng chỉ một cách nhanh chóng, cấu hình an toàn để sẵn sàng sử dụng và tự động thay mới khi cần.
- An toàn: Let's Encrypt sẽ hoạt động như một nền tảng thúc đẩy những TLS tốt nhất, cả về phía CA (Certificate Authority) và giúp các nhà khai thác trang web đảm bảo an toàn cho máy chủ một cách đúng đắn.
- Minh bạch: Tất các các chứng chỉ được ban hành hoặc thu hồi sẽ được ghi công khai và bất cứ ai cũng có thể kiểm tra.
Không hạn chế: Giao thức phát hành và gia hạn tự động sẽ được công bố như một tiêu chuẩn công khai và người khác có thể áp dụng.
- Hợp tác: Giống như những giao thức Internet cơ bản khác, Let's Encrypt nỗ lực để mang lại lợi ích cho cộng đồng và không nằm dưới sự kiểm soát của bất kỳ một tổ chức nào.

### Thực hiện

**Lưu ý:** Tất cả thao tác để thực hiện dưới quyền root

**Bước 1:** Cài Certbot

Chạy các lệnh

    # yum install epel-release -y
    # yum install certbot python2-certbot-apache mod_ssl -y

**Bước 2:** Lấy chứng chỉ

    # certbot --apache -d redmine.workfromehome.vn

Nhập số 2 để bắt buộc dùng HTTPS (Khyên dùng). Chọn số 1 để dùng song song HTTP và HTTPS. Sau đó nhấn ENTER.

```
Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel):2
```

Sau khi hoàn thành cài đặt sẽ hiện thông báo

```
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/redmine.workfromehome.vn/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/redmine.workfromehome.vn/privkey.pem
   Your cert will expire on 2020-06-25. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

Chứng chỉ sẽ được đặt ở thư mục `/etc/letsencrypt/live`

**Bước 3:** Kiểm tra trạng thái chứng chỉ

Truy cập vào đường link bên dưới trên trình duyệt web

`https://www.ssllabs.com/ssltest/analyze.html?d=redmine.workfromehome.vn`

Thay `redmine.workfromehome.vn` bằng domain của bạn.

Đang kiểm tra, bạn chờ vài phút. 

![Imgur](https://i.imgur.com/tA1NUu2.png)

Sau khi kiểm tra xong

![Imgur](https://i.imgur.com/1SuzK3g.png)

Kiểm tra lại. Lần lượt truy cập vào 

- https://redmine.workfromhome.vn
- http://redmine.workfromhome.vn
- redmine.workfromhome.vn

Kết quả cả 3 lần đều tương tự nhau, đều vào được HTTPS (Connection is secure) tức là thành công. 

![Imgur](https://i.imgur.com/woZgKgf.png)

Thông tin chứng chỉ.

![Imgur](https://i.imgur.com/0zLG4Hm.png)

**Bước 4:** Cài đặt tự động làm mới chứng chỉ

Chứng chỉ Let'Encrypt có thời hạn 90 ngày, nhưng nó khuyên bạn nên gia hạn chứng chỉ sau mỗi 60 ngày để hạn chế lỗi. Bạn hoàn toàn có thể đặt lịch và ra hạn bằng tay, nhưng cách tốt nhất là tự động hóa việc này.

**Cách 1:** Let's Encrypt cho phép bạn tự gia hạn chứng chỉ bằng cách chạy câu lệnh

    # certbot renew --dry-run

OUTPUT

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

**Cách 2:** Thiết lập gia hạn tự động. Bạn có thể sử dụng câu lệnh

Chỉnh sửa crontab để tạo một công việc mới

    # crontab -e

Thêm dòng sau vào và lưu lại

```
0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew
```
## 3. Kết luận

Trên đây là hướng dẫn của Cloud365 về cách trỏ subdomain và cài  đặt Let's Encrypt cho hệ thống Redmine.

Chúc các bạn thành công.

