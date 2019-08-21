# Users and Groups
## **1) Quản trị Users**
- Trên Linux có 2 loại user :
    - **User hệ thống**
    - **User người dùng**
- **User hệ thống** : dùng để thực thi các module , script cần thiết phục vụ cho hệ điều hành .
- **User người dùng** : là những tài khoản để login sử dụng hệ điều hành .
- Trong các tài khoản người dùng thì tài khoản user `root` ( ***super user*** ) là tài khoản quan trọng nhất :
    - Tài khoản này được tự động tạo ra khi cài đặt Linux . 
    - Tài khoản này không thể đổi tên hoặc xóa bỏ .
    - User `root` còn gọi là ***super user*** vì nó có full quyền trên hệ thống .
    - Chỉ làm việc với user `root` khi muốn thực hiện công tác quản trị hệ thống , trong các trường hợp khác , chỉ nên làm việc với user thường .
- Mỗi user thường có đặc điểm như sau :
    - Tên tài khoản user là duy nhất , có thể đặt tên *chữ thường , chữ hoa* .
    - Mỗi user có 1 mã định danh duy nhất ( **uid** ) .
    - Mỗi user có thể thuộc về nhiều group .
    - Tài khoản ***super user*** có **uid**=**gid**=`0` .
### **1.1) File `/etc/passwd`**
- Là file văn bản chứa thông tin về các tài khoản user trên máy .
- Mọi user đều có thể đọc tập tin này nhưng chỉ có user `root` mới có quyền thay đổi .
- Để xem nội dung file ta dùng lệnh :
    ```
    # cat /etc/passwd
    ```
- Cấu trúc file gồm nhiều hàng , mỗi hàng là 1 thông tin của user . Dòng đầu tiên của tập tin mô tả thông tin cho user `root` ( có **uid**=`0` ) , tiếp theo là các tài khoản khác của hệ thống , cuối cùng là tên các tài khoản người dùng bình thường . Mỗi hàng được chia thành `7` cột cách nhau bằng dấu `:` <br><br>
    <img src=https://i.imgur.com/yF07I26.png>
- Ý nghĩa các cột trong file :
    - `1` - Tên user ( ***login name*** )
    - `2` - Mật khẩu group đã được mã hóa ( vì có file `/etc/shadow` ) nên mặc định ở đây là `x`
    - `3` - User ID ( ***uid*** )
    - `4` - Group ID ( ***gid*** )
    - `5` - Tên mô tả người sử dụng ( ***comment*** )
    - `6` - Thư mục home của user ( thường là `/home/user_name` )
    - `7` - Loại shell sẽ hoạt động khi user login , thường là `/bin/bash`
### **1.2) File `/etc/shadow`**
- Là tập tin văn bản chứa thông tin về mật khẩu của các tài khoản user lưu trên máy .
- Chỉ có user `root` mới có quyền đọc tập tin này .
- User `root` có quyền reset mật khẩu của bất cứ user nào trên máy .
- Mỗi dòng trong tập tin chứa thông tin về mật khẩu của user , định dạng của dòng gồm nhiều cột , giá trị , dấu `:` được sử dụng để phân cách các cột .

    <img src=https://i.imgur.com/9N0aDM1.png>

- Ý nghĩa các cột : 
    - `1` - Tên user , giống với trong `/etc/passwd` ( ***login name*** )
    - `2` - Mật khẩu đã được mã hóa
        - Để trống ( *empty* ) - không có mật khẩu
        - `*` - tài khoản bị tạm ngưng ( *disable* )
    - `3` - Số ngày kể từ lần cuối thay đổi mật khẩu ( tính từ `1/1/1970` )
    - `4` - Số ngày trước khi có thể thay đổi mật khẩu . Giá trị `0` có nghĩa có thể thay đổi bất cứ lúc nào .
    - `5` - Số ngày mật khẩu có giá trị . `99999` có nghĩa mật khẩu có giá trị vô thời hạn .
    - `6` - Số ngày cảnh báo user trước khi mật khẩu hết hạn
    - `7` - Số ngày sau khi mật khẩu hết hạn tài khoản sẽ bị khóa . Thường có giá trị là `7` ( 1 tuần )
    - `8` - Số ngày kể từ khi tài khoản bị khóa ( tính từ `1/1/1970` )
### **1.3) Các lệnh quản lý user**
### **1.3.1) `useradd`**
- Là lệnh tạo tài khoản user .
    ```
    # useradd [options] [login_name]
    ```
    - **Options :**
        - `-c` : ***comment*** : tạo bí danh
        - `-u` : ***set user ID*** : mặc định sẽ lấy số ID tiếp theo để gắn cho user ( bắt đầu từ `1000` )
        - `-d` : chỉ định thư mục home cho user
        - `-g` : chỉ định group chính
        - `-G` : chỉ định group phụ ( group mở rộng )
        - `-s` : chỉ định shell cho user sử dụng
- **VD1 :** Tạo user với tên `Will` và tên đầy đủ là `Will Smiths` :
    ```
    # useradd -c "Will Smiths" will
    ```
    => User được tạo sẽ thuộc về group `will` và thư mục home của user là `/home/will` được tạo ra tự động .
- **VD2 :** Tạo user với tên `justice` và tên đầy đủ là `Justice Smiths` , user thuộc nhóm users và các nhóm `wheel` , `sales` :
    ```
    # useradd -g users -G wheel,sales -c "Justice Smiths" justice
    ```
### **1.3.2) `passwd`**
- Là lệnh đặt / đổi password cho user
    ```
    # passwd [login_name]
    ```

    <img src=https://i.imgur.com/TYEfRRE.png>

### **1.3.3) `usermod`**
- Là lệnh sửa thông tin tài khoản .
    ```
    # usermod [options] [login_name]
    ```
    - **Options :**
        - `-c` : ***comment*** : tạo bí danh
        - `-d` : thay đổi thư mục home cho user
        - `-m` : di chuyển nội dung từ thư mục home cũ sang thư mục home mới ( chỉ dùng với `-d` )
        - `-g` : chỉ định group chính
        - `-G` : chỉ định group phụ ( group mở rộng )
        - `-s` : chỉ định shell cho user sử dụng
        - `-l` : đổi tên tài khoản
        - `-L` : khóa tài khoản
- **VD :** Đổi tên tài khoản `will` thành `jaden` ( `Jaden Smiths` ) với thư mục home của user là `/home/jaden`
    ```
    # usermod -l jaden -c "Jaden Smiths" -m -d /home/jaden will
    ```
### **1.3.4) `userdel`**
- Là lệnh xóa tài khoản user
    ```
    # userdel [options] [login_name]
    ```
    - **Options :** 
        - `-r` : xóa cả thư mục home của user
- Khi xóa tài khoản user bằng lệnh `userdel` , dòng mô tả tương ứng của user trong tập tin `/etc/passwd` và `/etc/shadow` cũng bị xóa .
### **1.3.5) `chage`**
- Dùng để thiết lập chính sách ( ***policy*** ) cho user
    ```
    # chage [options] [login_name]
    ```
    - **Options :**
        - `-l` : xem chính sách của 1 user
        - `-E` : thiết lập ngày hết hạn cho account
        - `-I` : thiết lập ngày bị khóa sau khi hết hạn mật khẩu ( định dạng ngày tháng là `YYYY-MM-DD` )
        - `-m` : thiết lập số ngày tối thiểu được phép thay đổi password 
        - `-M` : thiết lập số ngày tối đa được phép thay đổi password
        - `-W` : thiết lập số ngày cảnh báo trước khi hết hạn mật khẩu
- **VD1 :** Xem policy của user :
    ```
    # chage -l jaden
    ```

    <img src=https://i.imgur.com/r8kFK64.png>
- **VD1 :** : Thiết lập policy cơ bản :
    ```
    # chage -E 2019-08-30 -m 5 -M 90 -I 30 -W 14 jaden
    ```
    => Lệnh trên sẽ thiết lập mật khẩu hết hạn vào ngày `30/4/2019` . Ngoài ra , số ngày tối thiểu / tối đa giữa các lần thay đổi mật khẩu trong khoảng `5` và `90` . Các tài khoản sẽ bị khóa sau `30` ngày sau khi hết hạn , và 1 tin nhắn cảnh báo sẽ được gửi ra `14` ngày trước khi hết hạn mật khẩu .

    <img src=https://i.imgur.com/w9cNWQx.png>
- **VD2 :** : Thiết lập tắt chính sách hết hạn mật khẩu :
    ```
    # chage -I -1 -m 0 -M 99999 -E -1 jaden
    ```
    => Lệnh trên sẽ set "`Password inactive`" -> `never` ( không bị hết hạn mật khẩu ) ( thông số `-1` ); số ngày tối thiểu / tối đa giữa các lần đổi mật khẩu là vô hạn ( `0` -> `99999` ) ; Tài khoản không bao giờ bị hết hạn ( "`Account expires`" -> `never` ) ( thông số `-1` ) => **ĐÂY LÀ THIẾT LẬP MẶC ĐỊNH**
- **VD3 :** Thiết lập bắt buộc user đổi mật khẩu trong lần đầu đăng nhập :
    ```
    # chage -d 0 jaden
    ```
    => Lệnh trên sẽ thiết set "`Last Password Change`" thành "`Password must be changed`" và user bắt buộc phải đổi mật khẩu ngay lần đầu đăng nhập .

    <img src=https://i.imgur.com/Efghpbn.png>

    <img src=https://i.imgur.com/MDnOG46.png>
### **1.3.6) `id`**
- Xem thông tin user hiện hành .

    <img src=https://i.imgur.com/Ff82soj.png>

### **1.3.7) `su`**
- Chuyển đổi user làm việc từ terminal .
- User `root` chuyển qua các user khác thì không cần nhập mật khẩu .
- User khác chuyển qua user `root` thì phải nhập password của user `root` .
    ```
    # su -l [login_name]
    ```
- Chuyển đổi từ user thường sang user `root` :

    <img src=https://i.imgur.com/wTRBMzA.png>
## **2) Quản trị Group**
- Group là tập hợp của nhiều user .
- Mỗi group có 1 tên duy nhất và 1 mã định danh duy nhất ( ***gid*** ) .
- Khi tạo ra 1 user ( không dùng option `-g` ) thì mặc định 1 group mang tên user được tạo ra .
### **2.1) File `/etc/group`**
- Là tập tin văn bản chứa thông tin về các group trên máy .
- Mọi user đều có quyền đọc tập tin này nhưng chỉ có user `root` mới có quyền thay đổi .
- Mỗi dòng tập tin chứa thông tin về 1 group trên máy , định dạng của dòng gồm nhiều cột giá trị , dấu `:` được sử dụng để phân cách giữa các cột .

    <img src=https://i.imgur.com/B0BCYZG.png>

- Ý nghĩa các cột :
    - `1` - Tên group
    - `2` - Mật khẩu group đã được mã hóa ( vì có file `/etc/gshadow` ) nên mặc định ở đây là `x`
    - `3` - Mã nhóm ( ***gid*** )
    - `4` - Danh sách các user nằm trong nhóm
### **2.2) File `/etc/gshadow`**
- Chứa thông tin password của group .

    <img src=https://i.imgur.com/Vt6E9jd.png>

- Ý nghĩa các cột :
    - `1` - Tên group
    - `2` - Mật khẩu group đã được mã hóa 
        - Để trống ( *empty* ) - không có mật khẩu
    - `3` - Danh sách các user có quyền admin trên group này
    - `4` - Danh sách các user có trong group
### **2.3) Các lệnh quản lý group**
### **2.3.1) `groupadd`** 
- Là lệnh tạo group .
    ```
    # groupadd [options] [group_name]
    ```
    - **Options :**
        - `-g [gid]` : định nghĩa nhóm cùng mã nhóm ( ***gid*** )
### **2.3.2) `gpasswd`**
- Tạo mật khẩu cho group .
    ```
    # gpasswd [group_name]
    ```
### **2.3.3) `groupmod`**
- Là lệnh sửa thông tin group .
    ```
    # groupmod [options] [group_name]
    ```
    - **Options :** 
        - `-g [gid]` : sửa lại mã nhóm ( ***gid*** )
        - `-n [group_name]` : sửa lại tên group
### **2.3.4) `groupdel`**
- Dùng để xóa 1 group .
    ```
    # groupdel [group_name]
    ```
> ## **Thay đổi các thông số mặc định**
- Khi sử dụng lệnh `useradd` hoặc `groupadd` , nếu chúng ta không liệt kê đầy đủ các thông số cần thiết thì hệ thống sẽ lấy theo giá trị mặc định đã được định nghĩa .
- Chúng ta có thể thay đổi định nghĩa những giá trị này trong các file sau :
    - `/etc/login.defs` : file chứa thông số mặc định khi tạo user hoặc tạo group .

        <img src=https://i.imgur.com/eXfWfkP.png>

    - `/etc/skel/` : tất cả những file và thư mục con trong này sẽ được copy sang thư mục home của user mới tạo .

        <img src=https://i.imgur.com/XmDQICQ.png>