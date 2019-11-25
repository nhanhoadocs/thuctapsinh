# Các phương thức class
## **1) Regular method**
- Thông thường **parameter** được nhận nhiệm vụ nhận **argument** đó ta sẽ đặt là `self` . Những phương thức có mặc định **parameter** `self` được gọi là các **regular method** ( phương thúc thường ) .
## **2) Class method**
- Nếu **regular method** có **argument** đầu tiên tự động đưa vào là **object** đó và được nhận bởi **parameter** `self` thì ở **class method** , **argument** đầu tiên được tự động đưa vào chính là **class** gọi phương thức đó hoặc là **class** của **object** gọi phương thức đó .
- Theo quy ước thì **parameter** nhận **argument** này sẽ là `cls` .
- Để **Python** biết được phương thức nào là **class method** thì nên thêm `@classmethod` vào ngay trên dòng khai báo hàm .
- **VD :**
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
        @classmethod
        def update_truong(cls, university):
            cls.truong = university

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    print(SinhVien.truong)
    print(sinh_vien_A.truong)

    SinhVien.update_truong("TLU")
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
- Tuy nhiên , đây không phải là ứng dụng chính của **class method** . Chúng thường được sử dụng để tạo **object** . Trong trường hợp cần xử lý thuật toán phức tạp , cần xử lý thông tin khác và biến chúng thành **argument** truyền vào các phương thức .
- **VD :**
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, para_ten, para_lop, para_MSV):
            self.ten = para_ten
            self.lop = para_lop
            self.MSV = para_MSV
        @classmethod
        def from_string(cls, s): # thường những xử lý như thế này thường tên là from...
            lst = s.split('-')
            new_lst = [st.strip() for st in lst]
            ten, lop, MSV = new_lst
            return cls(ten, lop, MSV)

    infor_str = "Ngo Quoc Cuong - VT1 - B15VT049"
    sinh_vien_A = SinhVien.from_string(infor_str)
    print(sinh_vien_A.__dict__)
    print(sinh_vien_A.ten)
    print(sinh_vien_A.lop)
    print(sinh_vien_A.MSV)
    ```
    => Output :
    ```
    {'ten': 'Ngo Quoc Cuong', 'lop': 'VT1', 'MSV': 'B15VT049'} 
    Ngo Quoc Cuong
    VT1
    B15VT049
    ```

## **3) Static method**
- **Regular method** được ngầm gửi vào **argument** là chính **object** gọi phương thức và ta sử dụng **parameter** `self` để xử lý những vấn đề khác . **Class method** được ngầm gửi vào **argument** là chính **class** gọi phương thức và ta sử dụng **parameter** `cls` để xử lý những vấn đề khác . Còn với **static method** thì không gửi vào nó gì cả , nó chỉ như một hàm bình thường .
- Có thể không cần tạo **static method** mà tạo luôn hàm ở ngoài **class** . Tuy nhiên , **static method** vẫn tồn tại vì đôi khi cần tới sự khoa học , logic , một số phương thức chẳng có sử dụng tí gì tới những thông tin của đối tượng thuộc lớp đó nhung vẫn có gì đó liên quan nên vẫn được đặt ở trong **class** đó .
- Để **Python** biết được phương thức nào là **static method** thì nên thêm `@staticmethod` vào ngay trên dòng khai báo hàm .
- **VD :**
    ```py
    class SinhVien:
        truong = "PTIT"
        def __init__(self, ten, lop, MSV):
            self.ten = ten
            self.lop = lop
            self.MSV = MSV
        @staticmethod
        def xinchao():
            print("Xin chao moi nguoi")

    sinh_vien_A = SinhVien("Ngo Quoc Cuong", "VT1", "B15VT049")
    SinhVien.xinchao()
    ```
    => Output :
    ```
    Xin chao moi nguoi
    ```

> ## **Chú ý :**
- Nếu cần dựng một phương thức cần sử dụng **object** đó thì sử dụng **regular method** .
- Nếu cần dùng **class** thì sử dụng **class method** .
- Trường hợp còn lại ( không dùng gì ) thì sử dụng **static method** .
