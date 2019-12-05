# Iteration và một số hàm hỗ trợ cho Iteration Object trong Python
## **1) Iteration**
- **Iteration** là một khái niệm chung cho việc lấy từng phần tử của một đối tượng nào đó , bất cứ khi nào sử dụng vòng lặp hay kỹ thuật nào đó để có được giá trị một nhóm phần tử thì đó là **iteration** .
## **2) Iterable object**
- **Iterable object** là một **object** có phương thức `_iter_` trả về một **iterator** , hoặc là một **object** có phương thức `_getitem_` cho phép lấy bất cứ phần tử nào của nó bằng `indexing` ví dụ như **chuỗi** , **list** , **tuple** .
## **3) Iterator object**
- **Iterator object** là một đối tượng mà cho phép ta lấy từng giá trị một của nó . Có nghĩa là bạn không thể lấy bất kỳ giá trị nào như ta hay làm với **list** hay **chuỗi**  .
- **Iterator** không có khả năng tái sử dụng trừ một số **iterator** có phương thức hỗ trợ như **file object** sẽ có phương thức `seek` .
- **Iterator** sử dụng hàm `next` để lấy từng giá trị một . Và sẽ có lỗi `StopIteration` khi sử dụng hàm `next` lên đối tượng đó trong khi nó hết giá trị đưa ra .
- Các **iterable object** chưa phải **iterator** . Khi sử dụng hàm `iter` sẽ trả về một **iterator** . Đây cũng chính là cách các vòng lặp hoạt động .
- Nói tóm lại **iterator** là một dạng của **iterable** nhưng khác ở chỗ không thể tái sử dụng .
- **VD :**
    ```py
    ```
## **4) Một số hàm hỗ trợ cho iterable object trong Python**
> **Lưu ý :** Các hàm này buộc phải lấy các giá trị của **iterable** để xử lý , do đó nếu đưa vào một **iterator** thì sẽ không thể sử dụng **iterator** đó được nữa .
### **4.1) Hàm tính tổng - `sum`**
- Cú pháp :
    ```py
    sum(iterable, start=0)
    ```
- Công dụng : trả về tổng các giá trị của **iterable** và **iterable** này chỉ chứa các giá trị là số . Còn `start` chính là giá trị ban đầu . Có nghĩa là sẽ cộng từ `start` lên . Mặc định `start = 0` .
- **VD :**
    ```py
    >>> sum([1, 6, 3])
    10
    >>> sum([1, 6, 3], 10)
    20
    >>> sum(iter([6, 3, 9]))
    18
    >>> a = (x for x in range (1, 2))
    >>> sum(a)
    1
    >>> next(b)
    Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    StopIteration
    ```
### **4.2) Hàm tìm giá trị lớn nhất - `max`**
- Cú pháp :
    ```py
    max(iterable, *[default=obj, key=func])
    ```
- Công dụng : nhận vào một **iterable** , sau đó tìm giá trị lớn nhất bằng `key` ( mặc định sử dụng toán tử `>` ) . `Default` là giá trị muốn nhận về trong trường hợp không có bất kỳ giá trị nào trong **iterable** . Dấu `*` chính là ký hiệu yêu cầu `keyword-only argument` .
- **VD :**
    ```py
    >>> max([1, 2, 3])
    3
    >>> max([1, 2, 3], default='none')
    3
    >>> max([], default='none')
    'none'
    ```
- Cú pháp khác :
    ```py
    max(arg_1, arg_2, *args, *[key=func])
    ```
    - Trong đó , `*args` là **packing arguments** . Ở đây không có parameter `default` , vì theo cách này , luôn có ít nhất 2 giá trị để so sánh .
        ```py
        >>> max(1, 2, 3)
        3
        >>> max(1, 2)
        2
        ```
### **4.3) Hàm tìm giá trị nhỏ nhất - `min`**
- Cú pháp :
    ```py
    min(iterable, *[default=obj, key=func)
    ```
    hoặc
    ```py
    min(arg_1, arg_2, *args, *[key=func])
    ```
- Công dụng : tìm giá trị nhỏ nhất
- **VD :**
    ```py
    >>> min([1, 2, 3])
    3
    >>> min([], default='none')
    'none'
    ```
### **4.4) Hàm sắp xếp - `sorted`**
- Cú pháp : 
    ```py
    sorted(iterable, /, *, key=None, reverse=False)
    ```
- Công dụng : sắp xếp . Giống với phương thức `sort` của `List` .
- **VD :**
    ```py
    >>> sorted([1, 6, 7, 2])
    [1, 2, 6, 7]
    >>> sorted([1, 6, 7, 2], reverse=True)
    [7, 6, 2, 1]
    ```