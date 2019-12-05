# Kiểu dữ liệu Chuỗi
- Trong **Python** , chuỗi ( ***string*** ) là những thứ được đặt trong cặp dấu `' '` , hoặc `" "`, có thể cũng là cặp `''' '''` , `""" """` . Nhưng cơ bản và thường được sử dụng nhất là cặp `' '` và `" "` .
## **1) Sự khác nhau giữa `' '` và `" "`**
- 2 cặp dấu nháy này có công dụng tương đương nhau .
- Xét **VD :** `'I'm a Student'`
    - Trong trường hợp này , nếu sử dụng `' '` thì string sẽ được hiểu là "`I`" . Phần đằng sau "`m a Student'`" sẽ không có ý nghĩa => Lỗi `SyntaxError` .
    - Nếu sử dụng `" "` thì cú pháp sẽ hoàn toàn đúng và không bị trùng lặp các cặp dấu : `"I'm a Student"`
- Làm tương tự với các trường hợp ngược lại
## **2) Chuỗi nhiều dòng với `'''` và `"""`**
- Chuỗi nhiều dòng sẽ được đặt trong các cặp dấu `'''` hoặc `"""` .
- **VD :**
    ```py
    >>> s = '''dong 1
    dong 2
    dong 3'''
    >>> s
    'dong 1\ndong 2\ndong 3'
    >>> print(s)        # sử dụng hàm print() để hiển thị kết quả mong muốn
    dong 1
    dong 2
    dong 3
    ```
## **3) Docstring**
- **Docstring** là một dạng chú thích nhiều dòng , hay xuất hiện ở đầu file **Python** , sau 1 dòng định nghĩa **class** hoặc **hàm** . Đây cũng là một trong những chuẩn ước về định dạng , trình bày code **Python** .
    ```py
    '''
    Day la doan code vi du
    Ve khai niem Docstring
    '''
    print("Hello_World!")
    ```
## **4) Escape Sequence**
- **Escape Sequence** là 1 chuỗi đặc biệt gồm 1 ký tự theo sau dấu `\` có công dụng cụ thể .
- Một số **escape sequence** :

    | Tên | Ký hiệu | Giải thích |
    |-----|---------|------------|
    | Alert | `\a` | Phát ra 1 tiếng bíp |
    | Backspace | `\b` | Đưa con trỏ về lại 1 khoảng trắng |
    | Newline | `\n` | Đưa con trỏ xuống dòng tiếp theo |
    | Horizontal tab | `\t` | In một tab ngang |
    | Single quote | `\'` | In ra ký tự `'` |
    | Double quote | `\"` | In ra ký tự `"` |
    | Blackslash | `\\` | In ra ký tự `\` | 

## **5) Chuỗi trần**
- **Python** cho phép sử dụng một dạng , gọi là **chuỗi trần** . **Chuỗi trần** sẽ không quan tâm đến **escape sequence** .
- Cú pháp :
    ```py
    r'nội_dung_chuỗi'
    ```
- **VD :**
    ```py
    >>> a = r'\neu mot ngay'     # chuỗi trần, bỏ qua \n
    >>> print(a)
    '\neu mot ngay'
    ```
## **6) Một số toán tử với chuỗi**
- **Toán tử `+` :**
    - Đây là một toán tử rất được hay sử dụng trong việc nối các chuỗi .
    - Cú pháp :
        ```py
        A + B    # A và B là 2 chuỗi
        ```
    - **VD :**
        ```py
        >>> s = 'hello'
        >>> s += 'Python'     # tương tự câu lệnh s = s + 'Python'
        >>> s
        'hello Python'
        >>> s2 = ', good bye'
        >>> s3 = s + s2
        >>> s3
        'hello Python, goodbye'
        ```
- **Toán tử `*` :**
    - Toán tử này giúp tạo ra một chuỗi nhờ lặp đi lặp lại chuỗi với số lần mong muốn .
    - Cú pháp :
        ```py
        A * N         #  Với A là một chuỗi, N là một số nguyên
        ```
    - **VD :**
        ```py
        >>> 'a' * 3      # tạo ra chuỗi lặp lại chuỗi 'a' 3 lần 
        'aaa'
        >>> s = 'abc'
        >>> s *= 2       # tương tự câu lệnh s = s * 2
        >>> s
        'abcabc'
        >>> s * 0        # bất cứ chuỗi nào * 0 đều có kết quả là :
        ''
        >>> 'Hello World' * (-2)  # đối với số âm cũng sẽ trả về một chuỗi ''
        ''
- **Toán tử `in` :**
    - Khi sử dụng toán tử này, chỉ có thể nhận được 1 trong 2 đáp án là `True` hoặc `False` .
    - Cú pháp :
        ```py
        s in A     # với s và A là chuỗi
        ```
        => Kết quả sẽ là `True` nếu chuỗi `s` xuất hiện trong chuỗi `A` . Ngược lại sẽ là `False`
    - **VD :**
        ```py
        >>> 'a' in 'abc'
        True
        >>> 'ab' in 'abc'
        True
        >>> 'ac' in 'abc'
        False
        ```
## **7) Indexing**
- Trong một chuỗi của **Python** , các ký tự tạo nên chuỗi đó sẽ được đánh số từ `0` đến `n-1` từ trái qua phải với `n` là số kí tự có trong chuỗi .
- Không chỉ đánh số từ `0` tới `n-1` từ trái qua phải với `n` là độ dài chuỗi , các ký tự của chuỗi còn được đánh số từ phải qua trái từ `-1` đến `-n` với `n` là độ dài chuỗi .
- Cú pháp index : 
    ```
    <chuỗi><vị_trí>
    ```
- **VD :** Có chuỗi `'abc xyz'`
    ```py
    >>> s = 'abc xyz'
    >>> s
    'abc xyz'
    ```
    => Các ký tự trong chuỗi sẽ được đánh số như sau :

    | `a` | `b` | `c` | _ | `x` | `y` | `z` |
    |---|---|---|--|---|---|---|
    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 
    | -7 | -6 | -5 | -4 | -3 | -2 | -1 |

    => Dựa vào đây , có thể lấy được bất cứ kí tự nào trong chuỗi 
    ```py
    >>> s = 'abc xyz'
    >>> s[0]
    'a'
    >>> s[-7]
    'a'
    >>> s[3]
    ''
    >>> s[7]     # truy cập vị trí không có trong chuỗi
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    IndexError: string index out of range
    >>> s[len(s) - 1]    # truy cập phần tử cuối cùng của chuỗi
    'z'
    ```
## **8) Cắt chuỗi**
- Dựa trên **Indexing** , **Python** cho phép cắt chuỗi .
- Cú pháp ( cắt từ **trái sang phải** ) :
    ```py
    <chuỗi>[vị_trí_bắt_đầu:vị_trí_dừng]
    ```
    => Khi sử dụng cú pháp này , ta sẽ nhận được 1 chuỗi . Chuỗi này chính là bản sao của chuỗi mà ta muốn cắt . Ta sẽ cắt lấy từng ký tự có vị trí từ `<vị_trí_bắt_đầu>` đến `<vị_trí_dừng> -1` và từ trái sang phải .
    - **VD :** Có chuỗi `'abc xyz'` :
        ```py
        >>> s = 'abc xyz'
        >>> s[1:5]            # cắt từng ký tự có vị trí từ 1 đến 4
        'bc x'
        >>> s[0:3]            # cắt từng ký tự có vị trí từ 0 đến 3
        'abc '
        >>> s[-4:-1]          # cắt từng kí tự có vị trí từ -4 đến -2
        ' xy'
        >>> s[1:None]         # lấy các ký tự có vị trí 1 đến hết chuỗi
        'bc xyz'
        >>> s[1:]             # chỉ cần bỏ trống, Python sẽ tự hiểu là None
        'bc xyz'
        >>> s[:]              # sao chép chuỗi
        'abc xyz'
        ```
- Cú pháp ( cắt từ **phải sang trái** ) :
    ```py
    <chuỗi>[vị_trí_bắt_đầu:vị_trí_dừng:bước]
    ```
    - Với cú pháp đầu tiên , không cần nhập số `bước` . Mặc định `bước` = `1` ( vị trí của ký tự sau hơn vị trí của ký tự trước `1` đơn vị )
    - Có thể tăng `bước` :
        ```py
        >>> s = 'abc xyz'
        >>> s = [1:7:2]        # bước là 2 => trả về s[1], s[3], [s5]
        'b y'
        ```
    - Cắt từ phải sang trái bằng việc đặt `bước` âm :
        ```py
        >>> s = 'abc xyz'
        >>> s[3:1-1]   # bắt đầu từ s[3] tới s[1] => trả về s[3], s[2]
        ```
    > ***Chú ý :*** Không được đặt `bước = 0`
## **9) Ép kiểu dữ liệu**
- Trong trường hợp muốn chuyển chuỗi (có nội dung là số) về số để tính toán hoặc ngược lại, phải ép kiểu dữ liệu .
- Sử dụng hàm `int()` để chuyển đổi về số nguyên :
    ```py
    int(<tên_biến>)
    ```
    - **VD :** 
        ```py
        >>> s = '69'
        >>> int(s)
        69
        >>> t = 3.63
        >>> int(t)
        3
        ```
    > ***Chú ý :*** không thể chuyển đổi số thực dưới dạng chuỗi bằng hàm `int()`
- Sử dụng hàm `float` để chuyển đổi về số thực :
    ```py
    float(<tên_biến>)
    ```
    - **VD :**
        ```py
        >>> s = '3.63'
        >>> f = float(s)
        >>> a
        3.63
        >>> i = int(a)
        3
        ```
## **10) Thay đổi nội dung chuỗi**
- **Python** không cho phép thay thế bằng phương pháp **Indexing** giống như các ngôn ngữ khác .
    ```py
    >>> s = 'abc xyz'
    >>> s[0] = k
    >>> s
    Traceback (most recent call last) :
      File '<stdin>', line 1, in <module>
    TypeError: 'str' object does not support item assignment
    ```
- Chỉ có thể sử dụng phương pháp cắt chuỗi :
    ```py
    >>> s = 'abc xyz'
    >>> s = 'k' + s[1:0]   # bỏ qua không lấy s[0]
    >>> s
    'kbc xyz'
    ```
## **11) Định dạng chuỗi trong Python**
### **11.1) Định dạng bằng toán tử `%`**
- Đây là kiểu định dạng quen thuộc khá giống lập trình `C` .
- Cú pháp :
    ```py
    <tên_chuỗi> % (value_1,value_2,value_3,...)
    ```
- **VD :** 
## **12) Các phương thức chuỗi**
### **12.1) Các phương thức biến đổi**
#### **12.1.1) Phương thức `capitalize`**
- Cú pháp :
    ```py
    <chuỗi>.capitalize()
    ```
- Công dụng : trả về 1 chuỗi với ký tự đầu tiên được viết hoa và viết thường tất cả các ký tự còn lại
- **VD :**
    ```py
    >>> 'hello World!'.capitalize()
    'Hello world!'
    ```
#### **12.1.2) Phương thức `upper`**
- Cú pháp : 
    ```py
    <chuỗi>.upper()
    ```
- Công dụng : trả về 1 chuỗi với tất cả các ký tự được chuyển thành các ký tự viết hoa .
- **VD :**
    ```py
    >>> 'hello World!'.upper()
    'HELLO WORLD!'
    ```
#### **12.1.3) Phương thức `lower`**
- Cú pháp :
    ```py
    <chuỗi>.lower()
    ```
- Công dụng : trả về 1 chuỗi với tất cả các ký tự được chuyển thành các ký tự viết thường .
- **VD :**
    ```py
    >>> 'hello World!'.lower()
    'hello world!'
    ```
#### **12.1.4) Phương thức `swapcase`**
- Cú pháp :
    ```py
    <chuỗi>.swapcase()
    ```
- Công dụng : trả về 1 chuỗi với các ký tự viết hoa được chuyển thành viết thường , viết thường được chuyển thành viết hoa .
- **VD :**
    ```
    >>> 'hello World!'.swapcase()
    'HELLO wORLD!'
    ```
#### **12.1.5) Phương thức `title`**
- Cú pháp : 
    ```py
    <chuỗi>.title()
    ```
- Công dụng : trả về 1 chuỗi với định dạng tiêu đề , có nghĩa là các từ sẽ được viết hoa chữ cái đầu tiên , còn lại là viết thường .
- **VD :**
    ```py
    >>> 'hello World!'.title()
    'Hello World!'
    ```
### **12.2) Các phương thức định dạng**
#### **12.2.1) Phương thức `center`**
- Cú pháp :
    ```py
    <chuỗi>.center(width, [fillchar])
    ```
- Công dụng : trả về 1 chuỗi được căn giữa với chiều rộng `width`
    - Nếu `fillchar` là `None` ( không được nhập vào ) thì sẽ dùng ký tự khoảng trắng ( `space` ) để căn , không thì sẽ căn bằng ký tự `fillchar` .
    - Ký tự `fillchar` là 1 chuỗi có độ dài bằng `1` .
- **VD :**
    ```py
    >>> 'abc'.center(12)
    '    abc     '
    >>> 'abc'.center(12, '*')
    '****abc*****'
    ```
#### **12.2.2) Phương thức `rjust`**
- Cú pháp :
    ```py
    <chuỗi>.rjust(width, [fillchar])
    ```
- Công dụng : tương tự như `center` , tuy nhiên sẽ chỉ căn lề bên phải .
- **VD :**
    ```py
    >>> 'abc'.rjust(12)
    '         abc'
    >>> 'abc'.rjust(12, '*')
    '*********abc'
    ```
#### **12.2.3) Phương thức `ljust`**
- Cú pháp :
    ```py
    <chuỗi>.ljust(width, [fillchar])
    ```
- Công dụng : ngược lại với `rjust` , đây là căn lề trái .
- **VD :**
    ```py
    >>> 'abc'.ljust(12)
    'abc         '
    >>> 'abc'.ljust(12, '*')
    'abc*********'
    ```
### **12.3) Các phương thức xử lý**
#### **12.3.1) Phương thức `encode`**
- Cú pháp :
    ```py
    <chuỗi>.encode(encoding='utf-8', errors='strict')
    ```
- Công dụng : đây là phương thức dùng để `encode` một chuỗi với phương thức mã hóa mặc định là `utf-8` . Còn về `errors` mặc định sẽ là `strict` có nghĩa là sẽ có thông báo lỗi hiện lên nếu có vấn đề xuất hiện trong quá trình `encode` chuỗi .
- **VD :**
    ```py
    >>> 'uể oải'.encode()
    b'u\xe1\xbb\x83 o\xe1\xba\xa3i'
    ```
#### **12.3.2) Phương thức `join`**
- Cú pháp :
    ```py
    <ký_tự_nối>.join(<iterable>)
    ```
- Công dụng : trả về một chuỗi bằng cách nối các phần tử trong `iterable` bằng `ký_tự_nối` . Một `iterable` có thể là một `tuple` , `list` ,... hoặc là một `iterator` .
#### **12.3.3) Phương thức `replace`**
- Cú pháp :
    ```py
    <chuỗi>.replace(old, new, [count])
    ```
- Công dụng : trả về một chuỗi với các chuỗi `old` nằm trong chuỗi ban đầu được thay thế bằng chuỗi `new` . Nếu `count` khác `None` ( có nghĩa là ta cho thêm `count` ) thì ta sẽ thay thế `old` bằng `new` với số lượng `count` từ trái qua phải . Nếu chuỗi `old` không nằm trong chuỗi ban đầu hoặc `count` = `0` thì sẽ trả về 1 chuỗi giống y với chuỗi ban đầu .
- **VD :**
    ```py
    >>> 'hello world!'.replace('hello', 'hi')
    'hi world!'
    >>> 'hello world!'.replace('word', 'A')
    'hello world!'
    >>> 'hello world!'.replace('world', 'A'. 0)
    'hello world!
    >>> 'hello hello world!'.replace('hello', 'hi', 1)
    'hi hello world!'
    ```
#### **12.3.4) Phương thức `strip`**
- Cú pháp :
    ```py
    <chuỗi>.strip([chars])
    ```
- Công dụng : trả về một chuỗi với phần đầu và phần đuôi của chuỗi được bỏ đi các ký tự `chars` . Nếu `chars` bị bỏ trống thì mặc định các ký tự bỏ đi là dấu `space` và các **escape sequence** .
- **VD :**
    ```py
    >>> '    abc     '.strip()
    'abc'
    >>> '%%%%%Hello%%%'.strip('%')
    'Hello'
    >>> 'cababHellobaaaca'.strip('abc')
    'Hello'
    ```
#### **12.3.5) Phương thức `rstrip`**
- Cú pháp :
    ```py
    <chuỗi>.rstrip()
    ```
- Công dụng : cách hoạt động hoàn toàn như phương thức `strip` , nhưng khác là chỉ bỏ đi phần đuôi ( từ phải sang trái )
- **VD :**
    ```py
    >>> '    abc     '.rstrip()
    '    abc'
    ```
#### **12.3.6) Phương thức `lstrip`**
- Cú pháp :
    ```py
    <chuỗi>.lstrip()
    ```
- Công dụng : ngược lại với `rstrip` , `lstrip` bỏ đi phần đầu của chuỗi .
- **VD :**
    ```py
    >>> '    abc     '.lstrip()
    'abc     '
    ```
### **12.4) Các phương thức tách chuỗi**
#### **12.4.1) Phương thức `split`**
- Cú pháp :
    ```py
    <chuỗi>.split(sep=None, maxsplit=-1)
    ```
- Công dụng : trả về 1 `list` bằng cách chia các phần tử bằng lý tự `sep` :
    - Nếu `sep` mặc định bằng `None` thì sẽ dùng ký tự khoảng trắng ( `space` )
    - Nếu `maxsplit` được mặc định bằng `-1` , **Python** sẽ không giới hạn việc tách , còn không , **Python** sẽ tách với số lần được cung cấp thông qua `maxsplit` .
- **VD :**
    ```py
    >>> 'around the world'.split()
    ['around', 'the', 'world']
    >>> 'around the world'.split(maxsplit=1)
    ['around', 'the world']
    >>> 'around-the-world'.split('-')
    ['around', 'the', 'world']
    ```
#### **12.4.2) Phương thức `rsplit`**
- Cú pháp :
    ```py
    <chuỗi>.rpslit(sep=None, maxsplit=-1)
    ```
- Công dụng : tương tự như `split()` , khác là tách từ bên phải sang trái .
- **VD :**  
    ```py
    >>> 'around the world'.rsplit()
    ['around', 'the', 'world']
    >>> 'around the world'.rsplit(maxsplit=1)
    ['around the', 'world']
    ```
#### **12.4.3) Phương thức `partition`**
- Cú pháp :
    ```py
    <chuỗi>.partition(sep)
    ```
- Công dụng : trả về một `tuple` với 3 phần tử . Các phần tử đó lần lược là `chuỗi_trước_sep` , `sep` , và `chuỗi_sau_sep` . Trong trường hợp không tìm thấy `sep` trong chuỗi , mặc định trả về giá trị đầu tiên là chuỗi ban đầu và 2 giá trị kế tiếp là chuỗi rỗng .
- **VD :**
    ```py
    >>> 'A with B with C'.partition('with')
    ('A', 'with', 'B with C')
    >>> 'A with B with C'.partition('and')
    ('A with B with C', '', '')
    ```
#### **12.4.4) Phương thức `rpartition`**
- Cú pháp :
    ```py
    <chuỗi>.rpartition(sep)
    ```
- Công dụng : cách phân chia giống như phương thức `partition` nhưng lại chia từ phải qua trái . Với `sep` không có trong chuỗi thì sẽ trả về 2 giá trị đầu tiên là chuỗi rỗng và cuối cùng là chuỗi ban đầu .
- **VD :**
    ```py
    >>> 'A with B with C'.rpartition('with')
    ('A with B', 'with', 'C')
    >>> 'A with B with C'.rpartition('and')
    ('', '', 'A with B with C')
    ```
### **12.5) Các phương thức tiện ích**
#### **12.5.1) Phương thức `count`**
- Cú pháp :
    ```py
    <chuỗi>.count(sub, [start, [end]])
    ```
- Công dụng : trả về một số nguyên, chính là số lần xuất hiện của `sub` trong chuỗi . Còn `start` và `end` là số kĩ thuật slicing ( không có bước )
- **VD :**
    ```py
    >>> 'hello hello hello'.count('hello')
    3
    >>> 'hello hello hello'.count('hello hello')
    1
    >>> 'hello hello hello hello'.count('hello', 2)
    2
    >>> 'hello hello hello hello'.count('hello', 2, 3)
    1
    ```
#### **12.5.2) Phương thức `startswith`**
- Cú pháp :
    ```py
    <chuỗi>.startswith(prefix, [start, [end]])
    ```
- Công dụng : trả về giá trị `True` nếu chuỗi đó bắt đầu bằng `prefix` . Ngược lại là `False` . Hai yếu tố `start` , `end` tượng trưng cho việc slicing ( không có bước ) để kiểm tra với chuỗi slicing đó .
- **VD :**
    ```py
    >>> 'hello world!'.startswith('he')
    True
    >>> 'hello world!'.startswith('hi')
    False
    >>> 'fly around the world'.startswith('fly', 4)
    False
    ```
#### **12.5.3) Phương thức `endswith`**
- Cú pháp :
    ```py
    <chuỗi>.endswith(prefix, [start, [end]])
    ```
- Công dụng : trả về giá trị `True` nếu chuỗi đó kết thúc bằng chuỗi `prefix` . Ngược lại là `False` . Hai yếu tố `start` và `end` tượng trưng cho việc slicing ( không có bước ) để kiểm tra với chuỗi slicing đó .
- **VD :**
    ```py
    >>> 'hello world!'.endswith('!')
    True
    >>> 'hello world!'.endswith('ho')
    False
    ```
#### **12.5.4) Phương thức `find`**
- Cú pháp : 
    ```py
    <chuỗi>.find(sub, [start, [end]])
    ```
- Công dụng : trả về 1 số nguyên , là vị trí đầu tiên của `sub` khi dò từ trái sang phải trong chuỗi . Nếu `sub` không có trong chuỗi , kết quả sẽ là `-1` . Vẫn như các phương thức khác , `start` và `end` đại diện cho slicing và sẽ tìm trong chuỗi slicing này .
- **VD :**
    ```py
    >>> 'hello world!'.find('h')
    0
    >>> 'hello world!'.find('!')
    11
    >>> 'hello world!'.find('k')
    -1
    >>> 'hello world!'.find('h', 2)
    -1
    ```
#### **12.5.5) Phương thức `rfind`**
- Cú pháp :
    ```py
    <chuỗi>.rfind(sub, [start, [end]])
    ```
- Công dụng : tương tự như phương thức `find` nhưng sẽ dò từ phải sang trái .
- **VD :**
    ```py
    >>> 'hello world!'.rfind('l')
    9
    ```
#### **12.5.6) Phương thức `index`**
- Cú pháp :
    ```py
    <chuỗi>.index(sub, [start, [end]])
    ```
- Công dụng : tương tự phương thức `find` nhưng khác biệt là sẽ có lỗi `ValueError` nếu không tìm thấy chuỗi `sub` trong chuỗi ban đầu .
- **VD :**
    ```py
    >>> 'hello world!'.find('a')
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: substring not found
    ```
#### **12.5.7) Phương thức `rindex`**
- Cú pháp :
    ```py
    <chuỗi>.rindex(sub, [start, [end]])
    ```
- Công dụng : tương tự như phương thức `index` nhưng khác là sẽ tìm từ phải sang trái của chuỗi .
- **VD :**
    ```py
    >>> 'hello world!'.find('a')
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: substring not found
    ```
### **12.6) Các phương thức xác thực**
#### **12.6.1) Phương thức `islower`**
- Cú pháp :
    ```
    <chuỗi>.islower()
    ```
- Công dụng : trả về `True` nếu tất cả các ký tự trong chuỗi đều là viết thường . Ngược lại sẽ là `False` .
- **VD :**
    ```py
    >>> 'python'.islower()
    True
    >>> 'Python'.islower()
    False
    ```
#### **12.6.2) Phương thức `isupper`**
- Cú pháp :
    ```py
    <chuỗi>.isupper()
    ```
- Công dụng : trả về `True` nếu tất cả các ký tự trong chuỗi đều là viết hoa . Ngược lại là `False` .
- **VD :**
    ```py
    >>> 'Python'.isupper()
    False
    >>> 'PYTHON'.isupper()
    True
    ```
#### **12.6.3) Phương thức `istitle`**
- Cú pháp :
    ```py
    <chuỗi>.istitle()
    ```
- Công dụng : trả về `True` nếu chuỗi đó là 1 dạng `title` ( có các từ được viết hoa chữ cái đầu ) . Ngược lại sẽ là `False` .
- **VD :**
    ```py
    >>> 'Hello World!'.istitle()
    True
    >>> 'hello World!'.istitle()
    False
    ```
#### **12.6.4) Phương thức `isdigit`**
- Cú pháp :
    ```py
    <chuỗi>.isdigit()
    ```
- Công dụng : trả về `True` nếu tất cả các ký tự trong chuỗi đều là những con số từ `0 -> 9`
- **VD :**
    ```py
    >>> '0124'.isdigit()
    True
    >>> '-124'.isdigit()
    False
    ```
#### **12.6.5) Phương thức `isspace`**
- Cú pháp :
    ```py
    <chuỗi>.isspace()
    ```
- Công dụng : trả về `True` nếu tất cả các ký tự trong chuỗi đều là ký tự khoảng trắng ( `space` )
- **VD :**
    ```py
    >>> '   '.isspace()
    True
    >>> 'a   a'.isspace()
    False
    ```
