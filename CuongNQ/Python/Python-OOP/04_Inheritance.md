# Kế thừa - Inheritance
## **1) Tạo class kế thừa**
- **Class kế thừa ( *inheritance class* )** là **class** nâng cấp hơn một **class** đã có trước , cho phép sử dụng những gì mà **class** trước đó đã có .
- **VD :**
    ```py
    class SinhVien:
        pass
    class SinhVien_PTIT:
        pass
    
    sinh_vien_A = SinhVien_PTIT()
    print(sinh_vien_A)
    ```
    => Output :
    ```
    <__main__.SinhVien_PTIT object at 0x7fdc37071dd8>
    ```
## **2) Kế thừa thuộc tính**
- **VD :**
    ```py
    class SinhVien:
        tuoi = 18
        quan = "Thanh Xuan"
    class SinhVien_PTIT(SinhVien):
        truong = "PTIT"
        quan = "Ha Dong"
    sinh_vien_A = SinhVien_PTIT()
    print(sinh_vien_A.truong)         
    print(sinh_vien_A.tuoi)            # thuoc tinh ke thua
    print(sinh_vien_A.quan)            # thuoc tinh khong muon ke thua
    ```
    => Output :
    ```
    PTIT
    18
    Ha Dong
    ```
    => **Class** `SinhVien_PTIT` đã kế thừa thuộc tính `tuoi` của **class** `SinhVien` và không muốn kế thừa thuộc tính `quan` .
## **3) Kế thừa hàm constructor**
- Nếu ở **class kế thừa** có hàm **constructor** thì khi kế thừa **class** đó nghiễm nhiên đã có một hàm **constructor** , dùng như dùng ở **class kế thừa** .
- **VD1 :** Kế thừa hàm **constructor** :
    ```py
    class SinhVien:
        truong = "..."
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV
    
    class SinhVien_PTIT(SinhVien):
        truong = "PTIT"

    sinh_vien_A = SinhVien_PTIT("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(sinh_vien_A.__dict__)
    print(sinh_vien_A.truong)
    ```
    => Output :
    ```
    {'ten': 'Ngo Quoc Cuong', 'lop': 'VT1', 'MSV': 'B15VT049'}
    PTIT
    ```
- **VD2 :** Thay đổi hàm **constructor** :
    ```py
    class SinhVien:
        truong = "..."
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV
    
    class SinhVien_PTIT(SinhVien):
        truong = "PTIT"
        def __init__(self, para_ten, para_lop, para_MSV, para_nganh):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV
            self.nganh = para_nganh
        
    sinh_vien_A = SinhVien_PTIT("Ngo Quoc Cuong", "VT1", "B15VT049", "Vien Thong")
    print(sinh_vien_A.__dict__)
    print(sinh_vien_A.truong)
    ```
    => Output :
    ```
    {'ten': 'Ngo Quoc Cuong', 'lop': 'VT1', 'MSV': 'B15VT049', 'nganh': 'Vien Thong'}
    PTIT
    ```
- **VD3 :** Thay đổi hàm **constructor** sử dụng phương thức `super()` :
    ```py
    class SinhVien:
        truong = "..."
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV

    class SinhVien_PTIT(SinhVien):
        truong = "PTIT"
        def __init__(self, para_ten, para_lop, para_MSV, para_nganh):
            super().__init__(para_ten, para_lop, para_MSV)
            # Có thể thay bằng SinhVien.__init__(para_ten, para_lop, para_MSV)
            self.nganh = para_nganh

    sinh_vien_A = SinhVien_PTIT("Ngo Quoc Cuong", "VT1", "B15VT049", "Vien Thong")
    print(sinh_vien_A.__dict__)
    print(sinh_vien_A.truong)
    ```
    => Output :
    ```
    {'ten': 'Ngo Quoc Cuong', 'lop': 'VT1', 'MSV': 'B15VT049', 'nganh': 'Vien Thong'}
    PTIT
    ``` 
## **4) Kế thừa phương thức**
- Kế thừa phương thức hoàn toàn tương tự với kế thừa thuộc tính .
- Nếu **class kế thừa** có phương thức gì , sẽ được kế thừa toàn bộ . Nếu muốn thêm gì thì viết thêm . Nếu muốn chỉnh sửa thì viết lại phương thức đó .
- **VD :**
    ```py
    class SinhVien:
        truong = "..."
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV
        def show_truong(self):
            print("Truong :", self.truong)

    class SinhVien_PTIT(SinhVien):
        truong = "PTIT"
        quan = "Ha Dong"
        def __init__(self, para_ten, para_lop, para_MSV, para_nganh):
            super().__init__(para_ten, para_lop, para_MSV)
            self.nganh = para_nganh
        def show_truong(self):
            print("Truong : %s - Quan : %s" % (self.truong, self.quan))

    sinh_vien_A = SinhVien_PTIT("Ngo Quoc Cuong", "VT1", "B15VT049", "Vien Thong")
    print(sinh_vien_A.__dict__)
    print(sinh_vien_A.truong)
    sinh_vien_A.show_truong()
    ```
    => Output :
    ```
    {'ten': 'Ngo Quoc Cuong', 'lop': 'VT1', 'MSV': 'B15VT049', 'nganh': 'Vien Thong'}
    PTIT
    Truong : PTIT - Quan : Ha Dong
    ```