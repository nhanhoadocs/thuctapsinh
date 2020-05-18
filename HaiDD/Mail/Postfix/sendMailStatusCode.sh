#!/bin/bash

# SCRIPT GỬI MAIL STATUS CODE WEB


URL="https://news.cloud365.vn/"
STATUS_CODE=""
MAIL="dangdohai1996@gmail.com"


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