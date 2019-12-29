### Thêm quyền sudo cho user trong Centos  
Mục lục
 #### 1. [Tìm hiểu về root và user trong Linux](#1)  
 #### 2. [Thêm quyền sudo cho user](#2) 

<a name ="1"></a>  
1. Tìm hiểu về root và user trong Linux

*root* là tên tài khoản có đặc quyền cao nhất trong hệ thống *nix.  
*root* có quyền lực lớn nhất và tuyệt đối, nó có thể truy cập được đến bất kì file nào trong hệ thống và thực thi mọi câu lệnh.  
*root* có quyền cấp phát và thu hồi các quyền hạn truy cập file cho các user khác, bao gồm cả các file mặc định dành riêng cho root.    

Trong hệ thống *nix ngoài tài khoản *root* duy nhất còn có thể có rất nhiều tài khoản user thường (normal user). Hệ thống phân quyền trong *nix mặc định cấm các normal user truy cập, thay đổi cấu hình các khu vực trọng yếu trên hệ thống và dữ liệu cá nhân thuộc về các user khác.  
Thường thì user chỉ có thể đọc file mà không có quyền ghi bất kì vào *root directories*.  
Lệnh sudo cung cấp những quyền mà chỉ tài khoản *root* mới có thể thực thi. Trong phần tiếp theo chúng ta sẽ tìm hiểu cách gán quyền sudo cho 1 tài khoản user.  
<a name="2"></a>

2. Thêm quyền sudo cho user  
- Trước tiên ta sẽ tạo 1 tài khoản user mới có tên là *kma* và đặt mật khẩu. Sử dụng câu lệnh sau:  
```
# useradd kma  
# passwd kma
Changing password for user kma.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```
Sau khi cài đặt mật khẩu thành công ta tiến hành kiểm tra tài khoản *kma* đã có quyền *sudo* hay chưa bằng cách đăng nhập vào tài khoản *kma* và gõ lệnh *useradd bka*.   

Hệ thống sẽ báo lỗi "Permission denied" bởi vì tài khoản kma đang không có quyền thực thi lệnh `useradd`.     

Khi thêm sudo vào trước lệnh `useradd bka` thì hệ thống báo tài khoản *kma* không có trong file *sudoers*.

Để gán quyền *sudo* cho user *kma* ta đăng nhập vào root rồi add tài khoản *kma* vào group *wheel* (Mặc định các tài khoản trong group *wheel* được quyền thực thi tất cả các lệnh khi thêm sudo vào trước command)    
```
# usermod -G wheel kma
```
Tiếp tục đăng nhập vào tài khoản *kma* và thực hiện lệnh *sudo useradd bka* ta sẽ tạo được một user mới có tên *bka*

Như vậy ta đã thành công trong việc thêm quyền sudo cho 1 normal user.





