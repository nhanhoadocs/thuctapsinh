#!/bin/bash
MAIL="youremail@gmail.com"

if md5sum -c /root/passwd.md5 && md5sum -c /root/shadow.md5; then
    echo "OK"
else
    (echo "Subject:File changed"; echo "File /etc/passwd or /etc/shadow changed on $HOSTNAME!";) | /usr/sbin/sendmail $MAIL
    md5sum /etc/passwd > /root/passwd.md5
    md5sum /etc/shadow > /root/shadow.md5
fi