# Module trong Python
## **1) Giới thiệu**
- **Module** chỉ đơn giản là một file python ( `.py` ) bình thường .
- Việc đặt tên cho **module** có ràng buộc như đặt tên một biến .
- **Module** của **Python** không nhất thiết phải là một file **python** mà có thể là những file được viết bằng những ngôn ngữ lập trình khác như **C** , **C++** , **Java** ,.... Những **module** như vậy được gọi là **extension module** , và thường được sử dụng cho việc lưu các external library
- Các module phải được tạo trong cùng một thư mục để hoạt động được cùng nhau .
## **2) Lệnh `import`**
- Đây là câu lệnh cơ bản khi làm việc với **module**
- Cú pháp :
    ```py
    import<tên_module>
    ```
    hoặc có thể import nhiều **module** trên một dòng lệnh :
    ```py
    import module_a, module_b, module_c
    ```
- Công dụng : sau khi thực hiện lệnh , file **module** sẽ chạy và thực hiện tạo ra một **module object** lưu dưới một biến với tên là tên của biến đó . **Module object** này có các **attribute** và **method** lần lượt là các biến và hàm (với scope global) .
- **VD :** Có module `new_module.py` sau :
    ```py
    # new_module.py
    print('Day la vi du ve lenh Import')
    def test(a):
        print(a)
    ```
    - Import `new_module` vào file `main.py` như sau :
    ```py
    # main.py
    import new_module
    new_module.test('Hello')
    new_module.test('World!')
    ```
    - Chạy file `main.py`
    ```py
    $ python3 main.py
    Day la vi du ve lenh Import
    Hello
    World!
    ```
## **3) Lệnh `from import`**
- Cú pháp :
    ```py
    from <module> import <function_in_module>
    ```
    hoặc import nhiều hàm :
    ```py
    from <module> import <function_1>, <function_2>
    ```
    hoặc import tất cả các hàm :
    ```py
    from <module> import *
    ```
- Công dụng : import hàm từ một **module** khác .
- **VD :** Có module `new_module.py` sau :
    ```py
    # new_module.py
    print('Day la vi du ve lenh Import')
    def test(a):
        print(a)
    ```
    - Import `new_module` vào file `main.py` như sau :
    ```py
    # main.py
    from new_module import test
    test('Hello')
    test('World!')
    ```
    - Chạy file `main.py`
    ```py
    $ python3 main.py
    Day la vi du ve lenh Import
    Hello
    World!
    ```
## **4) Import một module nhiều lần**
- Sử dụng `import` hay `from import` để import một module thì chỉ hoạt động 1 lần . 
- **Python** chỉ thực hiện lấy mỗi file 1 lần , khi thấy file đã được import thì khi đó gõ lại import không khác gì việc gõ comment .
- Tuy nhiên , khi sử dụng `from import` rồi sau đó sử dụng `import` thì lần import thứ 2 được coi như là cách reset lại các giá trị của biến thuộc module đó .
- **VD :**
    ```py
    # a.py
    print("imported")
    var = 10
    ```
    ```py
    # main.py
    from a import var
    var = 100
    import a
    print(a.var)
    ```
    => Output
    ```py
    imported
    10
    ```
## **5) Reload module**
- **Python** chỉ cho phép import module một lần , không có nghĩa là không thể reload lại module . Có thể sử dụng hàm `reload` trong thư viện `importlib` của **Python** .
- **VD :**
    ```py
    # a.py
    var = 10
    ```
    ```py
    # main.py
    import a
    a.var = 20
    print(a.var)
    import a                       # Lệnh import thứ 2 sẽ không có tác dụng
    print(a.var)
    from importlib import reload
    reload(a)
    print(a.var)
    ```
    => Output :
    ```
    20
    20
    10                             # Biến đã được reload
    ```
## **6) Đổi tên module , attribute khi import**
- Đôi khi , tên của **module** hay **attribute** bị dài . Có thể thay đổi lại tên của **module** hoặc **attribute** đó , tuy nhiên khá nguy hiểm với các thư viện chuẩn .
- Cách đơn giản để đổi tên là sử dụng `as` .
- **VD :**
    ```py
    # a_long_name_for_a_module.py
    short_name = 10
    a_long_name_for_a_variable = 20
    def a_long_name_for_a_function():
        print('Successful!')
    ```
    ```py
    # main.py
    import a_long_name_for_a_module as module
    from a_long_name_for_a_module import a_long_name_for_a_variable as longvar, a_long_name_for_a_function as longfunc
    print(module.short_name)
    print(longvar)
    longfunc()
    ```
    => Output
    ```
    10
    20
    Successful!
    ```
## **7) Folder `__pycache__`**
- Sau khi chạy chương trình , nếu nhìn lại thư mục chứ project , sẽ có một folder được tạo ra tên là `__pycache__` , bên trong chứa những file `.pyc` ( đôi lúc là `.pyo` ) . Những file này là những file muốn import được biên dịch ra .

    <img src=https://i.imgur.com/EtyN1za.png>
    
- Nếu không muốn lưu cache , mỗi lần chạy file **Python** , sử dụng lệnh sau :
    ```sh
    python3.7 -B file.py
    ```