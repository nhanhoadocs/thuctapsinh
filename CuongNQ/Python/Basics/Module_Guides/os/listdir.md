# `listdir`
- Cú pháp :
    ```py
    import os
    os.listdir('path')
    ```
- Công dụng : liệt kê các file , folder có trong thư mục có đường dẫn `path` . Nếu không cung cấp `path` , nó sẽ trả về các file , folder ở thư mục hiện tại . Kết quả được hiển thi dưới dạng `List` .
- **VD1 :** Liệt kê các file, folder trong thư mục `/home/cuongnq/code` :
    ```py
    >>> import os
    >>> os.listdir('/home/cuongnq/code')
    ['DLLs', 'Doc', 'fantasy-1.py', 'fantasy.db', 'fantasy.py', 'frame.py', 'gridexample.py', 'include', 'Lib', 'libs', 'LICENSE.txt', 'listbox.py', 'NEWS.txt', 'place.py', 'players.db', 'python.exe', 'python3.dll', 'python36.dll', 'pythonw.exe', 'sclst.py', 'Scripts', 'tcl', 'test.py', 'Tools', 'tooltip.py', 'vcruntime140.dll', 'virat.jpg', 'virat.py']
    ```
- **VD2 :** Liệt kê các file, folder trong thư mục hiện hành :
    ```py
    >>> import os
    >>> os.listdir()
    ['.config', '.dotnet', 'python']
    ```