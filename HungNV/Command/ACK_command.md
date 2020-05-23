# ACK command 

ack được thay đế cho 99% việc sử dụng grep 

### Liệt kê các file và kết quả ứng với từ cần tìm. 

Ví dụ: Tìm từ Accepted 

```
ack Accepted
```
ta sẽ có kết quả tương tự như sau: 

```
[root@sidecar01 log]# ack Accepted
secure-20200319
5:Mar  8 14:26:56 sidecar01 sshd[23479]: Accepted password for root from 10.10.34.1 port 45553 ssh2
6:Mar  8 14:26:56 sidecar01 sshd[23485]: Accepted password for root from 10.10.34.1 port 50100 ssh2
14:Mar  8 14:45:29 sidecar01 sshd[24411]: Accepted publickey for root from 10.10.34.1 port 4417 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY
15:Mar  8 14:45:29 sidecar01 sshd[24421]: Accepted publickey for root from 10.10.34.1 port 19063 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY
22:Mar  8 15:25:32 sidecar01 sshd[26403]: Accepted publickey for root from 10.10.34.1 port 26397 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY
23:Mar  8 15:25:32 sidecar01 sshd[26414]: Accepted publickey for root from 10.10.34.1 port 18634 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY


secure-20200403
3:Mar 19 14:26:08 sidecar01 sshd[3560]: Accepted publickey for root from 10.10.34.1 port 2356 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY
5:Mar 19 14:26:08 sidecar01 sshd[3568]: Accepted publickey for root from 10.10.34.1 port 41666 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY
7:Mar 19 14:26:19 sidecar01 sshd[3595]: Accepted publickey for root from 10.10.34.1 port 52118 ssh2: RSA SHA256:ivfT7g7XGYOtt+9qzrkx3yDuUTmPGodqVcebfD33swY


secure-20200412
6:Apr  5 08:39:56 sidecar01 sshd[6288]: Accepted password for thuctap from 10.10.34.1 port 61865 ssh2
8:Apr  5 08:39:56 sidecar01 sshd[6298]: Accepted password for thuctap from 10.10.34.1 port 45005 ssh2
12:Apr  5 15:20:01 sidecar01 sshd[25739]: Accepted password for thuctap from 10.10.34.1 port 60295 ssh2
14:Apr  5 15:20:22 sidecar01 sshd[25750]: Accepted password for thuctap from 10.10.34.1 port 36780 ssh2
18:Apr  6 08:37:30 sidecar01 sshd[11372]: Accepted password for thuctap from 10.10.34.1 port 39374 ssh2
20:Apr  6 08:37:35 sidecar01 sshd[11382]: Accepted password for thuctap from 10.10.34.1 port 60503 ssh2


secure
1:Apr 14 16:17:39 sidecar01 sshd[14569]: Accepted password for thuctap from 10.10.34.1 port 56068 ssh2
3:Apr 14 16:17:39 sidecar01 sshd[14576]: Accepted password for thuctap from 10.10.34.1 port 25088 ssh2
7:Apr 14 18:08:51 sidecar01 sshd[20001]: Accepted password for thuctap from 10.10.34.1 port 8285 ssh2
9:Apr 14 18:08:51 sidecar01 sshd[20006]: Accepted password for thuctap from 10.10.34.1 port 14535 ssh2
13:Apr 14 18:08:59 sidecar01 sshd[20045]: Accepted password for thuctap from 10.10.34.1 port 57566 ssh2
15:Apr 14 18:08:59 sidecar01 sshd[20049]: Accepted password for thuctap from 10.10.34.1 port 8312 ssh2
17:Apr 14 18:09:11 sidecar01 sshd[20088]: Accepted password for thuctap from 10.10.34.1 port 1802 ssh2

```

Ví dụ: Tìm từ Accepted trong các file và số lần xuất hiện trong các file đó

```
ack -cl Accepted
```
```
secure-20200319:14
secure-20200403:8
secure-20200405:11
secure-20200412:14
secure:29
```

### Tìm kiếm thư mục 

Ví dụ : 

Ta muốn xem trong thư mục con httpd tại thư mục đang đứng chứa những file có trên là gì 
Sử dụng tùy chọn -f 

```
ack -f httpd
```
```
httpd/access_log-20200405
httpd/error_log-20200405
httpd/access_log-20200412
httpd/access_log
httpd/error_log-20200412
httpd/error_log
```
