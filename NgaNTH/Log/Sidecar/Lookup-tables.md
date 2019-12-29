# Tìm hiểu và cấu hình lookup table trên graylog server  

## 1. Lookup table là gì?  
`Lookup tables` là một công cụ trên Graylog cho phép tra cứu/ánh xạ/sửa đổi giá trị trường message thành giá trị mới và ghi chúng vào một trường mới hoặc ghi đè lên trường cũ.  
Ví dụ khi ta đã thu thập được log tập trung từ client về graylog server, ta đã extractor được ra các trường như `user_ssh`. Nhưng khi click vào các trường đó thì ta chỉ nhận được tên hiển thị ngắn gọn ( root, ngakma, user1, ...) Vậy làm thế nào để biết được thông tin chi tiết hơn như chức vụ, họ tên đầy đủ của user thì ta sẽ sử dụng `lookup table` - một công cụ mạnh mẽ được tích hợp trên graylog server giúp highlight quá trình theo dõi, giám sát hệ thống log.  

## 2. Chuẩn bị  
- Máy client đã cấu hình gửi log về graylog server.  
- Sử dụng các công cụ để lấy được trường `ssh_user` đến từ ssh log message.  

## 3. Cấu hình  
- Tạo file CSV trên graylog server  
```
vi /etc/graylog/lookup-table.csv
"user_ssh","full_name"
"root","Quan tri vien"
"ngakma","Nguyen Thi Hong Nga"
```
Ý nghĩa nội dung file:  
- Dòng đầu tiên: khai báo `key` và `value` cho Adapter. Chú ý ta sẽ dùng nó để khai báo khi đến bước tạo Adapter sau này.  
- các dòng tiếp theo là user_login và mô tả tên đầy đủ của user đó 
 Sau đó Chọn mục `System/Lookup tables` trên Web interface 

<img src="https://i.imgur.com/cSCen4m.png">

## Tạo Data adapter  

`Data adapter` được sử dụng để thực hiện tra cứu kết qủa cho một giá trị. Nó có thể đọc từ file CSV, kết nối với cơ sở dữ liệu hoặc thực hiện các request HTTP để nhận kết quả tra cứu.

<img src="https://i.imgur.com/thN6DVc.png">

<img src="https://i.imgur.com/5iVuMCH.png">  

<img src="https://i.imgur.com/lKohMff.png">

<img src="https://i.imgur.com/2k5k0kA.png">  

Sau đó chọn `Create Adapter`
Nếu bạn không tạo file CSV như ở bước đầu tiên thì hệ thống sẽ báo lỗi không tìm thấy file. Ta có thể config trước và tạo file sau cũng được. Sau khi tạo xong Adapter thì sẽ hiển thị một Adapter ta vừa tạo 

<img src="https://i.imgur.com/GZ4YQZZ.png">  

## Tạo Caches
Trong bộ nhớ trong (in-memory) cache duy trì các giá trị được sử dụng gần đây từ các bộ điều hợp dữ liệu (adapter).  
Đảm bảo rằng các máy chủ Graylog của bạn có đủ đống để chứa các mục được lưu trong bộ nhớ cache và theo dõi hiệu quả của bộ đệm.
Bộ nhớ cache là cục bộ cho mỗi máy chủ Graylog, chúng không chia sẻ các mục.
Ví dụ: nếu bạn có hai máy chủ, chúng sẽ duy trì bộ đệm hoàn toàn độc lập với nhau.

- Vào mục `Caches` và click `Create cache` 

<img src="https://i.imgur.com/SDoVTid.png">  

<img src="https://i.imgur.com/O3hfyti.png">  

<img src="https://i.imgur.com/vLzoJYD.png">  

Ý nghĩa của các trường trong Cache:  
- **Cache size**: Mỗi bộ đệm có số lượng mục nhập tối đa, bộ nhớ cache không giới hạn không được hỗ trợ.
- **Time-based expiration** (Hết hạn theo thời gian)  

    - `Expire after access` (Hết hạn sau khi truy cập): Bộ đệm sẽ xóa các mục sau một thời gian cố định vì chúng đã được sử dụng lần trước. Điều này dẫn đến bộ đệm hoạt động như một bộ đệm được sử dụng gần đây nhất trong không gian.

    - `Expire after write` (Hết hạn sau khi viết): Bộ đệm sẽ xóa các mục sau một thời gian cố định vì chúng đã được nhập vào bộ đệm. Điều này dẫn đến các mục không bao giờ cũ hơn thời gian nhất định, điều này có thể quan trọng đối với việc thay đổi dữ liệu thường xuyên, chẳng hạn như trạng thái cấu hình của các hệ thống bên ngoài.

Sau khi ấn `Create cache` ta sẽ có một cache mới  

<img src="https://i.imgur.com/uZQkQ93.png">  

## Tạo Lookup table  

`Lookup table` (bảng tra cứu) có thể được sử dụng trong các trình trích xuất, chuyển đổi và xử lý các pipeline để dịch message field hoặc để làm phong phú các message.
- Chọn mục `Lookup table` và click `Create lookup table`  

<img src="https://i.imgur.com/iX1SQQ0.png">  

- Khai báo thông tin. `Data Adapter` và `Cache` chọn giá trị vừa tạo ở bước trước.  

<img src="https://i.imgur.com/rpv3sdU.png">  

- Sau khi khai báo xong chọn `Create loolup table` ta sẽ có một lookup table mới  

<img src="https://i.imgur.com/JE0BR7o.png">  

## Extractor  
Vào mục message, click vào message ssh để tạo Extrator.  

<img src="https://i.imgur.com/BNY5NnB.png">  

Điền các mục cần thiết để extractor thành field `full_name_user_login`  

<img src="https://i.imgur.com/uWc1ldR.png">

Thử đăng nhập vào tài khoản và kiểm tra trường `full_name_user_login` đã có ở mục Fields chưa. Sau đó click vào nó và theo dõi bên mục Messages. Nếu kết quả như dưới là đã thành công.

<img src="https://i.imgur.com/jxLa6Cd.png">

<img src="https://i.imgur.com/9KpEe6s.png">  
