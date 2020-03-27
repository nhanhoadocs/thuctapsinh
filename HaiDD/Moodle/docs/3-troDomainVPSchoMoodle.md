# Hướng dẫn cấu hình domain trên ZoneDNS cho Moodle

# Yêu cầu

1. Sở hữu domain trên [Zone DNS](https://zonedns.vn/)
    - Thông tin về domain, cũng như mật khẩu truy cập sẽ có trong email mà bạn dùng để mua domain

    - Trong hướng dẫn dưới đây là domain : workfromhome.vn

2. Sở hữu VPS trên [Portal của Cloud365](https://portal.cloud365.vn/) và cài đặt Moodle trên CentOS-7.

    - Thông tin về tài khoản Portal sẽ được cung cấp qua email bạn đăng kí

    - IP public được đặt cho VPS

        <img src="https://i.imgur.com/f2G4cGU.png">

    - **Lưu ý** : Nếu chưa cài đặt Moodle. Bạn có thể xem hướng dẫn cài đặt Moodle tại : 
        - [Cài đặt Moodle trên CentOS-7 Step by step](https://news.cloud365.vn/cai-dat-moodle-3-8-1-tren-centos7/)

        - [Cài đặt sử dụng template Moodle của Cloud365](https://support.cloud365.vn/cloud-app/su-dung-template-moodle-tai-cloud365/)

## Mục tiêu bài viết
Trong bài viết này, Cloud365 sẽ hướng dẫn bạn thực hiện bước 1 và 2.

- Trỏ sub-domain e-learning.workfromhome.vn về IP public của VPS

- Sau khi thành công thì truy cập e-learning.workfromhome.vn sẽ dẫn tới trang Moodle được cài trên VPS của bạn

> # Các bước thực hiện cấu hình domain cho Moodle
**Bước 1**: Truy cập Moodle bằng địa chỉ IP

**Bước 2**: Trỏ domain về IP public của VPS cài đặt Moodle

**Bước 3**: Xử lí cấu hình Domain trên Moodle

**Bước 4**: Cài đặt Let's Encrypt cho hệ thống Moodle

-----

## **Bước 1**: Truy cập trang Moodle bằng IP
Khi VPS của bạn cài đặt xong Moodle, bạn sử dụng IP để truy cập tới trang Moodle mà bạn đã cài đặt:

<img src="https://i.imgur.com/udgRdFm.png">

## **Bước 2**: Trỏ domain về IP public của VPS cài đặt Moodle
1. Truy cập Zone DNS : https://zonedns.vn/ 

2. Đăng nhập bằng domain và mật khẩu đã được cấp trong email -> Click **Đăng nhập**

    <img src="https://i.imgur.com/kuqqbwj.png">

    Đăng nhập thành công sẽ có giao diện như sau:

    <img src="https://i.imgur.com/4aMnIY4.png">

3. Tạo bản ghi để trỏ sub-domain về IP của VPS đã cài sẵn Moodle

    <img src="https://i.imgur.com/BPWXVst.png">

    - 1 - Tên record : phần sub của domain. Ở đây là `e-learning`
    - 2 - Loại record : Ta chọn là bản ghi **A**
    - 3 - Giá trị record : IP public của VPS mà bạn sở hữu
    - 4 - Giá trị TTL : Thời gian tồn tại của record cấu hình tên miền được nhớ với máy chủ DNS trung gian. Ở đây, ta để là `300`

    - Click chọn **TẠO RECORD**.

4. Sau khi tạo thành công, ta sẽ thấy bản ghi được hiển thị

    <img src="https://i.imgur.com/wREsAVk.png">

5. Kiểm tra việc trỏ domain bằng trang [MXToolBox](https://mxtoolbox.com/NetworkTools.aspx)
    - Gõ domain e-learning.workfromhome.vn vào phần bản ghi A rồi Enter:
        
        <img src="https://i.imgur.com/D0w8S1d.png">

    - **Kết quả**: đã trỏ thành công domain về IP của VPS
        
        <img src="https://i.imgur.com/SLVvaLy.png">

6. Truy cập domain e-learning.workfromhome.vn

    <img src="https://i.imgur.com/udgRdFm.png">

    Vậy là ta đã có thể truy cập tới trang Moodle mà ta cài trên VPS bằng domain.

    Việc đăng nhập vào hệ thống Moodle thì đã có thông trong email đăng kí VPS mà bạn đăng kí.

Tuy nhiên, khi truy cập bằng domain thì trình duyệt vẫn mặc định hiển thị IP public của VPS.

Trong bài tiếp theo, Cloud365 sẽ hướng dẫn cấu hình domain trên VPS Moodle để giải quyết vấn đề này và hướng dẫn cài đặt **Let's Encrypt**