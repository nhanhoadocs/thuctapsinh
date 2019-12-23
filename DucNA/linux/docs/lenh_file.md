#Phân quyền và quản lý file trong centos7 

Hệ thống thư mục phân cấp gồm: 

1 thư 1 chính và các thư mục khác thuộc thư mục này 

Kiểm tra thư mục hiện tại:  pwd

Tạo thư mục: mkdir( tên thư mục) 

Copy thư mục và file : cp file1 file 2

Đổi tên thư mục và file: 	mv file1 file 2

Xóa file: rm (tên file) 

Xóa thư mục và file của nó: rm-rf (tên thư mục) 

	Lệnh chuyển thư mục đang dùng: cd (tên thư mục)

	Liệt kê tất cả các phần tử thuộc thư mục : ls 

	Khi đang đứng ở user nào đó muốn truy cập vào thư mục người dùng của nó: cd ~
	
	Tạo ra một file: touch (tên file)
	
	Thay đổi nội dung file: vi (tên file), esc + I. sửa xong lưu esc “ :wq! Enter 
	
	Mở xem file: cat + (tên file) hoặc more+ (tên file) và tail  -(số dòng) ( tên file) head giống tail nhưng từ trên xuống 
	
	Sự khác biết giữa more vè file: 

	+ cat: sẽ hiện thị tất cả 

	+ more: hiện thị theo trang. Đầu tiên sẽ hiển thị trang đầu tiên. Rồ ấn nút cách sẽ hiển thị từng trang tiếp theo 

	+ tail: sẽ xem trang từ cuối lên. Nếu không ghi số dòng hiện thị thì mặc định sẽ là 10 dòng. 

	Cách tạo một thư mục:mkdir ( tên file)

	•	Chú ý: ký tự đầu tiên của dòng khi liệt kê thì

		- : là file

		Muốn di chuyển file vào thư mục: mv ( tên file)  đường dẫn tuyệt đối  đến thư mục đấy 

		Muốn thay đổi quyền: chmod ( tham số) . thêm quyền dùng + và trừ ngược lại 

		-	a tham số cho tất cả các nhóm  

		-	o là tham số nhóm người tạo ra 

		-	g là tham số cho nhóm group order 

		-	u là tham số cho nhóm user 

