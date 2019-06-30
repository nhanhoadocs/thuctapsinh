# Difference between su and sudo
- Thông thường, có hai cách để chạy các administrative applications trong Linux.
1. su ( super user )
2. sudo ( super user do )

- Cả su và sudo đều được sử dụng để chạy các lệnh có quyền root. Người dùng root về cơ bản tương đương với người dùng quản trị viên trên Windows - người dùng root có quyền tối đa và có thể làm bất cứ điều gì với hệ thống. Người dùng bình thường trên Linux chạy với quyền hạn bị giảm 
  - ví dụ, họ có thể cài đặt phần mềm hoặc ghi vào thư mục hệ thống.
- Để làm điều gì đó yêu cầu ta phải có các quyền này.

**1. su**
- Lệnh su dùng để chuyển sang siêu người dùng - hoặc người dùng root, tức là khi ta chạy lệnh su  ta phải nhập mật khẩu vào. Tuy nhiên, đây là tất cả các lệnh su thực hiện - ta có thể sử dụng nó để chuyển sang bất kỳ tài khoản người dùng nào. 
  - VD: su user1
  - passwd: 
  - Tức là chuyển sang dùng user1
- Để chạy một lệnh đơn với tư cách là người dùng root với su, hãy chạy lệnh sau:

``su -c lệnh ``

**2. sudo**  
- Lệnh sudo chạy một lệnh duy nhất với quyền root. Khi ta chạy lệnh sudo, hệ thống sẽ nhắc ta nhập mật khẩu tài khoản người dùng hiện tại trước khi chạy lệnh với tư cách là người dùng root. Theo mặc định, hệ điều hành sẽ nhớ mật khẩu trong 15 phút và yêu cầu mật khẩu một lần nữa cho đến khi hết 15 phút.

-  Để user có thể dùng được command ``sudo`` trước tiên ta phải thêm user vào tệp Sudoers. Vì
Chỉ các user thuộc loại quản trị viên trong hệ điều hành thì mới có thể chạy các lệnh bằng sudo.

![img](https://www.howtogeek.com/wp-content/uploads/2012/04/image196.png.pagespeed.ce.NxeKnXR7o0.png)

- Chuyển từ user về root ta cũng có thể dùng lệnh `` sudo -i `` hoặc `` su root ``.

**3. Tạo user và thêm vào group**
- B1: Đăng nhập vào root

`` su root ``
- B2: tạo user

`` adduser ten_user ``
- B3: Đặt pass cho user

`` passwd ten_user ``
- B4: join user vào group wheel có sẵn trong file sudoers của centOS
![img](https://scontent.fhan5-6.fna.fbcdn.net/v/t1.15752-9/62015558_368579090677726_2389569660027666432_n.png?_nc_cat=105&_nc_oc=AQmTnluwIo2e8gd1YaWxbbBDFU5rfRgW6ugfIGxGMgS1ZnLsHNwfvkhsDxREFb6WynQ&_nc_ht=scontent.fhan5-6.fna&oh=0080139bf1bdcf479caea3a26526e587&oe=5D55E769)

    `` usermod -aG wheel ten_user ``
 
- B5: Sau khi join xong check file group để xem.
![img](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/62314196_2063588703936695_8493854300982738944_n.png?_nc_cat=102&_nc_oc=AQmtzcj9_1YpRaSEeGSFgwV4o7t91xchLgFdWzmlRVsY2LjxJMfYDKVzf4swDRM0Mzs&_nc_ht=scontent.fhan5-2.fna&oh=4c6ad7ed4834dcf617602f2754824c6d&oe=5D57EC25)

- user1 và user2 đã join vào group wheel mặc định có sẵn trên centOS.
- Như vậy là đã có thể sử dụng command ``sudo`` cho user.

**Tổng kết**
- Sự khác biệt chính giữa su và sudo. Su chuyển ta đến tài khoản người dùng root và yêu cầu mật khẩu gốc của tài khoản. Sudo thì chạy một lệnh duy nhất với quyền root - nó không chuyển đổi sang người dùng root hoặc yêu cầu mật khẩu người dùng root riêng.
