# Simple watchdog

Script watchdog, check xem service có hoạt động không. Nếu có thì thôi. Nếu không thì restart service và gửi mail và thông báo telegram.

Thêm các service cần theo dõi vào SERVICES

`watchdog.sh`

```sh
#!/bin/bash

SERVICES="ssh apache2 mysql"
DATE=$(date '+%d-%m-%Y %H:%M:%S')
TOKEN="1203313564:AAHa7Sb5Yd0Ty5aOuS6criY-cHLW9BY0ym0"
ID="1002837489"
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
```

Dừng dịch vụ mysql và chạy thử script trên

Kết quả:

![Imgur](https://i.imgur.com/aFyFqOF.png)

![Imgur](https://i.imgur.com/vpHYzvv.png)

Đặt crontab cứ 30 phút chạy script 1 lần

    crontab -e

    0,30 * * * * /opt/watchdog.sh > /dev/null 2>&1