<img src ="../../../images/25 bai Linux/mysqldump-backup-title.jpg">  

## Chuẩn bị  
- 1 máy ảo CentOS 7 có cài MySQL Server hoặc MariaDB Server với các thông số: 

<img src ="..\..\..\images/25 bai Linux/chuanbi1.png">  

- Trên máy ảo có 1 database user dùng để thực hiện sao lưu dữ liệu. Ngoài ra tài khoản bạn dùng phải là tài khoản root hoặc tài khoản được cấp quyền `sudo`  

## Mô hình  

<img src ="../../../images/25 bai Linux/backup_restore.png">  

## Backup - Sao lưu dữ liệu  
#### Cú pháp:  

  ```sh
  mysqldump -u [username] -p [databaseName] > [filename]-$(date +%F).sql
  ```  

  - `username` - tên người dùng có quyền sao lưu cơ sở dữ liệu  
  - `databasename` - tên cơ sở dữ liệu cần sao lưu  
  - `filename` - tên của bản sao dữ liệu  
  - `-$(date +%F)` mốc thời gian sao lưu dữ liệu  

#### Các trường hợp ví dụ sử dụng     
- Tạo bản sao lưu của toàn bộ hệ thống quản lý cơ sở dữ liệu(DBMS)  
  ```sh
  mysqldump --all-databases --single-transaction --quick --lock-tables=false > full-backup-$(date +%F).sql -u root -p 
  ```  

- Sao lưu một sơ sở dữ liệu cụ thể. Thay `NhanHoa` bằng tên cơ sở dữ liệu bạn muốn sao lưu.  

  ```sh
  mysqldump -u root -p NhanHoa --single-transaction --quick --lock-tables=false > NhanHoa-backup-$(date +%F).sql
  ```  

- Sao lưu một bảng duy nhất từ một cơ sở dữ liệu. Thay `NhanHoa` bằng tên cơ sở dữ liệu chứa bảng, thay `Mentor` bằng tên bảng bạn muốn sao lưu.  

  ```sh
  mysqldump -u root -p --single-transaction --quick --lock-tables=false NhanHoa Mentor > NhanHoa-Mentor-$(date +%F).sql
  ```  

#### Phân tích các tùy chọn lệnh được sử dụng ở trên:  
- `--single-transaction` - đưa ra câu lệnh `BEGIN SQL` trước khi vào máy chủ  
- `--quick` - Đọc các bảng lớn theo cách không yêu cầu có đủ RAM để phù hợp với toàn bộ bảng trong bộ nhớ.  
- `--lock-tables=false` - Không khóa bảng cho phiên sao lưu.  

## Tự động sao lưu với `Cron`  
`cron` sẽ đọc tệp cấu hình `/etc/crontab` khi nó khởi động và tiếp tục chạy trong khi máy đang chạy.  
#### Các bước thực hiện  
- Tạo thư mục chứa dữ liệu được sao lưu:  
  ```sh
  mkdir /var/backups/mysql
  ```  
- Vào chỉnh sửa file `/etc/crontab` và thêm vào dòng lệnh tự động sao lưu dữ liệu:  
  ```sh
  405 14 * * * mysqldump -u root -pabc@123 --single-transaction --quick --lock-tables=false --all-databases | gzip> /var/backups/mysql/fullbackup-$(date +”/%Y_/%m_/%d_/%I_/%M”).sql.gz
  ```  
  ***Phân tích:***  
  - `41 3 * * *` lần lượt là phút(0-59), giờ(0-23), ngày trong tháng(1-31), thán(1-12), ngày trong tuần(0(Sunday)-6). Kí tự `*` là viết tắt của bất kỳ. Nếu đặt như trên thì dữ liệu sẽ được tự động sao lưu mỗi ngày vào 1h sáng  
  - `root` có nghĩa là chạy lệnh dưới tài khoản root  
  - `mysqldump -u root -pabc@123 --single-transaction --quick --lock-tables=false --all-databases` cả đoạn này có nghĩa là sao lưu tất cả cơ sở dữ liệu  
  - `/var/backups/mysql/fullbackup` là đầu ra của dữ liệu được sao lưu  
  - `$(date +”/%Y_/%m_/%d_/%I_/%M”)` một lệnh hiển thị thời gian giúp chúng ta theo dõi được thời gian sao lưu dữ liệu.  

## Khôi phục dữ liệu đã sao lưu  
#### Cú pháp chung:  
```sh
mysql -u [username] -p [databaseName] < [filename].sql
```  

#### Các ví dụ cho các trường hợp cụ thể:  

- Khôi phục toàn bộ dữ liệu đã sao lưu. Việc này sẽ ghi đè lên toàn bộ cơ sở dữ liệu hiện có trong hệ thống CSDL.  

  ```sh
  mysql -u root -p < full-backup.sql
  ```  

- Khôi phục cơ sở dữ liệu nhất định nào đó. Điều kiện: cơ sở dữ liệu đích trống hoặc cơ sở dữ liệu cũ còn tồn tại và tài khoản dùng để chạy lệnh phải là tài khoản có quyền ghi vào CSDL đó.  

  ```sh  
  mysql -u root -p NhanHoa < NhanHoa-backup.sql
  ```  

- Khôi phục một bảng dữ liệu duy nhất. Điều kiện: có CSDL đích sẵn sàng nhận dữ liệu.  
  ```sh
  mysql -u root -p NhanHoa < NhanHoa-Mentor.sql
  ```







## TÀI LIỆU THAM KHẢO  
- [use-mysqldump-to-back-up-mysql-or-mariadb](https://www.linode.com/docs/databases/mysql/use-mysqldump-to-back-up-mysql-or-mariadb/)
- [mysqldump-with-modern-mysql](https://serversforhackers.com/c/mysqldump-with-modern-mysql)
