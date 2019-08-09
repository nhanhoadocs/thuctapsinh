# Tìm hiểu về SELinux

## Giới thiệu

SElinux (Security-Enhanced Linux) được sử dụng để bảo vệ trong kernel của Linux. Được phát triển bởi NSA để bảo vê máy tính từ bên trong.

SELinux có trên Centos, RHEL, Fedora. Có trong kernel Linux bắt đầu các bản 2.6.x

## Tại sao cần SELinux

**DAC (Discretionary Access Control)**

Mỗi prosess đều chạy dưới quyền của một user và group (UID, SUID, GID). Ví dụ một process httpd chạy dưới quyền của user apache. Process httpd có quyền truy cập vào các thư mục mà user apache có thể truy cập. Khi đó nếu có vấn đề về bảo mật thì có thể lợi dụng vào user này để chỉnh sửa hoặc các phá hoại tất cả các file thuộc người dùng này.

**MAC (MAndatory Access Control)**

Cho phép xác định tất cả các quyền khác nhau cho tất cả các process. Nó xác định tất cả các process có thể tương tác với các phần khác trên server:
 * Pipes
 * Files
 * Network ports
 * Sockets
 * Directories
 * Process khác

SELinux đặt các hạn chế đối với từng đối tượng theo các policy. Ví dụ với user apache chỉ có quyền truy cập với thư mục `/var/www/html`, nhưng không thể làm gì với các phần khác của hệ thống ví dụ như thư mục `/etc`. Như vậy kẻ tấn công không thể truy cập sang cái khác hoặc truy cập vào mạng LAN của ta.

=> Hạn chế được các hư hại

SElinux cung cấp các tính năng bảo mật sau:
 * Bảo vệ dữ liệu người dùng khỏi truy cập trái phép
 * Bảo vệ process khỏi truy cập trái phép
 * Bảo vệ ports/socket/files khỏi truy cập trái phép
 * Bảo vệ server chống lại việc khai thác
 * Vượt quyền

## Các mode của selinux

Có 3 mode trong selinux:
 * enfocing: selinux sẽ hoạt động
 * permissive: selinux không hoạt động nhưng sẽ có những cảnh báo được ghi vào log
 * disabled: selinux không hoạt động

Ta có thể show trạng thái hoạt động của selinux sử dụng lệnh 

```
sestatus
```

Để thay đổi mode ta sửa trong file `/etc/selinux/config`.

File `/etc/selinux/config` có nội dung như sau:

```
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted 
```

Để thay đổi mode của selinux ta thay đổi ở dòng

```
SELINUX=mode tương ứng
```

Trong file này ta cũng thấy 3 mode của `SELINUXTYPE` để xác định chính sách sẽ được sử dụng.
 * tageted: Cho phép ta tùy chỉnh quyền kiểm soát truy cập phù hợp.
 * minimum: Hộ trợ một bộ daemon tối thiểu trong các domain riêng của chúng. Phần còn lại chạy trong domain uninedined_t.
 * mls: Bảo vệ nâng cao hơn với nhiều lớp.(Sử dụng mls cần cài các gói bổ sung)

## Một số khái niệm

**User selinux**

Bất kì một user nào (user sử dụng để login hay user dùng để chạy một process) đều được map tới một user selinux. Một user selinux có thể có nhiều user login map tới nhưng một user login chỉ có thể map tới 1 user selinux. User selinux có tên kết thúc bằng ký tự `_u`. Có các loại user selinux sau

```
                 Labeling   MLS/       MLS/
SELinux User    Prefix     MCS Level  MCS Range                      SELinux Roles

guest_u         user       s0         s0                             guest_r
root            user       s0         s0-s0:c0.c1023                 staff_r sysadm_r system_r unconfined_r
staff_u         user       s0         s0-s0:c0.c1023                 staff_r sysadm_r system_r unconfined_r
sysadm_u        user       s0         s0-s0:c0.c1023                 sysadm_r
system_u        user       s0         s0-s0:c0.c1023                 system_r unconfined_r
unconfined_u    user       s0         s0-s0:c0.c1023                 system_r unconfined_r
user_u          user       s0         s0                             user_r
xguest_u        user       s0         s0                             xguest_r
```

Mỗi user sẽ có các policy khác nhau:

 * guest_u: This user doesn't have access to X-Window system (GUI) or networking and  can't execute su / sudo command.
 
 * xguest_u: This user has access to GUI tools and networking is available via Firefox  browser.
 
 * user_u: This user has more access than the guest accounts (GUI and networking), but  can't switch users by running su or sudo.
 
 * staff_u: Same rights as user_u, except it can execute sudo command to have root  privileges.
 
 * system_u: This user is meant for running system services and not to be mapped to  regular user accounts.

**Subject và object**

Porocess được coi như một subject.

Object là tất cả những gì mà process có thể tương tác với: file, thư mục, port,...

**Domain**

Domain xác định bối cảnh mà process có thể chạy. Nó xác định những gì mà proccess có thể làm.

**Type**

Type quy định mục đích của object. Ví dụ nó quy định mục đích của những file trong thư mục `/var/www/html` là trang web.

Tên của một domain hoặc type được kết thúc với ký tự `_t`.
**Roles**

Role đóng vai trò như một gateway nằm giữa user và process để xác định xem user nào có thể truy cập vào process. Nó cũng quy định user selinux nào được phép truy cập tới roles đó. Tên một role sẽ được kết thúc với ký tự `_r`.

**Policy**

Đầu tiên user selinux cần được xác thực để truy cập vào một role. Sau đó role lại cần xác thực để truy cập vào vào domain. Và một domain chỉ được phép truy cập vào một số object xác định.

Khi selinux được enable thì khi khởi động các policy sẽ được load tới RAM.

## Một số câu lệnh

Để quản lý tốt hơn selinux ta nên cài thêm một số packet sau để thuận tiện cho việc quản lý và troubshoot.

```
yum install policycoreutils policycoreutils-python selinux-policy selinux-policy-targeted libselinux-utils setroubleshoot-server setools setools-console mcstrans
```

**Show trạng thái selinux**

```
sestatus
```

```
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      31
```

**Show các policy được load vào RAM**

```
semodule -l
```

```
...
webalizer	1.13.0
wine	1.11.0
wireshark	2.4.0
xen	1.13.0
xguest	1.2.0
xserver	3.9.4
zabbix	1.6.0
zarafa	1.2.0
zebra	1.13.0
zoneminder	1.0.0
zosremote	1.2.0
```

**Show boolean**

Boolean cho phép ta thay đổi policy của SELinux trong khi nó đang chạy mà không cần reload lại các policy. Ví dụ ta cho phép service http truy cập vào DB mà không cần phải reload lại policy của selinux

```
semanage boolean -l
```

```
...
logging_syslogd_run_nagios_plugins (off  ,  off)  Allow logging to syslogd run nagios plugins
squid_connect_any              (on   ,   on)  Allow squid to connect any
ssh_sysadm_login               (off  ,  off)  Allow ssh to sysadm login
domain_fd_use                  (on   ,   on)  Allow domain to fd use
samba_enable_home_dirs         (off  ,  off)  Allow samba to enable home dirs
mcelog_client                  (off  ,  off)  Allow mcelog to client
tomcat_use_execmem             (off  ,  off)  Allow tomcat to use execmem
nfs_export_all_ro              (on   ,   on)  Allow nfs to export all ro
cron_can_relabel               (off  ,  off)  Allow cron to can relabel
```

Tất cả các policy này đều được lưu trong các file ở thư mục `/etc/selinux/targeted/policy`.

**Check trạng thái của một boolean**

```
getsebool tên
```

Ví dụ 

```
getsebool httpd_can_network_connect_db
```

```
httpd_can_network_connect_db --> off
```

Ta thấy nó đang off. Tức là httpd không thể kết nối được đến DB.

**Đổi giá trị của một boolean**

```
setsebool tên on[off]
```

Ví dụ

```
setsebool httpd_can_network_connect_db on
```

Kết qủa lúc này sẽ là 

```
httpd_can_network_connect_db --> on
```

Giá trị ta vừa set chỉ tồn tại đến ky ta reboot. Nếu muốn reboot không bị mấy thì ta sử dụng thêm option `-P`.

```
setsebool -P httpd_can_network_connect_db on
```

**Show user**

User login: là những user tất cả các user trên máy. Bao gồm cả user dùng để login bằng user/password và những user dùng cho các process

```
semanage login -l
```

```
Login Name           SELinux User         MLS/MCS Range        Service

__default__          unconfined_u         s0-s0:c0.c1023       *
root                 unconfined_u         s0-s0:c0.c1023       *
system_u             system_u             s0-s0:c0.c1023       *
```

Ta sẽ thấy có 3 loại:
 * __default__: Những user chúng ta tạo ra (sử dụng lệnh useradd) mà chưa được map tới user selinux nào
 * root: user root
 * system_u: các user để chạy các process hoặc daemom

User selinux

```
semanage user -l
```

```
                 Labeling   MLS/       MLS/
SELinux User    Prefix     MCS Level  MCS Range                      SELinux Roles

guest_u         user       s0         s0                             guest_r
root            user       s0         s0-s0:c0.c1023                 staff_r sysadm_r system_r unconfined_r
staff_u         user       s0         s0-s0:c0.c1023                 staff_r sysadm_r system_r unconfined_r
sysadm_u        user       s0         s0-s0:c0.c1023                 sysadm_r
system_u        user       s0         s0-s0:c0.c1023                 system_r unconfined_r
unconfined_u    user       s0         s0-s0:c0.c1023                 system_r unconfined_r
user_u          user       s0         s0                             user_r
xguest_u        user       s0         s0                             xguest_r
```

**Show user selinux mà user login map tới**

Đứng tại user muốn kiểm tra ta thực hiện lệnh

```
id -Z
```

```
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

Như ví dụ trên tôi kiểm tra trên user `root`. User này đang được map tới user selinux là `unconfined_u` và được map tới role là `unconfined_r` và domain là `unconfined_t`

**Thực hiện đổi user selinux cho một user login**

```
semanage login -a -s user_selinux_name user_login_name
```

Ví dụ user demo của tôi đang map đến user selinux là `unconfined_u`

```
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

Tôi muốn nó map đến user slinux là `user_u`

```
semanage login -a -s user_u demo
```

Kiểm tra lại ta thấy

```
user_u:user_r:user_t:s0
```

**Show quyền của user hoặc group với một file hoặc thư mục**

Thông thường chúng ta sử dụng lệnh `ls` để list các file hoặc thư mục trong một thư mục. 

```
[root@server html]# ls
index.html
```

Chúng ta sử dụng thêm option `-Z` để show các quyền này

```
[root@server html]# ls -Z
-rwxr-xr-x. root root unconfined_u:object_r:httpd_sys_content_t:s0 index.html
```

**Thay đổi type cho một file hoặc thư mục**

Như ta thấy ở bên trên type của file `index.html` đang là `httpd_sys_content_t`. Tôi muốn đôi lại thành `var_t`

```
chcon --type var_t /var/www/html/index.html
```

Kiểm tra lại

```
-rwxr-xr-x. root root unconfined_u:object_r:var_t:s0 index.html
```

**Show các user có quyền truy cập role**

Các `role` mà user có quyền truy cập

Ví dụ với user `system_u`

```
[root@server www]# seinfo -usystem_u -x
   system_u
      default level: s0
      range: s0 - s0:c0.c1023
      roles:
         object_r
         system_r
         unconfined_r
```

Tương tự ta có thể show các domain mà một role có thể truy cập

Ví dụ với role `user_r`

```
seinfo -rsystem_r -x
```

```
[root@server www]# seinfo -rsystem_r -x | head
   system_r
      Dominated Roles:
         system_r
      Types:
         abrt_t
         abrt_dump_oops_t
         abrt_handle_event_t
         abrt_helper_t
         abrt_retrace_worker_t
         abrt_retrace_coredump_t
```

## Troubshooting

Ví dụ tôi không với user `guest_u` đang không được quyền thực thi các file

```
[demo0@server ~]$ ll
total 4
-rwx------. 1 demo0 demo0 48 10:14 26 Th07 script.sh

[demo0@server ~]$ id -Z
guest_u:guest_r:guest_t:s0

[demo0@server ~]$ ./script.sh 
-bash: ./script.sh: Permission denied
```

Chúng ta sử dụng lệnh sau để xem lỗi ở đâu

```
audit2allow -w -a
```

Ta thấy kết quả trả về như sau

```
...
type=AVC msg=audit(1564373152.060:186): avc:  denied  { execute } for  pid=2463 comm="bash" name="script.sh" dev="dm-0" ino=13111127 scontext=guest_u:guest_r:guest_t:s0 tcontext=unconfined_u:object_r:user_home_t:s0 tclass=file permissive=0
	Was caused by:
	The boolean guest_exec_content was set incorrectly. 
	Description:
	Allow guest to exec content

	Allow access by executing:
	# setsebool -P guest_exec_content 1
```

Như vậy nếu muốn cho phép user `guest_u` thực thi file ta phải sử dụng lệnh

```
setsebool -P guest_exec_content 1
```

Bây giờ ta thử lại 

```
[demo0@server ~]$ ./script.sh 
Đây là chương trình demo
```

**Lưu ý** các lệnh với selinux ta phải thực hiện trên user root hoặc user sudo