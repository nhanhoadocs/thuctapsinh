# Chỉnh sửa command line prompt

Biến môi trường `PS1` là kí tự hiển thị như là dấu nhắc của dòng lệnh. Hầu hết các phiên bản của Linux đều đặt `PS1` là một kí tự có giá trị mặc định, ví dụ, người dùng và tên host như sau :

`[root@linux ~]# `

Nó rất hữu dụng vì nó luôn hiển thị để người dùng biết họ đang làm việc ở chế độ người dùng nào, root user hay là người dùng thường :

Ta có thể tùy chỉnh lại bằng cách thay đổi giá trị của `PS1`, đầu tiên ta xem giá trị mặc định của `PS1`:
```
[root@iscsi_target ~]# echo $PS1
[\u@\h \W]\$
```

Trong đó:
- `\u` đại diện cho tên user
- `\h` đại diện cho hostname
- `\W` đại diện cho thư mục đang làm việc
- `\$` đại diện cho ký tự đại diện loại tài khoản

Để tùy biến ta chỉ cần thay đổi giá trị của `PS1`, ví dụ ta sẽ đổi hostname ra trước user và thêm một số ký tự tùy biến ở cuối:

```
[root@iscsi_target ~(___Custom)]#export PS1='[\h@\u \W___Custom]\$'
[iscsi_target@root ~___Custom]#
```