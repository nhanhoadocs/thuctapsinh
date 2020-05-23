# Các thao tác với phpMyAdmin

## I. Các thao tác cơ bản 
### 1. Tạo DB
Ở cột bên trái, click chọn **New** sau đó nhập vào tên CSDL của bạn, chọn kiểu mã hóa kí tự rồi chọn **Create**:

<img src="..\images\Screenshot_6.png">

Sau khi tạo thành công, ta sẽ thấy Database vừa tạo ở phần bên trái giao diện:

<img src="..\images\Screenshot_7.png">

### 2. Tạo bảng
- Chọn DB muốn tạo bảng

- Chọn phần Create table, nhập tên bảng, số cột của bảng rồi click **Go** để tiến hành tạo bảng

<img src="..\images\Screenshot_8.png">

- Sau đó, ta sẽ cấu hình các thuộc tính của bảng

<img src="..\images\Screenshot_9.png">

- **Các thuộc tính của cột**
    - **Name** – Tên của cột;
    - **Type** – Loại dữ liệu sẽ được lưu trong cột;
    - **Length/Values** – Độ dài của trường;
    - **Default** – tùy chọn giúp bạn đặt giá trị mặc định cho cột. Điều này sẽ hữu ích trong trường hợp bạn cần đặt dấu thời gian;
    - **Collation** – Đối chiếu dữ liệu cho từng trường;
    - **Attributes** – Gán bất kỳ thuộc tính đặc biệt nào cho trường;
    - **Null** – Xác định giá trị của trường có thể để trống hay không;
    - **Index** – Đặt chỉ mục cho các hàng;
    - **A_I** – viết tắt của Auto Increment. Nếu tùy chọn này được bật thì các giá trị trong trường của cột sẽ tự động tăng lên;
    - **Comments** – Ghi chú về cột

    <img src="..\images\Screenshot_11.png">
    
- Sử dụng **Preview SQL** để xem xem các thao tác trên dưới dạng câu lệnh truy vấn

    <img src="..\images\Screenshot_10.png">

- Chọn **Save** để lưu cấu hình với bảng. Sau khi Save, sẽ có giao diện như sau:

    <img src="..\images\Screenshot_12.png">

### 3. Vị trí đang làm việc
Ta có thể thấy nơi ta đang làm việc với database như hình bên dưới

<img src="..\images\Screenshot_17.png">

## II. Thao tác với Databases
### 1. Truy cập Database
Ta chọn Database ở list bên trái, hoặc vào tab Database rồi chọn Database cần truy cập

<img src="..\images\Screenshot_13.png">

<img src="..\images\Screenshot_14.png">

### 2. Xóa Database
Chọn Database, chọn tab **Operations** -> **Drop the database (DROP)**
<img src="..\images\Screenshot_15.png">

<img src="..\images\Screenshot_16.png">


## III. Thao tác với bảng
### 1. Xem bảng
Ta có thể click chuột vào tên bảng hoặc click vào **Browse**

<img src="..\images\Screenshot_18.png">

Sau đó, ta sẽ vào giao diện của bảng vừa chọn:

<img src="..\images\Screenshot_20.png">

### 2. Chỉnh sửa bản ghi trong bảng
Để chỉnh sửa bản ghi nào đó trong bảng, ta click chuột **Edit** tại bản ghi

<img src="..\images\Screenshot_19.png">

Ta sẽ thấy cấu trúc bản ghi kèm giá trị hiện tại, ta có thể chỉnh sửa và click **Go** để hoàn tất thay đổi.

<img src="..\images\Screenshot_21.png">

### 3. Thêm bản ghi
Ta có thể click **Insert** tại bảng cần thêm bản ghi

<img src="..\images\Screenshot_22.png">

Sau đó, ta sẽ thêm các bản ghi vào bảng rồi click chuột **Go** để thêm bản ghi

<img src="..\images\Screenshot_23.png">

Ta sẽ thấy bản ghi được thêm trong bảng

<img src="..\images\Screenshot_24.png">

### 4. Xóa bản ghi
Click chuột vào **Delete** trên bản ghi muốn xóa

<img src="..\images\Screenshot_25.png">

Click **OK** để xác nhận Xóa

<img src="..\images\Screenshot_26.png">

### 5. Làm trống bảng cơ sở dữ liệu
Để xóa hết dữ liệu bảng ta click **Empty**

<img src="..\images\Screenshot_27.png">

Click **OK** để xác nhận xóa

<img src="..\images\Screenshot_28.png">

### 6. Xóa bảng
Click **Drop** trên bảng để xóa

<img src="..\images\Screenshot_29.png">

Click **OK** để xác nhận

<img src="..\images\Screenshot_30.png">

## IV. Query
Ta có thể truy vấn dữ liệu thông qua các câu truy vấn.

Để làm điều này, ta chọn Tab **Query** rồi viết truy vấn. Click **Go** để chạy truy vấn.