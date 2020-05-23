# Postfix

https://ixnfo.com/en/installing-and-configuring-postfix.html

Cài đặt trên Ubuntu

    apt-get update
    apt-get install postfix

- Chọn “Internet site”
- Gõ domain vào

Khởi động service 

    service postfix restart
    service postfix status
    service postfix enable

Nếu cần thiêt, có thể cấu hình lại với lệnh

    dpkg-reconfigure postfix

Xem port có được dùng không

    netstat -na | grep LISTEN | grep 25
    netstat -na | grep LISTEN | grep 587

Kiểm tra cấu hình, phần quyền 

    postfix check

Gửi mail test (kết thuc mail bằng dấu chấm)
```
root@ubuntu176:~# sendmail -v dungz1207@gmail.com
test.
```
Trước khi gửi mail, chạy tcpdump trên port 25

Kết quả:
```
root@ubuntu176:/etc/postfix# tcpdump port 25
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
08:25:44.796826 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [S], seq 2114568683, win 64240, options [mss 1460,sackOK,TS val 3844596928 ecr 0,nop,wscale 7], length 0
08:25:44.831861 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [S.], seq 1464683406, ack 2114568684, win 62392, options [mss 1430,sackOK,TS val 2981231234 ecr 3844596928,nop,wscale 8], length 0
08:25:44.831930 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [.], ack 1, win 502, options [nop,nop,TS val 3844596963 ecr 2981231234], length 0
08:25:44.986428 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 1:52, ack 1, win 244, options [nop,nop,TS val 2981231389 ecr 3844596963], length 51: SMTP: 220 mx.google.com ESMTP 76si8738266pfv.27 - gsmtp
08:25:44.986474 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [.], ack 52, win 502, options [nop,nop,TS val 3844597118 ecr 2981231389], length 0
08:25:44.986587 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [P.], seq 1:17, ack 52, win 502, options [nop,nop,TS val 3844597118 ecr 2981231389], length 16: SMTP: EHLO ubuntu176
08:25:45.021614 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [.], ack 17, win 244, options [nop,nop,TS val 2981231424 ecr 3844597118], length 0
08:25:45.143054 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 52:223, ack 17, win 244, options [nop,nop,TS val 2981231545 ecr 3844597118], length 171: SMTP: 250-mx.google.com at your service, [103.101.160.130]
08:25:45.143270 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [P.], seq 17:91, ack 223, win 501, options [nop,nop,TS val 3844597275 ecr 2981231545], length 74: SMTP: MAIL FROM:<root@ubuntu176> SIZE=237
08:25:45.178246 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [.], ack 91, win 244, options [nop,nop,TS val 2981231580 ecr 3844597275], length 0
08:25:45.297629 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 223:263, ack 91, win 244, options [nop,nop,TS val 2981231700 ecr 3844597275], length 40: SMTP: 250 2.1.0 OK 76si8738266pfv.27 - gsmtp
08:25:45.341263 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [.], ack 263, win 501, options [nop,nop,TS val 3844597473 ecr 2981231700], length 0
08:25:45.377858 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 263:303, ack 91, win 244, options [nop,nop,TS val 2981231780 ecr 3844597473], length 40: SMTP: 250 2.1.5 OK 76si8738266pfv.27 - gsmtp
08:25:45.377894 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [.], ack 303, win 501, options [nop,nop,TS val 3844597509 ecr 2981231780], length 0
08:25:45.378033 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 303:344, ack 91, win 244, options [nop,nop,TS val 2981231780 ecr 3844597473], length 41: SMTP: 354  Go ahead 76si8738266pfv.27 - gsmtp
08:25:45.378043 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [.], ack 344, win 501, options [nop,nop,TS val 3844597509 ecr 2981231780], length 0
08:25:45.378154 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [P.], seq 91:337, ack 344, win 501, options [nop,nop,TS val 3844597509 ecr 2981231780], length 246: SMTP: Received: by ubuntu176 (Postfix, from userid 0)
08:25:45.413059 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [.], ack 337, win 248, options [nop,nop,TS val 2981231815 ecr 3844597509], length 0
08:25:45.670111 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 344:396, ack 337, win 248, options [nop,nop,TS val 2981232072 ecr 3844597509], length 52: SMTP: 250 2.0.0 OK  1589851545 76si8738266pfv.27 - gsmtp
08:25:45.670785 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [P.], seq 396:452, ack 337, win 248, options [nop,nop,TS val 2981232073 ecr 3844597509], length 56: SMTP: 221 2.0.0 closing connection 76si8738266pfv.27 - gsmtp
08:25:45.671003 IP tl-in-f26.1e100.net.smtp > ubuntu176.54788: Flags [F.], seq 452, ack 337, win 248, options [nop,nop,TS val 2981232073 ecr 3844597509], length 0
08:25:45.683207 IP ubuntu176.54788 > tl-in-f26.1e100.net.smtp: Flags [R.], seq 337, ack 453, win 501, options [nop,nop,TS val 3844597815 ecr 2981232072], length 0

```
Mail đã được gửi

![Imgur](https://i.imgur.com/XxsbShF.png)

Check log
```
root@ubuntu176:~# grep dungz1207@gmail.com /var/log/mail.log
May 19 08:25:45 ubuntu176 postfix/smtp[2697]: 714FE804E7: to=<dungz1207@gmail.com>, relay=gmail-smtp-in.l.google.com[64.233.189.26]:25, delay=5.6, delays=4.4/0.01/0.65/0.53, dsn=2.0.0, status=sent (250 2.0.0 OK  1589851545 76si8738266pfv.27 - gsmtp)
root@ubuntu176:~#

```

Xem thông số hiện tại và thông số mặc định

    postconf
    postconf -d

Xem thông số cụ thể với `grep`, ví dụ:
```
root@ubuntu176:~# postconf | grep message_size_limit
message_size_limit = 10240000
root@ubuntu176:~#
```
Sửa thông số với option `-e`, ví dụ:
```
root@ubuntu176:~# postconf -e 'message_size_limit = 20480000'
root@ubuntu176:~# postconf | grep message_size_limit
message_size_limit = 20480000
root@ubuntu176:~#
```

Chỉ định interface mà Postfix hoạt động trên đó

sửa file `/etc/postfix/main.cf`, sửa dòng

    #inet_interfaces = all
    inet_interfaces = 127.0.0.1

Khởi động lại dịch vụ để lưu thay đổi

    sudo /etc/init.d/postfix restart