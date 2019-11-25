# Nhập/Xuất trong Python
## **1) Hàm `print` - hàm xuất**
- Hàm `print` giúp xuất các nội dung mà người dùng muốn ra shell ( `terminal` , `command prompt` , `powershell` , ...)
- Cú pháp :
    ```py
    print(*object, sep='', end='\n', file=sys.stdout, flush=False)
    ```
- Trong đó :
    - `*object` : `*` chính là **packing argument** . Nó sẽ gom các **argument** lại thành một **tuple**
        ```py
        >>> packing = 1, 2, 3, 4
        >>> packing
        (1, 2, 3, 4)
        >>> print('Hello', 'World!')
        Hello World!
        ```
    - `sep` - `separate` : giá trị mặc định của `sep` là một khoảng trắng ( `space` ) . Khi các `argument` ném vào hàm `print` để hàm `print` in ra nội dung , nó sẽ được gói vào 1 **Tuple** . Các giá trị trong **tuple** sẽ được nối với nhau bằng `sep` .
        ```py
        >>> print('around', 'the', 'world')       # sep mặc định là space
        around the world
        >>> print('around', 'the', 'world', sep='---')
        around---the---world
        >>> print('around', 'the', 'world', sep='\n')
    - `end`
    - `file`
    - `flush`
>### **Khác nhau giữa Python 3.x và Python 2.x**
- `print` trong **Python `3.x`** là một hàm .
    ```py
    print ('text_string')
    ```
- `print` trong **Python `2.x`** chỉ là một câu lệnh .
    ```py
    print 'text_string'
    ```
- Nếu sử dụng cú pháp của **Python `3.x`** cho **Python `2.x`** thì vẫn được , tuy nhiên khi `print` 2 chuỗi trở lên , sẽ bị hiểu nhầm là 1 **tuple** :
    ```py
    >>> print('Hello')              # sử dụng được cấu trúc của Python3 khi dùng 
    Hello
    >>> print('Hello', 'Python')    
    ('Hello', 'Python')             # kết quả bị hiểu nhầm là Tuple
    >>> print 'Hello', 'World!'     # công thức đúng
    Hello World!
    ```
## **2) Hàm `input` - hàm nhập** :
- Cú pháp :
    ```py
    input(prompt=None)
    ```
- Công dụng : hàm này giúp ta đọc một chuỗi từ **standard input** , sau đó trả về cho chúng ta . Và thứ mà nó đọc vào luôn là một **chuỗi** cho dù có nhập **tuple** , **list** , **dict** ,... Việc nhập sẽ kết thúc khi gõ phím `Enter` ( đồng nghĩa gửi vào một ký tự `\n` tuy nhiên trong thực tế nó sẽ bị bỏ đi )
- **VD1 :**
    ```py
    >>> input('string')
    string
    ```
- **VD2 :** : Chạy file `reading_input.py`
    ```py
    # reading input
    int_input = input('Nhap vao mot so nguyen: ')
    float_input = input('Nhap vao mot so thuc: ')
    string_input = input('Nhap vao mot chuoi: ')

    # print 
    print('***************')
    print('So nguyen nhap vao la: ', int_input)
    print('So thuc nhap vao la: ', float_input)
    print('Chuoi nhap vao la: ', string_input)
    ```
    => Output :
    
    <img src=https://i.imgur.com/HeAHnGE.png>