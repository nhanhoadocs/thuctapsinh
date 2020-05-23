https://securitytrails.com/blog/open-ports

# Open Ports 

Các port phổ biến

- FTP - 20, 21 are the ports used during a classic FTP connection between client and server.

- SSH - 22 is the OpenSSH server port used by default on most Unix/Linux installations.

- Telnet - 23 is dedicated to the Telnet application server that receives connections from any Telnet client.

- SMTP - 25 is dedicated to relaying messages between MTAs (mail transfer agents). SMTP (Simple Mail Transfer Protocol) là giao thức chuẩn TCP/IP được dùng để truyền tải thư điện tử (e-mail) trên mạng internet. SMTPS (có SSL) có port 465/587. 
SMTP thiết lập kênh kết nối giữa mail client và mail server, và thiết lập kênh liên lạc giữa mail server gửi và mail server nhận. Email sẽ được đẩy từ mail client lên mail server và từ mail server nó sẽ được server này gửi đi đến mail server nhận. Nhìn hình dưới bạn sẽ thấy cách hoạt động của việc gửi mail:

![Imgur](https://i.imgur.com/ui4YZQA.png)



- DNS - 53 is where the DNS server runs, and one of the most famous daemons that uses this port is Bind.

- DHCP - 67, 68: port 67 is used for the DHCP server, and the UDP port 68 for the DHCP client.

- HTTP - 80 is the port assigned to web servers and directly associated with the Hypertext Transfer Protocol.

- POP3 - 110 is the Post Office Protocol, one of the most traditional protocols used by email clients to retrieve data from remote email servers. POP3 (Post Office Protocol version 3) được sử dụng để kết nối tới server email và tải email xuống máy tính cá nhân thông qua một ứng dụng email như Outlook, Thunderbird, Windows Mail, Mac Mail, v.v. POP3S (có SSL) có port 995 .

- IMAP - 143 is the default IMAP port for non-encrypted connections. IMAP (Internet Message Access Protocol), POP3 cũng đều được dùng để kéo emails về emails client, tuy nhiên khác biệt với POP3 là nó chỉ kéo email headers về, nội dung email vẫn còn trên server. Đây là kênh liên lạc 2 chiều, thay đổi trên mail client sẽ được chuyển lên server. Sau này, giao thức này trở nên phổ biến nhờ nhà cung cấp mail lớn nhất thế giới, Gmail, khuyên dùng thay vì POP3. IMAPS (có SSL) có port 993.

- HTTPS - 443 is the port used to serve all SSL-based requests on any website.

Các port mặc định được mở phụ thuộc vào hệ điều hành, phiên bản.

- Ubuntu mặc định mở port 22 SSH 

- Centos mặc định mở port 22 SSH, 25 SMTP, 111 rpcbind

Để biết port nào đang mở:

    nmap -p 1-65535 localhost

Đối với host không phải local

    nmap -p 1-1024 X.X.X.X

1-65535 là range. Range càng rộng thì càng tốn thời gian.

Để scan các port phổ biến

    nmap --top-ports 20 X.X.X.X

Với 20 là số lượng port phổ biến bạn muốn scan. 

Ví dụ output

```
[research@securitytrails.com ~]# nmap --top-ports 20 localhost
Starting Nmap 7.70 ( https://nmap.org ) at 2019-12-03 16:24 -03
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000031s latency).
Other addresses for localhost (not scanned): ::1
PORT STATE SERVICE
21/tcp closed ftp
22/tcp closed ssh
23/tcp closed telnet
25/tcp closed smtp
53/tcp closed domain
80/tcp closed http
110/tcp closed pop3
111/tcp closed rpcbind
135/tcp closed msrpc
139/tcp closed netbios-ssn
143/tcp closed imap
443/tcp closed https
445/tcp closed microsoft-ds
993/tcp closed imaps
995/tcp closed pop3s
1723/tcp closed pptp
3306/tcp closed mysql
3389/tcp closed ms-wbt-server
5900/tcp closed vnc
8080/tcp closed http-proxy
Nmap done: 1 IP address (1 host up) scanned in 0.50 seconds
[research@securitytrails.com ~]#
```

