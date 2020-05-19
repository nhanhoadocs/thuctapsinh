#!/bin/bash
MAIL="youremail@gmail.com"

if md5sum -c /root/passwd.md5; then
    echo "OK"
else
    (echo "Subject:File changed"; echo "File /etc/passwd changed on $HOSTNAME!";) | /usr/sbin/sendmail $MAIL
    md5sum /etc/passwd > /root/passwd.md5
fi