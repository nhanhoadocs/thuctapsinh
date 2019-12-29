# Tạo SSH Streams trên Graylog  

## 1.Định nghĩa
Là kỹ thuật định tuyến bản tin tới một chỉ mục nhất định. Ví dụ, tôi chỉ muốn đọc các bản tin liên quan ssh thì sẽ dùng Stream để lọc các bản tin về ssh được đẩy về.  

## Công dụng

Phân luồng thông tin.
Có thể đẩy các bản tin trong Stream qua một output khác để xử lý.
Dùng cho việc cảnh báo ( qua Email, Slack)
3.3 Tạo và kiểm soát Stream
Stream dùng những rule riêng để phân luồng và lấy về các bản tin cần thiết.

## Cấu hình  

## 1. Streams từ field `message`
- Trong mục Stream, ta click vào `Create Stream`, sau đó điền `Title` và `Description` cho Stream.

<img src="https://i.imgur.com/joULWQp.png">  

- Điền thông tin  

<img src="https://i.imgur.com/iONfWE2.png">  

- Sau khi chọn `Save`thì trong menu Streams sẽ xuất hiện thêm `SSH streams`. Bạn chọn mục `Manage Rules` để thiết lập các Rules. 

<img src="https://i.imgur.com/I4TpnZH.png">  

- Cửa sổ mới hiện ra, bạn chọn `Add stream rule` và điền thông tin vào các trường. Sau đó ấn `Save`  

<img src="https://i.imgur.com/0TtTKVA.png">

- Bạn có thể tạo nhiều Rule và sử dụng tùy chọn Stream theo kiểu match tất cả các Rule hoặc chỉ 1 rules.   

<img src="https://i.imgur.com/NpwqCgW.png">  

- Click `I'm done` để lưu lại.  
- Mở cửa sổ terminal bên phía máy client. Đăng nhập sai 1 tài khoản bất kì và xem log trong `SSH streams`  

<img src="https://i.imgur.com/me83qvG.png">
<img src ="https://i.imgur.com/bzonGsc.png">

## 2. Streams từ field `application_name`  

Để streams các trường hợp SSH ta sẽ lấy giá trị của field `application_name` trong `New Stream Rule`. Trong trường hợp này chỉ có 1 value duy nhất `sshd` nhưng ta có thể xem được tất cả các log về SSH  

<img src="https://i.imgur.com/ndajGpk.png">  

- Lưu rule và chọn `I'm done`

Sau đó thử đăng nhập đúng và đăng nhập sai vào tài khoản root rồi kiểm tra kết quả  

<img src="https://i.imgur.com/aa8u6Bg.png">