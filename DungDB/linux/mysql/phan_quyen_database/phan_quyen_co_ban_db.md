# Tìm hiểu phân quyền cơ bản cho database mysql

Database Server ở đây là máy CentOS 7 server sử dụng MariaDB v 5.5

## Thao tác trên MariaDB

Bắt đầu với việc truy cập vào mysql bằng lệnh:

    # mysql -u root -p password

Tạo một user mới

    > CREATE USER 'username'@'Your IP' IDENTIFIED BY 'password';

Ví dụ: 

    > CREATE USER 'demo@localhost' IDENTIFIED BY 'demopw';

    > CREATE USER 'demo1@10.10.34.173' IDENTIFIED BY 'demopw';

Sau khi tạo user cần phân quyền cho user để user thao tác trên database

    > GRANT ALL PRIVILEGES ON * . * TO 'username'@'Your IP;

Dấu * trong trường hợp này được chỉ đến database và bảng mà user này được quyền truy cập, lệnh cụ thể này cho phép người đọc. Lệnh này cho phép người đọc, chỉnh sửa, thực hiện các nhiệm vụ trên database và table.

Khi bạn đã hoàn tất các quyền mà bạn thiết lập cho người dùng mới của mình, hãy chắc chắn rằng bạn đã reload lại các quyền của các user trong mysql.

    > FLUSH PRIVILEGES;

### Cấp các quyền khác cho user

- ALL PRIVILEGES: Như chúng ta đã thấy trước đây, điều này sẽ cho phép một người dùng MySQL truy cập vào một cơ sở dữ liệu được chỉ định (hoặc nếu không có cơ sở dữ liệu nào được chọn, qua hệ thống)
- CREATE: cho phép họ tạo các bảng hoặc cơ sở dữ liệu mới
- DROP: cho phép họ xóa các bảng hoặc cơ sở dữ liệu
- INSERT: cho phép họ thêm các hàng từ các bảng
- DELETE: cho phép họ xóa các hàng từ các bảng
- SELECT: cho phép họ sử dụng lệnh SELECT để đọc qua cơ sở dữ liệu
- UPDATE: cho phép họ cập nhật các hàng của bảng
- GRANT OPTION: cho phép họ cấp hoặc xoá các đặc quyền của người dùng khác

Để cung cấp cho một người dùng cụ thể có quyền trên, bạn có thể sử dụng cú pháp:

    > GRANT [type of permission] ON [database name].[table name] TO ‘[username]’@'your_ip’;

Nếu bạn muốn cung cấp cho họ quyền truy cập vào bất kỳ cơ sở dữ liệu hoặc bất kỳ bảng nào, hãy chắc chắn đặt dấu hoa thị (*) vào vị trí của tên cơ sở dữ liệu hoặc tên bảng.

Mỗi lần bạn cập nhật hoặc thay đổi sự cho phép chắc chắn sử dụng lệnh `Flush Privileges`.

    > FLUSH PRIVILEGES;

Nếu bạn muốn xóa quyền truy cập của một user có thể dùng:

    > REVOKE [type of permission] ON [database name].[table name] FROM ‘[username]’@‘your_ip’;

Cũng như bạn có thể xóa cơ sở dữ liệu với DROP, bạn có thể sử dụng DROP để xóa hoàn toàn một người dùng

    > DROP USER ‘username’@‘your_ip’;

Để kiểm tra người dùng mới của bạn, đăng xuất bằng cách gõ `exit` 

    # mysql -u [username]-p

## Làm thế nào để truy cập vào database server từ máy khác

Để truy cập được database server của máy X từ một máy khác Y bạn cần thiết lập mysql của máy X như sau.

Vào file `/etc/my.cnf.d/server.cnf`

    # nano /etc/my.cnf.d/server.cnf

Nếu muốn tất cả mọi người có thể truy cập vào database

Thêm dòng `bind-address=0.0.0.0` vào dưới mục `[mariadb]`

Sau khi thay đổi, khởi động lại dịch vụ mariadb 

    # systemctl restart mariadb 

### Demo 

Mô hình

![Imgur](https://i.imgur.com/i7zVRjD.png)

Database server: 10.10.34.171 (CentOS 7)

Client 1: 10.10.34.173 (Ubuntu 18)

Client 2: (Windows 10) 

Client 2 là máy thật, dùng VPN nên IP sẽ khác

SSH vào máy DB server và xem log SSH để biết IP Client 2 kết nối

    # tail -f -n 50 /var/log/secure | grep sshd

![Imgur](https://i.imgur.com/n6jzsFQ.png)

IP ở đây là IP gateway 10.10.34.1

Từ máy DB server, thực hiện tạo user demo1, demo2 và phân toàn quyền cho 2 user này trên tất cả database

    # mysql -u root -p
    >create user 'demo1'@'10.10.34.173' identified by '123qwe';
    >grant all on *.* to 'demo1'@'10.10.34.173';

    >create user 'demo2'@'10.10.34.1' identified by '123qwe';
    >grant all on *.* to 'demo2'@'10.10.34.1';
    >FLUSH PRIVILEGES;
    >exit

Tiến hành Bind-address

    #nano /etc/my.cnf.d/server.cnf

Thêm dòng `bind-address=0.0.0.0` vào cuối file 

Từ Client 1, truy cập vào DB

    # mysql -h 10.10.34.171 -u demo1 -p

![Imgur](https://i.imgur.com/FejTHlz.png)

Từ đây Client có thể thực hiện các thao tác trên các Database của Database server

Từ Client 2, có thể cài mysql workbench (https://dev.mysql.com/downloads/workbench/) hoặc HeidiSQL (https://www.heidisql.com/download.php) để truy cập vào Database server

Ví dụ với HeidiSQL

Tạo 1 session mới, nhấn vào New:

![Imgur](https://i.imgur.com/cPHw9ec.png)

Đặt tên cho session, và thêm các thông tin

![Imgur](https://i.imgur.com/eUT9D2V.png)

- Network type: chọn MySQL (TCP/IP)
- Library: chọn libmariadb.dll (Nếu dùng mysql thì chọn libmysql.dll)
- Hostname/IP: 10.10.34.171 (IP máy DB server)
- User/Password: User/Password đã tạo cho CLient 2 ở trên (demo2/123qwe)
- Port: 3306 (Port của dịch vụ MySQL database system)

Điền xong nhấn Open sẽ xuất hiện giao diện

![Imgur](https://i.imgur.com/8JrqyZy.png)

Các database nằm ở bên tay trái, thực hiện quản lý DB ở đây.