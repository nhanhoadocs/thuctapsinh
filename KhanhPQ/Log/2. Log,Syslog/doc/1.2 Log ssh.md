## file log của ssh được lưu tại :	/var/log/secure

![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/2.%20Log%2CSyslog/img/1.png) 

Các thêm,xóa sửa user,group trên server-ssh

![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/2.%20Log%2CSyslog/img/2.png)  

![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/2.%20Log%2CSyslog/img/3.png) 
 
## Các đăng nhập và trạng thái của nhưng lần đăng nhập từ Client



Username -> Đúng , Pass -> Sai
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/2.%20Log%2CSyslog/img/4.png) 
 
Username -> Sai (Không quan tâm Pass)
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/2.%20Log%2CSyslog/img/5.png) 

Username -> Đúng , Pass -> Đúng ( sau đó đóng kết nối)

 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/2.%20Log%2CSyslog/img/6.png) 



## Các thông tin ta có thể thu thập được qua log ssh
-	username phía client
-	IP Client
-	Port
-	Trạng thái ( thành công/thất bại/ tại sao)


