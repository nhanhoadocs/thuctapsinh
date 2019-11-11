# CÁCH TẠO FILE , THƯ MỤC TRONG LINUX :  
### Lệnh touch  

Lệnh **touch** dùng để tạo một file trống.  

touch filename.html  

Ngoài ra bạn có thể chỉ định nhiều tên file để tạo nhiều file cùng một lúc, chẳng hạn như:  

touch file.html style.css  

Các tùy chọn :  

**-a** : Thay đổi thời gian truy cập và chỉnh sửa file lần gần nhất  
**-c** : Không tạo thư mục mới   
**-m**: cập nhật thời gian lần chỉnh sửa cuối cùng   
**-t** : tạo file với timestamp mình muốn YYMMDDHHMM.SS  

### Lệnh mkdir
Lệnh **mkdir** dùng để tạo thư mục trong thư mục chúng ta đang làm việc
Tạo nhiều thư mục cùng một lúc : 
mkdir tech hello world

*Các tùy chọn* :  

**-p** : tạo thư mục kèm thư mục cấp cha dù thư mục cha chưa tồn tại .  
VD :  
`mkdir -p <path_name>`  
mkdir -p thumuccha/thumuccon  

**-v** : đưa ra thông báo mỗi directory được tạo ra  
VD :  
` mkdir -p -v <path_name>`  

**-m** : phân quyền truy cập cho thư mục mới tạo  
VD :  
` mkdir -p <permission_value> <path>`  

## Vi:  

Ứng dụng soạn thảo, chỉnh sửa text chính là 1 trong những công cụ hỗ trợ không thể thiếu. Không giống như Nano – ứng dụng chỉnh sửa text dưới dạng Terminal, Vi có hệ thống các phím tắt chức năng khá đa dạng và hữu ích, với 2 chế độ hoạt động chính là **Insert** và **Command**.  

**Chế độ Command**  

 Vi thực chất là ứng dụng soạn thảo bằng phương thức, và được mở bằng chế độ **Command**. 

  Khi ở trong chế độ **Command**, chúng ta có thể di chuyển con trỏ bằng cách nhấn phím mũi tên, nhấn x để xóa ký tự ngay dưới con trỏ, còn nhấn dd để xóa toàn bộ dòng ký tự. Bên cạnh đó, các bạn có thể lựa chọn, copy, cut và lưu đoạn text trong chế độ này. Di chuyển con trỏ sang bên trái hoặc phải của ký tự cần copy và nhấn phím v, nhấn x để cắt đoạn text, sau đó đặt con trỏ vào vị trí cần di chuyển đoạn text và nhấn p để paste.  

  **Chế độ Insert**  

Đây là chế độ hoạt động của Vi cho phép người dùng chèn thêm ký tự vào văn bản. Chỉ cần nhấn nút I là chúng ta đã chuyển sang chế độ **Insert** sau khi xác định vị trí con trỏ trong chế độ **Command**:
Khi nhập xong đoạn nội dung cần thiết, nhấn phím **Escape** để quay về chế độ Command.  

**Chế độ Visual**  

Chế độ này được được dùng kết hợp với Insert Mode để xử lý khối.  
  
  **Saving và Quiting**  

Các bạn có thể lưu và thoát ứng dụng trong chế độ **Command** (nhấn Escape để chắc chắn rằng chúng ta đã ở trong chế độ này). Gõ :wq để lưu file sau khi thay đổi và đóng Vi, hoặc thực hiện riêng rẽ thành 2 công đoạn, :w để lưu file và :q để thoát chương trình mà không lưu lại thay đổi. Nhưng Vi sẽ không cho người dùng đóng ứng dụng nếu đã thay đổi từ lần lưu cuối cùng, gõ lệnh :q! Và nhấn Enter để bỏ qua cảnh báo này:  


**Di chuyển giữa các ký tự** 

	* Bạn phải ở chế độ Command.  
	* Bạn có thể sử dụng các phím: Mũi tên lên, xuống, trái và phải.


Ngoài ra, bạn có thể sử dụng các phím khác:
| | |
|--|--|   
|k|Đưa con trỏ lên trên |  
|j|Đưa con trỏ xuống dưới |  
|h|Đưa con trỏ sang trái |
|l|Đưa con trỏ sang phải |  

**Các lệnh thông thường trong Vi**   
Lưu ý: Bạn phải ở chế độ Command.  
|Lệnh|Mô tả|  
|-|-|
|i|Chèn văn bản trước vị trí con trỏ hiện tại|  
|l|Chèn văn bản ở đầu dòng hiện tại . | 
|a|Chèn văn bản sau vị trí con trỏ hiện tại . |  
|A|Chèn văn bản ở cuối dòng hiện tại . |
|o|Tạo một dòng mới cho mục nhập văn bản bên dưới con trỏ .|
|O|Tạo một dòng mới cho mục nhập văn bản ở trên con trỏ .|
|x|Xóa kí tự bên dưới con trỏ .|
|X|Xóa ký tự trước con trỏ .|
|đ|Xóa dòng con trỏ đang được đặt .|
|cc|Xóa nội dung của dòng , để người dùng ở chế độ insert .|
|r|Thay thế ký tự bên dưới con trỏ .|