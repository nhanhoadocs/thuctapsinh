# Tìm hiểu về vi và vim 
# VI 
- VI : Là viêt tắt của từ video interactif là chương trình soạn thảo văn bản 
	- Vi có 2 chế độ hoạt động 
		- Command mode: chế độ lệnh 
		- Insert mode: chế độ soạn thảo văn bẳn giúp ghi vả sửa văn bản 
	- Một số thao tác lệnh tệp tin 
		- Lệnh xóa 

			- `x` Hoặc  delete: xóa 1 ký tự 
			- `dd` xóa 1 dòng 
			- `2dd` xóa 2 dòng 
			- `dw` xóa 1 từ bên phải con trỏ 
			- `db` xóa từ bên trái con trỏ 
		- Lệnh lưu và thóat 
			- `:w` lưu và không thoát VI
			- `:w newfile.txt` lưu file đang làm việc sang file mới 
			- `:wq` lưu và thóat VI
			- `:q!` không lưu và thóat VI 
		- Tìm kiếm và thay thế
			- `/text1` tìm kiếm từ text 1 từ trên xuống 
			- `?text1` tìm kiếm từ text 1 từ dưới lên 
			- `n` để nhảy đến kết quả tìm kiếm tiếp theo
# VIM 
- Vim: là một trình biên soạn nâng cao và chỉ được cài đặt sẵn ở linux và unix
- Vim có hai chế độ làm việc đó là commit và insert 
	- Commit: cung cấp một số hướng dẫn cho vim làm một số hành động như xóa 1 dòng, hoặc tìm kiếm 1 từ. khi khởi động file mặc định sẽ ở chế độ commit để vào chế độn insert ta ấn nút i hoặc insert
	- Insert : Ta có thể chỉnh sửa văn bản tại đây. khi ở cuối có chữ INSERT có nghĩa là bạn đã và chế độ insert và sẵn sàng để biên soạn một file để quay lại chế độ commit thì ta ấn ESC
	- Sau khi chỉnh sửa văn bản xong muốn thoát và lưu ta phải về chế độ commit và ấn một số  câu lệnh sau đây
		- `:q`  thoát mà không lưu 
		- `:wq` thoát và lưu
		- `x:` lưu và thóat
		
 