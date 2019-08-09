# Giới thiệu về Router
##1.Hệ điều hành  
- Nhiệm vụ:
  - Định tuyến và chuyển mạch  
  - Bảo đảm và bảo mật cho việc truy cập vào tài nguyên
  - Mở rộng hệ thống mạng
- Giao diện người dùng - giao diện dòng lệnh(CLI - Command - line interface)  
Cách truy cập(3 cách)  
   - Kết nối trực tiếp từ máy tính hoặc thiết bị đầu cuối đến cổng Console trên router
   - Sử dụng đường quay số qua modem hoặc hoặc kết nối null modem vào cổng AUX trên router
   - Telnet/SSH vào Router. Điều kiện: có ít nhất 1 cổng cấu hình địa chỉ IP, các đường vty đã được cấu hình cho phép truy cập và đặt mật khẩu
- Các chế độ cấu hình:  
EXEC là một trình thông dịch của IOS. EXEC sẽ thực thi câu lệnh ngay sau khi câu lệnh được cấu hình.  
   + Chế độ EXEC người dùng cho phép thực thi câu lệnh kiểm tra cấu hình cơ bản của router. Chỉ xem, không cho phép thực hiện các câu lệnh làm thay đổi cấu hình router. Dấu nhắc của chế độ này là ">"  
   + Chế độ EXEC đặc quyền cho phép thực hiện tất cả các câu lệnh của router. Chế độ EXEC đặc quyền được xác định bởi dấu nhắc "#"
- Tên của Cisco IOS được chia thành 3 phần:  
   + Phần 1: thể hiện loại thiết bị mà phần mềm IOS có thể sử dụng được  
   + Phần 2: các đặc tính của phần mềm IOS
   + Phần 3:thể hiện nơi chạy phần mềm IOS trên router và cho biết phần mềm này ở dạng nén hay không nén.
- Kiểm tra phần mềm IOS hiện tại, dung lượng RAM: `show version`  
    …\<output omited>…cisco 1721 (68380) processor (revision c) with 3584k/512K bytes of memory.

Dòng trên cho biết dung lượng của bộnh chính và bộ nhớ chia sẻ trên router. Có một số thiết bị sử dụng một phần DRAM làm bộ nhớ chia sẻ. Tổng hai dung lượng trên là dung lương thật sựcủa DRAM trên router.
- Xem dung lượng bộ nhớ flash:  `show flash`  

…\<output omitted>…1599897 bytes total (10889728 bytes free)  
- Hoạt động của phần mềm Cisco IOS  
Thiết bị Cisco IOS có 3 chế độ hoạt động:
  - ROM Monitor: thực hiện quá trình bootstrap và kiểm tra phần cứng. Được sử dụng để khôi phục lại hệ thống khi bị lỗi nghiêm trọng hoặc người quản trị quên mật khẩu. Chỉ có thể truy cập bằng cách kết nối vào cổng console trên router.
  - Boot ROM: chỉ có 1 phần Cisco IOS là hoạt động được, cho phép chép được lên bộ nhớ flash --> thay thế phần mềm Cisco IOS trong bộ nhớ Flash. Câu lệnh "copy tftp flash" để chép phần mềm IOS trên TFTP server vào bộ nhớ flash router.
  - Cisco IOS: Thông thường trong quá trình khởi động router, một trong các chế độ trên sẽ được tải lên RAM để chạy. Người quản trị có thể cài đặt giá trị cho thanh ghi để điều khiển chế độ khởi động mặc định router.

> ## **2.Thiết lập phiên kết nối bằng Hyper Terminal**

> ## **3.Gõ lại câu lệnh đã sử dụng**  
Mặc định Router sẽ lưu lại 10 câu lệnh trong bộ đệm. Có thể thay đổi số lượng câu lệnh mà router lưu lại bằng lệnh terminal history size hoặc history size. Tối đa 255 câu lệnh được lưu lại.
> ## **4.Những thông tin hiển thị do lệnh `show version`**
	* Phiên bản IOS và 1 ít thông tin đặc trưng
	* Phiên bản phần mềm Bootstrap ROM
	* Phiên bản phần mềm Boot ROM
	* Thời gian hoạt động của router
	* Phương thức khởi động router lần gần đây nhất
	* Tên và vị trí lưu phần mềm hệ điều hành
	* Phiên bản phần cứng của Router
	* Giá trị cài đặt của thanh ghi cấu hình.
    

# CHƯƠNG 3 - CẤU HÌNH ROUTER




