## Tìm hiểu file log của Web server khi thao tác trên Wordpress  

Ở bài viết trước chúng ta đã tìm hiểu cách cài đặt Wordpress để tạo ra 1 trang riêng của mình. Bây giờ ta sẽ tìm hiểu cách thức hoạt động của Web server bằng cách đọc file log Apache khi ta thao tác trên Wordpress.

- Trên url của trình duyệt ta gõ địa chỉ máy chủ: `IP_address/wp-login.php` để đăng nhập vào website. 

<img src="https://i.imgur.com/EhS3EHm.png">

Sau đó vào cửa sổ terminal dùng lệnh `tail /var/log/httpd/access_log` để theo dõi nhật ký đăng nhập.

<img src="https://i.imgur.com/RCkRWBA.png">  

Ta thấy máy client có địa chỉ `192.168.152.1` thực hiện phương thức `GET` truy vấn đến máy chủ hiển thị giao diện đăng nhập (login). (Máy client yêu cầu truy cập vào tài nguyên `/wp-login.php`)  

- Sau khi nhập thông tin tên user và mật khẩu, nhấn `Log In` thì bạn sẽ thấy trình duyệt trả về giao diện quản lý của admin. 

<img src="https://i.imgur.com/0PCRNWx.png">

Ta tiếp tục lệnh `tail` để đọc file nhật ký.  

<img src="https://i.imgur.com/1lh2LmX.png"> 

Theo dõi log ta thấy khi nhập thông tin để đăng nhập thì phương thức thực hiện của máy client sẽ là `POST` gửi dữ liệu đến Server để tăng tính bảo mật và không bị giới hạn băng thông.  
Sau đó phương thức `GET` truy vấn thông tin dữ liệu để hiển thị giao diện quản trị website của admin. Trong trường hợp này, sử dụng phương thức `GET` đảm bảo được tốc độ truy cập nhanh hơn là POST và cũng không ảnh hưởng gì đến dữ liệu. 

- Tiếp theo ta sẽ vào xem trang chủ Web bằng cách chọn `Visit Site` ở góc trái màn hình  
<img src="https://i.imgur.com/3O5rTN1.png">  

- Bạn ấn vào một bài viết bất kỳ trên website và lại quay trở lại xem file log. Giả sử tôi sẽ xem bài viết `Giới thiệu về VFone`.

<img src="https://i.imgur.com/BknNNGW.png">

Dòng thông tin được ghi vào file log:  

<img src="https://i.imgur.com/3E2AoCU.png">  

- Tiếp theo ta thử comment bài viết ở ô bên dưới. Giả sử tôi viết `Test comment` và ấn `POST COMMENT` thì ta sẽ xem log sẽ ghi gì.  

<img src="https://i.imgur.com/3HNYJEa.png">

Thông tin trong file log:  

<img src="https://i.imgur.com/YI19br7.png">

Khi bạn bình luận vào mục `Comment` thì phương thức `POST` sẽ gửi dữ liệu về server. Sau đó phương thức `GET` truy vấn dữ liệu hiển thị lại giao diện bài đăng.  



