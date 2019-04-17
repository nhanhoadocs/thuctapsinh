# passwd
`passwd` là một câu lệnh dùng để thay đổi và quản lý mật khẩu đối với user trên linux.
### Một số option hay dùng
* `-S` hiển thị về trạng thái password của một user
`passwd -S tên_user`
```
[root@localhost ~]# passwd -S client1
client1 PS 2018-12-01 0 99999 7 -1 (Password set, SHA512 crypt.)
```
* `-l` để khóa một user
Với option này thì user đó sẽ không thể login vào tài khoản của mình cho đến khi được admin unlock
`passwd -l tên_user`
```
[root@localhost ~]# passwd -l client1
Locking password for user client1.
passwd: Success
```
```
niemdt@niemdt:~$ ssh client1@192.168.169.129
client1@192.168.169.129's password: 
Permission denied, please try again.
```
* `-u` để unlock user password
Để có thể login vào user khi user đã bị khóa ta dùng lệnh `passwd -u tên_user`
```
[root@localhost ~]# passwd -u client1
Unlocking password for user client1.
passwd: Success
```
* `-e` để bắt user đổi mật khẩu sau khi login vào
` passwd -e tên_user`
```
niemdt@niemdt:~$ ssh client1@192.168.169.129
client1@192.168.169.129's password: 
You are required to change your password immediately (root enforced)
Last login: Wed Dec 12 18:23:01 2018 from 192.168.169.1
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user client1.
Changing password for client1.
```
*Lưu ý* các option trên chỉ thực hiện được dưới quyền root. Muốn đổi password trên user mình đang đứng chỉ cần nhập lệnh `passwd`
```
[client1@localhost ~]$ passwd
Changing password for user client1.
Changing password for client1.
(current) UNIX password: 
New password: 
```