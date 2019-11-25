# Hàm (function)
## **1) Các thao tác với hàm**
### **1.1) Khai báo hàm**
- Để khai báo một **hàm** , ta sử dụng từ khóa `def` với cú pháp :
    ```py
    def <function_name>(parameter_1, parameter_2, ...., parameter_n):
        function-block
    ```
### **1.2) Gọi hàm**
- Cú pháp :
    ```py
    <function_name>()
    ```
- Khi gọi **hàm** , các câu lệnh có trong **hàm** sẽ được thực thi .
- **VD :**
    ```py
    >>> def test():
    ...     print('Hello World!')
    ... 
    >>> test()
    Hello World!
    ```
### **1.3) Sử dụng parameter và argument**
- Đầu tiên , khởi tạo một hàm có `parameter` ( trong trường hợp này là biến `text` ) :
    ```py
    >>> def test_2(text)
    ...     print(text)
    ```
- Khi gọi hàm có `parameter` , phải truyền vào `argument` tương ứng ( trong trường hợp này là truyền giá trị vào cho biến `text` ):
    ```py
    >>> test_2('Hello World!')
    Hello World!
>#### **Giá trị mặc định của `parameter` ( default `argument` )**
- Khi có một giá trị chuỗi được sử dụng nhiều , nên sử dụng **default `argument`** .
- **VD :**
    ```py
    >>> def test_3(khoi, lop):
    ... print('--' + khoi, lop + '--')
    ...
    >>> test_3('D15', 'VT1')
    --D15VT1--
    >>> test_3('D15', 'VT2')
    --D15VT2--
    >>> test_3('D15', 'VT3')   # Giá trị 'D15' được sử dụng nhiều lần
    --D15VT3--
- Theo ví dụ trên , ta thấy chuỗi '`D15`' được người dùng nhập lại nhiều lần . Để giảm thiểu việc nhập liệu , ta sẽ sử dụng **default `argument`** :
    ```py
    >>> def test_3(khoi='D15', lop):
    ... print('--' + khoi, lop + '--')
    ...
    >>> test_3('VT1')
    --D15VT1--
    >>> test_3('VT2')
    --D15VT2--
    >>> test_3('VT3')
    --D15VT3--
    ```
## **2) Positional argument và keyword argument**
- Khi pass argument theo **positional argument** , các **argument** sẽ được gán lần lượt cho các parameter . Riêng đối với **keyword argument** , bạn đã tự mình gán giá trị cho các parameter .
- Hai cách gọi hàm này tương tự với nhau .
- Không được phép để **positional argument** theo sau **keyword argument** ( có thể pass argument vừa **positional** và **keyword** cùng một lúc được , nhưng những **positional** buộc phải đứng trước **keyword** )
- **VD1 :** Cho hàm sau :
    ```py
    >>> def demo(a, b):
    ...     print(a)
    ...     print(b)
    ```
    - Truyền biến kiểu **positional argument** :
        ```py
        >>> demo('Hello', 'World!')
        Hello
        World!
        ```
    - Truyền biến kiểu **keyword argument** :
        ```py
        >>> demo(a='Hello', b='World!')
        Hello
        World!
        ```
    - Truyền biến kiểu **positional** trước , **keyword** sau :
        ```py
        >>> demo('Hello', b='World!')
        Hello
        World!
        ```
    - Truyền biến kiểu **keyword** trước , **positional** sau :
        ```py   
        >>> demo(a='Hello', 'World!')
          File "<stdin>", line 1                   # lỗi
        SyntaxError: positional argument follows keyword argument
        ```
## **3) Packing argument và Unpacking argument**
### **3.1) Unpacking argument với `*`**
- Được sử dụng để truyền các biến vào hàm bằng cách unpack các container như **list** , **tuple** , **chuỗi** , **set** , **dict** ( chỉ lấy được `key` ) .
- Sử dụng cách này là đang truyền biến dưới dạng **positional argument** .
- **VD :** Cho hàm sau :
    ```py
    >>> def test(a, b, c, d)
    ...     print(a)
    ...     print(b)
    ...     print(c)
    ...     print(d)
    ...
    ```
    => Mỗi lần gọi hàm phải thực hiện truyền `4` biến<br>
    => Tạo **list** chứa các biến :
    ```py
    >>> lst = ['Hello', 'all', 'of', 'you']
    ```
    => Truyền phần tử trong **list** làm biến :
    ```py
    >>> test(lst[0], lst[1], lst[2], lst[3])
    Hello
    all
    of
    you
    ```
    => Tuy nhiên , sử dụng dấu `*` sẽ nhanh hơn :
    ```py
    >>> test(*lst)
    Hello
    all
    of
    you
    ```
### **3.2) Packing arguments với `*`**
- Có nghĩa là nhờ một biến gói tất cả các giá trị truyền vào cho hàm bằng **positional argument** thành một **tuple** .
- `Print()` là hàm đặc trưng sử dụng phương thức này .
- **VD :**
    ```py
    >>> def test(*var)
    ...     print(var)
    ...     print(type(var))
    ...
    >>> test('Hello', 'World!')
    ('Hello', 'World')
    <class 'tuple'>
    ```
## **4) Biến locals và globals**
### **4.1) Cách khai báo biến trong hàm**
- Biến khai báo ở hàm nào thì chỉ hàm đó mới biết biến đó còn thoát ra ngoài thì biến đó coi như không có .
- Biến khai báo ở hàm cha ( ***biến globals*** ) có thể sử dụng ở hàm con nhưng biến ở hàm con ( ***biến locals*** ) không thể sử dụng ở hàm cha .
    ```py
    >>> a = 5                                 # Biến globals
    >>> def test_cha():
    ...     x = a + 5                         # Biến globals trong hàm
    ...     def test_con():
    ...         y = x + 5                     # Biến local trong hàm
    ...         return(y)
    ...     z = test_con() + 5
    ...     return(z)
    ...
    >>> test_cha()
    20
    ```
### **4.2) Sử dụng lệnh `global`**
- Nếu như một biến nằm trong hàm thì người ta gọi đó là **local variable** ( biến chỉ có hiệu lực trong một hàm nhỏ ) .
- Cú pháp :
    ```
    global<variable>
    ```
- Công dụng : cho phép biến local thành biến global .
- **VD :**
    ```py
    >>> a = 5
    >>> def test_cha():
    ...     x = a + 5 
    ...     def test_con():
    ...         y = x + 5
    ...         return(y)
    ...     global z
    ...     z = test_con() + 5
    ...     return(z)
    ...
    >>> test_cha()
    20
    >>> z               # Gọi biến local trong hàm
    20
    ```
### **4.3) Hàm `locals` và `globals`**
- Hàm `locals` cho biết những **biến local** ( những biến được khai báo trong hàm ) nằm trong chương trình .
- Hàm `globals` cho biết những **biến global** nằm trong chương trình .
- Kết quả xuất ra của 2 hàm này là 1 **dict** , với `key` là ***tên biến*** và `value` là ***giá trị của biến*** .
> **Chú ý :** Với hàm `globals()` thì chỉ trả về những **biến global** có giá trị .
- **VD :**
    ```py
    >>> a = 5
    >>> def test_cha():
    ...     x = a + 5 
    ...     def test_con():
    ...         y = x + 5
    ...         return(y)
    ...     global z
    ...     z = test_con() + 5
    ...     return(z)
    ...
    >>> test_cha()
    20
    >>> z               # Gọi biến local trong hàm
    20
    >>> globals()
    {'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': None, '__annotations__': {}, '__builtins__': <module 'builtins' (built-in)>, 'a': 5, 'test_cha': <function test_cha at 0x0000026B2BF85288>, 'z': 20}
    >>> locals()
    {'__name__': '__main__', '__doc__': None, '__package__': None, '__loader__': <class '_frozen_importlib.BuiltinImporter'>, '__spec__': None, '__annotations__': {}, '__builtins__': <module 'builtins' (built-in)>, 'a': 5, 'test_cha': <function test_cha at 0x0000026B2BF85288>, 'z': 20}
    ```
## **5) Lệnh `return`**
- Đây là lệnh chỉ sử dụng ở trong hàm ( nếu sử dụng ở ngoài hàm sẽ có nhắc lỗi ) .
- Cú pháp :
    ```py
    return(object)
    ```
    - Trong đó : `object` là một đối tượng bất kỳ của một lớp nào đó , có thể là **số** , **chuỗi** , **list** , **tuple** , **hàm** hoặc thậm chí bỏ trống -> `object` sẽ được hiểu là `None` .
- Công dụng : khi `return` được gọi , hàm được kết thúc và kết quả được trả ra ngoài . Kết quả trả ra ngoài nên được đưa cho một biến nào đó hứng , nếu không thì coi như không gọi hàm để làm gì .
- **VD :**
    ```py
    >>> a = 5
    >>> def test():
    ...     x = a + 5
    ...     return(x)
    ...
    >>> test()
    10
    ```
### **Dùng lệnh `return` để trả về nhiều giá trị cùng 1 lúc**
- **VD :**
    ```py
    >>> a = 5
    >>> def test(a, b):
    ...     x = a + b
    ...     y = a*b
    ...     return(x, y)
    ...
    >>> so_thu_1 = 3
    >>> so_thu_2 = 4
    >>> tong, tich = test(so_thu_1, so_thu_2)
    >>> print(tong, tich)
    7 12
    ```   
## **6) Lệnh `yield`**
### **6.1) Generator**
- **Generator** là **iterator** , một dạng của **iterable** nhưng khác ở chỗ không thể tái sử dụng .
- **Generator** không lưu trữ tất cả các giá trị ở bộ nhớ , mà nó sinh ra lần lượt .
- **VD :**
    ```py
    >>> gen = (value for value in range(3))
    >>> for value in gen:
    ...     print(value)
    ...
    0
    1
    2
    ```
    - Vì **generator** là một **iterator** , nên không thể tái sử dụng :
    ```py
    >>> for value in gen:
    ...     print(value)
    ...
    >>> 
    ```
### **6.2) Lệnh `yield`**
- Công dụng giống với lệnh `return` , khác `return` ở chỗ :
    - `return` trả về một **object**
    - `yield` trả về một **generator**
- Lý do nên dùng `yield` : 
    - **Tốc độ** : khi sử dụng **generator** , để duyệt các giá trị thì **generator** sẽ nhanh hơn khi duyệt một **iterable** lưu trữ một lúc tất cả các giá trị .
    - **Bộ nhớ** : khi phải làm việc với những tập dữ liệu lớn , cần cân nhắc liệu có cần giữ tất cả các giá trị một lúc không hay chỉ cần sinh ra từng giá trị một để tiết kiệm bộ nhớ .
- **VD :**
    ```py
    >>> def gen():
    ...     for value in range(3):
    ...         print('yield', value + 1, 'times')
    ...         yield value
    ...
    >>> for value in gen():
    ...     print(value)
    ...
    yield 1 times
    0
    yield 2 times
    1
    yield 3 times
    2
    ```
### **6.3) Phương thức `send`**(`*`)
- Cú pháp :
    ```py
    generator.send(value)
    ```
- Công dụng : là phương thức giúp gửi giá trị vào trong một **generator** .
## **7) Lambda**
- Ngoài từ khóa `def` , **Python** hỗ trợ một cách khác để khai báo hàm , đó chính là `lambda` .
- `lambda` khác `def` ở chỗ thay vì `def` tạo ra một hàm với cái tên xác định thì `lambda` trả về một hàm .
- `lambda` còn được gọi là **hàm nặc danh ( *anonymous* )** .
- Nó được sử dụng thường xuyên để có thể tạo ra 1 hàm chỉ với 1 dòng lệnh .
- Cú pháp :
    ```py
    lambda arg_1, arg_2, ...arg_n: expression
    ```
    - `lambda` là một `expression` , không phải một câu lệnh
    - `lambda` là một dòng `expression` duy nhất , không phải một khối lệnh . Phần `expression` của `lambda` giống với phần khối lệnh của hàm với một lệnh `return` ở cuối hàm nhưng với `lambda` chỉ cần ghi giá trị mà không cần `return`<br>
    => `lambda` được ưu tiên dùng cho việc tạo ra những hàm đơn giản , còn nếu phức tạp thì sẽ sử dụng đến `def`.
- **VD1 :**
    - Khi sử dụng `def` :
        ```py
        >>> def tbc(a, b, c):
        ...     return (a + b + c)/3
        ...
        >>> tbc (1, 2, 3)
        2.0
        ```
    - Khi sử dụng `lambda` :
        ```py
        >>> tbc = lambda a, b, c:(a + b + c)/3
        >>> tbc(1, 2, 3)
        2.0
        ```
- **VD2 :** Sử dụng **default argument** :
    ```py
    >>> ham_mu = lambda x, a=2: x**a
    >>> ham_mu(2)
    4
    >>> ham_mu(2, 3)
    8
    ```
- Lý do nên sử dụng `lambda` : là một công cụ nhanh gọn để có thể tạo ra một hàm và sử dụng nó .
### **Câu điều kiện cho `lambda`**
- Cú pháp :
    ```py
    if a:
        b
    else:
        c
    ```
    => `Lambda` ( cách `1` ) :
    ```py
    b if a else c              # nên dùng cách này
    ```
    => `Lambda` ( cách `2` ) :
    ```py
    (a and b) or c
    ```
- **VD1 :**
    ```py
    >>> tim_max = lambda x, y: x if x > y else y
    >>> tim_max(1, 3)
    3
    ```
- **VD2 :** lồng `if` 
    ```py
    >>> boi_chung_2_3 = lambda x: (1 if x % 3 == 0 else 0) if x % 2 == 0 else 0
    >>> boi_chung_2_3(6)
    1
    >>> boi_chung_2_3(8)
    0
    ```
### **`Lambda` chồng `lambda`** (`*`)
## **8) Một số công cụ hỗ trợ**
### **8.1) Hàm `map`**
- Cú pháp :
    ```py
    map(func, iterable)
    ```
    Cụ thể hơn :
    ```py
    >>> def mymap(func, iterable)
    ...     for x in iterable:
    ...         yield func(x)
    ...
    ```
- Công dụng : hàm `map` sẽ trả về một **map object** ( một dạng **generator** ) . Hàm `map` sẽ lấy từng phần tử của `iterable` sau đó dùng gọi hàm `func` với `argument` là giá trị mới lấy ra từ `iterable` , kết quả trả về của hàm `func` sẽ được `yield` .
- **VD :**
    ```py
    >>> def inc(x): return x + 1
    ...
    >>> lst = [1, 2, 3, 4]
    >>> lst_out = map(inc(lst))
    [2, 3, 4, 5]
    ```
### **8.2) Hàm `filter`**
- Cú pháp :
    ```py
    filter(function of None, iterable)
    ```
- Công dụng : hàm `filter` sẽ trả về một **filter object** ( một dạng **generator object** ) . Hàm `filter` lấy từng giá trị trong **iterable** , sau đó gửi vào hàm , nếu như giá trị hàm trả ra là một giá trị khi chuyển sang kiểu dữ liệu **boolean** là `True` thì sẽ `yield` giá trị đó , nếu không thì bỏ qua . Trường hợp không gửi hàm vào mà là `None` , hàm `filter` lấy từng giá trị trong **iterable** , nếu giá trị đó chuyển sang giá trị **boolean** là `True` thì `yield` , nếu không thì bỏ qua .
- **VD :**
    ```py
    >>> func = lambda x: x > 0
    >>>
    >>> lst = [1. -3, 5, 0, 2, 6, -4, -9]
    >>> lst_2(filter(func, lst))
    [1, 5, 2, 6]
    ```
### **8.3) Hàm `reduce`**(`*`)
- Trước hết , import hàm `reduce` từ thư viện `functools` :
    ```py
    from functools import reduce
    ```
- Cú pháp :
    ```py
    reduce(function, sequence[, initial])
    ```
- Công dụng : trả về một giá trị
## **9) Đệ quy ( recursion )**(`*`)