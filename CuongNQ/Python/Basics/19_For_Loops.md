# Vòng lặp For
## **1) Hạn chế của vòng lặp `while`**
## **2) Cấu trúc vòng lặp `for` và cách hoạt động**
- Cấu trúc :
    ```py
    for var_1, var_2, ..., var n in sequence
        # for block
    ```
    - `Sequence` ở đây là một ***iterable object*** ( có thể là **iterator** hoặc là một dạng **object** cho phép sử dụng `indexing` hoặc thậm chí không phải 2 kiểu trên ) . Nếu `sequence` là một **iterator object** thì việc dùng vòng lặp quyệt qua cũng sẽ tương tự như sử dụng hàm `next` .
## **3) Sử dụng vòng lặp để xử lý các iterator và dict**
## **4) Lệnh `break` , `continue`**
- Chức năng hoàn toàn tương tự như trong vòng lặp `while` .
- **VD1 :** Lệnh `break` :
    ```py
    >>> s = 'Hi Nam!'
    >>> for ch in s
    ...     if ch == ' ':
    ...         break
    ...     else:
    ...         print(ch)
    ...
    H
    i
    ```
- **VD2 :** Lệnh `continue` :
    ```py
    >>> s = 'Hi Everyone!'
    ...     if ch == ' ':
    ...         continue
    ...     else:
    ...         print(ch)
    ...
    H
    i
    N
    a
    m
    ```
## **5) Cấu trúc vòng lặp `for-else` và cách hoạt động**
- Cấu trúc :
    ```py
    for var_1, var_2, ..., var_n in sequence:
        # for block
    else
        # else block
    ```
- Công dụng : vòng lặp sẽ hoạt động bình thường . Khi vòng lặp kết thúc , khối `else-block` sẽ được thực hiện . Nếu trong quá trình thực hiện `for-block` mà xuất hiện lệnh `break` thì vòng lặp sẽ kết thúc và bỏ qua `else-block` .
- **VD1 :** `For-else` bình thường :
    ```py
    >>> for k in (1, 2, 3):
    ...     print(k)
    ... else
    ...     print('Done!')
    ...
    1
    2
    3
    Done!
    ```
- **VD2 :** `For-else` có `break` :
    ```py
    >>> for k in (1, 2, 3)
    ...     print(k)
    ...     if k % 2 == 0:
    ...         break
    ... else
    ...     print('Done!')
    ...
    1
    2
    ```
## **6) Kiểu dữ liệu `range`**
### **6.1) Khái niệm**
- Đây là một kiểu dữ liệu đặc biệt vì có thể lấy nhiều giá trị từ nó nhưng bản chất thì nó không lưu giữ những giá trị mà ta lấy .
- **Range** hỗ trợ `indexing` .
- Có 2 cách khởi tạo 1 **range** :
    - Cách khởi tạo thứ nhất :
        ```py
        range(stop)
        ```
        - Công dụng : cách này sẽ tạo một dãy số bắt đầu bằng `0` và kết thúc là `stop - 1` . Dãy số này là một cấp số cộng với công sai là `1` .
        - **VD :**
            ```py
            >>> k = range(3)
            >>> type(k)
            <class 'range'>
            >>> k[0]
            1
            >>> k[-1]
            2
            ```
    - Cách khởi tạo thứ hai :
        ```py
        range(start, stop[, step])
        ```
        - Công dụng : cách này sẽ tạo một dãy số bắt đầu bằng `start` và kết thúc bằng `stop - 1` . Dãy số này là một cấp số cộng với công sai bằng `1` . Trong trường hợp `step` ( buộc phải <code>&ne;0</code> ) được đưa vào thì công sai sẽ là `step` .
        - **VD :**
            ```py
            >>> list(range(2,5))
            [2, 3, 4]
            >>> list(range(1, 10, 2))
            [1, 3, 5, 7, 9]
            ```
### **6.2) Sử dụng range để duyệt một List , Tuple , Chuỗi**
- **VD :**
    ```py
    >>> lst = ['Hello', 'all', 'of', 'you']
    >>> for i in range(len(lst)):
    ...     print(lst[i])
    ...
    Hello
    all
    of
    you
    ```
## **7) Comprehension**
- **Comprehension** là một công cụ rất hiệu quả của **Python** để xử lý nhiều việc mà chỉ cần 1 dòng .
- Nếu so sánh những đoạn code lớn với những **comprehension** thì **comprehension** có tốc độ nhanh hơn .
- Cú pháp :
    ```py
    [output-expression for-statement optional-predicate]  # Sử dụng cho List
    (output-expression for-statement optional-predicate)  # Sử dụng cho Tuple
    {output-expression for-statement optional-predicate}  # Sử dụng cho Dict
    ```
## **8) Hàm `enumerate`**
- Cú pháp :
    ```py
    enumerate(iterable[, start])
    ```
    - Nếu `start` không được gửi vào thì mặc định là `0` .
