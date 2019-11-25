# Các phương thức đặc biệt
## **1) Giới thiệu**
- **Phương thức đặc biệt ( *special method* )** , đôi khi còn được gọi là **magic method** hoặc **dunder method** .
- Những phương thức này đã được quy ước sẵn tên . Định dạng chung của các phương thức này là `__tên-phương-thức__` .
- Hàm **constructor** cũng là một **special method** .
- Có rất nhiều **special method** , mỗi **special method** lại có công dụng khác nhau .
## **2) Các phương thức đặc biệt**
### **2.1) `__init__`**
- Thường được sử dụng để tạo hàm **constructor** trong **class** :
- **VD :**
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(sinh_vien_A)
    ```
    => Output :
    ```
    <__main__.SinhVien object at 0x7ff5b29895f8>
    ```
### **2.2) `__str__`**
- Sử dụng để in ra string .
- **VD :** Thêm phương thức sau đây vào ví dụ trên :
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV
        def __str__(self):
            return 'Ho ten : {} - Lop : {} - MSV :{}'.format(self.ten, self.lop, self.MSV)

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(sinh_vien_A)
    ```
    => Output :
    ```
    Ho ten : Ngo Quoc Cuong - Lop : VT1 - MSV :B15VT049
    ```
### **2.3) `__repr__`**
- Công dụng tương tự như `__repr__` .
- Tuy nhiên , khi dùng hàm `print` , nếu như **class** có cả 2 phương thức `__str__` và `__repr__` thì hàm `print` ưu tiên dùng `__str__` hơn . Còn trên **interactive prompt** khi không dùng hàm `print` thì sẽ ưu tiên dùng `__repr__` hơn .
- **VD :**
    ```py
    def __str__(self):
            return 'Ho ten : {} - Lop : {} - MSV :{}'.format(self.ten, self.lop, self.MSV)
    ```
### **2.4) `__len__`**
- Sử dụng để đếm số ký tự trong chuỗi .
- **VD :**
    ```py
    s = "Hello World!"
    print(len(s))
    print(s.__len__())
    ```
    => Output :
    ```
    12
    12
    ```
### **2.5) `__add__`**
- Chính là toán tử `+` 
- **VD :**
    ```py
    print(2 + 3)
    print(int.__add__(2, 3))
    print('Hello' + 'World')
    print(str.__add__('Hello', 'World'))
    ```
    => Output :
    ```
    5
    5
    HelloWorld
    HelloWorld
    ```
### **2.x**) [Các phương thức khác](https://docs.python.org/3/reference/datamodel.html#special-method-names)
