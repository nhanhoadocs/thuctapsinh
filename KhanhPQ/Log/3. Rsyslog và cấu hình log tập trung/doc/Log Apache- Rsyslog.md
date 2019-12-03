# ĐẨY LOG APACHE VÀ MARIADB VỀ LOG SERVER
 Trên thực tế, hệ thống chỉ là môi trường,ta sẽ còn cài đặt thêm các ứng dụng khác nhằm phục vụ mục đích nào đó (database, webserver, ....). Đây mới là mục đích chính của ta

-> Cần theo dõi log của chúng để đảm bảo chúng chạy bình thường ổn định và khi cần ta có thể truy vết, xử lý sự cố

# 1. Module sử dụng: imfile (Text File Input Module) 
Là 1 InPut Module.

Module này chuyển đổi bất kỳ 1 tệp văn bản tiêu chuẩn nào (standard text file) thành 1 syslog message

(standard text file: gồm các ký tự có thể in được và các dòng phân định bằng LF)

File sẽ được đọc từng dòng -> chuyển dòng dọc được đến rsyslog để áp rule -> các rule thực hiện lọc điều kiện và chọn action tương ứng. ( Dòng trống không được xử lý) 

Các dòng mới được viết sẽ được lấy ra và xử lý. Tùy vào được mode được chọn(polling/inotify) mà các thức lấy, thời gian xử lý sẽ khác nhau

Trình monitor file hỗ trợ cơ chế rotation file. Để có thể hoạt động đầy đủ chức năng, rsyslogd phải chạy trongkhi file được rotate. Nếu rsyslogd bị dừng trong quá trình rotation thì file mới sẽ được đọc nhưng những dòng không được báo lại từ file cũ sẽ có thể không được lấy ra.

Khi rsyslogd bị dừng trong quá trình monitor 1 text file. Nó sẽ ghi lại vị trí được xử lý cuối cùng và tiếp tục công việc khi nó được restart

-> Không có dữ liệu bị mất trừ khi file bị rotate trong thời gian rsyslogd restart

## 1.2 Các Parameter 
1 MODULE chứa các PARAMETER

1 PARAMETER chứa các "OPTION"/"BIẾN" đi kèm

Tùy vào mục đích cấu hình mà ta bỏ đi các OPTION/BIẾN hoặc chọn và áp giá trị cho chúng.

Chú ý: 

+) Chỉ sử dụng các OPTION/BIẾN cần thiết,  tránh việc cấu hình quá nhiều, rườm rà không cần thiết.

+) Các Parameter không phân biệt hoa thường

https://www.rsyslog.com/doc/v8-stable/configuration/modules/imfile.html

1 số Parameter thường sử dụng :
(+) Module Parameters

    - Mode :
    chỉ định mode là inotify (được khuyến nghị - mặc định)  hay polling (mặc định của imfile; tốn tài nguyên và chậm hơn)

    Note: nếu ta sử dụng $ModLoad thì polling sẽ là mặc định -> giúp ngăn xung đột với cấu hình cũ.

    - PollingInterval ( chỉ định tần suất ghi dữ liệu mới) -> chỉ chạy ở polling -> tốn tài nguyên
    
    Nên dùng inotify

(+) Input Parameters

    - File
    - Tag
    - Facility
    - Severity
## 1.3 Cấu hình đẩy log apache
Tạo file /etc/rsyslog.d/apache.conf có nội dung như sau: 


    module(load="imfile" PollingInterval="10")

    #access_log

    input(  type="imfile"
   
           File="/var/log/httpd/access_log"
           Tag="access_log"
           Severity="info"
           Facility="local7")

    #error_log

    input(  type="imfile"
   
           File="/var/log/httpd/error_log"
           Tag="error_log"
           Severity="info"
           Facility="local6")

## 1.4 Cấu hình đẩy log ssh


Tương tự apache

Tạo file /etc/rsyslog.d/secure.conf có nội dung như sau:

    module(load="imfile")
    #/var/log/secure
    input(type="imfile"
            File="/var/log/secure"
            Tag="Log_SSH"
            Severity="info"
            Facility="local2"
    )


## 1.5 Cấu hình đẩy log mariadb
(máy client đã cài mariadb-server)

Tương tự apache

Tạo file /etc/rsyslog.d/mariadb.conf có nội dung như sau:

    module(load="imfile")

    #Mariadb
    input(  type="imfile"
            File="/var/log/mariadb/mariadb.log"
            Tag="Mariadb_Log"
            Severity="info"
            Facility="local1"
)

