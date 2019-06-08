# Phân quyền và cấp quyền 

[ 1.Tổng quan ](#tongquan)

[ 2.Về user ](user)

[ 3.Một vài tham số ](#note)

[ 4.Cấp quyền cho user ](#capquyen)

<a name="tongquan">

# 1.Tổng quan 

- Hệ thống người dùng ở trong centos 7 gốm 2 loại:

	-	Root ( là tài khoản có quyền cao nhất trong hệ thống) 
	
		- Để thao tác với hệ thống người dùng thì phải đứng ở bên root.
	
	-	User : Là tài khoản mà được người quản trị cấp cho nhưng bị giới hạn bởi các quyền 
	
		- Khi một tài khoản user thường muốn dùng lệnh tác động lên user thì có thể dùng lệnh ` sudo ` mà không cần cấp quyền đặc biệt 
		
		- Một user bình thường muốn dùng được lệnh `sudo` thì cần được cấp quyền để sử dụng đó là bằng cách tạo ra một group và cấp quyền cho group rồi thêm user vào group được cấp quyền và tài khoản này sẽ được gọi là administrator
		
		- Tất cả thông tin của root và user đều  được lưu trong một file để kiểm tra file thì dùng câu lệnh

		- `Cat /etc/group`: thông tin về các tài khoản root

		- lệnh `Cat`: mở file 

			ví dụ: `Cat	/etc/passwd`

- `Clear`: xóa màn hình 

- Để tạo ra một group : `groupadd (tên group)`

- Để xóa một group : `groupdel ( tên group)`

<a name="user">

# 2.VỀ USER

- Một group có thể chứa nhiều user và một user có thể thuộc nhiều group

- Một user có thể thuộc tối đa 17 group : 1 primary group và 16 secondary group 

- Để tạo ra một user: `useradd ( tên user)`

- Xóa user là: `userdel (tên user)`

- Khi tạo ra một user thì nó sẽ được mặc định cấp cho 1 thư mục trong home

- Kiểm tra xem có bao nhiêu user : `ls –l`

- Khi tạo ra một user thì sẽ có 1 group mặc định được tao ra cùng tên với user 

- Kiểm tra user thuộc group nào: `groups (tên user)`
 
- Đổi pass user: `passwd (tên user)`

- Các tham số để thay đổi thông tin

<a name="note">

# 3.Một vài tham số cần lưu ý: 

-c thêm thông tin cho user 

-d thư mục đăng nhập mới của người dùng. Nếu kết hợp với –m thì nội dung thư mục chính của user sẽ được chuyển vào lưu trữ tại thư mục mới này 

-a thêm user vào các group khác chỉ sử dụng  cho –G

-e thêm vào ngày mà tài khoản sẽ bị vô hiệu hóa 

-f cài đặt số ngày tài khoản bị vô hiệu hóa sau khi mật khẩu hết hạn

-g thay đổi primary group của user 

-G thêm secondary group  cho user 

-l thay đổi tên user 

-L khóa mật khẩu user 

-m di chuyển đến vị chí mới 

-u tạo một id mới cho user  

-o cho phép thêm một giá trị nếu dùng với –u thì  sẽ thêm một id mới 

-U mở khóa mật khẩu user khi chưa bị hết hạn 

<a name="capquyen">

# 4.Cấp quyền cho user và group

- Ta dùng lệnh `chmod`

- Để có quyền đọc viết hoặc chỉnh sửa một file thì mỗi user cần được user root cấp quyền cho mới có thể thự thi được 

	- Quyền đọc: r = 4
	
	- Quyền Viết: w = 2 
	
	- Quyền thực thi: x = 1
	
- Kí tự - đầu tiên là một cờ đặc biệt để chỉ loại file, - với file thông thường, d với thư mục, c với thiết bị, l với liên kết (liên kết tới một file khác).

- o+rws: cho phép user sở hữu có full quyền

- g+rw: cho phép group sở hữu có quyền đọc và ghi

- u+w: cho phép các user còn lại có quyền đọc

- a+rws: cho phép toàn bộ user có full quyền (777)
