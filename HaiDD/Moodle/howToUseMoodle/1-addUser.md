# #1 - Thêm user vào trang Moodle

## Yêu cầu
- Sử dụng tài khoản có quyền **Admin User**

----

# Thêm một user vào hệ thống
## 1. Đăng nhập vào hệ thống với Admin User
Sau khi đăng nhập vào hệ thống Moodle với tài khoản Admin User. Chọn mục **Site administration** -> **Users** -> **Add a new user**

<img src="..\images\Screenshot_1.png">

Ta có giao diện thêm User mới

<img src="..\images\Screenshot_2.png">

## 2. Mục General
**Các mục có dấu **!** là những mục bắt buộc phải điền, không được để trống**

1. Username : Tên đăng nhập để người dùng truy cập vào hệ thống

2. Choose an authentication method : Chọn phương thức xác thực

    <img src="..\images\Screenshot_4.png">

    **Ta quan tâm 3 kiểu sau**
    - *Email-based self-registration* : tự đăng kí qua email. Khi chọn mục này sẽ có email để đăng kí tài khoản
    - *Manual accounts* : Tài khoản thông thường cài đặt thủ công
    - *No login* : Tài khoản không đăng nhập

    <img src="..\images\Screenshot_3.png">

    **Các tùy chọn khác:**

    <img src="..\images\Screenshot_5.png">

    - *Suspended account* : Chọn option này thì user sẽ bị suspended

    - *Generate password and notify user* : Tự động sinh mật khẩu ngẫu nhiên và gửi về email đăng kí


3. New password : 

    <img src="..\images\Screenshot_6.png">

- Nếu bạn tích vào chọn *Generate password and notify user* thì sẽ không thể nhập password

- Còn không, ta click vào để đặt pass. 

- **Yêu cầu**: Password phải có ít nhất 8 kí tự. Bao gồm: số, chữ hoa, chữ thường, kí tự đặc biệt

- *Force password change* : Lựa chọn này sẽ bắt buộc người dùng đổi mật khẩu khi đăng nhập lần đầu tiên.

4. First name : Tên của người dùng

5. Surname : Họ của người dùng

6. Email address : Email người dùng để đăng kí tài khoản.

7. City/town : Thành phố

8. Select a country : Chọn quốc gia

9. Timezone : Múi giờ

10. Preferred language : Ngôn ngữ sử dụng

11. Description : Mô tả về người dùng

## 3. Mục User picture
Một số lựa chọn về ảnh đại diện cho user

<img src="..\images\Screenshot_7.png">


## 4. Mục Additional names : Thông tin thêm về tên user

<img src="..\images\Screenshot_8.png">

## 5. Mục Interests:  Sở thích của user

<img src="..\images\Screenshot_9.png">

## 6. Mục Optional
Một số thông tin thêm không bắt buộc

<img src="..\images\Screenshot_10.png">

## 7. Click **Create user**

<img src="..\images\Screenshot_11.png">

Sau khi add, ta có thể thấy user được tạo

<img src="..\images\Screenshot_12.png">

----
# Thêm nhiều user một lúc

Giả sử cần thêm một khóa đào tạo. Các sinh viên của khóa học này chưa có tài khoản truy cập hệ thống. Việc thêm tài khoản cho từng người rất tốn thời gian. Vì vậy, ta cần có giải pháp.

Moodle cung cấp cho ta tính năng thêm user theo file giúp ta có thể thêm một lượng lớn user mà tốn ít thời gian.

### 1. Chuẩn bị thông tin các user cần tạo
- Tạo file với các cột cần thiết như sau: `username`, `firstname`, `lastname`, `email`. Lưu file với định dạng `.csv`

    Ví dụ:

    <img src="..\images\Screenshot_13.png">

    File này hoàn toàn có thể để sinh viên tự cung cấp thông tin, phần `username` có thể để là mã sinh viên,... để tránh bị trùng lặp

### 2. Tiến thành thêm user
- Truy cập trang moodle của mình và đăng nhập vào hệ thống với tài khoản admin

- Chọn **Site administration** -> **Users** -> **Upload users**

    <img src="..\images\Screenshot_14.png">

- Giao diện **Upload users**

    <img src="..\images\Screenshot_15.png">

    - Example text file : file mẫu để upload. Ta có thể tải file này về và thay đổi dữ liệu của mình

    - *File* : chọn file để upload lên

    - *CSV delimiter* : Kiểu dấu phân cách

    - *Encoding* : Kiểu mã hóa kí tự. Ta sử dụng UTF-8

    - *Preview rows* : Số hàng xem trước

- Ta chọn file có sẵn dữ liệu đã chuẩn bị ở bước 1 -> **Upload users**

- Kiểm tra lại thông tin 

    <img src="..\images\Screenshot_16.png">

    - Kiểm tra một số tùy chọn trước khi tạo như kiểu upload, password user, ....

    - **Upload type**: Kiểu upload

        <img src="..\images\Screenshot_17.png">
        - *Add neww only, skip existing users* : chỉ thêm những user mới, bỏ qua những user đã trùng
        
        - *Add all append number to usernames if needed* : Thêm số phụ vào tài khoản nếu cần

        - *Add new and update existing users* : thêm mới và cập nhật lại thông tin với những user trùng với user hiện có. (Hãy cân nhắc khi sử dụng)

        - *Update existing users only*: chỉ update thông tin user đã có trong hệ thống.

    - **New user password** : Password mới cho user

        <img src="..\images\Screenshot_18.png">
        
        - Field required in file : Nếu file có trường password, thì n sẽ import password từ file cho các user

        - Create password if needed and send via email : Tự động tạo password và gửi đến email cho người dùng.

    
- Click chọn **Upload user**

    <img src="..\images\Screenshot_19.png">

- Sau khi upload user, ta sẽ thấy giao diện kết quả với một số thông tin cơ bản. 

- Các thông tin tài khoản cũng như mật khẩu sẽ được gửi về mail của người đăng kí để sử dụng đăng nhập.

## Tham khảo
Trên đây chỉ là hướng dẫn cơ bản về cách thêm user vào hệ thống Moodle. 

Xem thêm tại [docs của Moodle](https://docs.moodle.org/38/en/Main_page).