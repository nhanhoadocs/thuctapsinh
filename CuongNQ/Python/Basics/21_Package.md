# Package trong Python
## **1) Giới thiệu**
- **Package** là một folder chứa các **module** , **package con** ( *sub package* ) và bên cạnh đó là file `__init__.py` .
- Sử dụng **package** cho phép phân nhóm các **module** cùng loại , cùng mục đích , mỗi nhóm **module** tạo ra một folder => dễ dàng xử lý các **module** hơn .
- Để truy xuất đường dẫn file một cách thông thường `folder\file` thì sử dụng cú pháp `folder.file`
- Để truy xuất đường dẫn folder nằm trong một folder `folder\sub_folder\file` thì sử dụng cú pháp `folder.sub_folder.file`
- Để truy xuất đường dẫn package nằm trong một package thì sử dụng cú pháp `package.sub_package.module`
- **VD :** Tạo 1 cấu trúc thư mục sau :
    
    <img src=https://i.imgur.com/zShunXh.png>

    ```py
    # module_a.py
    a_var = 123
    def func():
        print("func in module a")
    ```
    ```py
    # module_b.py
    b_var = 456
    def func():
        print("func in module b")
    ```
    ```py
    # main.py
    from test_package import module_a as mod_a, module_b as mod_b
    # hoặc import test_package.module_a, test_package.module_b
    mod_a.func()
    print(mod_a.a_var)
    mod_b.func()
    print(mod_b.b_var)
    ```
    => Output :
    ```
    func in module a
    123
    func in module b
    456
    ```
## **2) File `__init__.py` ( *initialization* )**
- Mỗi package đều phải chứa file này .
- File này sẽ được tự động chạy khi **package** được import .
- File `__init__.py` này nhằm mục đích khởi tạo những thứ cần thiết cho **package** trong trường hợp cần import **package** .
- Các biến trong file `__init__.py` cũng sẽ được khởi tạo đồng thời .
- **VD :**

    <img src=https://i.imgur.com/UG3YNvK.png>

    ```py
    # __init__.py
    print("package is imported")
    init_var = "Hello World!"
    ```
    ```py
    # main.py
    import test_package                      # import một package
    print(test_package.init_var)             # biến của package, không phải của module
    ```
    => Output :
    ```
    package is imported
    Hello World!
    ```
## **3) Biến `__all__`**
- Sử dụng khi cần import tất cả các **module** của một **package** qua lệnh `from ... import *`
- Với **module** , khi import tất cả có nghĩa là tất cả các biến , hàm , lớp ,... nói chung là toàn bộ nội dung của **module** đó . Với **package** , có thể quy định "tất cả" ở đây gồm những gì . Mặc định , khi không quy ước gì thì "tất cả" = "không có gì"
- **VD1 :** Không quy ước biến `all` :

    <img src=https://i.imgur.com/UG3YNvK.png>

    ```py
    # module_a.py
    a_var = 123
    def func():
        print("func in module a")
    ```
    ```py
    # __init__.py
    print("Package is imported")
    # không quy ước biến __all__
    ```
    ```py
    # main.py
    from test_package import *
    module_a.func()
    ```
    => Output :
    ```
    Package is imported
    Traceback (most recent call last):
    File "main.py", line 3, in <module>
        module_a.func()
    NameError: name 'module_a' is not defined
    ```
- **VD2 :** Quy ước biến `__all__` :
    ```py
    # __init__.py
    print("Package is imported")
    __all__ = [
        'module_a',
    ]
    # quy ước biến __all__
    ```
    => Output :
    ```
    Package is imported
    func in module a
    ```



