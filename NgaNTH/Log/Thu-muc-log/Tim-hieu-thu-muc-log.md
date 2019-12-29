## Tìm hiểu về thư mục log trong Linux   

Mục lục  
[1. Thư mục log](#1)  
[2. SSH log ](#2)  
[3. Vai trò của dmesg, messages log ](#3)  
[4. Các câu lệnh hay sử dụng để đọc log](#4)
  
Log là file clear text ghi lại các hoạt động của hệ thống hoặc các dịch vụ chạy trên hệ thống. Nhờ đó ta có thể giải quyết các vấn đề rắc rối phát sinh trên hệ thống:  
- TroubleShooting trong quá trình cài đặt các service.  
- Tra cứu nhanh các thông tin của hệ thống.  
- Truy vết các event đã và đang xảy ra.  

<a name="1"></a>

### 1. Thư mục log  

Thư mục log nằm ở `var/log` trong Linux.  
Có những thư mục log chính là:  
- `/var/log/auth.log`: Lưu các log về xác thực.  
- `/var/log/boot.log` : Log các hoạt động trong quá trình khởi động hệ thống.  
- `/var/log/cron`: Log lưu các lịch hoạt động tự động.  
- `/var/log/dmesg` : Giống log message bên dưới nhưng chủ yếu là log bộ đệm.  
- `/var/log/message`: Log lưu thông tin chung của hệ thống.  
- `/var/log/httpd/`: Thư mục chứa log của dịch vụ Apache.  
- `/var/log/maillog`: Các log hoạt động mail trên máy chủ.  
- `/var/log/secure`: Log bảo mật.  
- `/var/log/wtmp`  : Ghi log đăng nhập (log in -log out).  
- `/var/log/btmp` – Thông tin đăng nhập không thành công.  
- `/var/run/utmp` – Thông tin log trạng thái đăng nhập hiện tại của mỗi người dùng.  
- `/var/log/yum.log`: Các log của Yum.  
<a name="2"></a>

### 2. SSH log  
khi ta SSH vào một tài khoản thì log sẽ được ghi lại tại thư mục `var/log/secure`. Ta sẽ xem xét các trường hợp đăng nhập:  
- đúng tên tài khoản, đúng pass.  
- đúng tên tài khoản, sai pass
- sai tên tài khoản.  
Ta sẽ tạo tài khoản có tên `user1` với passwd là `matkhau`.  
- **Đúng user, đúng pass**  

<img src="https://i.imgur.com/gPSVKhO.png">  

- **Đúng user, sai pass**   
Hệ thống báo bạn cần check lại mật khẩu, xác thực thất bại.

<img src="https://i.imgur.com/wQDDEjP.png">  

- **Sai user**  
Hệ thống báo không có sẵn tài khoản `user3` và xác thực mật khẩu thất bại.  

<img src="https://i.imgur.com/oGJs1RN.png">  

**Các thông tin thu thập được khi đọc SSH log**  
- username client  
- IP 
- Port
- Trạng thái (đăng nhập thành công, thất bại, tại sao). 
<a name="3"></a>

### 3. Vai trò của dmesg, messages log  

- `messages log` chứa dữ liệu log của hầu hết các thông báo hệ thống nói chung, bao gồm cả các thông báo trong quá trình khởi động hệ thống.
Ví dụ như, khi bạn restart service network, sẽ có các log về networking xuất hiện.   

<img src="https://i.imgur.com/9Wv8rfJ.png">  

- `dmesg log` chứa thông tin bộ đệm kernel ring. Khi hệ thống khởi động, file log sẽ chứa thông tin về các thiết bị phần cứng mà kernel phát hiện được. Các message này có sẵn trong kernel ring buffer và bất cứ khi nào có message mới xuất hiện, message sẽ bị ghi đè. Bạn cũng có thể xem nội dung của tệp này bằng lệnh dmesg.  

<img src="https://i.imgur.com/48B6und.png">  
<a name="4"></a>

### 4. Các câu lệnh hay sử dụng để đọc log  

- Xem file log realtime với `tail -f`  
```
tail -f /var/log/messages
```  
- Lọc thông tin với `grep` 
```
cat /var/log/cron  | grep /backup/backup_database.sh 
```  
- Đọc định dạng file wtmp với `utmpdump` đi kèm `less` để hiển thị một phần của file.  
```  
utmpdump /var/log/cron | less  
```
- In ra số lượng dòng cụ thể mà không phải mặc định 10 dòng  
```
tail -n 20 /var/log/dmegs
```  
- In ra tất cả các file log có chứa cụm từ cụ thể (ví dụ `ngakma`)  
```
grep -Rin "ngakma" /var/log 
```  
