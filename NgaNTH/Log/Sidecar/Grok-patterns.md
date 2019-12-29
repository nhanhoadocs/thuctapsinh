# Tìm hiểu và thực hành grok patterns

## 1. Grok pattern là gì
`Grok pattern` là kỹ thuật xác định cấu trúc log data, có thể sử dụng pattern sẵn có hoặc tạo các mẫu tùy chỉnh. Grok pattern giúp ta có thể lọc thông tin và xử lý bản tin log, extract thành trường riêng tùy theo mục đích của người giám sát log. 

## 2. Tạo grok pattern với log SSH 

Thử đăng nhập vào 1 tài khoản trên máy Client để đẩy log SSH về graylog server. Ta xem message log trên Web interface. Click vào một log message.  

<img src="https://i.imgur.com/nE63zyG.png">

Tiếp theo vào mục message của bản tin log và tạo extractor cho field message thông qua `grok pattern`.   
<img src="https://i.imgur.com/mXUTWgv.png">  

Cửa sổ mới hiện ra với mục `Example message` và `Extractor Configuration`.

- Để extractor ra 1 cột mới, ta phải truyền vào những giá trị để lấy dữ liệu Example message. Đồng thời định nghĩa lại tên dữ liệu đó. Các kiểu dữ liệu có thể search ở Filter pattern.

<img src="https://i.imgur.com/MqUTeCX.png"> 

Ví dụ grok pattern cho bản tin SSH thành công  
```
%{WORD} %{INT} %{TIME} %{WORD:hostname} %{WORD:app_name}\[%{INT}\]\: %{WORD:acction_ssh} password for %{WORD:user_ssh} from %{IPV4:ip_ssh} 
```
- Thêm các pattern bằng cách lọc ở cột Filter pattern và add. Click `Try against example` để kiểm tra đã phù hợp và check tên các trường tự extract.  

<img src="https://i.imgur.com/z6f8Cqj.png">  

- Tiếp theo kéo xuống dưới nhập tiêu đề cho Extractor và chọn `Create extractor` để tạo.  

- Tiếp tục SSH vào 1 tài khoản trên client và kiểm tra mục `Fields` ở Web interface. Ta thấy đã xuất hiện thêm một số trường do ta extractor từ các bước trước.  

<img src="https://i.imgur.com/lkoZCCT.png">  

- Bây giờ ta có thể lọc được các thông tin SSH như đăng nhập thành công/ thất bại, IP SSH, user SSH

<img src="https://i.imgur.com/3J1jhBa.png">

## 3. Tạo grok pattern với log apache 
- Điều kiện: Trên máy client đã cài dịch vụ apache (httpd)
Giả sử máy client có địa chỉ IP `10.10.34.102` đã cài apache. Ta vào trình duyệt và gõ IP này trên thanh URL. Quay trở lại Web Interface của graylog server để theo dõi log đẩy về  

<img src="https://i.imgur.com/Ypz9MX2.png">

- Tiếp theo ta sẽ tiến hành grok pattern để tạo extractor ra các field, giúp cho việc theo dõi log được dễ dàng hơn  

<img src="https://i.imgur.com/IW6CBIR.png">  

- Tiếp tục đăng nhập vào IP `10.10.34.102` để đẩy log về graylog server. Theo dõi trên mục Fields đã xuất hiện các trường mà ta extractor.  

<img src="https://i.imgur.com/uH8FpPY.png">