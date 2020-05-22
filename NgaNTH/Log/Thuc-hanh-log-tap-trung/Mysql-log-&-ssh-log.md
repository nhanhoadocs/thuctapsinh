## Thực hành đẩy MySQL log  và SSH log từ Client về Server  

Mục lục  
[1.Giới thiệu Module sử dụng: imfile (Text File Input Module)](#1)  
[2. Cấu hình đẩy Mysql log và SSH log](#2)  
 
<a name="1"></a>

### 1. Giới thiệu Module sử dụng: imfile (Text File Input Module)

`imfile` là 1 InPut Module.  
Module này chuyển đổi bất kỳ 1 tệp văn bản tiêu chuẩn nào (standard text file) thành 1 syslog messag.  
-> standard text file: gồm các ký tự có thể in được và các dòng phân định bằng LF).  
File sẽ được đọc từng dòng -> chuyển dòng dọc được đến rsyslog để áp rule -> các rule thực hiện lọc điều kiện và chọn action tương ứng. ( Dòng trống không được xử lý).  
Các dòng mới được viết sẽ được lấy ra và xử lý. Tùy vào  mode được chọn(polling/inotify) mà các thức lấy, thời gian xử lý sẽ khác nhau.  
Trình monitor file hỗ trợ cơ chế rotation file. Để có thể hoạt động đầy đủ chức năng, rsyslogd phải chạy trongkhi file được rotate. Nếu rsyslogd bị dừng trong quá trình rotation thì file mới sẽ được đọc nhưng những dòng không được báo lại từ file cũ sẽ có thể không được lấy ra.

Khi rsyslogd bị dừng trong quá trình monitor 1 text file. Nó sẽ ghi lại vị trí được xử lý cuối cùng và tiếp tục công việc khi nó được restart.  
-> Không có dữ liệu bị mất trừ khi file bị rotate trong thời gian rsyslogd restart.  

**Các Parameter**  
1 MODULE chứa các PARAMETER.  
1 PARAMETER chứa các "OPTION"/"BIẾN" đi kèm.  
Tùy vào mục đích cấu hình mà ta bỏ đi các OPTION/BIẾN hoặc chọn và áp giá trị cho chúng.  

*Chú ý*:

- Chỉ sử dụng các OPTION/BIẾN cần thiết, tránh việc cấu hình quá nhiều, rườm rà không cần thiết.  
- Các Parameter không phân biệt hoa thường.  

Một số Parameter thường sử dụng : 
- Input Parameter:  
    - File  
    - Tag  
    - Facility  
    - Serverity  
- Module Parameter

Tham khảo thêm tại [đây](https://www.rsyslog.com/doc/v8-stable/configuration/modules/imfile.html
)  

<a name="2"></a>

### 2. Cấu hình đẩy Mysql log và SSH log   

**Mô hình**    
Dựng 2 máy ảo cài hệ điều hành CentOS7, một máy client sẽ sinh logs và logs được đẩy về máy Server. Mô hình được trình bày như hình dưới.  

<img src="https://i.imgur.com/sRuCoDU.png"> 

**Triển khai**  

### 2.1. Cấu hình đẩy log mysql

**Trên máy Client**  
- Cài đặt mysql. Nếu bạn chưa biết thì có thể tham khảo tại [đây](https://www.hostinger.com/tutorials/how-to-install-mysql-on-centos-7) 

- Tạo file `/etc/rsyslog.d/mysql.conf` và ghi vào nội dung file như sau  
```
module(load="imfile")

#mysql
input(  type="imfile"
        File="/var/log/mysqld.log"
        Tag="Mysql_Log"
        Severity="info"
        Facility="local5"
)
```  
- Restart rsyslog  
- Dùng lệnh `tcpdump` để bắt gói tin và xem kết quả 

<img src="https://i.imgur.com/kzhfKKA.png"> 

Kiểm tra bên phía Rsyslog server  

<img src="https://i.imgur.com/Gsj0BPX.png"> 

### 2.2 Cấu hình đẩy log SSH  

Tương tự như trên ta cũng sẽ tạo file `/etc/rsyslog.d/secure.conf` và ghi vào nội dung file như sau:  
```
module(load="imfile")
#secure log
input(type="imfile"
        File="/var/log/secure"
        Tag="Log_SSH"
        Severity="info"
        Facility="local6"
)
```
Kết quả kiểm tra phía Rsyslog server khi thực hiện ssh vào tài khoản `ngakma`  

<img src="https://i.imgur.com/I69r2UY.png">  

Như vậy ta đã đẩy log Mysql và log SSH từ máy client về Rsyslog Server.  