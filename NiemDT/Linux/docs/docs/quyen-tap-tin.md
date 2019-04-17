# Phân quyền với thư mục và file trong linux

Trong linux chia làm 2 kiểu người dùng là `user` và `root`

 * Trên 1 máy chạy hệ điều hành linux chỉ có duy nhất 1 tài khoản `root` và có thể có rất nhiều `user`

 * Tài khoản `root` thường được do người quản trị nắm giữ.
 
 * Tài khoản `root` có quyền cao nhất. Nó có thể làm bất cứ điều gì nó muốn.
 
 * Tài khoản `user` được người quản trị cấp và nó sẽ bị giới hạn một số quyền. VD như nó không được phép động vào hệ thống mà nó chỉ có quyền với các file và thư mục do nó tạo ra,
 các file và thư mục được mà nó được cấp quyền.
 
Trong linux bất kỳ một file hoặc một thư mục nào cũng chia ra 3 quyền cho 3 nhóm người dùng khác nhau.

## Ba quyền là quyền:

 * Read `r` là quyền chỉ được đọc đối với thư mục hoặc file
	
 * Write `w` là quyền được ghi đối với thư mục hoặc file
	
 * Excuted `x` là quyền thực thi đối với thư mục hoặc file. Quyền này thể hiện rõ đối với các file thực thi và các thư mục. 
	
## Ba nhóm người dùng là:

 * Người sở hữu với thư mục hoặc file (user). Thường mặc định được cấp cho người tạo ra thư mục hoặc file.
	
 * Nhóm sở hữu thư mục hoặc file (group). 
	
 * Những người dùng còn lại (other). Là những người dùng không phải người sở hữu và không có tên trong nhóm sở hữu thư mục hoặc file đó.

## Các lệnh cơ bản với user và group:

 * Tạo user: `useradd tên_user`
	
 * Đặt password cho user: `passwd tên_user`
	
 * Tạo group: `groupadd tên_group`
	
 * Đặt mật khẩu cho group: `gpasswd tên_group`
	
 * Thêm 1 user vào 1 group: `usermod -G tên_group tên_user`
	
 * Xóa 1 user ra khỏi 1 group: `gpasswd -d tên_user tên_group`
	
 * Xem danh sách các user: đứng ở thư mục /home gõ lệnh `ll`
	
 * Xem danh sách các group: `cat /etc/group`
	
 * Xem 1 user thuộc những group nào: `groups tên_user` khi ở tài khoản root hoặc lệnh `groups` để xem user của mình nằm trong những group nào.
	
 * *Lưu ý:* có thể tạo được nhiều user và nhiều group. Một user có thể tham gia vào được nhiều group.
	
## Các lệnh để thay đổi quyền đối với thư mục

 * Để xem các quyền của một thư mục hoặc một file: ` ls -l tên_thư_mục_hoặc_file`. *Chú ý* tên thư mục hoặc file ở đây là đường dẫn đến với thư mục hoặc file đó.
	
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/1.png)

 * Nhóm thứ nhất ở đây là quyền của người sở hữu, nhóm thứ hai là quyền nhóm sở hữu, nhóm thứ ba là quyền của những user còn lại.
	
 * Các quyền thể hiện lần lượt là `rwx` nếu không có quyền nào thì vị trí đó được thay bằng dấu `-`
	
 * Để thêm quyền cho đọc cho nhóm sở hữu với 1 thư mục: `chmod g+r tên_thư_mục ` . Tương tự thay quyền khác thì ta chỉ cần thay `r` bằng `w` hoặc `x`. Muốn bỏ quyền gì
	thì ta thay dấu `+` bằng dấu `-`. Muốn đổi quyền đối với người sở hữu thì ta thay `g` bằng `u`, đổi quyền cho những người còn lại thì thay `g` bằng `o`.
	
 * Muốn thay đổi người sở hữu cho thư mục hoặc file: `chown tên_user tên_file`. *Chú ý* lệnh này phải thực hiện trên user root.
	
 * Thay đổi nhóm sở hữu cho thư mục hoặc file: `chgrp tên_group tên_thư_mục`. Lệnh này cũng chỉ thực hiện được trên user root.