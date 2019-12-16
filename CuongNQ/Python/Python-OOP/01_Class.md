# Class
## **1) Khái niệm class ( lớp )**
- **Class** giống như là một bản mẫu , một khuôn mẫu . Ở đó ta khai báo các thuộc tính ( ***attribute*** ) và phương thức ( ***method*** ) nhằm miêu tả để từ đó ta tạo ra được những object ( ***đối tượng*** ) .
- Cú pháp :
    ```py
    class <ClassName>:
        # code
    ```
    > Theo chuẩn **PEP8** về đặt tên của lớp ( ***class*** ) thì sẽ được viết theo kiểu `CapWords` .
- **VD :**
    ```py
    class MyClass:
        x = 5

    print(MyClass)
    ```
    => Output :
    ```
    <class '__main__.MyClass'>
    ```
## **2) Thuộc tính**
- Khi khai báo thuộc tính cho một object , phải nghĩa ra những thuộc tính để mà giúp có thể phân biệt nó với những object khác cùng class .
- **VD :**
    ```py
    class SinhVien:
        pass

    Sinh_Vien_A = SinhVien()
    Sinh_Vien_A.ten = "Cuong"
    Sinh_Vien_A.lop = "VT1"
    Sinh_Vien_A.MSV = "B15VT049"
    print("Tên Sinh Viên :", Sinh_Vien_A.ten)
    print("Lớp :", Sinh_Vien_A.lop)
    print("Mã SV :", Sinh_Vien_A.MSV)
    ```
    => Output :
    ```
    Tên Sinh Viên : Cuong
    Lớp : VT1
    Mã SV : B15VT049
    ```
## **3) Hàm constructor ( initialize method )**
- Mục đích : giảm thiểu số dòng khai báo khi có quá nhiều object sử dụng class .
- Cú pháp :
    ```py
    class ClassName:
        def __init__(self):
            # code
    ```
- Đây là tên hàm được quy ước , mặc định nói với chương trình rằng đây là **constructor** . Trong **Python** , một số hàm trong **class** sẽ được tự động gọi khi khai báo một **object** và **constructor** là một trong số những hàm đó .
- Từ khóa `self` hay **parameter self** là một quy ước . Từ khóa này sẽ nhận giá trị chính là đối tượng đã gọi hàm đó .
- **VD :**
    ```py
    class SinhVien:
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    sinh_vien_B = SinhVien("Dinh Cong Hung", "VT1", "B15VT471")
    sinh_vien_C = SinhVien("Tran Van Hieu", "VT1", "B15VT153")

    print("Ten Sinh Vien:", sinh_vien_A.ten)
    print("Lop :", sinh_vien_A.lop)
    print("Ma Sinh Vien :", sinh_vien_A.MSV)
    print("Ten Sinh Vien:", sinh_vien_B.ten)
    print("Lop :", sinh_vien_B.lop)
    print("Ma Sinh Vien :", sinh_vien_B.MSV)
    print("Ten Sinh Vien:", sinh_vien_C.ten)
    print("Lop :", sinh_vien_C.lop)
    print("Ma Sinh Vien :", sinh_vien_C.MSV)
    ```
    => Output :
    ```
    Ten Sinh Vien: Ngo Quoc Cuong
    Lop : VT1
    Ma Sinh Vien : B15VT049
    Ten Sinh Vien: Dinh Cong Hung
    Lop : VT1
    Ma Sinh Vien : B15VT471
    Ten Sinh Vien: Tran Van Hieu
    Lop : VT1
    Ma Sinh Vien : B15VT153
    ```
## **4) Phương thức**
- Thông thường , khi nói tới hàm của **class** , người ta hay gọi là phương thức ( **method** ) .
- **VD :**
    ```py
    class SinhVien:
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
        def xin_chao(self):
            return "Xin chao, minh la " + self.ten

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")

    print(sinh_vien_A.xin_chao())
    ```
    => Output :
    ```
    Xin chao, minh la Ngo Quoc Cuong
    ```

