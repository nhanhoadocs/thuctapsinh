# Kiểu dữ liệu Dict
## **1) Khái niệm**
- **Dict ( dictionary )** cũng là một container như **list** , **tuple** .
- Khác biệt là **List** và **Tuple** có các `index` để phân biệt các phần tử còn **Dict** lại dùng các `key` để phân biệt .
- Một **Dict** gồm các yếu tố sau :
    - Được giới hạn bởi các cặp ngoặc nhọn `{}` , tất cả những gì nằm trong đó là những phần tử của **dict** .
    - Các phần tử của **Dict** được phân cách nhau ra bởi dấu phẩy (`,`) .
    - Các phần tử của **Dict** phải là 1 cặp `key-value` .
    - Cặp `key-value` của phần tử trong **Dict** được phân cách bởi dấu hai chấm (`:`) .
    - Các `key` buộc phải là một **hash object** .
## **2) Cách khởi tạo Dict**
### **2.1) Sử dụng cặp dấu ngoặc `{}` và đặt giá trị bên trong**
- Cú pháp :
    ```py
    {<key_1: value_1>, <key_2: value_2>, <key_3: value_3>, ...,<key_n: value_n>}
    ```
- **VD :**
    ```py
    >>> dic = {'name': 'Cuong', 'STT': '1'}
    >>> dic
    {'name': 'Cuong', 'STT': '1'}
    >>> dic_empty = {}           # Khởi tạo dict rỗng
    >>> dic_empty
    {}
    ```
### **2.2) Sử dụng constructor Dict**
#### **2.2.1) Khởi tạo 1 Dict rỗng**
- Cú pháp :
    ```py
    dict()
    ```
- **VD :**
    ```py
    >>> dic = dict()
    >>> dic
    {}
    ```
#### **2.2.2) Khởi tạo một Dict từ một mapping object** `*`
#### **2.2.3) Khởi tạo bằng iterable** `*`
#### **2.2.4) Khởi tạo bằng keyword arguments**
### **2.3) Sử dụng Dict Comprehension**
- **VD :**
    ```py
    >>> dic = {key: value for key, value in [('name', 'Cuong'), ('STT', '1')]}
    >>> dic
    {'name': 'Cuong', 'STT': '1'}
    ```
### **2.4) Sử dụng phương thức fromkeys**`*`
- Cú pháp :
    ```py
    dict.fromkeys(iterable, value)
    ```
- Công dụng : cách này cho phép khởi tạo một **Dict** với các `keys` nằm trong một `iterable` . Các giá trị này đều sẽ nhận được một giá trị với mặc định là `None`
- **VD :**
    ```py
    >>> iter_ = ('name', 'STT')
    >>> dic_none = dict.fromkeys(iter_)
    ```
## **3) Lấy `value` trong Dict bằng `key`**
- Cú pháp :
    ```py
    your_dict[key]
    ```
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic['STT']
    1
    >>> dic['Ten']
    'Cuong'
    ```
## **4) Thay đổi nội dung Dict trong Python**
- **Dict** là một ***unhashable object*** => có thể thay đổi nội dung tương tự **list** .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic['Ten'] = 'Trang'
    >>> dic
    {'STT': 1, 'Ten': 'Trang'}
    >>> dic['STT'] = dic['STT'] + 1
    >>> dic
    {'STT': 2, 'Ten': 'Trang'}
    ```
## **5) Thêm thủ công một phần tử vào Dict**
- Cách này giống với cách thay đổi nột dung **dict** . Khác là bây giờ sẽ sử dụng một `key` chưa hề có trong **dict** .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic['Lop'] = 'VT1'
    >>> dic
    {'STT': 1, 'Ten': 'Cuong', 'Lop': 'VT1'}
    ```
## **6) Các phương thức của Dict**
### **6.1) Các phương thức tiện ích**
#### **6.1.1) Phương thức `copy`**
- Cú pháp :
    ```py
    <Dict>.copy()
    ```
- Công dụng : trả về một **dict** tương tự **dict** ban đầu .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic_2 = dic.copy()
    >>> dic_2
    {'STT': 1, 'Ten': 'Cuong'}
    ```
#### **6.1.2) Phương thức `clear`**
- Cú pháp :
    ```py
    <Dict>.clear()
    ```
- Công dụng : loại bỏ tất cả các phần tử có trong **dict**
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic.clear()
    >>> dic
    {}
    ```
### **6.2) Các phương thức xử lý**
#### **6.2.1) Phương thức `get`**
- Cú pháp :
    ```py
    <Dict>.get(key [,default=None])
    ```
- Công dụng : trả về giá trị của khóa `key` . Nếu `key` không có trong **dict** thì trả về giá trị `default` . `Default` có giá trị mặc định là `None` nếu không truyền tham số vào .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic.get('STT')
    1
    >>> dic.get('Lop')
    >>> dic.get('Lop', 'khong co thong tin')
    'khong co thong tin'
    ```
#### **6.2.2) Phương thức `items`**
- Cú pháp :
    ```py
    <Dict>.items()
    ```
- Công dụng : trả về một giá trị thuộc lớp `dict_items` . Các giá trị của `dict_items` sẽ là một **tuple** với giá trị thứ nhất là `key` , giá trị thứ 2 là `value` . `Dict_items` là một **iterable** .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> items = dic.items()
    >>> items
    dict_items([('STT', 1), ('Ten', 'Cuong')])
    >>> type(items)
    <class 'dict_items'>
    >>> lst = list(items)
    >>> lst
    [('STT', 1), ('Ten', 'Cuong')]
    >>> lst[0]
    ('STT', 1)
    >>> lst[0][0]
    'STT'
    ```
#### **6.2.3) Phương thức `keys`**
- Cú pháp :
    ```py
    <Dict>.keys()
    ```
- Công dụng : trả về một giá trị thuộc lớp `dict_keys` . Các giá trị của `dict_keys` sẽ là các `key` trong **dict** . `Dict_keys` là một **iterable** .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> keys = dic.keys()
    >>> keys
    dict_keys(['STT', 'Ten'])
    >>> type(keys)
    <class 'dict_keys'>
    >>> lst = list(keys)
    >>> lst
    ['STT', 'Ten']
    >>> lst[1]
    'Ten'
    ```
#### **6.2.4) Phương thức `value`**
- Cú pháp : 
    ```py
    <Dict>.values()
    ```
- Công dụng : trả về một giá trị thuộc lớp `dict_values` . Các giá trị của `dict_values` sẽ là các `value` trong **dict** . `Dict_values` là một **iterable** .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> values = dic.values()
    >>> values
    dict_values([1, 'Cuong'])
    >>> type(values)
    <class 'dict_values'>
    >>> lst = list(values)
    >>> lst
    [1, 'Cuong']
    >>> lst[0]
    1
    ```
#### **6.2.5) Phương thức `pop`**
- Cú pháp :
    ```py
    <Dict>.pop(key[,default=None])
    ```
- Công dụng : bỏ đi phần tử có `key` và trả về `value` của `key` đó . Trường hợp `key` không có trong **dict** :
    - Báo lỗi `KeyError` nếu `default=None`
    - Trả về `default` nếu khai báo `default` .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic.pop('STT')
    1
    >>> dic
    {'Ten': 'Cuong'}
    ```
#### **6.2.6) Phương thức `popitem()`**
- Cú pháp :
    ```py
    <Dict>.popitem()
    ```
- Công dụng : trả về một **tuple** với 2 phần tử là `key` và `value` tương ứng bất kỳ . Và cặp `key-value` sẽ bị loại bỏ khỏi **dict** . Nếu **dict** rỗng , sẽ báo lỗi `KeyError` .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic.popitem()
    ('Ten': 'Cuong')
    >>> dic
    {'STT': 1}
    >>> dic.popitem()
    ('STT': 1)
    >>> dic
    {}
    ```
#### **6.2.7) Phương thức `setdefault`**
- Cú pháp :
    ```py
    <Dict>.setdefault(key [,default=None])
    ```
- Công dụng : trả về giá trị của `key` trong **dict** . Trường hợp `key` không có trong **dict** thì sẽ trả về giá trị `default` , đồng thời một cặp `key-value` mới sẽ được thêm vào **dict** với `key=key` và `value=default` . `Default` mặc định là `None` .
- **VD :**
    ```py
    >>> dic = {'STT': 1, 'Ten': 'Cuong'}
    >>> dic.setdefault('STT')
    1
    >>> dic.setdefault('Lop')
    >>> dic
    {'STT': 1, 'Ten': 'Cuong', 'Lop': 'None'}
    ```
#### **6.2.8) Phương thức `update`**`*`
- Cú pháp :
    ```py
    <Dict>.update([E,]**F)
    ```
- Công dụng : giúp cập nhật nội dung cho **dict** .
    - `F` là một **dict** được tạo thành bởi **packing arguments** . Và sẽ thêm **dict** vào bằng cách :
        ```py
        for k in F: D[k] = F[k]
        ```
    - Nếu `E` được truyền vào và đối tượng `E` có phương thức `keys()` , thì sẽ cập nhật **dict** bằng cách :
        ```py
        for k in E: D[k] = E[k]
        ```
    - Nếu `E` được truyền vào và đối tượng `E` có các giá trị là 1 container chứa 2 giá trị thì sẽ cập nhật **dict** bằng cách :
        ```py
        for k, v in E: D[k] = v
        ```
- **VD1 :** Update theo kiểu sử dụng **packing arguments** :
    ```py
    >>> dic = {'a': 1}
    >>> dic
    {'a': 1}
    >>> dic.update(b=2,c=3)
    >>> dic
    {'a': 1, 'b': 2, 'c': 3}
    ```
- **VD2 :** Cách truyền `E` với `E` là một đối tượng có phương thức `keys()` :
    ```py
    >>> dic = {'a': 1}
    >>> E = {'b': 2, 'c': 3}
    >>> dic.update(E)
    >>> dic
    {'a': 1, 'b': 2, 'c': 3}
    ```
- **VD3 :** Cách truyền vào một `E` với `E` có chứa 2 giá trị :
    ```py
    >>> dic = {'a': 1}
    >>> E = [('b', 2), ('c', 3)]
    >>> dic.update(E)
    >>> dic
    {'a': 1, 'b': 2, 'c': 3}
    ```
    
