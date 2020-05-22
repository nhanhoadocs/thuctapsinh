## Thực hành cấu hình log tập trung  

### 1. Mô hình  

<img src="https://i.imgur.com/nEEORtQ.png">  

### 2. Triển khai:  

**2.1 Cấu hình Rsyslog Server**  
- Chỉnh sửa trong file cấu hình `/etc/rsyslog.conf` để nó có thể nhận các bản tin log từ các máy client gửi về.   
> Bỏ comment 2 dòng sau: bạn có thể lựa chọn sử dụng UDP hoặc TCP để cho phép server nhận các bản tin log. Mặc định syslog sử dụng port 514 để gửi và nhận thông tin log. Ở đây mình sử dụng UDP.

<img src="https://i.imgur.com/TulIhun.png"> 

-  Để máy chủ log tạo thành các thư mục lưu riêng log đối với từng máy Client gửi về thêm dòng này vào cuối file cấu hình:  
    - Cách 1: Thư mục lưu log client trả về sẽ là Ip-client  
    ```
    $template RemoteServer, "/var/log/%fromhost-ip%/%SYSLOGFACILITY-TEXT%.log"
    *.* ?RemoteServer
    ```  
    - Cách 2: Thư mục lưu log client trả về sẽ là tên máy client

    ```  
    $template RemoteServer, "/var/log/%HOSTNAME%/%SYSLOGFACILITY-TEXT%.log"
    *.* ?RemoteServer 
    ```  
    Ngoài ra bạn có thể sử dụng cấu hình sau để lưu các file log với tên các chương trình:
```
$template TmplAuth,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" #hostname
*.*     ?TmplAuth
$template TmplAuth,"/var/log/%fromhost-ip%/%PROGRAMNAME%.log" #ip-server
*.*     ?TmplAuth
```  
Ở đây mình sẽ sử dụng cách 1. Với cú pháp này, các tệp cập nhật sẽ được nhóm theo Ip-client gửi log và sau đó theo cơ sở syslog (kern, user, auth, v.v.)  

- Mở port 514  
```
firewall-cmd --permanent --add-port=514/udp
firewall-cmd --permanent --add-port=514/tcp
firewall-cmd --reload
```  
- Khởi động lại Rsyslog-server của bạn và đảm bảo rằng nó hiện đang lắng nghe trên cổng 514 cho UDP hoặc TCP.  
```
[root@rsyslogsrv ~]# systemctl restart rsyslog
[root@rsyslogsrv ~]# netstat -tuan | grep 514
udp        0      0 0.0.0.0:514             0.0.0.0:*
udp6       0      0 :::514                  :::*
```  

Cấu trúc thư mục lưu ở phía máy chủ Rsyslog server  

<img src="https://i.imgur.com/jxaobeB.png">  

**2.2 Cấu hình Rsyslog Client**  

*Trên Clien1 (CentOS7)*  

- Khai báo IP của Rsyslog Server (dưới mục Rule)  
```
[root@client1 ~]# vi /etc/rsyslog.conf
```  

<img src="https://i.imgur.com/6kC4GZI.png">  

> Nếu bạn muốn phương thức truyền gói tin là UDP thì sẽ để `@` và TCP là `@@`.  

- Restart service Rsyslog  
```
systemctl restart Rsyslog  
```  

*Trên client2 (Ubuntu 18.4)*  

- Khai báo IP của Rsyslog-server   
```
vi /etc/rsyslog.d/50-default.conf
```

<img src="https://i.imgur.com/HDLesvM.png">  

Kiểm tra lại bằng lệnh `grep`  

<img src="https://i.imgur.com/PrVUt1S.png">

- Restart service Rsyslog  
```
systemctl restart rsyslog  
```  
### 3. Dùng lệnh tcpdump để bắt gói tin gửi đến Rsyslog  
Mở cửa sổ terminal gõ lệnh `tcpdump -nni ens33 port 514` để bắt các gói tin gửi đến. Đồng thời trên 2 máy client ta thực hiện restart network.  

<img src="https://i.imgur.com/aKRESj6.png">  

Như các bạn đã thấy, log messages như `daemon` sẽ được đẩy từ client về server qua port 514.  
Sau đó, đứng trên Rsyslog-server kiểm tra thư mục đẩy về trên `/var/log`.  

<img src="https://i.imgur.com/qJ6qgsq.png">  

Xem một thư mục chứa log của client bất kì  

<img src="https://i.imgur.com/8BauF1x.png">  

Như vậy ta đã cấu hình được log tập trung đẩy log từ các máy client về Log Server.  