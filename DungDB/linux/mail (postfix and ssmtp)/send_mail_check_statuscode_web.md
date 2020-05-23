# Gửi mail check statuscode của website

## Status code là gì và ý nghĩa

Status code (Mã hóa trạng thái thường được gọi là mã trạng thái) là một số nguyên 3 ký tự, trong đó ký tự đầu tiên của Status-Code định nghĩa loại Response và hai ký tự cuối không có bất cứ vai trò phân loại nào. Có 5 giá trị của ký tự đầu tiên:

- 1xx: Information (Thông tin): Khi nhận được những mã như vậy tức là request đã được server tiếp nhận và quá trình xử lý request đang được tiếp tục.
- 2xx: Success (Thành công): Khi nhận được những mã như vậy tức là request đã được server tiếp nhận, hiểu và xử lý thành công
- 3xx: Redirection (Chuyển hướng): Mã trạng thái này cho biết client cần có thêm action để hoàn thành request
- 4xx: Client Error (Lỗi Client): Nó nghĩa là request chứa cú pháp không chính xác hoặc không được thực hiện.
- 5xx: Server Error (Lỗi Server): Nó nghĩa là Server thất bại với việc thực hiện một request nhìn như có vẻ khả thi.
Status-Code HTTP là có thể co giãn và ứng dụng HTTP không được yêu cầu để hiểu ý nghĩa của tất cả các mã trạng thái được đăng ký. 

Xem thêm:

https://viblo.asia/p/tim-hieu-ve-http-status-code-lA7GKwx5GKZQ

## Script

```
#!/bin/bash

# Script gửi mail check statuscode website
  
echo -n "Nhập website cần check: "
read site
URL="https://$site/"
STATUS_CODE=""
MAIL="dungz1207@gmail.com"

f_get_status_code(){
	STATUS_CODE=$(curl -s -o /dev/null -I -w "%{http_code}" $URL)
}

f_send_mail(){
	echo "Status Code $URL : $STATUS_CODE" | mail -s "Mail Check Status Code trang $site:" $MAIL
}

main(){
	f_get_status_code
	f_send_mail
}

main

exit
```

## Kết quả

![Imgur](https://i.imgur.com/p6pUDq5.png)

![Imgur](https://i.imgur.com/LpbhYsK.png)

## Sử dụng crontab để check 1 site cụ thể sau 1 khoảng thời gian

### Cài đặt và sử dụng

Cài đặt

    yum install -y cronie

Start crontab và tự động chạy mỗi khi reboot:

    systemctl start crond.service

    systemctl enable crond.service

Tạo file crontab

    crontab -e

Thêm vào dòng sau

    */5 * * * * sh send_mail.sh

Cứ 5 phút sẽ chạy script gửi mail 1 lần để kiểm tra status code website

Xem thêm về crontab: https://123host.vn/tailieu/kb/vps/linux-crontab-cac-vi-du-ve-cach-su-dung-crontab.html

Tạo script

    vi send_mail.sh

```
#!/bin/bash

# SCRIPT GỬI MAIL STATUS CODE WEB


URL="https://news.cloud365.vn/"
STATUS_CODE=""
MAIL="dungz1207@gmail.com"


f_get_status_code(){
	STATUS_CODE=$(curl -s -o /dev/null -I -w "%{http_code}" $URL)
}

f_send_mail(){
	echo "Status Code $URL : $STATUS_CODE" | mail -s "Mail Check Status Code trang News365" $MAIL
}

main(){
	f_get_status_code
	f_send_mail
}

main

exit
```
Thêm quyền thực thi cho script

    chmod u+x send_mail.sh

Khởi động lại crontab

    systemctl restart crond.service

### Kết quả

![Imgur](https://i.imgur.com/8po0mAv.png)