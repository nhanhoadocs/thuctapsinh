#!/bin/bash

#Script watchdog, check xem service có hoạt động không. Nếu có thì thôi. Nếu không thì restart service và gửi mail và thông báo telegram.

#Thêm các service cần theo dõi vào SERVICES


SERVICES="ssh apache2 mysql"
DATE=$(date '+%d-%m-%Y %H:%M:%S')
TOKEN="<token_bot>"
ID="<chat_id_bot>"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

for SERVICE in ${SERVICES}
 do
   /etc/init.d/$SERVICE status 2>&1>/dev/null
    if [ $? -ne 0 ];
      then
        /etc/init.d/$SERVICE restart
        echo -e "Khởi động dịch vụ $SERVICE"
        (echo -e "Subject:Khởi động lại dịch vụ  $SERVICE\n\$DATE Dịch vụ $SERVICE không hoạt động trên host $HOSTNAME! Khởi động lại.";) | /usr/sbin/ssmtp -v  dungz1207@gmail.com
        /usr/bin/curl -s -X POST $URL -d chat_id=$ID -d text="$DATE Dịch vụ $SERVICE không hoạt động trên host $HOSTNAME! Khởi động lại."
      else
        echo -e "$SERVICE OK"
    fi
done