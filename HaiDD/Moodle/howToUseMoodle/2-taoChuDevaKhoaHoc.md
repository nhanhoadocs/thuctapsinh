# #2 - Hướng dẫn tạo Category (chủ đề hay thể loại) và các Course (khóa học)
-----


## Category và Course

- Category là chủ đề hay thể loại của bài giảng. Ta có thể dùng nó như là để chia các bài giảng từng khoa hay lớp, ...

- Mỗi Category đều có thể tạo các subCategory. Và mỗi subCategory đều có thể tạo thêm sub của nó.

- Mỗi Category có thể tạo ra các Course

- Mỗi Course sẽ chứa các Topic như các bài giảng, bài học, ...


# Category
## Tạo Category
1. Chọn  **Site administration** -> **Courses** -> **Manage courses and categories**

    <img src="..\images\Screenshot_21.png">


2. Trên giao diện **Manage courses and categories**, ta chọn **Create new category**

    <img src="..\images\Screenshot_22.png">

3. Trên giao diện thêm Category, ta chọn và điền các thông tin

    <img src="..\images\Screenshot_23.png">

    - *Parent category* : Category cha. Ở đây, ta tạo một Category lớn nên ta để là *Top*

    - *Category name* : Tên Category

    - *Category ID number* : Mã của Category

    - *Description* : Mô tả về Category

4. Nhấn chuột chọn **Create category**. Sau khi hệ thống tạo ta sẽ thấy Category ta vừa tạo

    <img src="..\images\Screenshot_24.png">

## Tạo subcategory
1. Tương tự tạo mới Category, nhưng ở bước đầu, chọn *Parent category* là Category mà ta muốn tạo subcategory

    <img src="..\images\Screenshot_25.png">

2. Sau khi tạo thành công, ta sẽ thấy cấu trúc phân cấp tương tự như sau:

    <img src="..\images\Screenshot_26.png">

# Tạo Course
Để tạo các khóa học hay các lớp, ta có sẽ làm như sau

### 1. Chọn  **Site administration** -> **Courses** -> **Add a new course**

<img src="..\images\Screenshot_27.png">

### 2. Giao diện **Add a new course**
#### Phần General
Thông tin cơ bản của một khóa học

<img src="..\images\Screenshot_28.png">

- *Course full name* : Tên đầy đủ của khóa học
- *Course short name* : Tên tóm tắt của khóa học
- *Course category* : Chọn Category.
- *Course start date* và *Course end date* : Thời gian bắt đầu và kết thúc của khóa học
- *Course ID number* : ID của khóa học. Nên tạo để sau có thể thêm thành viên vào khóa học một cách dễ dàng.

#### Phần Description
Mô tả của khóa học

<img src="..\images\Screenshot_29.png">

- *Course summary *: Phần mô tả của khóa học
- *Course image* : Hình ảnh mô tả khóa học

#### Course format
Định dạng khóa học.

<img src="..\images\Screenshot_30.png">

- *Format* : Kiểu khóa học. Ví dụ: theo Topic, Hoạt động đơn lẻ, hay theo tuần,...

- *Number of sections* : Số phần trong khóa học
 
- *Hidden sections* : Phần ẩn

- *Course layout* : Bố trí khóa học

### 3. Click chọn **Save and display**

Vậy là ta đã thêm thành công khóa học. Ra ngoài trang chủ ta sẽ thấy khóa học

<img src="..\images\Screenshot_31.png">

## Thêm thành viên vào khóa học
Để thêm thành viên vào khóa học, ta làm theo các bước sau:

1. Chọn khóa học

2. Trong giao diện của khóa học, ta chọn mục **Participants** -> **Enrol users**

    <img src="..\images\Screenshot_41.png">

3. Giao diện thêm enrol users hiện ra, ta chọn các users thêm vào, chọn role, và click **Enroll users**

    <img src="..\images\Screenshot_42.png">

    - **Assign role** : Chọn role cho user
        - *Manager* : Quản lí - có thể quản lí, thêm, sửa, xóa bài viết, users, ....
        - *Teacher* : Người có thể chỉnh sửa các bài giảng trong khóa học, thêm users
        - *Non-editing teache*r : Giảng viên dạy nhưng không có quyền chỉnh sửa khóa học hay tài liệu
        - *Student* : Người học

4. Sau khi thêm, ta sẽ thấy giao thông tin các thành viên trong khóa học

    <img src="..\images\Screenshot_43.png">


# Tham khảo
Tham khảo tại [docs của Moodle](https://docs.moodle.org/38/en/Main_page) trên trang chủ.