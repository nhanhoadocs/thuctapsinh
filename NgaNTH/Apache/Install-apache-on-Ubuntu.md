### Cài đặt Apache Web server trên Ubuntu  

1. Cài đặt apache trên Ubuntu  
- Để kiểm tra apache đã được cài đặt hay chưa, ta sử dụng lệnh `ls -l /var/www`  
```
root@ubuntusrv:~# ls -l /var/www
ls: cannot access '/var/www': No such file or directory
```  
Như vậy hệ thống chưa cài đặt apache nên ta sẽ tiến hành cài đặt nó  
```
apt-get install -y apache2
```  
- Xem trạng thái apache trên Ubuntu ta sử dụng lệnh
```
service apache2 status
```
- Khởi động apache2  
```
service apache2 start
```
Xác minh apache đang chạy hay không thì bạn hãy mở trình duyệt và gõ địa chỉ IP của máy, một trang thử nghiệm apache sẽ hiển thị. 

<img src="https://i.imgur.com/JXfcnT0.png">  

Bạn có thể làm như sau để nhanh chóng tránh thông báo '*could not reliably determine the fqdn (không thể xác định tin cậy fqdn)*' khi khởi động lại apache.  
```
root@ubuntusrv:~# echo ServerName ubuntusrv >> /etc/apache2/apache2.conf
root@ubuntusrv:~# service apache2 restart
```  
**default website**  
Thay đổi website mặc định của apache server mới cài đặt rất đơn giản, tất cả bạn cần là tạo (hoặc thay đổi) file index.html.  
Khi bạn `cài apache2` xong thì mặc định trong thư mục `var/www/html` sẽ có một file `index.html`. File này chứa mã code html mà khi bạn gõ địa chỉ IP của máy bạn trên trình duyệt, nó đọc nội dung code và hiển thị là nội dung trang web thử nghiệm như phía trên.  
Bây giờ bạn hãy thay đổi một nội dung bất kì trong file `index.html` và xem trang web thử nghiệm nó có thay đổi không.   
Giả sử ở đây tôi sẽ thay đổi từ `It work!` bằng từ `Vietnam!` trong tệp index.html  
<img src="https://i.imgur.com/Ld8bzFs.png">  
Sau đó tôi lưu lại và gõ IP lên trình duyệt và xem kết quả:  
<img src="https://i.imgur.com/6okCGwD.png">  

Như vậy ví dụ trên cho ta thấy được chế độ hoạt động của web server là nó sẽ đọc nội dung của tệp html theo đường dẫn mà nó được trỏ đến. Tức là đối với trang web thử nghiệm trên thì Document Root được trỏ theo đường dẫn `/var/www/html`.  

Các bạn dùng lệnh `cat` xem nội dung file `000-default.conf` của thư mục `etc/apache2/site-available` sẽ thấy mặc định đường dẫn của `Document Root` là `/var/www/html`.  

<img src="https://i.imgur.com/TltMwGJ.png">  

Như vậy ta đã hiểu cơ bản cách hoạt động của web server. Ở các phần tiếp theo ta sẽ cấu hình các virtual host, đổi port và tìm hiểu rõ hơn cơ chế hoạt động của nó