# `mkdir`
- Cú pháp
    ```py
    import os
    os.mkdir(path, mode)
    ```
- Công dụng : tạo mới thư mục với đường dẫn `path` và permission `mode` .
- **VD :**
    ```py
    import os
    path = "/home/cuongnq/code/new_folder"
    os.mkdir(path, 755)
    ```