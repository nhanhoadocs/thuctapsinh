# Mô hình OSI
## Mục tiêu:	
Thiết kế các hệ thống mạng cho phép tất cả các hệ thống máy tính khác nhau có thể truyền thông với nhau
## Kiến trúc phân tầng, chức năng: 
	
### 1.Tầng vật lý: gồm các kết nối vật lý 
* Thiết lập hoặc ngắt kết nối điện ở các phương tiện truyền thông.
* Biểu diễn bit: xác định các phương thức mã hóa
* Tốc độ dữ liệu: xác định khoảng thời gian để truyền 1 bit
* Đồng bộ hóa các bit 
* Cấu hình đường truyền: kết nối các thiết bị vào môi trường truyền thông
* Topo : xác định cách kết nối các thiết bị với nhau để tạo thành mạng
* Chế độ truyền dẫn: Xác định hướng truyền dữ liệu giữa 2 thiết bị: đơn công, bán song công, song công
	 
### 2.Tầng liên kết dữ liệu:
* Framing: đóng gói dữu liệu 
* Định địa chỉ vật lý
* Kiểm soát lưu lượng: nếu tốc độ nhận dữ liệu nhỏ hơn tốc độ gửi dữ liệu, tầng liên kết phải thực hiện kỹ thuật kiểm soát lưu lượng để ngăn ngừa quá tải
* Kiểm soát lỗi: Tầng liên kết dữ liệu làm tăng tính tin cậy của tầng vật lý bằng cách sử dụng kỹ thuật phát hiện và truyền lại các frame bị lỗi hoặc mất
* Kiểm soát truy cập: Khi nhiều thiết bị dùng chung đường truyền, các giao thức ở tầng này sẽ quuyeets định thiết bị nào được quyền sử dụng đường truyền
	 
### 3.Tầng mạng: Chuyển gói dữ liệu từ người gửi đến nơi người nhận
* Địa chỉ logic
* Định tuyến: Các thiết bị kết nối trung gian phải xác định tuyến đường cho gói dữ liệu để chúng đến được đích
	 
### 4.Tầng giao vận
* Địa chỉ cổng 
* Kiểm soát kết nối
* Kiểm soát lưu lượng ( ở thiết bị đầu cuối )
* Kiểm soát lỗi ( ở thiết bị đầu cuối ), khắc phục lỗi bằng cách yêu cầu truyền lại
	 
### 5.Tầng phiên: Duy trì và đồng bộ hóa tính liên tác giữa 2 bên
* kiểm soát hội thoại
* Đồng bộ hóa
	
### 6.Tầng trình diễn
* Dịch các mã ký tự từ ASCII sang EBCDIC
* Chuyển đổi dữ liệu 
* Nén dữ liệu để giảm lượng dữ liệu truyền trên mạng
* Mã hóa và giải mã dữ liệu để đảm bảo sự bảo mật trên mạng 
	 
### 7.Tầng ứng dụng 
* Thiết bị đầu cuối ảo của mạng: là phiên bản phần mềm của thiết bị đầu cuối vật lý, cho phép người dùng đăng nhập vào máy từ xa
* Quản lý truy cập vào chuyển file
	 
 > VD về các ứng dụng này bao gồm: Telnet, giao thức truyền tập tin FTP và giao thức truyền thư điện tử SMTP, HTTP, X

   


