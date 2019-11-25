# Kiểu dữ liệu List
## **Mục lục**
**1. Khái niệm**

**2. Cách khởi tạo list**
- **2.1. Sử dụng cặp dấu ngoặc `[]` đặt giá trị bên trong**
- **2.2. Sử dụng List Comprehension**
- **2.3. Sử dụng constructor list**

**3. Một số toán tử với list trong Python**
- **Toán tử `+`**
- **Toán tử `*`**
- **Toán tử `in`**

**4. Indexing và cắt List trong Python**

**5. Thay đổi nội dung List**

**6) Ma trận**

**7) Các phương thức trong list**
- **7.1. Các phương thức tiện ích**
    - **7.1.1. Phương thức `count`**
    - **7.1.2. Phương thức `index`**
    - **7.1.3. Phương thức `copy`**
    - **7.1.4. Phương thức `clear`**
    - **7.1.5. Phương thức `len`**
- **7.2) Các phương thức cập nhật**
    - **7.2.1. Phương thức `append`**
    - **7.2.2. Phương thức `extend`**
    - **7.2.3. Phương thức `insert`**
    - **7.2.4. Phương thức `pop`**
    - **7.2.5. Phương thức `remove`**
- **7.3) Các phương thức xử lý**
    - **7.3.1. Phương thức `reverse`**
    - **7.3.2. Phương thức `sort`**

---------------------------------------------
## **1) Khái niệm**
- **List** là một container được sử dụng rất nhiều trong các chương trình **Python** .
- Một **list** gồm các yếu tố sau :
    - Được giới hạn bởi cặp ngoặc `[]` , tất cả những gì nằm trong đó là những phần tử của **List** .
    - Các phần tử của **List** được phân cách nhau bởi dấu phẩy ( `,` )
    - **List** có khả năng chứa mọi giá trị , đối tượng trong **Python** . Và bao gồm chứa chính nó .
- **VD :**
    ```py
    >>> [1, 2, 3, 4, 5]               # List chứa 5 số nguyên
    [1, 2, 3, 4, 5]

    >>> ['a', 'b', 'c', 'd']          # Một list chứa 4 chuỗi
    ['a', 'b', 'c', 'd']

    >>> [[1, 2], [3, 4]]              # Một list chứa 2 list [1, 2] và [3, 4]
    [[1, 2], [3, 4]]

    >>> [1, 'one', [2, 'two']]        # List chứa số nguyên, chuỗi, và List
    [1, 'one', [2, 'two']]
    ```
## **2) Cách khởi tạo List**
### **2.1) Sử dụng cặp dấu ngoặc `[]` đặt giá trị bên trong**
- Cú pháp :
    ```
    [<value_1>, <value_2>, <value_3>, ...., <value_n-1>, <value_n>]
    ```
- **VD :**
    ```py
    >>> lst = [1,2,5,'a']
    >>> lst
    [1,2,5,'a']
    >>> empty_list = []              # Khởi tạo list rỗng
    >>> empty_list
    []
    ```
### **2.2) Sử dụng List Comprehension**
- Cú pháp :
    ```
    [comprehension]
    ```
- **VD :**
    ```py
    >>> a = [a for a in range(3)]
    >>> a
    [0, 1, 2]
    >>> b = [[n, n*1, n*2] for n in range(1, 4)]
    >>> b
    [[1, 1, 2], [2, 2, 4], [3, 3, 6]]
    ```
### **2.3) Sử dụng constructor list**
- Cú pháp :
    ```py
    list(iterable)
    ```
- **VD :**
    ```py
    >>> lst = list([1, 2, 3])
    >>> lst
    [1, 2, 3]
    >>> str_lst = list('abcdef')
    >>> str_lst
    ['a', 'b', 'c', 'd' , 'e', 'f']
    ```
## **3) Một số toán tử với list trong Python**
- **Toán tử `+`** :
    ```py
    >>> lst = [1, 2]
    >>> lst += ['one', 'two']
    >>> lst
    [1, 2, 'one', 'two']
    >>> lst += 'abc'               # Cộng List với chuỗi
    >>> lst
    [1, 2, 'one', 'two', 'a', 'b', 'c']
    >>> 'abc' + [1, 2]             # Chỉ cho phép list + chuỗi , không cho phép chuỗi + list
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: must be str, not list
    ```
- **Toán tử `*`** :
    ```py
    >>> lst = list('abc') * 2
    >>> lst
    ['a', 'b', 'c', 'a', 'b', 'c']
    >>> [1, 2] * 3
    [1, 2, 1, 2, 1, 2]
- **Toán tử `in`** :
    ```py
    >>> 'a' in [1, 2, 3]
    False
    >>> 'a' in [a, 2, 3]
    True
    >>> 'a' in [['a'], 'b', 'c']   # Chỉ có ['a'] , không có 'a'
    False
## **4) Indexing và cắt List trong Python**
- **VD :**
    ```py
    >>> lst = [1, 2, 'a', 'b', [3, 4]]
    >>> lst[0]
    1
    >>> lst[-1]
    [3, 4]
    >>> lst[3]
    'b'
    >>> lst[1:3]
    [2, 'a']
    >>> lst[:2]
    [1, 2]
    >>> lst[2:]
    ['a', 'b', [3, 4]]
    >>> lst[::-1]
    [[3, 4], 'b', 2, 1]
    ```
## **5) Thay đổi nội dung List**
- Khác với chuỗi , có thể thay đổi nội dung thành phần trong list :
    ```py
    >>> lst = [1, 'two', 3]
    >>> lst[1]
    'two'
    >>> lst[1] = 2
    >>> lst
    [1, 2, 3]
    ```
## **6) Ma trận**
- Ma trận List chỉ đơn giản là một list chứa các list bên trong .
    ```py
    >>> lst = [[1,2,3], [4,5,6]]
    >>> lst
    [[1,2,3], [4,5,6]]
    ```
- Truy cập các phần tử của list vừa khởi tạo :
    ```py
    >>> lst[0]          # List con
    [1,2,3]
    >>> lst[-1]         # List con
    [4,5,6]
    ```
- Truy cập đến các phần tử con của các list con :
    ```py
    >>> lst[0][0]
    1
    >>> lst[0][-1]
    3
    >>> lst[-1][-1]
    6
    ```
>### ***Chú ý :** Không được phép gán list này qua list kia nếu không có chủ đích*
## **7) Các phương thức trong list**
### **7.1) Các phương thức tiện ích**
#### **7.1.1) Phương thức `count`**
- Cú pháp :
    ```py
    <list>.count(sub, [start, [end]])
    ```
    - Trong đó :
        - `sub` : là phần tử của chuỗi . Kết quả của lệnh sẽ là 1 số nguyên , chính là số lần xuất hiện của `sub` trong list
        - `start` và `end` là kỹ thuật slicing ( không có bước)
- Công dụng : trả về một số nguyên, chính là số lần xuất hiện của `sub` trong list .
- **VD :**
    ```py
    >>> lst = [1, 3, 5, 7, 9, 1]
    >>> lst.count(1)
    2
    >>> lst.count(4)
    0
    ```
#### **7.1.2) Phương thức `index`**
- Cú pháp :
    ```py
    <list>.index(sub, [start, [end]])
    ```
- Công dụng : trả về 1 số nguyên , là vị trí đầu tiên của `sub` khi dò từ trái sang phải trong list . Sẽ có lỗi `ValueError` nếu không tìm thấy phần tử `sub` trong `list` ban đầu .
- **VD :**
    ```py
    >>> lst = [1, 2, 3]
    >>> ls.index(2)
    1
    >>> ls.index(4)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: 4 is not in list
    ```
#### **7.1.3) Phương thức `copy`**
- Cú pháp :
    ```py
    <list>.copy()
    ```
- Công dụng : trả về một List tương tự list ban đầu , giống với `list[:]`
- **VD :**
    ```py
    >>> lst_1 = [1, 2, 3]
    >>> lst_2 = lst_1.copy()
    >>> lst_3 = lst_1[:]
    >>> lst_2
    [1, 2, 3]
    >>> lst_3
    [1, 2, 3]
    ```
#### **7.1.4) Phương thức `clear`**
- Cú pháp :
    ```py
    <list>.clear()
    ```
- Công dụng : xóa mọi phần tử có trong list
> Lưu ý : **Python `< 3.2`** sẽ không có phương thức này .
- **VD :**
    ```py
    >>> lst = [1, 2, 3]
    >>> lst.clear()
    >>> lst
    []
    ```
#### **7.1.5) Phương thức `len`**
- Cú pháp :
    ```py
    len(<list>)
    ```
- Công dụng : trả về số phần tử có trong `list`
- **VD :**
    ```py
    >>> lst = [1, 2, 3, 4, 5]
    >>> a = len(lst)
    >>> a
    5
    ```
### **7.2) Các phương thức cập nhật**
#### **7.2.1) Phương thức `append`**
- Cú pháp :
    ```py
    <list>.append(x)
    ```
- Công dụng : thêm phần tử `x` vào cuối `list` .
- **VD :**
    ```py
    >>> lst = [1, 2, 3]
    >>> lst.append(4)
    >>> lst
    [1, 2, 3, 4]
    >>> lst.append([5, 6])
    >>> lst
    [1, 2, 3, 4, [5, 6]]
    ```
#### **7.2.2) Phương thức `extend`**
- Cú pháp : 
    ```py
    <list>.extend(iterable)
    ```
- Công dụng : thêm từng phần tử một của `iterable` vào cuối `list` .
- **VD :**
    ```py
    >>> lst = [1, 2, 3, 4]
    >>> lst.extend([5, 6])
    >>> lst
    [1, 2, 3, 4, 5, 6]
    >>> lst.extend([7, 8], 9)
    [1, 2, 3, 4, 5, 6, [7, 8], 9]
    ```
#### **7.2.3) Phương thức `insert`**
- Cú pháp :
    ```py
    <list>.insert(i, x)
    ```
- Công dụng : thêm phần `x` vào vị trí `i` trong `list`
- **VD :**
    ```py
    >>> lst = [1, 2, 3]
    >>> lst.insert(1, 8)
    >>> lst
    [1, 8, 2, 3]
    ```
#### **7.2.4) Phương thức `pop`**
- Cú pháp :
    ```py
    <list>.pop([i])
    ```
- Công dụng : bỏ đi phần tử thứ `i` trong `list` và trả về giá trị đó . Nếu vị trí `i` không được cung cấp , phương thức này sẽ tự bỏ đi phần tử cuối cùng của `list` và trả về giá trị đó .
- **VD :**
    ```py
    >>> lst = [1, 2, 3, 4, 5, 6]
    >>> lst.pop(3)
    4
    >>> lst
    [1, 2, 3, 5, 6]
    >>> lst.pop()                # Mặc định bỏ đi phần tử cuối cùng của List
    6
    >>> lst
    [1, 2, 3, 5]
    ```
#### **7.2.5) Phương thức `remove`**
- Cú pháp : 
    ```py
    <list>.remove(x)
    ```
- Công dụng : bỏ đi phần tử đầu tiên trong `list` có giá trị `x` . Nếu trong `list` không có giá trị `x` sẽ có lỗi được thông báo .
- **VD :**
    ```py
    >>> lst = [1, 5, 6, 2, 1, 7]
    >>> lst.remove(1)
    >>> lst
    [5, 6, 2, 1, 7]
    >>> lst.remove(3)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: list.remove(x): x not in list
    ```
### **7.3) Các phương thức xử lý**
#### **7.3.1) Phương thức `reverse`**
- Cú pháp :
    ```py
    <list>.reverse()
    ```
- Công dụng : đảo ngược các phần tử trong list
- **VD :**
    ```py
    >>> lst = [1, 2, 3]
    >>> lst.reverse()
    >>> lst
    [3, 2, 1]
    ```
#### **7.3.2) Phương thức `sort`**
- Cú pháp :
    ```py
    <list>.sort(key=None, reverse=False)
    ```
- Công dụng : sắp xếp các phần tử từ bé đến lớn bằng cách so sánh trực tiếp . Mặc định ( `reverse = False` ) , phương thức sẽ sắp xếp list từ nhỏ đến lớn . Nếu `reverse = True` , phương thức sẽ sắp xếp từ lớn đến nhỏ .
- **VD :**
    ```py
    >>> lst_1 = [3, 6, 7, 1, 2, 4]
    >>> lst_1.sort()
    >>> lst_1
    [1, 2, 3, 4, 6, 7]
    >>> lst_2 = [6, 8, 2, 5, 1, 10, 4]
    >>> lst_2.sort(reverse=True)
    >>> lst_2
    [10, 8, 6, 5, 4, 2, 1]
    ```


