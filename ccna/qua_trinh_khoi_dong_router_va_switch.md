# router
## 1. Cấu tạo và thành phần của router.
- Các thành phần có trong router:
    - ROM, RAM, NVRAM, CPU, BUS, FLASH, PORT.
- Các thành phần khi khởi động router:
    - ROM ( Read-only Memory): lưu trữ chương trình khởi động, bootstrap, chương trình os, ROMMON, chương trình kiếm tra hardware khi khởi động (POST).
    - Flash Memory: lưu trữ IOS.
    - RAM( Random-access memory): lưu thông tin vận hành , bảng định tuyến( routing table), cấu hình router đang hoạt động( running-config).
    - NVRAM( Non-volatile RAM): lưu trữ file startup-config(file cấu hình) của router. Khi mất điện or restart sẽ ko bị mất.
    - Startup-config: file lưu cấu hình trước đó của router. Lưu routing, mật khẩu, IP address, . . 
## 2. Các bước khởi động router.
- Bước 1: POST( Power On Self Test): là chương trình kiếm tra các thành phần sử dụng cho quá trình khởi động router có đầy đủ không. Nếu có thì thực hiện bước 2.
- Bước 2: Load chương trình bootstraps từ ROM và RAM( tìm kiếm và load IOS).
- Bước 3: Load IOS
    - Tìm kiếm trong flash có  IOS giải nén và load IOS.
    - Nếu IOS không có trong flash thì nó sẽ load RXBOOT kết nối TFTP server khác để download IOS xuống flash. Nếu RXBOOT thất bại nó sẽ load ROMMON
    - Nếu IOS không có trong các TFTP server thì sẽ tìm kiếm sang ROM nếu có IOS thì sẽ load nếu không có thì 
- Bước 4: Load file cấu hình.
    - Dựa vào bit 6 của thanh ghi cấu hình để thực hiện:
        - Nếu bit 6 = 0 (0x2102): load file startup-config trong VNRAM vào RAM chạy running-config.
        - Nếu bit 6 = 1 (0x2142): bỏ qua file startup-config trong VNRAM, load vào cấu hình trắng.
    - Nếu không có   file cấu hình trong VMRAM router sẽ broadcast tìm TFTP server tìm và downlaod file cấu hình cho router.
- TFTP( trivial File Transfer Protocol): là giao thức truyền file đơn giản, cho phép client có thể upload , download cac tệp từ remote host như switch , server,... chỉ truyền tệp và truyền qua port 69, 512 byte.
- ROMMON: tập những dòng lệnh  thiết lập để có thể kết nối đến  một TFTP server và phục hồi lại khi IOS lỗi.
- Bootstrap: được sự dụng để  tìm kiếm  một hệ điều hành đề đưa vào load.
- RXBOOT: là một IOS mini để giúp đỡ quá trình phục hồi IOS từ TFTP server.
## 3. Khôi phục mật khẩu trong router.
- Chỉnh sửa giá trị default trên thanh ghi cấu hinh của router là 0x2102 -> 0x2142
- Trước tiên ta phải vào  chế độ rommon: khởi động lại router ấn tổ hợp phím  ctrl-break
- Sử dụng lệnh confreg đổi từ 0x2102 -> 0x2142.
- Sau đó reset lại router: nhớ phải chon "No"
- Sau khi reboot thì router lại vào chế độ user mode.
- Cuối cùng trả thanh gi về giá trị default (0x2102) sử dụng lệnh: config-register 0x2102.
- Lưu câu hình router wr. 
## 4. Khởi động router lần đầu tiên.
- Cần phải setup 1 so thứ cơ bản.
    - Hostname:
    - password để đăng nhập vào chế độ privileged EXEC:
    - Password để  sử dụng khi boot lại images.
    - Password để sử dụng khi quên password đang nhập vào chế độ privileged.
    - Password để đăng nhập vào cấu hình cổng interface.
# switch
## quá trình khởi động switch cũng tương tự như router 
- xem các trạng thái  khởi động trên switch qua trạng thái của đèn LED.
- Switch và router hoạt động giống như máy tính  nên quá trình khởi động giống máy tính.
