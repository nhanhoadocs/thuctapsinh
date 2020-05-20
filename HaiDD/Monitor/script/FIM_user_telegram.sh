#!/bin/bash
DATE=$(date)
TOKEN="bot_TOKEN"
ID="ID-Telegram"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
IP=$(hostname -I)
MESS=$(echo -e "$DATE \nIP $IP \nFile /etc/passwd changed on $HOSTNAME!")

if md5sum -c /root/passwd.md5 && md5sum -c /root/shadow.md5; then
    echo "OK"
else
    curl -s -X POST $URL -d chat_id=$ID -d text="$MESS"
    md5sum /etc/passwd > /root/passwd.md5
    md5sum /etc/shadow > /root/shadow.md5
fi