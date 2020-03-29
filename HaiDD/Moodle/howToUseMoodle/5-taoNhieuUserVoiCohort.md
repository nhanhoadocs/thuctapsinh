# Hướng dẫn tạo và phân quyền số lượng lớn User trên Moodle với Cohort


# Đặt vấn đề
Việc thêm một vài tài khoản user vào khóa học thì rất đơn giản. Nhưng nếu là hệ thống lớn có số lượng học sinh lớn và nhiều lớp cũng như khóa học thì việc thêm bằng tay không khả thi.

Chính vì vậy, ta cần một giải pháp. Moodle cho phép ta nhóm hàng loạt user vào các nhóm khác nhau để dễ dàng thêm học sinh vào các khóa học khác nhau bằng cách sử dụng tính năng **Cohort**.

Cohort sẽ định các user theo các nhóm khác nhau. Một corhort sẽ có nhiều user và một user có thể ở trong nhiều cohort khác nhau.

# Mô hình ví dụ
Hệ thống Moodle quản lí các lớp học của một trường THPT có 3 khối lớp được xây dựng theo Category như hình dưới đây.

<img src="https://i.imgur.com/YDY2QHm.png">

- Trong lớp **12A1** sẽ có 2 khóa học như sau: **Văn 12A1** và **Toán 12A1**

    <img src="https://i.imgur.com/1lRDhD8.png">

- Trong lớp **11A1** sẽ có 1 khóa học là : **Anh 11A1**

    <img src="https://i.imgur.com/8StytJ9.png">
 
Bây giờ, ta sẽ thêm một danh sách các học sinh lớp 12A1 và 11A1 vào hệ thống. Rồi sau đó sẽ thêm vào từng môn của lớp.


# Các bước thực hiện
## Bước 1: Tạo Cohort
- Chọn **Site Administrator** -> **Users** -> **Cohorts**

    <img src="https://i.imgur.com/fld7DWs.png">

- Chọn tab **Add new cohort** sau đó điền các thông tin của Cohort bạn tạo -> Click **Save changes**

    <img src="https://i.imgur.com/gseskeP.png">

    **Trong đó:**

    - 2 : Name : Tên của Cohort
    - 3 : Context : Phạm vi của Cohort. Ở đây, ta chỉ để trong phạm vi lớp học.
    - 4 : Cohort ID : Mã của Cohort. Cần đặt dễ nhớ để sử dụng
    - 5 : Description : Mô tả

- Sau khi tạo xong ta sẽ thấy danh sách các Cohort ở tab **All Cohorts** như hình dưới.

    <img src="https://i.imgur.com/S0irgwy.png">

    - Cohort ID của Lớp 11A1 : **HS11A1**
    - Cohort ID của Lớp 12A1 : **HS12A1**

**Lưu ý:** Ta có thể thêm hàng loạt Cohorts bằng cách sử dụng file như thêm user. Xem thêm tại [đây](https://docs.moodle.org/38/en/Upload_cohorts).

## Bước 2: Thêm các user (học sinh) vào các Cohort đã định nghĩa ở trên
### **Cách 1**: Thêm thẳng các user trên hệ thống
- Tại tab **All cohorts** -> chọn **Assign**

    <img src="https://i.imgur.com/XYWf9zQ.png">

- Chọn các user cần thêm ở bên ô **Potential users** -> chọn **Add**

    <img src="https://i.imgur.com/9bX6pZ3.png">

- Sau khi add thành công, ta sẽ thấy các user ở bên cột **Current users**

    <img src="https://i.imgur.com/tEBJcze.png">

### **Cách 2**: Thêm hàng loạt user bằng file `.csv`
- Chuẩn bị file `.csv` là danh sách các sinh viên như cách [thêm hàng loạt users](https://news.cloud365.vn/moodle-hdsd-1-huong-dan-them-tai-khoan-nguoi-dung-vao-he-thong-moodle/).

- **Lưu ý**: thêm trường là `cohort1`, `cohort2`,... : trường này ghi Cohort ID được gán cho user
    - Lớp 11A1:

        <img src="https://i.imgur.com/cW4z9Rj.png">

    - Lớp 12A1:

        <img src="https://i.imgur.com/oWChMls.png">

- Add user sử dụng 2 file trên vào hệ thống. Cách thêm có thể xem tại [bài viết này](https://news.cloud365.vn/moodle-hdsd-1-huong-dan-them-tai-khoan-nguoi-dung-vao-he-thong-moodle/).
    
    <img src="https://i.imgur.com/5rVM14K.png">

    <img src="https://i.imgur.com/Z6G9DiV.png">

## Bước 3: Thêm danh sách học sinh vào các khóa học
- Chọn khóa học cần thêm học sinh

    <img src="https://i.imgur.com/d0qWju8.png">

- Chọn **Participants** -> click **Enrol users**

    <img src="https://i.imgur.com/PQrTv6A.png">

- Tại phần **Select cohorts**, ta chọn Cohort tương ứng với khóa học -> click **Enrol selected users and cohorts**

    <img src="https://i.imgur.com/fmYgTIK.png">

- Sau đó, ta sẽ thấy các user học sinh của lớp được thêm vào.

    <img src="https://i.imgur.com/XSsmeaQ.png">

- Làm tương tự với các môn của từng lớp còn lại.

    - **Môn Toán Lớp 12A1**:

        <img src="https://i.imgur.com/yKQA2ql.png">

    - **Môn Anh Lớp 11A1**:

        <img src="https://i.imgur.com/Iv6wxeU.png">

# Kết luận

Trên đây là cách thêm user theo nhóm vào các khóa học trên Moodle.