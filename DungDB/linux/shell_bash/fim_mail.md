# Vài script liên quan

Script gửi mail test

`sendmail.sh    `
```sh
#! /bin/bash

echo "mail test script" | /usr/sbin/ssmtp -v dungz1207@gmail.com
```

Script thông báo khi có người sửa file qua email. File Integrity Monitor (FIM) 

`filechange.sh`
```sh
#! /bin/bash

if md5sum -c /opt/passwd.md5; then
    echo "OK"
else
   (echo "Subject:File bi thay doi"; echo "File /etc/passwd da bi thay doi tren host .34.176";) | sendmail dungz1207@gmail.com
   md5sum /etc/passwd > /opt/passwd.md5
fi
```

Script thông báo khi có người sửa file qua telegram

`filechangetelegram.sh`
```sh
#! /bin/bash

TOKEN="1203313564:AAHa7Sb5Yd0Ty5aOuS6criY-cHLW9BY0ym0"
ID="1002837489"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if md5sum -c /opt/passwd.md5; then
    echo "OK"
else
   curl -s -X POST $URL -d chat_id=$ID -d text="Có thằng sửa file /etc/passwd trên host $HOSTNAME kìa Dũng"
   md5sum /etc/passwd > /opt/passwd.md5
fi
```

Đặt crontab cứ 30 phút chạy script 1 lần

    crontab -e

    0,30 * * * * /opt/filechange.sh
    0,30 * * * * /opt/sendmail.sh
    0,30 * * * * /opt/filechangetelegram.sh

**Lưu ý:**

Với việc sử dụng ssmtp trong bash script với crontab, ta nên sử dụng đường dẫn dịch vụ ssmtp.

Thông thường, đường dẫn mặc định sẽ là `/usr/sbin/ssmtp`. Hoặc bạn có thể tìm bằng cách locate ssmtp và chọn đường dẫn thực thi đúng của dịch vụ ssmtp.

Đơn giản, sửa `sendmail -v dungz1207@gmail.com` thành /`usr/sbin/ssmtp -v dungz1207@gmail.com` thì có thể dùng ssmtp với crontab.