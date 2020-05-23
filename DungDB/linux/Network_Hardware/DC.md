# DC

Thủ tục:

Đầu tiên, lấy thẻ khách, để chứng minh thư ở bảo vệ để được vào trong. 
Sau đó vào phòng làm thủ tục, khai báo cấu hình, IP, up mới hay up lại. 
Khai họ tên, số chứng minh. Sang phòng DC, để lai chứng minh, bằng lái, lấy thẻ khách rồi vào phòng. 
Lắp server vào tủ rack rồi gắn dây vào kiểm tra xem server đã cấu hình đúng chưa, hoạt động được không. 
Kiểm tra ok rồi ra khỏi phòng, trả thẻ khách. Ký xác nhận, ra bảo vệ trả thẻ khách rồi ra về.

Anh Quyền chỉ tụi em 2 tủ D23, D24 là chạy openstack. 4 tủ từ C21-C24 là chạy tự phát, bao gồm của khách và hệ thống storage cũ.

Báo cáo a. Hôm nay lên DC e có ghi chép một số thứ a dặn như sau: Cấu tạo tủ rack gồm tủ, nguồn, thanh quản lý cáp, tay rack. Ở segment 1,2 thì dùng tủ 42U, segment 3 dùng tủ 48U. Cứ 2 đến 3 thiết bị thì tách ra một U cho đỡ nóng. Một tủ thường lắp 20 - 25 thiết bị. Nguồn trung bình 1 tủ 14kW. Dây đi phía trên (có thể đi phía dưới được). Các dãy tủ đánh ký hiệu theo alphabet, các tủ trong dãy đánh số 1, 2, 3... Nhiệt độ trong phòng là 18 độ C. Em có quan sát thấy có các loại thiêt bị dùng nguồn 460W, 500W, 750W. FPT trang bị mỗi tủ 1 switch. Họ hỗ trợ thêm nguồn và lắp đặt. Tay rack do mình chế mang theo (Cũng có loại tay rack kèm theo server)

Báo cáo anh. 
- Sáng nay em chạy python xong phần tuple
- Đọc về RAID 0, RAID 1. Các chế độ RAID khác các em chưa đọc sâu.
- Đọc lệnh ack
Buổi chiều lên DC thì em có note môt số chỗ:
- DC CMC đi dây bên dưới
- công ty mình thuê tủ E6, E7, E8 chạy cloud, cung cấp dịch vụ VPS
- Kỹ thuật stack port channel switch và bonding sẽ được biết sau khi học phần cloud
- Phải quan sát kỹ khi nhân viên up server, kiểm tra lại tay rack, chú ý tránh động chạm dây nguồn, dây mạng.
- Server nên cài đặt hết ở công ty trước khi mng lên DC.
- Dán tag cẩn thận cho các dây mạng mang theo
- Cấu hình IDRAC trước. Sau đó cấu hình các interface mạng. Kiểm tra lại từng dây mạng bằng cách rút ra, cắm vào lại trong khi vẫn ping để xem dự phòng tốt không.
- Sau khi kiểm tra hết thì reboot một lần xem sau khi reboot nó có hoạt động ổn định không.
- check xong thì nhả IDRAC và báo về công ty check lại
- Ok rồi thì về