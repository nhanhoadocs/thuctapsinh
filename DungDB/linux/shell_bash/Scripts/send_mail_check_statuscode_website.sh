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

# Để check 1 site cụ thể mà không cần nhập. Bỏ biến site
# Sử dụng crontab để check theo thời gian