# Khai báo thuộc tính Class
## **1) Khai báo và sử dụng**
- Thuộc tính cho một đối tượng về bản chất chính là các biến .
- Việc khai báo biến trong một **class** cũng tương tự như khai báo biến trong 1 **function** hay một block nào đó .
- **VD :** 
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(SinhVien.truong)
    print(sinh_vien_A.truong)
    ```
    => Output :
    ```
    PTIT
    PTIT
    ```
    => Nhận xét : `truong` tương tự như 1 biến global . Tất cả các **object** trong **class** `SinhVien` sẽ đều nhận thuộc tính `truong = "PTIT"` .
## **2) Cập nhật giá trị thuộc tính thông qua class**
- Khi thay đổi giá trị một thuộc tính được khai báo trong **class** thông qua **class** thì thuộc tính ở toàn bộ **object** thuộc **class** đó sẽ được cập nhật lại giá trị mới được thay đổi .
- **VD1 :**
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(SinhVien.truong)
    print(sinh_vien_A.truong)

    SinhVien.truong = "TLU"
    print(SinhVien.truong)
    print(sinh_vien_A.truong)
    ```
    => Output :
    ```
    PTIT
    PTIT
    TLU
    TLU
    ```
- **VD2 :** Cập nhật giá trị tăng dần trong hàm `__init__` :
    ```py
    class SinhVien:
        truong = "PTIT"
        stt = 1
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
            self.stt = SinhVien.stt
            SinhVien.stt += 1

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    sinh_vien_B = SinhVien("Dinh Cong Hung", "VT1", "B15VT471")

    print(sinh_vien_A.stt)
    print(sinh_vien_B.stt)
    print(SinhVien.stt)
    ```
    => Output :
    ```
    1
    2
    3
    ```
    => Nhận xét : giá trị `SinhVien.stt` sẽ tăng lên 1 đơn vị sau khi mỗi **object** được tạo ra .
## **3) Cập nhật giá trị thuộc tính thông qua object**
- Khi thay đổi giá trị thuộc tính của một đối tượng , chỉ có giá trị đó bị thay đổi , còn **class** sẽ không bị ảnh hưởng , các **object** được tạo ra sau đó cũng không bị ảnh hưởng .
- **VD :**
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(SinhVien.truong)
    print(sinh_vien_A.truong)

    sinh_vien_A.truong = "TLU"
    print(SinhVien.truong)
    print(sinh_vien_A.truong)
    ```
    => Output :
    ```
    PTIT
    PTIT
    PTIT
    TLU
    ```
    => Nhận xét : chỉ có thuộc tính `truong` của **object** `sinh_vien_A` bị thay đổi .
## **4) Sử dụng thuộc tính trong các phương thức**
- Khi khai báo thuộc tính của một đối tượng ở ngay trong **class** luôn thì nó vẫn chỉ là thuộc tính , vì thế vẫn có thể sử dụng nó bình thường như những thuộc tính được khởi tạo trong hàm **constructor** .
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