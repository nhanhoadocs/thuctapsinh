# I)	Linux basice security

Theo mặc định, Linux có 1 số loại account để cô lập các quy trình và công việc

•	root

•	system

•	normal

•	network

-	Để có 1 môi trường an toàn

	Cấp quyền phù hợp, tối thiếu cho  các tài khoản và xóa các tài khoản không sử dụng

Lệnh last 	-> show ra lần cuối các user đăng nhập -> Hộ trợ việc xác định các user để hệ thống xóa bỏ,…
 

## 1)	Tài khoản root

Là tài khoản đặc quyền nhất trên Linux-> có khả năng thực hiện tất cả hoạt động quản trị hệ thống (thêm,xóa,sửa người dùng,xem log,cài đặt ,…)


Có 2 cách để sử dụng quyền root để thực hiện 1 số hành động cần quyền  root đối với các user thông thường	-> su hoặc sudo

+) Với su	: Nhập mật khẩu của tk root( không được cấp cho người dùng thông thường)

	Mở terminal với tài khoản root

	Lúc này người dùng có quyền thực hiện bất kỳ thao tác gì đối với hệ thống mà không bị hỏi lại password

+) Với sudo 	:Nhập mật khẩu của chính user chứ không phải root

	Mỗi khi thực hiện những hành động cần quyền root thì lại hỏi lại password

## 2)	sudo command

Muốn 1 ng dùng thông thường có thể sử dụng sudo

	Cấu hình trong /etc/sudoers hoặc file trong /etc/sudoers.d (thường folder này trống)

Cú pháp:	who where = (as_whom) what

Sử dụng quyền sudo để chỉnh sửa /etc/sudoers
 
Loại bỏ dấu # trước %wheel để cấp quyền sudo cho các user thuộc group wheel
 
	có thể cấu hình riêng vs từng user  và để file cấu hình vào /etc/sudoer.d

## 3)	Cô lập Tiến trình

3 cơ chế:

-	Control Group

-	Linux Containers

-	Vỉtualization

## 4)	Mã hóa password

Linux sử dụng thuật toán SHA512 ( Thuật toán băm 512 bit) để mã hóa password

Thuật toán này được sử dụng chó các ứng dụng và giao thức bảo mật như ; TLS,SSL,PHP,SSH,S/MIME,IPSec

## 5)	password aging

PA là phương pháp đảm bảo rằng người dùng nhận được lời nhắc họ tạo password mới sau 1 khoảng thời gian cụ thể.

	Đảm bảo mật khẩu nếu bị bẻ khóa sẽ chỉ có thể sử dụng được trong 1 khoảng thời gian giới hạn

Sử dụng lệnh chage để thay đổi 
 

## 6)	Public/Private Keys cho việc Xác thực

Sử dụng Public/Private Keys cho việc Xác thực có 2 điểm lợi:

-	Không phải gõ lại password khi đăng nhập/remote tới server

-	Sau khi thiết lập cặp khóa xong có thể disable password -> không có khóa thì không đăng nhập được

  

id_rsa là private key

id_rsa.pub là public key
 
Sử dụng cặp khóa này ta có 2 cách:
C1: Cùng 1 publickey có thể lưu trên nhiều server-> chỉ cần bạn cầm privatekey -> đăng nhập các server đó

Copy nội dung file id_rsa.pub vào ~/.ssh/authorized_keys

Copy file private key qua máy Client

Thực hiện ssh sử dụng private keys đến server:

ssh -i ~/.ssh/id_rsa root@servermachine_IP

C2: 

Gửi nội dung file public key cho quản trị server

Dán nội dung đó vào file ~/.ssh/authorized_keys trên server

ssh đến server -> Lần đầu sẽ phải nhập password.Nhưng những lần sau sẽ không cần

