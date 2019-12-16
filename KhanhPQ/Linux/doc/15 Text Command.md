# I)	Text commands
Linux cung cấp 1 số tiện ích cho các thao tác với file và văn bản

+) Hiển thị nội dung: 	cat,echo

+) Chỉnh sửa nội dung file:	sed,awk

+) Tìm kiếm:	grep

## 1)	Hiển thị nội dung
Lệnh cat	-> Đọc nội dung các file ngắn,nhỏ ; Đọc từ trên xuống

Lệnh tac 	-> Tương tự cat nhưng đọc nội dụng từ dưới lên

Lệnh echo		-> hiển thị đoạn text đơn giản 
 
## 2)	Chỉnh sửa nội dung file

+)Lệnh sed	(stream editor)

	 là một công cụ xử lý văn bản mạnh mẽ

	lọc văn bản và thực hiện sửa đổi

	Lấy dữ liệu từ input (source/file/stream) đưa vào working space; sau đó sửa đổi rồi đưa ra output space ( hoặc stream)
 	 

+) Lệnh awk	
>	 trích xuất, hiển thị, xử lý 1 nội dung cụ thể của tệp

>	Hoạt động tốt với các trường (tương tự 1 cột) và các record (1 tập các trường / 1 dòng)
 

	Để ý $0 $1 $2 -> tương đương với tất cả các cột/cột 1/cột 2
## 3)	Thao tác với file
Lệnh sort  	-> sắp xếp lại các dòng của tệp văn bản theo thứ tự tăng dần hoặc giảm dần (theo bảng chữ cái,không phân biệt hoa thường)

Lệnh uniq -> loại bỏ các dòng trùng lặp trong văn bản ( kết hợp cùng với sort)
 
  -c : đếm số lần xuất hiện


Lệnh paste 	-> ghép dữ liệu từ các trường trên các file khác nhau
 
Chú ý : khi đồng nhất cần chú ý độ dài các trường -> việc chênh lệch độ dài có thể dẫn đến việc dữ liệu không đồng nhất trên các cột
Lệnh join -> kết hợp các trường từ 2 file khác nhau . chỉ join trên các trường giống nhau
 
Lệnh grep 	-> công cụ tìm kiếm văn bản. Nó quét các tệp và tìm các mẫu được chỉ định
 
Lệnh tr		->  chuyển các ký tự thành 1 ký tự khác ,hoặc xóa chúng
 
Lệnh tee	-> lấy output từ bất kỳ command khi chúng đứa ra stdout nào và lưu vào 1 file
 
Lệnh wc	(word count)-> đếm số dòng, từ, ký tự ( -l , -w, -c)
      
Lệnh cut	-> Trích xuất các cột(trường) văn bản
 
Lệnh head	-> đọc  10(default) hoặc n dòng đầu tiên của file (-n)

Lệnh tail	->hiển thị 10(default) hoặc n dòng cuối của file
 

