# Kiểu dữ liệu số
## **1) Numbers**
- Trong **Python** hỗ trợ rất nhiều kiểu dữ liệu số ( ***numeric*** ) . Một số kiểu dữ liệu cơ bản như **số nguyên** ( *`integer`* ) , **số thực** ( *`floating-point`* ) , **phân số** ( *`fraction`* ) , **số phức** ( *`complex`* ) , 
### **1.1) Số nguyên**
- **Số nguyên** bao gồm các số nguyên dương (`1`,`2`,`3`,...) , các số nguyên âm ( `-1`,`-2`,`-3`,...) và số `0` .
- Trong **Python** , kiểu dữ liệu **số nguyên** cũng không có gì khác biệt .
### **1.2) Số thực**
- **Số thực** ( *`float`* ) là tập hợp các **số nguyên** ( *`integer`* ) và các số thập phân ( *`decimal`* )
- **VD :** Gán giá trị số thực :
    ```py
    >>> Pi = 3.14
    ```
    > ***Chú ý :*** Thường khi viết **số thực** , phần nguyên và phần thập phân được phân cách nhau bằng dấu phẩy (`,`) . Thế nhưng trong **Python** , dấu phẩy này được thay thế bằng dấu chấm (`.`)
- **Số thực** trong **Python** có độ chính xác xấp xỉ `15` chữ số thập phân :
    ```py
    >>> 10 / 3
    3.3333333333333335
    ```
- Nếu muốn kết quả trên chính xác hơn thì nên dùng ở dạng **số thập phân** ( *`decimal`* ) :
    ```py
    >>> from decimal import *     # Lấy toàn bộ nội dung thư viện Decimal
    >>> getcontext().prec = 20    # Lấy tối đa 20 chữ số phần nguyên và phần thập phân
    >>> Decimal(10) / Decimal(3)
    Decimal('3.33333333333333333333')
    ```
    > ***Chú ý :*** Tuy *`decimal`* có độ chính xác cao hơn so với *`float`* nhưng lại khá rườm rà so với *`float`* . Vì vậy nên cân nhắc mỗi lần sử dụng .
### **1.3) Phân số**
- Để tạo 1 **phân số** ( *`fraction`* ) trong **Python** , sử dụng hàm `Fraction` với cú pháp sau :
    ```py
    Fraction(tử_số, mẫu_số)
    ```
- **VD :** Nhập các phân số <code>&frac12;</code> , <code>&frac45;</code> :
    ```py
    >>> from fractions import *    # Lấy toàn bộ nội dung thư viện Decimal
    >>> Fraction(1,2)              # Phân số với tử số là 1, mẫu số là 2
    Fraction(1,2)
    >>> Fraction(4,5)              # Phân số với tử số là 4, mẫu số là 5
    Fraction(4,5)
    ```
### **1.4) Số phức**
- **Số phức** gồm 2 phần :
    ```py
    <phần_thực> + <phần_ảo>j
    ```
    - Trong đó :
        - <`phần_thực`> , <`phần_ảo`> là số thực
        - `j` là đơn vị ảo trong toán học với <code>j<sup>2</sup> = 1</code>
- Để tạo 1 số phức , sử dụng hàm `Complex` với cú pháp sau :
    ```py
    complex(<phần_thực>,<phần_ảo>)
    ```
- Gán giá trị số phức cho 1 biến :
    ```
    <tên_biến> = <phần_thực> + <phần ảo>j
    ```
- Xuất ra từng phần của số phức :
    - Xuất ra phần thực :
        ```
        <tên_biến>.real
        ```
    - Xuất ra phần ảo :
        ```
        <tên_biến>.imag
        ```
- **VD :** Nhập một số số phức sau :
    - Gán biến `c` có giá trị `2 + 1j` . Xuất ra phần thực và phần ảo của biến `c` .
    - `4 + j` ( sẽ có lỗi vì kiểu dữ liệu nhập không đúng ) .
    - Tạo số phức có phần thực là `3` , phần ảo là `1` .
    - Tạo số phức có phần thực là `3` , phần ảo là `1` .
    - Tạo số phức chỉ có phần thực là `2` .
    ```py
    >>> c = 2 + 1j   # gán giá trị cho biến c là 1 số phức với phần thực là 2 còn phần ảo là 1
    >>> c
    (2 + 1j)
    >>> c.imag       # lấy phần ảo của số phức 2 + 1j mà ta đã gán cho biến c
    1.0
    >>> c.real       # lấy phần thực
    2.0
    -------------------------------------------------------------
    >>> 4 + j        # phần ảo là 1 , tuy vậy chúng ta không được phép bỏ số 1 như trong toán
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'j' is not defined
    >>> 4 + 1j
    (4 + 1j)
    -------------------------------------------------------------
    >>> 3j + 1       # phần thực là 1 , phần ảo là 3
    (1 + 3j)
    -------------------------------------------------------------
    >>> complex(3, 1)# dùng hàm complex để tạo 1 số phức với phần thực là 3, ảo là 1
    (3 + 1j)
    -------------------------------------------------------------
    >>> complex(2)   # chỉ có phần thực, phần ảo được mặc định là 0
    (2 + 0j)
    ```

### **1.5) Các kiểu toán tử cơ bản**
- Một số biểu thức toán học :
    
    | Biểu thức | Mô tả |
    |-----------|-------|
    | `X + Y` | Tổng của `X` và `Y` |
    | `X - Y` | Hiệu của `X` và `Y` |
    | `X * Y` | Tích của `X` và `Y` |
    | `X / Y` | Thương của `X` và `Y` ( luôn là 1 số thực ) |
    | `X // Y` | Thương nguyên của `X` với `Y` ( kết quả luôn luôn nhỏ hơn hoặc bằng `X / Y` ) |
    | `X % Y` | Phần dư của phép chia `X` cho `Y` |
    | `X ** Y` | Lũy thừa mũ `Y` với cơ số `X` ( <code>X<sup>Y</sup></code> ) |

### **1.6) Thư viện `math` trong Python**
- Thư viện **`math`** trong **Python** hỗ trợ rất nhiều hàm tính toán liên quan đến toán học .
- Để sử dụng 1 thư viện nào đó , ta dùng lệnh :
    ```py
    import <tên_thư_viện>
    ```
- Muốn sử dụng hàm nào đó của thư viện , ta sử dụng cú pháp :
    ```py
    <tên_thư_viện>.<tên_hàm>
    ```
- Dưới đây là 1 số hàm thường được dùng trong việc tính toán cơ bản :

    | Tên hàm | Công dụng |
    |---------|-----------|
    | `.trunc(x)` | Trả về 1 số nguyên là phần nguyên của số `x` |
    | `.floor(x)` | Trả về 1 số nguyên được làm tròn số từ số `x` , kết quả luôn luôn nhỏ hơn hoặc bằng `x` |
    | `.ceil(x)` | Trả về 1 số nguyên được làm tròn số từ số `x` , kết quả luôn luôn lớn hơn hoặc bằng `x` |
    | `.fabs(x)` | Trả về 1 số thực là trị tuyệt đối của số `x` |
    | `.sqrt(x)` | Trả về 1 số thực là căn bậc 2 ( <code>&Sqrt;</code> ) của số `x` |
    | `.gcd(x, y)` | Trả về 1 số nguyên là ước chung lớn nhất của 2 số `x` và `y` |

- **VD :**
    ```py
    >>> import math      # lấy nội dung của thư viện math về sử dụng
    >>> math.trunc(3.9)
    3
    >>> math.fabs(-3)
    3.0
    >>> math.sqrt(16)
    4.0
    >>> math.gcd(6, 4)
    2
    ```