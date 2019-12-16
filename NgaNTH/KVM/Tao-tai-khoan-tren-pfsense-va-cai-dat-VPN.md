# Tạo tài khoản trên pfsense và cài đặt OpenVPN    

## 1. Tạo tài khoản user  
- Đăng nhập với tên tài khoản (admin) và password  

<img src="https://i.imgur.com/qRlN2wI.png">  

- Trong mục `System` chọn `User manager`  

<img src="https://i.imgur.com/45wKrYg.png">

- Tiếp theo chọn `Add` để thêm một tài khoản user mới  

<img src="https://i.imgur.com/6pgLu2E.png">  


- Điền các thông tin cần thiết trong mục `Username`, `Password`, `Fullname`.  
**Lưu ý cách đặt tên user**: Thống nhất theo quy tắc: tên_họ_đệm ( ví dụ hiennt)  

<img src="https://i.imgur.com/Sn9BPXI.png">  

- Tiếp tục kéo xuống dưới và chọn mục `Click to create a user certificate`.  Điền vào mục `Descriptive name` như theo mẫu và ấn `Save`.  

<img src="https://i.imgur.com/RwFaRQ8.png">  

- Tiếp theo vào mục `VPN` chọn `OpenVPN` 

<img src="https://i.imgur.com/ekxQn3r.png">  

- Chọn mục `Client Export` và tìm đến tên user `hiennt` vừa tạo.  

<img src="https://i.imgur.com/kgkHz5A.png">  

- Chọn bản cài phù hợp với OS và tải về  
    - `Archive` dành cho Linux và Windows
    - `10/2016/2019` dành cho Windows  

<img src="https://i.imgur.com/WhLJ3NC.png">  

## 2. Cài đặt OpenVPN  

(Hướng dẫn này mô tả các bước cài đặt VPN cho tài khoản `nganth`).  
- Mở file cài đặt và chạy lệnh `Run`  
- Chọn `Install` để bắt đầu quá trình cài đặt 

<img src="https://i.imgur.com/mzL8vU9.png">  

 - Chọn `I Agree` để tiếp tục quá trình cài đặt 

<img src="https://i.imgur.com/ytAdcJF.png"> 

- Chọn các thành phần. Ta để theo mặc định và chọn `Next`

<img src="https://i.imgur.com/Os96GzG.png">  

- Tiếp theo chọn đường dẫn lưu `OpenVPN` rồi click `Install`  

<img src="https://i.imgur.com/ydD23Hg.png">  

- Sau khi quá trình cài đặt hoàn thành, một cửa sổ sẽ hiển thị thông tin chung của OpenVPN để thông báo cho ta biết. Tiếp tục chọn `Next` 

<img src="https://i.imgur.com/Mw2e1k0.png">  

- Cuối cùng là chọn `Finish` để hoàn tất quá trình cài đặt  

<img src="https://i.imgur.com/2mWi7fl.png">  

- OpenVPN có đi kèm 1 file `.txt` để hỗ trợ người dùng sử dụng.  

<img src="https://i.imgur.com/L2b9bw9.png">  

## 3. VPN connect  

- Sau khi cài đặt xong thì trên máy Windows (hoặc Linux) của bạn sẽ hiển thị biểu tượng của OpenVPN. Bạn nhấn chuột phải và chọn Connect để kết nối pfsense  

<img src="https://i.imgur.com/QmABXav.png">  

- Nhập tên tài khoản user và password để truy cập. Rồi chọn `OK`  

<img src="https://i.imgur.com/kXbtBzY.png"> 

- Vào mục `Show status` để xem địa chỉ IP   

<img src="https://i.imgur.com/B49gJTL.png">

- Để kiểm tra máy tính đã thực sự được kết nối chưa thì vào cửa sổ `Run` (Windows+R) và chạy lệnh ping IP

<img src="https://i.imgur.com/wM5gmiZ.png">  

Như vậy ta đã thành công trong việc tạo tk và kết nối pfsense qua VPN