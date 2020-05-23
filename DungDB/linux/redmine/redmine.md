# Redmine
## Cài đặt redmine theo tài liệu

https://news.cloud365.vn/huong-dan-cai-dat-redmine-tren-centos-7/#7

## Hướng dẫn cơ bản

https://news.cloud365.vn/redmine-huong-dan-su-dung-redmine-de-quan-ly-cong-viec-phan-1/#workflow-img

https://news.cloud365.vn/redmine-huong-dan-su-dung-redmine-de-quan-ly-cong-viec-phan-2/

### Đổi theme

Đầu tiên lựa chọn các theme để tải về ở đây

https://www.redmine.org/projects/redmine/wiki/Theme_List

1. Vào thư mục `/var/www/redmine`

    #cd /var/www/redmine

2. Giải nén và copy theme đã tải về vào thư mục

    #cp PurpleMine2-master.zip /var/www/redmine/public/themes

    #cd /var/www/redmine/public/themes

    #unzip PurpleMine2-master.zip

3. Khởi động lại ứng dụng redmine

    #touch tmp/restart.txt

    hoặc refresh trang redmine.

4. Chọn theme

    "Administration" > Settings"

![Imgur](https://i.imgur.com/1XzYcVf.png)

    Sau đó, chọn "Display". Tại "Theme", chọn theme vừa thêm vào.

![Imgur](https://i.imgur.com/6VB8Icf.png)

    Sau đó chọn "Save để lưu lại thay đổi".

![Imgur](https://i.imgur.com/76Km4lp.png)

    Giao diện đã được thay đổi.

![Imgur](https://i.imgur.com/oWmq7m8.png)

### Tạo custome field

Tạo một trường tùy ý, thêm các mục tại các phần như Project, Issues, User, v.v... để làm việc tại các phần này cụ thể và dễ dàng hơn.

Ví dụ: Thêm mục giới tính tại phần User để thêm phần giới tính khi tạo user.

- Từ tài khoản Admin, chọn "Administration" > "Custom fields" để tạo một custom field mới.

![Imgur](https://i.imgur.com/nB6Kybg.png)

- Chọn "New custom field"

![Imgur](https://i.imgur.com/f3oZuuG.png)

- Ở đây có nhiều mục để bạn chọn, ở ví dụ này chọn "Users" rồi nhấn "Next".

![Imgur](https://i.imgur.com/PuZMyKU.png)

- Tại đây có nhiều format để lựa chọn tùy theo nhu cầu của bạn. Ở ví dụ này tôi chọn "List".

![Imgur](https://i.imgur.com/EKM5vUQ.png)

- 1: Chọn format: List
- 2: Tên của Custom field
- 3: Mô tả
- 4: Có thể chọn nhiều giá trị
- 5: Điền vào các giá trị muốn thêm
- 6: Giá trị mặc định. (Nếu để trống thì ban đầu sẽ không hiển thị giá trị nào)
- 7: Đường link liên quan đến custom field này
- 8: Hiển thị theo dạng checkbox hoặc drop-down-list
- 9: Bắt buộc sửa phần này trước khi lưu
- 10: Hiển thị
- 11: Có thể chỉnh sửa
- 12: Dùng như một bộ lọc

![Imgur](https://i.imgur.com/DG5f9LH.png)

![Imgur](https://i.imgur.com/aba6pvK.png)

Sau khi chọn xong, Nhấn "Create" để tạo.

Sau khi tạo xong. Khi tạo một User mới sẽ nhìn thấy xuất hiện một bảng chọn Giới tính ở đây.

![Imgur](https://i.imgur.com/DstoRhg.png)

Thử tạo một custom field khác để thêm số điện thoại trong phần "Users"

![Imgur](https://i.imgur.com/cpm12VF.png)
