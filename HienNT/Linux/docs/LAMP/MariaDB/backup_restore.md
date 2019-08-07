<img src ="../../../images/25 bai linux/mysqldump-backup-title.jpg">  

## Chuẩn bị  
- 1 máy ảo CentOS 7 có cài MySQL Server hoặc MariaDB Server với các thông số: 

<img src ="..\..\..\images/25 bai linux/chuanbi1.png">  

- Trên máy ảo có 1 database user dùng để thực hiện sao lưu dữ liệu. Ngoài ra tài khoản bạn dùng phải là tài khoản root hoặc tài khoản được cấp quyền `sudo`  

## Mô hình  

<img src ="../../../images/25 bai linux/backup_restore.png">  

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
`Cron` là một tiện ích cho phép thực hiện các tác vụ một cách tự động theo định kỳ, ở chế độ nền của hệ thống. `Crontab` (CRON TABle) là một file chứa đựng bảng biểu (schedule) của các entries được chạy.

### Cron làm việc như nào? 
Một cron schedule đơn giản là một text file. Mỗi người dùng có một cron schedule riêng, file này thường nằm ở `/var/spool/cron`. Crontab files không cho phép bạn tạo hoặc chỉnh sửa trực tiếp với bất kỳ trình text editor nào,thay vào đó bạn sẽ phải dùng lệnh crontab.   

Một số lệnh thường dùng:

- crontab -e: tạo hoặc chỉnh sửa file crontab 
- crontab -l: hiển thị file crontab 
- crontab -r: xóa file crontab  

Hầu hết tất cả VPS/Server đều được cài đặt sẵn crontab, tuy nhiên vẫn có trường hợp VPS không có. Nếu bạn sử dụng lệnh crontab -l mà thấy output trả lại -bash: crontab: command not found thì cần tự cài crontab thủ công.  
 
**Cài đặt crontab**  
- Sử dụng lệnh:

  ```sh
  yum install cronie
  ```

- Start crontab và tự động chạy mỗi khi reboot:

  ```sh
  systemctl start crond
  ```
  ```sh
  systemctl enable crond.service
  ```  

### Cấu trúc của Crontab  
Một crontab file có 2 phần cần chú ý: đầu tiên là 5 trường xác định thời gian, phần cuối là câu lệnh hoặc script cần được thực thi, cấu trúc như sau:  

```sh
.---------------- minute (0 - 59)
|  .------------- hour (0 - 23)
|  |  .---------- day of month (1 - 31)
|  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
|  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
|  |  |  |  |
*  *  *  *  * user-name  command to be executed
```  

Nếu một cột được gán ký tự *, nó có nghĩa là tác vụ sau đó sẽ được chạy ở mọi giá trị cho cột đó.  

- Ví dụ:

  – Chạy script 30 phút 1 lần:

    ```sh
    0,30 * * * * command
    ```
    – Chạy script 15 phút 1 lần:

    ```sh
    0,15,30,45 * * * * command
    ```  
    – Chạy script vào 3 giờ sáng mỗi ngày:

    ```sh
    0 3 * * * command
    ```

### Ví dụ cụ thể  
- Vào thư mục `/usr/bin` tạo một file `.sh` để lưu scripts của bạn. Ở đây file mình tạo là `test.sh`. Đường dẫn của file scripts sẽ là `/usr/bin/test.sh`. Gán quyền thực thi cho file test.sh   

  ```sh
  cd /usr/bin
  touch test.sh
  chmod +x test.sh  
  ```

- Chỉnh sửa file test.sh viết một đoạn script sao lưu toàn bộ cơ sở dữ liệu `NhanHoa` vào thư mục `/root` như sau:
  ```sh
  !/bin/sh
  mysqldump -u root -p NhanHoa --single-transaction --quick --lock-tables=false > NhanHoa-backup-$(date +%F).sql
  ```  

- Sau đó cho scripts chạy định kì vào 15 giờ 18 phút thứ 2 và thứ 6 hàng tuần bằng cách tạo 1 file crontab như sau:  

  ```sh
  crontab -e
  ```  
- Nhấn o(chữ o) để chỉnh sửa nội dung file:   

  ```sh
  18 15 * * 1,5 sh /usr/bin/test.sh
  ```  

- Khởi động lại crontab  

  ```sh
  systemctl restart crond
  ```

### Disable email
Mặc định cron gửi email cho người thực thi cron job, nếu bạn muốn tắt chức năng gửi email này đi thì hãy thêm đoạn sau vào cuối dòng

```sh
>/dev/null 2>&1
```  

- Ví dụ:
  ```sh
  18 15 * * 1,5 sh /usr/bin/test.sh >/dev/null 2>&1
  ```

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
- [Tìm hiểu về trường của crontab](https://vinahost.vn/crontab-linux-la-gi)  
- [Ví dụ về crontab](https://viblo.asia/p/20-vi-du-de-hieu-ve-crontab-tren-he-dieu-hanh-linux-yMnKMADmK7P)  
