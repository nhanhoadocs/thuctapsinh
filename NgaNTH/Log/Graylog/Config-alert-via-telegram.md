# Cấu hình graylog server để Tích hợp cảnh báo SSH qua telegram  

- Vào thư mục plugin  
```
cd /usr/share/graylog-server/plugin/
```
- Tải gói cần thiết để cài đặt
```
wget https://github.com/irgendwr/TelegramAlert/releases/download/v2.2.0/telegram-alert-2.2.0.jar
```
- Kiểm tra gói đã tải về
```
[root@graylogsrv plugin]# ll
total 31004
-rw-r--r--. 1 root root 21198838 Nov  6 19:27 graylog-plugin-aws-3.1.3.jar
-rw-r--r--. 1 root root  3730009 Nov  6 19:27 graylog-plugin-collector-3.1.3.jar
-rw-r--r--. 1 root root  5239610 Nov  6 19:27 graylog-plugin-threatintel-3.1.3.jar
-rw-r--r--. 1 root root  1571383 Aug 20 05:59 telegram-alert-2.2.0.jar
```  
- Restart dịch vụ graylog-server và kiểm tra trạng thái
```
systemctl restart graylog-server
systemctl status graylog-server
```
- Truy cập vào link dưới để tạo Bot bằng BotFather 
```
https://t.me/BotFather
``` 
- Lần lượt nhập 2 lệnh  
```
/start
/newbot
```
- Đặt tên cho Bot và username cho Bot. Sau đó bạn sẽ nhận được token API. Hãy lưu lại token này để sử dụng sau này. 
 
<img src="https://i.imgur.com/mNASC3k.png">

- Tạo một Chanel mới trên Telegram
  
<img src="https://i.imgur.com/oFGC3kA.png">  

- Đặt tên cho Chanel và viết mô tả. Sau đó click CREATE 

<img src="https://i.imgur.com/1Rg3FpP.png">  

- Add Bot vào Chanel để test. Chọn mục `Add members`  

<img src="https://i.imgur.com/VyzfllL.png">  

- Tìm kiếm tên Bot và add.  

<img src="https://i.imgur.com/kY3WP04.png">  

- Truy cập vào URL bên dưới để test bot có hoạt động hay không. Chú ý: bạn cần thay thế `<BOT_TOKEN>` bằng token mà bạn nhận được ở bước tạo bot lúc đầu  
```
https://api.telegram.org/bot<BOT_TOKEN>/getUpdates
```
- Nếu trình duyệt trả về kết quả như dưới là đã thành công  

<img src="https://i.imgur.com/4hNiWWA.png">  

- Quay lại Chanel trên Telegram nhập thử một vài dòng.  
<img src="https://i.imgur.com/b2d1fOH.png">

- Xem trên trình duyệt và kiểm tra kết quả trả về đã OK.  

<img src="https://i.imgur.com/NfEXZnE.png">  

