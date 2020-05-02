# Basic Security


Theo mặc định, Linux phân chia các loại tài khoản ra cho các tác vụ và chương trình:
1. Root
2. System
3. Normal
4. Network

Để có 1 môi trường làm việc an toàn, ta chỉ nên cấp các đặc quyền tối thiểu có thể và cần thiết cho từng tài khoản và gỡ bỏ các tài khoản không hoạt động. 

Lệnh `last` sẽ cho ta biết lần cuối mỗi người dùng đăng nhập vào hệ thống. Từ đó, ta có thể xác định các tài khoản không hoạt động để có thể gỡ bỏ nếu tài khoản đó không cần thiết.

```
[client@localhost ~]$ last
client   pts/0        192.168.37.10    Mon Dec 16 08:37   still logged in
root     pts/0        192.168.37.10    Mon Dec 16 08:37 - 08:37  (00:00)
reboot   system boot  3.10.0-1062.el7. Mon Dec 16 08:37 - 08:38  (00:00)
root     pts/0        192.168.37.10    Fri Dec 13 11:49 - 11:50  (00:00)
reboot   system boot  3.10.0-1062.el7. Fri Dec 13 11:47 - 08:38 (2+20:50)
root     tty1                          Fri Dec 13 11:40 - 11:47  (00:06)
reboot   system boot  3.10.0-1062.el7. Fri Dec 13 11:39 - 11:47  (00:07)

wtmp begins Fri Dec 13 11:39:29 2019
```

Tài khoản **root** là tài khoản đặc quyền nhất trên hệ thống Linux/UNIX. Tài khoản này có thể thực hiện tất cả các khía cạnh của quản trị hệ thống, bao gồm: thêm tài khoản, thay đổi mật khẩu người dùng, kiểm tra các file log, cài đặt thêm phần mềm,...

Các tài khoản thông thường có thể thực hiện được một số thao tác mà cần yêu cầu quyền đặc biệt. Tuy nhiên, cấu hình hệ thống phải cho phép các khả năng đó được thực hiện. Chạy một `network client` hay truyền file qua mạng là những quyền không cần yêu cầu tài khoản `root`.

Trong Linux, bạn có thể sử dụng lệnh `su` hoặc `sudo` để có thể cấp quyền `root` cho các tài khoản bình thường. 2 lệnh này có những sự khác nhau:

**Lệnh `su`:**
- Để nâng cấp đặc quyền, bạn cần phải nhập mật khẩu của tài khoản `root`. Việc cung cấp mật khẩu `root` cho người dùng sẽ không bao giờ được thực hiện.
- Khi người dùng đã nâng lên tài khoản `root`, người dùng bình thường có thể làm bất cứ điều gì mà tài khoản `root` có thể làm được mà không cần hỏi lại mật khẩu.
- Tuy nhiên, có 1 số tính năng bị hạn chế về việc đăng nhập.

**Lệnh `sudo`:**
- Bạn sẽ nhập mật khẩu của tài khoản đang sử dụng chứ không phải tài khoản `root`.
- Những gì người dùng làm có thể được kiểm soát chính xác và hạn chế, mặc định người dùng sẽ luôn phải giữ mật khẩu để thực hiện các thao tác tiếp theo với `sudo`, hoặc có thể tránh làm như vậy trong một khoảng thời gian được cấu hình trước đó.
- Tính năng đăng nhập chi tiết có sẵn.

## Lệnh `sudo`
- Việc cấp quyền `sudo` cho người dùng ít nguy hiểm hơn là `su` và nó nên được ưu tiên.
- Theo mặc định, `sudo` phải được kích hoạt cho mỗi người dùng. Tuy nhiên, với một số phiên bản Linux như Unbuntu, thì việc kích hoạt nó theo mặc định cho ít nhất một người dùng chính.
- Để thực hiện 1 lệnh với quyền `root`, ta sử dụng `sudo <command>`. Khi lệnh thực hiện xong, bạn sẽ trở về với quyền người dùng thường.
- File cấu hình `sudo` được lưu trong `/etc/sudoers` và `/etc/sudoers.d`. Mặc định thì các thư mục này sẽ trống.
- Lệnh `sudo` có khả năng theo dõi được các hành động mượn quyền root không thành công. Một thông điệp về việc đăng nhập thất bại sẽ lưu trên `/var/log/secure`.

Lệnh `tail` dùng để xem những dòng đầu của tệp tin (theo mặc định là 10 dòng)

```
[root@localhost ~]# tail /var/log/secure
Dec 16 08:32:58 localhost sshd[1485]: Failed password for danghai from 192.168.37.10 port 64390 ssh2
Dec 16 08:33:08 localhost unix_chkpwd[1489]: password check failed for user (danghai)
Dec 16 08:33:10 localhost sshd[1485]: Failed password for danghai from 192.168.37.10 port 64390 ssh2
Dec 16 08:33:15 localhost sshd[1485]: error: Received disconnect from 192.168.37.10 port 64390:13: Unable to authenticate [preauth]
Dec 16 08:33:15 localhost sshd[1485]: Disconnected from 192.168.37.10 port 64390 [preauth]
Dec 16 08:33:15 localhost sshd[1485]: PAM 2 more authentication failures; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.37.10  user=danghai
Dec 16 08:33:21 localhost sshd[1490]: Accepted password for root from 192.168.37.10 port 64392 ssh2
Dec 16 08:33:21 localhost sshd[1494]: Accepted password for root from 192.168.37.10 port 64393 ssh2
Dec 16 08:33:21 localhost sshd[1490]: pam_unix(sshd:session): session opened for user root by (uid=0)
Dec 16 08:33:21 localhost sshd[1494]: pam_unix(sshd:session): session opened for user root by (uid=0)
```

- Khi lệnh `sudo` được thực hiện, sẽ có một tiến trình trỏ tới `/etc/sudoers` và các file trong `/etc/sudoers.d` để xác định rằng người dùng đó có được cấp quyền sử dụng `sudo` hay không và xem những quyền nào sẽ được cấp. Người dùng lạ sẽ không được thực thi các lệnh khi chưa được cho phép trong file cấu hình và sẽ bị ghi lại thông tin đăng nhập.
- Có thể sửa file `sudoers` bằng lệnh `visudo` để cấp quyền cho các `users`, file này chỉ cho phép 1 người được sửa trong 1 thời điểm.


Cấu trúc cơ bản của 1 mục:

`who where =(as_whom) what`

- Để tạo 1 tài khoản người dùng mới và cấp quyền `sudo` cho nó, bạn phải đăng nhập bằng tài khoản `root` và sửa file `/etc/sudoers` bằng lệnh `visudo`. Tìm đến dòng `Allows people in group wheel to run all commands`

```
## Allows people in group wheel to run all commands
# %wheel  ALL=(ALL)       ALL
```

Bỏ dấu `#` ở dòng dưới và lưu lại, lệnh này sẽ cho phép người dùng trong group `wheel` được thực hiện các quyền quản trị như `root user`.
```
[root@localhost ~]# useradd TestSudo
[root@localhost ~]# usermod -aG wheel TestSudo
[root@localhost ~]# su TestSudo
[TestSudo@localhost root]$ groups
TestSudo wheel
[TestSudo@localhost root]$ whoami
TestSudo
[TestSudo@localhost root]$
```

- Một số phiên bản Linux lại phải thay đổi trong file `/etc/sudoers.d`. File này bao gồm các cấu hình cho `sudo` và nếu thay đổi thì sẽ ảnh hưởng đến tất cả các người dùng trong hệ thống.

## Tiến trình độc lập(The process isolation)

Linux được cho là nền tảng bảo mật hơn các hệ điều hành khác bởi các tiến trình luôn chạy độc lập với nhau. Một tiến trình không thể truy cập vào tài nguyên của tiến trình khác kể cả khi nó đang chạy với cùng phiên của 1 người dùng. Các cơ chế bảo mật bổ sung đã được giới thiệu để giảm thiểu rủi ro gây ra:
1. **Control Groups**: cho phép người quản trị phân nhóm các tiến trình và cấp tài nguyên hữu hạn cho mỗi nhóm.
2. **Linux Containers**: cho phép chạy nhiều phiên bản Linux trên cùng một hệ thống
3. **Virtualization**: phần cứng được tính toán sao cho không chỉ tách biệt các tiến trình, đồng thời cũng cũng phải tách biệt với phần cứng mà các máy ảo sử dụng trên cùng một host vật lý.

## Mã hóa mật khẩu (Password Encryption)
Bảo vệ mật khẩu là một việc rất quan trọng. Hầu hết các phiên bản của Linux đều sử dụng cơ chế mã hóa mật khẩu bằng thuật toán `SHA-512` (Secure Hashing Algorithm 512bits) phát triển bởi NSA ( U.S. National Security Agency ).

`SHA-512` được sử dụng rộng rãi để bảo vệ các ứng dụng và giao thức như TLS, SSL, PHP, S/MINE và IPSec.

## Vòng đời password (Password Aging)
Password Aging là 1 phương pháp để nhắc nhở người dùng tạo mật khẩu mới sau 1 thời gian dài sử dụng, nhằm nâng cao tính bảo mật. Điều này có thể củng cố cho việc bảo mật, nếu hệ thống bị xâm nhập thì cũng chỉ có thể sử dụng trong một thời gian nhất định.

Sử dụng lệnh `chage` - cấu hình thông tin mật khẩu cho người dùng:
```
[root@localhost ~]# chage -l root
Last password change                                    : never
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

## Xác thực với Public/Private Keys:
Sử dụng `Encrypt keys` để xác thực sẽ có 2 lợi ích chính như sau:
- Không phải nhập mật khẩu nếu bạn sử dụng Public/Private Keys.
- Một khi đã xác thực sử dụng Public/Private Keys được thiết lập trên máy chủ, bạn có thể vô hiệu hóa xác thực mật khẩu hoàn toàn, có nghĩa là không có khóa ủy quyền bạn sẽ không có quyền truy cập.
