# Basic Security


Theo mặc định. Linux có nhiều loại tài khoản để phân chia cho các tác vụ và chương trình:

- Root
- System
- Normal
- Network

Đối với một môi trường làm việc an toàn, nên giới hạn các quyền hạn ở mức tối thiểu cho các tài khoản,
và loại bỏ các tài khoản không hoạt động tích cực.
Lệnh `last` để show lần cuối mỗi người dùng đăng nhập vào hệ thống, có thể xác định các tài khoản ít 
đăng nhập để loại bỏ .

```
[root@CentOS ~]# last
root     pts/1        192.168.235.1    Wed Nov 20 21:30   still logged in
root     tty1                          Wed Nov 20 21:30 - 21:30  (00:00)
root     pts/0        192.168.235.1    Wed Nov 20 21:17   still logged in
root     tty1                          Wed Nov 20 21:17 - 21:17  (00:00)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 09:16 - 22:47  (13:30)
root     pts/0        192.168.225.1    Wed Nov 20 20:55 - crash  (-11:-39)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 20:55 - 22:47  (01:51)
root     pts/0        192.168.225.1    Wed Nov 20 20:41 - crash  (00:13)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 20:39 - 22:47  (02:07)
root     pts/0        192.168.225.1    Wed Nov 20 20:03 - 20:28  (00:25)
root     tty1                          Wed Nov 20 20:02 - 20:02  (00:00)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 20:02 - 22:47  (02:45)
root     pts/0        192.168.225.1    Wed Nov 20 09:49 - crash  (10:12)
root     tty1                          Wed Nov 20 09:48 - 09:50  (00:01)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 21:48 - 22:47  (00:59)
root     pts/0        192.168.235.1    Wed Nov 20 08:20 - down   (00:08)
root     tty1                          Wed Nov 20 08:20 - 08:20  (00:00)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 08:19 - 08:29  (00:09)
root     pts/0        192.168.235.1    Wed Nov 20 04:08 - down   (01:26)
root     pts/0        192.168.235.1    Wed Nov 20 03:57 - 04:08  (00:10)
root     tty1                          Wed Nov 20 03:56 - 03:57  (00:00)
reboot   system boot  3.10.0-1062.el7. Wed Nov 20 03:56 - 05:34  (01:38)
reboot   system boot  3.10.0-1062.el7. Thu Nov 14 10:48 - 05:34 (5+18:46)
```

Tài khoản ``root`` là tài khoản có quyền cao nhất trong hệ thống Linux/UNIX. Nó có quyền quản trị hệ thống, tạo tài khoản, thay đổi mật khẩu người dùng, kiểm tra file log, cài đặt phần mềm ...

Một tài khoản người dùng thường có thể thực hiện những hoạt động yêu cầu sự cấp quyền; tuy nhiên nên cấu hình cho phép những hoạt động đó được thực thi. Chạy một network client hoặc chia sẻ file qua mạng là những hành động không yêu cầu tài khoản root để được thực thi.

Trong Linux, ta có thể sử dụng `su` hoặc `sudo` để tạm thời lấy quyền quản trị cho người dùng bình thường; 2 lệnh này có một số điểm khác biệt:

Lệnh `su`:
	- Dùng để nâng quyền, bạn cần nhập mật khẩu `root`.

	- Một khi người dùng đã được nâng quyền thành `root`, ngườih dùng đó có thể tực hiện bất cứ lệnh nào mà root user có thể làm mà không bị hỏi lại mật khẩu root.
	
	- Có một số giới hạn tính năng về việc đăng nhập

Lệnh `sudo`:

	- Bạn cần nhập mật khẩu của chính bạn chứ không phải mật khẩu `root`.

	- Những gì người dùng được phép làm có thể được kiểm soát chính xác và hạn chế; mặc định người dùng sẽ luôn phải giữ mật khẩu để thực hiện các thao tác tiếp theo với sudo, hoặc có thể tránh làm như vậy trong một khoảng thời gian được cấu hình trước đó.
	
	- Tính năng đăng nhập chi tiết có sẵn.

### Lệnh sudo ( Sudo command )

- Cấp quyền bằng `sudo` ít nguy hiểm hơn là `su` và nó nên được ưu tiên.

- Theo mặc định, `sudo` phải được kích hoạt cho mỗi người dùng. Tuy nhiên với một số phiên bản Linux như Ubuntu, thì việc kích hoạt nó theo mặc định cho ít nhất một người dùng chính.

- Để thực hiện một lệnh với quyền `root`, sử dụng `sudo <command>`. Khi lệnh hoàn thành, bạn sẽ trở về với quyền người dùng thường.

- File cấu hình `sudo` được lưu trong `/etc/sudoers` và `/etc/sudoers.d`. Theo mặc định thì các thư mục ấy trống.

- Lệnh `sudo` có khả năng theo dõi được các hành động mượn quyền root không thành công. Một thông điệp về việc đăng nhập thất bại sẽ lưu trên `/var/log/secure`.

```
[root@CentOS ~]# tail /var/log/secure
Nov 20 21:17:48 CentOS sshd[1346]: Failed password for root from 192.168.235.1 port 49970 ssh2
Nov 20 21:17:50 CentOS sshd[1346]: Accepted password for root from 192.168.235.1 port 49970 ssh2
Nov 20 21:17:51 CentOS sshd[1346]: pam_unix(sshd:session): session opened for user root by (uid=0)
Nov 20 21:17:52 CentOS sshd[1351]: Accepted password for root from 192.168.235.1 port 49972 ssh2
Nov 20 21:17:52 CentOS sshd[1351]: pam_unix(sshd:session): session opened for user root by (uid=0)
Nov 20 21:30:04 CentOS login: pam_unix(login:session): session opened for user root by LOGIN(uid=0)
Nov 20 21:30:04 CentOS login: ROOT LOGIN ON tty1
Nov 20 21:30:15 CentOS login: pam_unix(login:session): session closed for user root
Nov 20 21:30:24 CentOS sshd[1442]: Accepted password for root from 192.168.235.1 port 50038 ssh2
Nov 20 21:30:25 CentOS sshd[1442]: pam_unix(sshd:session): session opened for user root by (uid=0)
[root@CentOS ~]#
```
- Khi lệnh `sudo` được thực hiện, sẽ có một tiến trình trỏ tới `/etc/sudoers` và các file trong `/etc/sudoers.d` để xác định rằng người dùng đó có được cấp quyền sử dụng `sudo` hay không và những quyền nào mà họ được cấp. Người dùng lạ sẽ không được thực thi các lệnh khi chưa được cho phép trong file cấu hình và sẽ bị ghi lại thông tin đăng nhập. 

- Có thể sửa file `sudoers` bằng lệnh `visudo`, để cấp quyền cho các users, file này chỉ cho phép 1 người được sửa trong 1 thời điểm.

Cấu trúc cơ bản của lệnh nhập vào : `who where =(as_whom) what`

- Để tạo một tài khoản người dùng mới và cấp quyền `sudo` cho nó, bạn đăng nhập bằng tài khoản root và sửa file `/etc/sudoers` bằng lệnh `visudo`. Tìm đến dòng có `Allows people in group wheel to run all commands`:
	
```
## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL
```
Bỏ dấu # comment đi ở dòng dưới và lưu lại, lệnh này sẽ cho phép người dùng trong group wheel được thực hiện các lệnh quản trị như root user.


```
[root@CentOS ~]# useradd TestSudo
[root@CentOS ~]# usermod -aG wheel TestSudo
[root@CentOS ~]# su TestSudo -
[TestSudo@CentOS root]$ groups
TestSudo wheel
[TestSudo@CentOS root]$ whoami
TestSudo
```

- Một số phiên bản Linux lại phải thay đổi trong file `/etc/sudoers.d` . File này bao gồm các cấu hình cho `sudo` và nếu thay đổi thì sẽ ảnh hưởng đến tất cả các người dùng trong hệ thống.

#### Tiến trình riêng biệt ( The process isolation )

Linux được cho là nền tảng bảo mật hơn các hệ điều hành khác bởi các tiến trình luôn chạy độc lập với nhau. Một tiến trình không thể truy cập vào tài nguyên của tiến trình khác kể cả khi nó đang chạy với cùng phiên của 1 người dùng.

Một cơ chế được bổ sung vào để bảo mật và hạn chế tối thiểu các mối nguy hại đã được giới thiệu gần đây:
	
	1. `Control Groups`:  cho phép người quản trị phân nhóm các tiến trình và cấp tài nguyên hữu hạn cho mỗi nhóm.
	2. `Linux Containers`: cho phép chạy nhiều phiên bản Linux trên cùng một hệ thống.
	3. `Virtualization`: phần cứng được tính toán sao cho không chỉ tách biệt các tiến trình, đồng thời cũng cũng phải tách biệt với phần cứng mà các máy ảo sử dụng trên cùng một host vật lý.
	
#### Mã hóa mật khẩu (Password encryption) 

Bảo vệ mật khẩu là một việc rất quan trọng. Hầu hết các phiên bản của Linux đều sử dụng cơ chế mã hóa mật khẩu bằng thuật toán `SHA-512` ( Secure Hashing Algorithm 512bits) phát triển bởi NSA ( U.S. National Security Agency ).

SHA-512 được sử dụng rộng rãi để bảo vệ các ứng dụng và giao thức như TLS, SSL, PHP, S/MINE và IPSec.
	
#### Vòng đời mật khẩu ( Password Aging)
Password aging ( vòng đời mật khẩu ) là một phương pháp nhắc nhở người dùng tạo mật khẩu mới sau một thời gian sử dụng, nhằm nâng cao tính bảo mật. Điều này có thể củng cố cho việc bảo mật, nếu hệ thống bị xâm nhập cũng chỉ sử dụng được trong một thời gian nhất định.

Tính năng này được thực thi bằng lệnh `chage` - cấu hình thông tin mật khẩu cho người dùng.

```
[root@CentOS ~]# chage -l root
Last password change                                    : never
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
[root@CentOS ~]#
```