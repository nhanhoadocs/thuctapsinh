# Phân quyền User truy cập phpMyAdmin

Để cho phép hay ngăn user được đăng nhập trên phpMyAdmin. Ta sẽ sử dụng tài khoản `root` của MySQL để thiết lập quyền hạn cho user.

## 1. Liệt kê các user đang có trong dịch vụ MySQL
```sql
MariaDB [(none)]> SELECT user, host FROM mysql.user;
```

Giả sử ở đây, ta có 4 user tương ứng 6 host khác nhau.

<img src="..\images\Screenshot_41.png">


## 2. Liệt kê các quyền hạn được cấp cho user
- Ta có thể sử dụng lệnh `SHOW GRANT` để hiển thị phân quyền được gán cho user. Lệnh này sẽ hiển thị đầy đủ những quyền hạn nào đã được gán cho user trước đó bằng lệnh `GRANT` 
- Để xem được quyền của 1 user khác, bạn phải có quyền sử dụng `SELECT` trong database `mysql`

```sql
SHOW GRANT FOR [username]@[host]
```

### Trong đó:
- username : tên của user mysql mà bạn muốn hiển thị thông tin
- host : có thể nhận các giá trị đại diện cho cổng kết nối tới CSDL của dịch vụ
    - `127.0.0.1` : kết nối qua `127.0.0.1:3306`
    - `localhost` : thông qua socket pipe
    - `%` : có thể kết nối từ bất kì IP local hay public hay socket đều được.

### Ví dụ:
```sql
SHOW GRANTS FOR 'demo'@'%';
```

<img src="..\images\Screenshot_42.png">

## 3. Tạo user có thể đăng nhập từ phpMyAdmin
```sql
create user '[tên_user]'@'%' identified by '[password]';

grant all on [database].[table] to '[tên_user]'@'%';
```

### Ví dụ:
```sql
create user 'userdemo'@'%' identified by 'secret'; 
--> tạo user userdemo cho phép kết nối từ bất kì IP nào.
grant all on *.* to 'userdemo'@'%'; 
--> cấp quyền cho userdemo trên tất cả database
```

Thử truy cập bằng tài khoản này trên **phpMyAdmin**:

<img src="..\images\Screenshot_43.png">

Ta thấy có thể đăng nhập vào **phpMyAdmin** để sử dụng.

## 4. Tạo user chỉ sử dụng trên localhost
```sql
create user '[tên_user]'@'localhost' identified by '[password]';

grant all on [database].[table] to '[tên_user]'@'localhost';
```

### Ví dụ:
```sql
create user 'userlocal'@'localhost' identified by 'localhost'; 
--> tạo user userlocal chỉ có thể đăng nhập từ local mà không thể thông qua host cài phpMyAdmin.
grant all on *.* to 'userlocal'@'localhost'; 
--> cấp quyền cho userlocal trên tất cả database
```

Ta thấy, không thể truy cập trên host cài **phpMyAdmin**
<img src="..\images\Screenshot_44.png">

Kiểm tra trên local thì vẫn có thể:

<img src="..\images\Screenshot_45.png">

## 5. Trên phpMyAdmin
Khi ta đăng nhập bằng tài khoản có quyền `root`, ta có thể xem thông tin các user tại bảng `user` trong database `mysql`

<img src="..\images\Screenshot_46.png">

Ta có thể chỉnh sửa để có thể cho phép hoặc chặn `user` nào đó login vào trang **phpMyAdmin** bằng cách đổi phần Host của nó.

Để sửa, ta chọn **Edit** trên user muốn sửa. Rồi chỉnh sửa phần Host của nó cho phù hợp.

<img src="..\images\Screenshot_47.png">

<img src="..\images\Screenshot_48.png">

Chỉnh sửa xong, ta kéo xuống dưới click **Go** để thực hiện sửa đổi.