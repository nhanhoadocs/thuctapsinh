#! /bin/bash

#

TOKEN="<token_bot>"
ID="<chat_id_bot>"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if md5sum -c /opt/passwd.md5; then
    echo "OK"
else
   (echo "Subject:File bi thay doi"; echo "File /etc/passwd da bi thay doi tren host $HOSTNAME";) | sendmail dungz1207@gmail.com
   curl -s -X POST $URL -d chat_id=$ID -d text="Có người sửa file /etc/passwd trên host $HOSTNAME"
   md5sum /etc/passwd > /opt/passwd.md5
fi