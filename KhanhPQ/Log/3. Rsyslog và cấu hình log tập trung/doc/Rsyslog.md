Rsyslog là một phần mềm mã nguồn mở sử dụng trên Linux dùng để chuyển tiếp các log message đến một địa chỉ trên mạng (log receiver, log server) Nó thực hiện giao thức syslog cơ bản, đặc biệt là sử dụng TCP cho việc truyền tải log từ client tới server.

Kế thừa syslog-ng ( 1 ứng dụng chuyển tiếp log sử dụng syslog)

 TCP sử dụng port 10514

Cung cấp các module giúp ta có thể cấu hình -> chuyển tiếp các log mong muốn (ví dụ chuyển tiếp log apache từ client đến log server)

 Cung cấp tính năng lọc riêng cũng như tạo khuôn mẫu để định dạng dữ liệu sang định dạng tùy chỉnh.
# 1. Cấu tạo file config /etc/rsyslog.conf
 
 ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/1.png)

-> Thấy được nguồn tạo log, nơi lưu log
Cấu tạo 2 trường : Selector và Action









## 1.1 Trường Selector
Trường Seletor : Chỉ ra nguồn tạo ra log và mức cảnh bảo của log đó.

Trong trường seletor có 2 thành phần và được tách nhau bằng dấu “.“

 ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/2.png)
 
Bên trái dấu “.”	: Nguồn tạo log

Bên phải dấu “.”	: Mức độ bắt đầu ghi log

VD: 
*.emerg	: ghi log của tất cả các nguồn vào trường Action bên cạnh khi mức cảnh báo là emerg trở lên ( tuy nhiên emerg là max rồi  )

mail.*		: ghi log của mail ở tất cả các mức cảnh báo vào trường Action bên cạnh

mail.info	: ghi log của mail khi mức cảnh báo từ info trở lên ( tức là ghi khi cảnh báo ở mức info, notice, warning, err, crit, alert, emerg) vào trường Action bên cạnh

mail.!info	: ghi log của mail ở tất cả mức cảnh báo trừ info vào trường Action bên cạnh

mail.=info	: Chỉ ghi log của mail khi mức cả báo là info vào trường Action bên cạnh

*.info;mail.none;cron.none	: Ghi log của tất cả nguồn khi mức cảnh báo từ info trở lên vào trường Action bên cạnh . Riêng mail và cron thì không ghi 

## 1.2 Trường 2: Trường Action
•	Trường Action:là trường để chỉ ra nơi lưu log của tiến trình đó. Có 2 loại là lưu tại file trong localhost hoặc gửi đến IP của máy chủ Log
 
 ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/3.png)

# 2.Mô hình
Cấu tạo folder /var/log trên Log Server
 
  ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/4.png)

  ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/5.png)
 
Cần đảm bảo tính an toàn (secure) : cần đàm bảo log đến đúng nơi nhận và không bị xem trộm

Cần đảm bảo tính tin cậy (reliable) : đảm bảo log không mất khi mạng sập tạm thời


# 3. Ưu điểm
- Quản lý log tập trung trên 1 server -> dễ dàng theo dõi, quản lý,

- Vẫn có thể theo dõi client dù mất quyền truy cập

- Có thể xây dựng 1 cơ sở hạ tầng dám sát hoàn chỉnh ( kết hợp vs Kibana)

https://devconnected.com/monitoring-linux-logs-with-kibana-and-rsyslog/

# 4. Nhược điểm
- Có khả năng dẫn đến việc quá tải syslog server: khi 1 máy bị “crazy” (bị tấn công, xung đột, lỗi ) -> gửi hàng loạt log đến server dẫn đến việc quá tải server -> cần kiểm tra Filebeat

https://www.elastic.co/fr/products/beats/filebeat

-	Server ngừng hoạt động -> không xem được log + các máy client lưu trữ cục bộ ( có thể dẫn đến việc full client)

# 5. Config rsyslog đến forward logs đến Server
Mô hình bao gồm 1 server log 

2 client : 1 Ubuntu , 1 CentOs
## 5.1 Check
Kiểm tra trạng thái rsyslog

        #systemctl status rsyslog.service
	Nếu chưa có ryslog thì cài đặt ( thường là có rồi trên các bản Ubuntu/CentOs mới)
## 5.2 Config
### 5.2.1 Server log
        #Listen for TCP
        $ModLoad imtcp
        #Listen on port 514
        $InputTCPServerRun 514

	Load module imtcp và chỉ định port 514 thông qua parameter InputTCPServerRun

Chú ý : Module phải được load trước khi bất kỳ dòng config nào tham chiếu đến nó

	Viết các module ngay trên đầu file config
 
  ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/6.png)

Dòng cuối cùng -> cấu hình log client vào folder chỉ định

•	Cách 1: Thư mục lưu log client trả về sẽ là Ip-client

    $template RemoteServer, "/var/log/%fromhost-ip%/%SYSLOGFACILITY-TEXT%.log"
    *.* ?RemoteServer

•	Cách 2: Thư mục lưu log client trả về sẽ là tên máy client

    $template RemoteServer, "/var/log/%HOSTNAME%/%SYSLOGFACILITY-TEXT%.log"
    *.* ?RemoteServer

Ngoài ra bạn có thể sử dụng cấu hình sau để lưu các file log với tên các chương trình:

    $template TmplAuth,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" #hostname
    *.*     ?TmplAuth
hoặc

    $template TmplAuth,"/var/log/%fromhost-ip%/%PROGRAMNAME%.log" #ip-server
    *.*     ?TmplAuth

Mở port trên Cent7(tùy vào sử dụng udp hay tcp)

    firewall-cmd --permanent --add-port=514/udp
    firewall-cmd --permanent --add-port=514/tcp
    firewall-cmd --reload

Sau đó restart lại rsyslog

	sử dụng netstat để check

 ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/7.png)

### 5.2.2 Client
Lưu ý trên client cũng phải truyền đúng với giao thức như trên server:

•	*.* @IPserver:514 : Đối với giao thức UDP

•	*.* @@IPserver:514 : Đối với giao thức TCP

VD:
•	*.* @66.0.0.199:514

•	*.* @@66.0.0.199:514


Ubuntu

  ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/8.png)

CentOs7
 
  ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/8.1.png)

Note: Chú ý nếu đổi qua lại giữa UDP,TCP thì cần chú ý xem process cũ còn chạy không thì phải kill đi (và reboot lại máy - nếu service restart rồi vẫn không gửi log) rồi mới reload/restart lại rsyslog

### 5.2.3 Check kết nối Client -Server
Trên server ta có thể sử dụng tcpdump để bắt gói tin từ client gửi qua .Nếu bắt được -> ok

    #tcpdump -i ens33 port 514	
convert ip và port của local thành tên
 
  ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/9.png)

    #tcpdump -nni ens33 port 514
không convert ip và port của local thành tên 

 ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/10.png)












# 6. Encrypt message with TLS
Có 1 vấn đề đặt ra là khi ta gửi log thì log vẫn ở dạng clear text -> không chống được MITM

	lộ log -> lộ thông tin hệ thống

	cần mã hóa thông tin trên đường truyền

Đầu tiên cần tạo key-pair cho việc certificate
 
 ![IMG](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/3.%20Rsyslog%20v%C3%A0%20c%E1%BA%A5u%20h%C3%ACnh%20log%20t%E1%BA%ADp%20trung/img/11.png)

