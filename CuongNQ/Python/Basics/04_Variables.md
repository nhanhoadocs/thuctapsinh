# Biến trong Python
- Trong lập trình , `biến` ( **variable** ) là tên của 1 vùng trong bộ nhớ RAM , được sử dụng để lưu trữ thông tin . Có thể gán thông tin cho 1 biến , và lấy thông tin đó ra để sử dụng . Khi một biến được khai báo , một vùng trong bộ nhớ sẽ dành cho các biến .
- `Biến` cực kỳ quan trọng và không thể thiếu trong bất cứ chương trình lớn nhỏ nào .
## **1) Khởi tạo `biến` trong Python**
### **1.1) Đặc điểm của `biến`**
- Tên `biến` không được bắt đầu bằng số
- Tên `biến` không được trùng với các từ khóa của **Python**
- Tên `biến` chỉ chứa các chữ cái , số và dấu `_`
- Tên `biến` có phân biệt chữ hoa và chữ thường . **VD :** `PI` , `pi` , `pI` , `Pi` là 4 biến khác nhau
### **1.2) Khởi tạo 1 `biến`**
- Cú pháp :
    ```py
    <tên_biến> = <value>
    ```
- **VD :**

    <img src=https://i.imgur.com/G9ZxWtW.png>

### **1.3) Khởi tạo nhiều `biến`**
- Cú pháp :
    ```py
    <tên_biến_1>, <tên_biến_2>, <tên_biến_3>,..... = <value_1>, <value_2>, <value_3>,.....
    ```
- **VD :**

    <img src=https://i.imgur.com/0j3ckMZ.png>

## **2) Kiểm tra kiểu dữ liệu của biến**
- **Python** có 5 kiểu dữ liệu :
    - **`Numbers`**
    - **`String`**
    - **`List`**
    - **`Tuple`**
    - **`Dictionary`**
- Không như đa số các ngôn ngữ lập trình khác, khi khai báo biến phải đi kèm với kiểu dữ liệu. Trong **Python** việc khai báo kiểu dữ liệu cho biến không cần thiết mà **Python** sẽ tự biết kiểu dữ liệu của giá trị gán cho biến .
- Để kiểm tra kiểu dữ liệu giá trị của 1 biến đã khởi tạo , ta sử dụng hàm `type()` . Cú pháp :
    ```py
    type(<tên_biến>)
    ```
- **VD :**

    <img src=https://i.imgur.com/m04iBlR.png>
