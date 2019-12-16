# User, Group and Env


## User, Group
Linux là hệ điều hành đa người dùng, nhiều người dùng có thể đăng nhập cùng lục.

Để xem các người dùng đang đăng nhập ta sử dụng lệnh:

`$ who -a`

Để xem thông tin về người dùng hiện tại đang đăng nhập sử dụng lệnh:

`$ whoami`

Linux sử dụng các group (nhóm) để tổ chức người dùng, group là tập hợp các tài khoản với các quyền được chia sẻ nhất định, `/etc/group` lệnh được sử dụng để quản lý các nhóm, mặc định khi một người dùng mới được tạo ra, một group có cùng tên được tạo ra.

Mỗi người dùng đều được gansmootj ID duy nhất được gọi là **UID** và mỗi group cũng được gán một ID gọi là **GID**, những ID nhày được liệt kê trong các file `/etc/passwd`, `/etc/group`

Chỉ có người dùng root mới có quyên thêm người dùng hoặc nhóm, để thêm một người dùng mới ta sử dụng lệnh `useradd`:

```
# useradd Test
# cat /etc/passwd | grep Test
Test:x:1001:1001::/home/Test:/bin/bash

# ls -la /home/Test
total 12
drwx------. 2 Test Test  62 Nov 18 20:35 .
drwxr-xr-x. 4 root root  30 Nov 18 20:35 ..
-rw-r--r--. 1 Test Test  18 Aug  8 08:06 .bash_logout
-rw-r--r--. 1 Test Test 193 Aug  8 08:06 .bash_profile
-rw-r--r--. 1 Test Test 231 Aug  8 08:06 .bashrc
```

Để xóa bỏ một user ta sử dụng lệnh `userdel`:

```
# sudo userdel Test
# cat /etc/passwd | grep Test
# sudo ls -la /home/Test/
total 12
drwx------. 2 1001 1001  62 Nov 18 20:35 .
drwxr-xr-x. 4 root root  30 Nov 18 20:35 ..
-rw-r--r--. 1 1001 1001  18 Aug  8 08:06 .bash_logout
-rw-r--r--. 1 1001 1001 193 Aug  8 08:06 .bash_profile
-rw-r--r--. 1 1001 1001 231 Aug  8 08:06 .bashrc
```

Tuy nhiên lệnh trên không xóa thư mục home của người dùng, để xóa cả thư mục home ta sử dụng option `-r`.

Lệnh `id` không có tham số hiển thị thông tin về người dùng hiện tại và lệnh có tham số là tên hoặc id thi sẽ hiển thị thông tin của người dùng đó.

Để đặt mật khẩu cho người dùng mới ta sử dụng lệnh `passwd`:

```
# sudo passwd Test
Changing password for user Test.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

Để thêm một nhóm mới ta sử dụng `groupadd` và loại bỏ bằng `groupdel`:

```
# groupadd newgroup
# groupdel newgroup
```

Thêm người dùng vào một nhóm đã tồn tại được thực hiện bằng lệnh `usermod`:

```
$ sudo usermod -G NewGroup
$ sudo usermod -G NewGroup Test
```


### Tệp tin khởi động
Trong Linux, chương trình shell, nói chung bash sử dụng một hoặc nhiều tệp khởi động để cấu hình môi trường. Các tệp trong `/etc` xác định cài đặt chung cho tất cả người dùng trong khi các tệp khởi tạo trong thư mục home của người dùng có thể bao gồm và ghi đè cài đặt chung. Các tệp khởi động có thể làm bất cứ điều gì người dùng muốn làm trong mọi shell lệnh, chẳng hạn như:

- Tùy chỉnh lời nhắc của người dùng
- Xác định các phím tắt và bí danh dòng lệnh
- Đặt trình soạn thảo văn bản mặc định
- Đặt đường dẫn cho nơi tìm chương trình thực thi

Khi bạn đăng nhập lần đầu vào Linux, /etc/profile sẽ được đọc và sau đó các tệp sau được tìm kiếm theo thứ tự được liệt kê:

1. `~/.bash_profile`
2. `~/.bash_login`
3. `~/.profile`

## Biến môi trường (Environment Variable)
Biến môi trường đơn giản là các đại lượng có giá trị cụ thể và được hiểu bởi shell lệnh, các lệnh `set`, `env` và `export` được sử dụng để tương tác với các biến môi trường. Các biến môi trường được tạo ra trong một tệp lệnh chỉ tồn tại trong phiên shell hiện tại.

|Commands|Comments|
|--------|--------|
|echo $VAR|Show giá trị của VAR|
|export VAR=NewValue||
|VAR=value|Thêm một biến môi trường mới|

**HOME** là một biến môi trường xác định thư mục home của người dùng, `~` thường được dùng để làm ký tự viết tắt của HOME

**PATH** là biến môi trường lưu trữ danh sách các thư mục sẽ được duyệt qua để tìm nạp các chương trình hay kịch bản để chạy khi ta chạy lệnh, mỗi thư mục cách nhau bằng một dấu hai chấm (;).

```
$ echo $PATH
/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/toor/.local/bin:/home/toor/bin
```

**SHELL** là biến môi trường chứa giá trị cho shell mặc định sẽ được sử dụng bởi hệ thống.

### Lịch sử lệnh
Bash lưu trữ tất cả các lịch sử lệnh đã nhập trước đó trong bộ đệm lịch sử, lệnh `history` cho ta danh sách lịch sử lệnh đã thực hiện, ngoài ra `~./bash_history` cũng lưu trữ danh sách các lệnh mà ta đã sử dụng.

Một số biến môi trường lưu trữ các thông tin về lịch sử lệnh:

|Variable|Comments|
|--------|--------|
|HISTFILE|lưu trữ vị trí của tập tin lịch sử|
|HISTFILESIZE|lưu trữ số lượng dòng tối đa trong tệp lịch sử|
|HISTSIZE|lưu trữ số lượng dòng tối đa trong tệp lịch sử cho phiên hiện tại|


Một số cú pháp lệnh được sử dụng để gọi lại lệnh đã dùng trước đó:

|Commands|Comments|
|--------|--------|
|!!|Thực thi lệnh trước đó|
|!|Tahy thế lịch sử|
|!$|Đối số cuối cùng|
|!n|Lệnh thứ n|
|!string|Lệnh cuối cùng bắt đầu bằng chuối string|

### Bí danh lệnh
Các bí danh có thể được gán cho các lệnh, thông thường các bí danh này được đặt trong `~/.bashrc` để chúng có sẵn cho bất kỳ shell cá nhận nào, lệnh alias không có đối số sẽ liệt kê các bí danh quy định hiện hành.

```
$ alias
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
```