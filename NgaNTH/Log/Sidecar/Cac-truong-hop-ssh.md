# Các trường hợp SSH  

## 1. Đăng nhập đúng tài khoản root và đúng password  

```
Dec 10 11:42:58 centos7client01 sshd[23253]: Accepted password for root from 192.168.152.1 port 54440 ssh2
Dec 10 11:42:58 centos7client01 sshd[23253]: pam_unix(sshd:session): session opened for user root by (uid=0)
Dec 10 11:42:59 centos7client01 sshd[23260]: Accepted password for root from 192.168.152.1 port 54442 ssh2
Dec 10 11:42:59 centos7client01 sshd[23260]: pam_unix(sshd:session): session opened for user root by (uid=0)
```
## 2. Đăng nhập đúng tên tài khoản root và sai password  

```
Dec 10 12:05:31 centos7client01 unix_chkpwd[24507]: password check failed for user (root)
Dec 10 12:05:31 centos7client01 sshd[24469]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.152.1  user=root
Dec 10 12:05:31 centos7client01 sshd[24469]: pam_succeed_if(sshd:auth): requirement "uid >= 1000" not met by user "root"
Dec 10 12:05:33 centos7client01 sshd[24469]: Failed password for root from 192.168.152.1 port 54599 ssh2
```
## 3. Đăng nhập đúng tên tài khoản user và đúng password  

```
Dec 10 11:47:02 centos7client01 sshd[23481]: Accepted password for ngahd from 192.168.152.1 port 54455 ssh2
Dec 10 11:47:02 centos7client01 sshd[23481]: pam_unix(sshd:session): session opened for user ngahd by (uid=0)
Dec 10 11:47:03 centos7client01 sshd[23488]: Accepted password for ngahd from 192.168.152.1 port 54457 ssh2
Dec 10 11:47:04 centos7client01 sshd[23488]: pam_unix(sshd:session): session opened for user ngahd by (uid=0)
```  
## 4.Đăng nhập đúng tên tài khoản user và sai password  

```
Dec 10 11:44:34 centos7client01 unix_chkpwd[23363]: password check failed for user (ngahd)
Dec 10 11:44:34 centos7client01 sshd[23356]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.152.1  user=ngahd
Dec 10 11:44:36 centos7client01 sshd[23356]: Failed password for ngahd from 192.168.152.1 port 54448 ssh2
```
## 5. Đăng nhập sai tên tài khoản user  
```
Dec 10 12:08:26 centos7client01 sshd[24646]: Invalid user ngakma from 192.168.152.1 port 54611
Dec 10 12:08:26 centos7client01 sshd[24646]: input_userauth_request: invalid user ngakma [preauth]
```
Sau khi nhập password bất kỳ  
```
Dec 10 12:08:59 centos7client01 sshd[24646]: pam_unix(sshd:auth): check pass; user unknown
Dec 10 12:08:59 centos7client01 sshd[24646]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.152.1
Dec 10 12:09:00 centos7client01 sshd[24646]: Failed password for invalid user ngakma from 192.168.152.1 port 54611 ssh2
```  

## 6.Đóng cửa sổ  
```
Dec 10 12:00:26 centos7client01 sshd[23490]: Received disconnect from 192.168.152.1 port 54455:11: disconnected by user
Dec 10 12:00:26 centos7client01 sshd[23490]: Disconnected from 192.168.152.1 port 54455
Dec 10 12:00:26 centos7client01 sshd[23481]: pam_unix(sshd:session): session closed for user ngahd
Dec 10 12:00:27 centos7client01 sshd[23488]: pam_unix(sshd:session): session closed for user ngahd
```  
