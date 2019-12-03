# Xử lý file trong Python
## **1) Khái niệm File trong Python**
- **File** là một thứ rất quen thuộc đối với những người sử dụng máy tính .
- Trong **Python** , file có 2 loại :
    - **Text File** :
        - Được cấu trúc như một dãy các dòng , mỗi dòng bao gồm một dãy các ký tự và một dòng tối thiểu là một ký tự dù cho dòng đó là dòng trống .
        - Các dòng trong **text file** được ngăn cách bởi một lý tự `newline` ( chính là ký tự `\n` ) .
    - **Binary File**
        - Các file này chỉ có thể được xử lý bởi một ứng dụng biết và có thể hiểu được cấu trúc của file này .
## **2) Mở file trong Python**
- **VD :** File mẫu : `/tmp/handling.txt`
    ```
    File test
    print('Hello World!')
    ```
### **Hàm `open`**
- Cú pháp :
    ```py
    open(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, closefd=True, opener=None)
    ```
- **VD :** Mở file `/tmp/handling.txt`
    ```py
    >>> file_op = open('/tmp/handling.txt')
    >>> file_op
    <_io.TextIOWrapper name='/tmp/handling.txt' mode='r' encoding='UTF-8'>
    ```
    => Hàm trả về là 1 `file object` .
- Bảng các `mode` :

    | **Mode** | **Ý nghĩa** |
    |----------|-------------|
    | `r` | Mở để đọc . Đây là mode mặc định |
    | `r+` | Mở để đọc và ghi |
    | `w` | Mở để ghi . Trước đó , nó sẽ xóa hết nội dung của file hiện có . Nếu file không tồn tại , sẽ tạo ra một file với tên là tên file chúng ta truyền vào |
    | `w+` | Mở để ghi và đọc . Trước đó , nó sẽ xóa hết nội dung của file hiện có . Nếu file không tồn tại , sẽ tạo ra một file với tên là tên file chúng ta truyền vào |
    | `a` | Mở để ghi . Nếu file không tồn tại , sẽ tạo ra một file với tên là tên file chúng ta truyền vào |
    | `a+` | Mở để ghi và đọc . Nếu file không tồn tại , sẽ tạo ra một file với tên file là tên file chúng ta truyền vào |

## **3) Đóng file trong Python**
- Lý do cần đóng file :
    - Giới hạn hệ điều hành . Chẳng hạn một hệ điều hành chỉ cho mở một số file nhất định cùng lúc thì nếu quên đóng file sẽ gây hao tốn tài nguyên . Đặc biệt là các file có dung lượng lớn .
    - Khi một file được mở , hệ điều hành sẽ khóa file đó lại , không cho các chương trình khác có thể xử lý trên file đó nữa nhằm đảm bảo tính nhất quán của dữ liệu .
### **Hàm `close`**
- Cú pháp :
    ```py
    <file>.close()
    ```
- **VD :**
    ```py
    >>> file_op.close()
    ```
    => Sau khi đóng file , các phương thức xử lý sẽ không thể sử dụng được :

    ```py
    >>> data1 = file_op.read()         # Đọc file vừa bị đóng
    Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    ValueError: I/O operation on closed file.
    ```
## **4) Đọc file trong Python**
### **Hàm `read`**
- Cú pháp :
    ```py
    <file>.read(size=-1)
    ```
- Công dụng : Nếu `size` bị bỏ trống hoặc là một số âm , nó sẽ đọc hết nội dung file đồng thời đưa con trỏ file tới cuối file . Nếu không nó sẽ đọc tới `n` ký tự ( với `size = n` ) hoặc cho tới khi nội dung của file đã được đọc xong .
    - Sau khi đọc được nội dung , nó sẽ trả về dưới một dạng chuỗi .
    - Nếu không đọc được gì , nó sẽ trả về một chuỗi có độ dài bằng `0` ( `''` ) .
- **VD :**
    ```py
    >>> data = file_op.read()
    >>> data
    "File test\nprint('Hello World!')\n"
    >>> data_1 = file_op.read(10)
    >>> data_1
    'File test\n'
    ```
### **Hàm `readline`**
- Cú pháp :
    ```py
    <file>.readline(size=-1)
    ```
- Công dụng : đối với cách sử dụng `size` thì giống với `read` . Khác biệt ở chỗ :
    - `readline` chỉ đọc được 1 dòng có nghĩa là đọc tới khi nào gặp `\n` hoặc hết file thì ngừng .
    - Con trỏ file cũng sẽ đi từ dòng này qua dòng khác .
    - Kết quả đọc được trả về dưới dạng một chuỗi
    - Nếu không đọc được gì , phương thức sẽ trả về một chuỗi có độ dài bằng `0` .
- **VD :**
    ```py
    >>> file_op.readline()
    'File test\n'
    >>> file_op.readline()
    "print('Hello World!')\n"
    >>> file_op.readline()
    ''
    ```
### **Hàm `readlines`**
- Cú pháp :
    ```py
    <file>.readlines(hint=-1)
    ```
- Công dụng : hàm này sẽ đọc toàn bộ file , sau đó cho chúng vào một `list` , với các phần tử trong `list` là mỗi dòng của file . Con trỏ file sẽ được đưa tới cuối file ngay sau khi thực hiện lệnh . Khi đó , nếu tiếp tục dùng `readlines` , sẽ nhận được một chuỗi rỗng .
- **VD :**
    ```py
    >>> list_content = file_op.readlines()
    >>> list_content
    ['File test\n', "print('Hello World!')\n"]
    >>> list_content[0]
    'File test\n'
    >>> list_content[1]
    "print('Hello World!')\n"
    ```
### **Đọc file bằng constructor nhận iterable** `*`
## **5) Ghi file trong Python**
### **Hàm `write`**
- Cú pháp :
    ```py
    <file>.write(text)       # text là nội dung muốn ghi vào file
    ```
- Công dụng : trả về số ký tự mà ta ghi vào . Con trỏ file sẽ được đặt ngay sau ký tự cuối cùng được ghi .
- **VD1 :**
    ```py
    >>> file_op = open('/tmp/handling.txt', 'w')  # Thêm mode writable
    >>> file_op.write('Add a new line\n')
    15                                            # Số ký tự của chuỗi thêm vào
    ```
- Tuy nhiên sau khi sử dụng mode `w` , toàn bộ nội dung cũ của file sẽ bị mất đi , thay vào đó là nội dung mới . Vì vậy nếu muốn thêm nội dung nên dùng mode `a` ( hoặc `a+` ) .
- **VD2 :**
    ```py
    >>> file_op = open('/tmp/handling.txt', 'a+')
    >>> file_op.write('Add another new line\n')
    21
    >>> file_op.close()               # đóng file để đưa con trỏ chuột về đầu file
    >>> file_op = open('/tmp/handling.txt')
    >>> data = file_op.read()
    'Add a new line\nAdd another new line\n'
    ```
## **6) Kiểm soát con trỏ file**
### **Hàm `seek`**
- Cú pháp :
    ```py
    <file>.seek(offset, whence=0)
    ```
    > Trong **Python `3.X`** , một text file sẽ chỉ được sử dụng `whence = 0` . `whence = 1` hoặc `whence = 2` chỉ sử dụng với binary file .
- Công dụng : giúp ta di chuyển con trỏ từ vị trí đầu file qua `offset` kí tự ( `offset` phải là một số tự nhiên ) .<br>
    => Nhờ hàm này , có thể ghi nội dung từ bất cứ đâu trong file đồng thời có thể đọc lại file sau khi đưa con trỏ file xuống cuối file .
- **VD :**
    ```py
    >>> data = file_op.read()
    >>> data                            # con trỏ đang ở cuối file nên không thể đọc nữa
    ''
    >>> file_op.seek(0)                 # đưa con trỏ về đầu file (offset 0)
    0
    >>> data = file_op.read()
    >>> data
    'Add a new line\nAdd another new line\nAdd another new line\n'   # file đã có thể đọc được
    >>> 
    ```
## **7) Câu lệnh `with`**
- Cấu trúc :
    ```py
    with expression [as variable]
        with-block
    ```
    > `with-block` nằm thụt so với `with expression` là `4-space` ( `space` chứ không phải `tab` - Theo chuẩn [`PEP8`](https://www.python.org/dev/peps/pep-0008/) )
- Đặc điểm của câu lệnh `with` : khi kết thúc `with-block` , file sẽ được đóng
    ```py
    >>> with open('/tmp/handling.txt') as file_op:
    ...     data_1 = file_op.read()
    ...     # Gõ Ctrl + D để kết thúc
    >>> data_1
    'Add a new line\nAdd another new line\nAdd another new line\n'
    ```

