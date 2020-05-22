# Tìm hiểu về Dashbroad trong graylog  

## 1. Định nghĩa

Là nơi để hiển thị biểu đồ, số liệu, bảng thống kê... được tạo trong mục Search
## 2. Công dụng  

Giúp người dùng dễ dàng trong việc thống kê, tìm kiếm các thông tin được lọc từ bản tin log.

## 3 Tạo và kiểm soát Dashboard

- Trên Dashboard, tạo một Dashboard mới, thêm Title và Description cho Dashboard  

<img src="https://i.imgur.com/oWjES0S.png">  

- Sau khi tạo xong, Dashboard hiện giờ vẫn đang rỗng, ta cần thêm thông số vào Dashboard thông qua Search hoặc Stream.  
Ví dụ : Dashboard thống kê số lần đăng nhập SSH thành công, thất bại, và tổng số đăng nhập trong 30 phút  

Bước 1 : Nhập term tìm kiếm ở mục search.  
Bước 2 : Hiện lên thông số và biểu đồ thống kê cho từng field.  
Bước 3 : Chọn các mục muốn thêm vào Dashboard  

## Thống kê các user SSH

Ví dụ bạn muốn thống kê các tài khoản đăng nhập thì ta vào field `ssh_login`  rồi chọn chế độ `Qick values`. 
<img src="https://i.imgur.com/Ia2DtZU.png">

Biểu đồ thống kê ssh_login sẽ hiển thị lên. Bạn click vào `Add to dashboard` để thêm vào Dashboard. 

<img src="https://i.imgur.com/iZOyDqA.png">  

## Thống kê IP đăng nhập đúng, đăng nhập sai.  

- Chọn khoảng thời gian muốn giám sát rồi chọn `Search`. Sau đó muốn thống kê tổng số lần đăng nhập thì ta chọn `acction_ssh` rồi chọn `Add to dashboard`.

- Thống kê IP đăng nhập đúng và IP đăng nhập sai 

<img src="https://i.imgur.com/u97Umy7.png">
 
## Xem thông tin SSH trên dashboard  

<img src="https://i.imgur.com/3S1IQN0.png">  
