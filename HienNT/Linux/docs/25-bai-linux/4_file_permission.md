# I - Quản trị user, group trên Linux  
### User là gì?  
\- User là người có thể truy cập đến hệ thống.  
\- User có username và password.  
\- User có 2 loại: super user và regular user.  
\- Mỗi user đều có 1 giá trị định danh được gọ là UID.  
\- Định danh của người dùng bình thường sử dụng giá trị bắt đầu từ 500.  

### Group là gì?  
\- Group là tập hợp của nhiều user.  
\- Mỗi user luôn là thành viên của 1 group.  
\- Khi tạo 1 user thì mặc định 1 group cũng được tạo ra.  
\- Mỗi group còn có 1 định danh riêng được gọi là GID.  
\- Định danh của group thường sử dụng giá trị từ 500.  

## 1.Các file dữ liệu  
### 1.1. /etc/passwd: lưu thông tin tài khoản của người dùng  
- Khảo sát thông tin user  
`#cat /etc/passwd hoặc #cat /etc/passwd | more`  
==> Mỗi user tạo ra được lưu trên 1 dòng.  

 ***Cấu trúc file:***  
 **UserName : Password : UserID : Group ID : Comments : HomeDirectory : Shell**  
Trong đó:  
    \- Username: tên đăng nhập của người dùng, có phân biệt HOA/thường; nên sử dụng chữ thường.  
    \- Password: lưu chuỗi password đã mã hóa, nếu có sử dụng /etc/shadow thì ở đây sẽ là chữ x.  
    \- User ID: hệ thống dùng user id để phân biệt người này với người khác.  
    \- Group ID: nhóm của user này.  
    \- Comment: mô tả cho user.   
    \- HomeDirectory: thư mục home của từng user.  
    \- Shell: tên chương trình sẽ chạy thực thi ngay sau khi user login vào. Nếu không có shell thì user sẽ không thể login vào.  

 
- Khi tạo 1 user thì mặc định tạo ra 1 group cùng tên và chứ user đó.  
- user id = 0 là user root.  
\+ id = 1 - 99 ==> dùng cho system service.  
\+ id = 100 -499 ==> dùng cho system cài thêm.  
\+ id >= 500 ==> dùng cho user và group thường.  

### 1.2. /etc/shadow: lưu thông tin mật khẩu của người dùng.  
`#cat /etc/shadow`  
**root:$6$VPjOJxdySUjgLpFl$ikOFllvIkdiq1kYlpfskE6l9LZzLG9K0893FJHSQ6k53tBf9chpPIgNBgbyRjhrq.00DIaOqjKvwdJhh6OY1m.::0:99999:7:::** 

***Thứ tự thông tin:*** username, password đã được mã hóa,
 ngày đổi password gần nhất(1/1/1970 + số ngày đến ngày hôm nay), 0(1 ngày sau mới có thể đổi password), 1(không gia hạn đổi password).  

### 1.3. /etc/default/useradd  

<img src = "../../images/25 bai linux/useradd.png">    
Nội dung file:  

- GROUP: là ID của group mặc định mà user sẽ được đưa vào khi tạo ra.    
- HOME: đường dẫn mặc định chứa các thư mục của từng thành viên khi tạo ra.    
- INACTIVE: Thời gian mà tài khoản sẽ bị khóa vĩnh viễn sau khi mật khẩu user đó hết hạn.  
- EXPIRE: Ngày mà tài khoản của thành viên được tạo ra mặc định sẽ bị khóa.  
- SHELL: hệ vỏ mặc định mà user được sử dụng. Hiểu đơn giản, đây là môi trường giúp người dùng gõ và thực thi các câu lệnh Linux.  
- SKEL: thư mục mẫu, khi user được tạo ra mặc định sẽ copy các file trong đây vào /home/tên-user.  
- CREATE_MAIL_SPOOL: cho phép thành viên được sử dụng mail trên server nếu tùy chọn là yes. Mail sẽ được lưu trong fle /var/mail/tên-user hoặc /var/spool/mail/tên-user.  

### 1.4. /etc/group  

<img src = "../../images/25 bai linux/group.png">  

*Cấu trúc:*  
**GroupName : Password : GroupID : User1,User2,…**  
 \- GroupName: tên nhóm  
 \- Password: lưu chuỗi password, được ghi là x.  
 \- Group ID: ID của nhóm.  
 \- User1, User2,...: Danh sách các user nằm trong group này, ngăn cách nhau bằng dấu ",".  

## 2.Quản lý user  
- **useradd** - tạo user  
Options:  
\- c: comment(chú thích)  
\- d: home directory(thư mục cá nhân)  
\- G: đưa user vào group  
\- M: không tạo thư mục cá nhân  
\- n: không tạo primary group, user tạo ra sẽ được đưa vào user group  
\- s: chỉ định shell  

-  **passwd** -  đặt password cho user  
\- l: lock user  
\- u: unlock user  
\- d: disable password

- **userdel** - xóa user
\- r: xóa luôn thư mục cá nhân  

***Ví dụ:***   

    - Tạo user u1,u2,u3 có home directory là thư mục /home  


<img src = "../../images/25 bai linux/taouser.png">  

    - Tạo user v1 có home directory là thư mục /IT  

<img src = "../../images/25 bai linux/taouserthumuc.png">   

- Đặt password cho user  

<img src = "../../images/25 bai linux/passwd.png">  


## 3. Quản lý group  
groupadd - tạo group  
groupdel - xóa group  


















## File permissions - Quyền truy cập tệp  




## TÀI LIỆU THAM KHẢO  
- https://support.maxserver.com/009025-H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-ph%C3%A2n-quy%E1%BB%81n-t%E1%BA%ADp-tin-v%C3%A0-th%C6%B0-m%E1%BB%A5c-tr%C3%AAn-Linux
- 