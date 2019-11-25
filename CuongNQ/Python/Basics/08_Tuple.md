# Kiểu dữ liệu Tuple
## **1) Khái niệm**
- **Tuple** là một container cũng được sử dụng rất nhiều trong các chương trình **Python** không thua kém gì **list** .
- Một **Tuple** gồm các yếu tố sau :
    - Được giới hạn bởi cặp ngoặc `()` , tất cả những gì nằm trong đó là những phần tử của **Tuple** .
    - Các phần tử của **Tuple** được phân cách nhau ra bởi dấu phẩy (`,`)
    - **Tuple** có khả năng chứa mọi giá trị , đối tượng trong **Python** .
- **VD :**
    ```py
    >>> (1, 2, 3, 4, 5)             # Một Tuple chứa 5 số nguyên
    (1, 2, 3, 4, 5)
    >>> ('h', 'e', 'l', 'l', 'o')   # Một Tuple chứa 5 chuỗi
    ('h', 'e', 'l', 'l', 'o')
    >>> ([1, 2], [3, 4])            # Một Tuple chứa 1 list là [1, 2] và 1 tuple là (3, 4)
    ([1, 2], [3, 4])
    ```
## **2) Cách khởi tạo Tuple**
### **2.1) Sử dụng cặp dấu ngoặc `()` và đặt giá trị bên trong**
- Cú pháp :
    ```py
    (<value_1>, <value_2>, ..., <value_n-1>, <value_n>)
    ```
- **VD1 :**
    ```py
    >>> tup_1 = (1, 2, 3, 4)
    >>> tup_1
    (1, 2, 3, 4)
    >>> tup_2 = ()              # Khởi tạo tuple rỗng
    >>> tup_2
    ()
    >>> type(tup_1)             # Xem kiểu dữ liệu của tup_1
    <class 'tuple'>
    ```
> Chú ý : Khi khởi tạo **tuple** có 1 giá trị , phải thêm dấu (`,`) vào sau giá trị đó .
- **VD2 :**
    ```py
    >>> tup_3 = (9)
    >>> tup_3
    9
    >>> type(tup_3)
    <class 'int'>                 # tuple_3 không thuộc dạng Tuple
    >>> tup_4 = (9,)
    >>> tup_4
    (9,)
    >>> type(tup_4)
    <class 'tuple'>               # tuple_4 thuộc dạng Tuple
    ```
### **2.2) Sử dụng Constructor Tuple**
- Cú pháp :
    ```
    tuple(iterable)
    ```
- Công dụng : giống hoàn toàn với việc sử dụng **constructor List** . Khác biệt duy nhất là **constructor Tuple** sẽ tạo ra một **Tuple** .
- **VD :**
    ```py
    >>> tup_1 = tuple([1, 2, 3])
    >>> tup_1
    (1, 2, 3)
    >>> tup_2 = tuple('Hello')
    >>> tup_2
    ('H', 'e', 'l', 'l', 'o')
    >>> tup(123)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: 'int' object is not iterable
    ```
## **3) Một số toán tử với Tuple trong Python**
- **Toán tử `+`**
    ```py
    >>> tup = (1, 2)
    >>> tup += ('hello', 'world')
    >>> tup
    (1, 2, 'hello', 'world')
    ```
- **Toán tử `*`**
    ```py
    >>> tup = tuple('hello') * 3
    >>> tup
    ('h', 'e', 'l', 'l', 'o', 'h', 'e', 'l', 'l', 'o', 'h', 'e', 'l', 'l', 'o')
    >>> (1,) * 0
    ()
    >>> (1,) * 3
    (1, 1, 1)
    ```
- **Toán tử `in`**
    ```py
    >>> 1 in (1, 2, 3)
    True
    >>> 4 in (1, 2, 3)
    False
    ```
## **4) Indexing và cắt Tuple**
- **Indexing** và **cắt** **Tuple** hoàn toàn tương tự như với kiểu dữ liệu `List` .
- **VD :**
    ```py
    >>> tup = ('H', 'e', 'l', 'l', 'o')
    >>> tup[0]
    'H'
    >>> tup[-1]
    'o'
    >>> tup[1:3]
    ('e', 'l')
    ```
## **5) Thay đổi nội dung Tuple trong Python**
- **Tuple** và **chuỗi** đều là một dạng **hash object** . Do đó trên lý thuyết là không thể thay đổi nội dụng của chúng .
- **VD :**
    ```py
    >>> tup = ('H', 'e', 'l', 'l', 'o')
    >>> tup[0]
    'H'
    >>> tup[0] = 'h'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: 'tuple' object does not support item assignment
    ```
## **6) Ma trận**
## **7) Các phương thức của Tuple**
### **7.1) Phương thức `count`**
- Cú pháp :
    ```py
    <tuple>.count(value)
    ```
- Công dụng : trả về một số nguyên , chính là số lần xuất hiện của `value` trong `tuple` .
- **VD :**
    ```py
    >>> tup = ('H', 'e', 'l', 'l', 'o')
    >>> tup.count('H')
    1
    >>> tup.count('l')
    2
    ```
### **7.2) Phương thức `index`**
- Cú pháp :
    ```py
    <tuple>.index(sub, [start, [end]])
    ```
- Công dụng : trả về 1 số nguyên , là vị trí đầu tiên của `sub` khi dò từ trái sang phải trong list . Sẽ có lỗi `ValueError` nếu không tìm thấy phần tử `sub` trong `tuple` ban đầu .
- **VD :**
    ```py
    >>> tup = ('H', 'e', 'l', 'l', 'o')
    >>> tup.index('e')
    1
    >>> tup.index('l')
    2
    >>> tup.index('h')
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: tuple.index(x): x not in tuple
    ```
## **8) So sánh `Tuple` và `List`**
- **Tuple** khác **List** ở chỗ **Tuple** không cho phép sửa chữa nội dung , còn **List** thì có .
- Vì đặc điểm đó , **Tuple** mạnh hơn **List** ở những điểm sau :
    - Tốc độ truy xuất của **Tuple** nhanh hơn so với **List**
    - Dung lượng chiếm trong bộ nhớ của **Tuple** nhỏ hơn so với **List**
    - Bảo vệ dữ liệu sẽ không bị thay đổi
    - Có thể dùng làm `key` của **Dictionary** ( **List** không làm được )