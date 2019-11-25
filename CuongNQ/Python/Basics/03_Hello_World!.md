# Hello World!
## **1) Các môi trường chạy Python**
### **1.1) Chạy trực tiếp Interactive Prompt (Windows)**
- Mở **Command Prompt** gõ lệnh `python3` để vào trình chạy **Python** :
    
    <img src=https://i.imgur.com/2XW0zks.png>

### **1.2) Chạy trực tiếp bằng Terminal (CentOS/Ubuntu)**
- Mở **Terminal** gõ lệnh `python3.7` để vào trình chạy **Python** :

    <img src=https://i.imgur.com/A5lXDo5.png>

### **1.3) Debug trên phần mềm Sublime Text 3**
- Mở file script với đuôi `.py` . Gõ `Ctrl` + `B` để chạy Script và Debug

    <img src=https://i.imgur.com/NSVxiln.png>

## **2) Chạy 1 chương trình Python**
- **B1 :** Tạo 1 file mới `hello_world.py`
- **B2 :** Mở file bằng các trình soạn thảo ( **Notepad** , **vim** ,... ) hoặc các **IDE** ( **Sublime Text 3** , **VS Code** , **Notepad++** ,.... ) và viết code .
- **B3 :** Chạy file bằng lệnh `python3` :
    ```
    python3 [options] [script_name]
    ```
    - **Options :**
        - `-d` : cung cấp tính năng debug
        - `-v` : 

## **3) Một số chú ý trong code**
### **3.1) Các keyword tránh sử dụng**
- Dưới đây là 1 số keyword của **Python** . Tránh sử dụng chúng để đặt tên biến và hằng số .
    - `and` , `exec` , `not` , `assert` , `finally` , `or` , `break` , `for` , `pass` , `class` , `from` , `print` , `continue` , `global` , `raise` , `def` , `if` , `return` , `del` , `import` , `try` , `elif` , `in` , `while` , `else` , `is` , `with` , `except` , `lambda` , `yield`
### **3.2) Nhận diện các block**
- **Python** không cung cấp các dấu ngoặc để phân biệt các đoạn block cho class , hàm ,... 
- Block sẽ được hiểu theo cách thụt đầu dòng
- Số dòng trong Block có thể vô hạn , nhưng các dòng trong cùng 1 block phải có cấu trúc thụt đầu dòng giống nhau .
- **VD1 :** Đoạn code chạy đúng :
    ```py
    if True:
        print("True")
    else:
        print("False")
    ```
- **VD2 :** Đoạn code bị lỗi :
    ```py
    if True:
    print("Answer")
    print("True")
    else:
    print("Answer")
    print("False")
    ```
### **3.3) Xuống dòng trong các mệnh đề**
- 1 lệnh hoặc 1 mệnh đề trong code thường kết thúc khi xuống dòng mới . Tuy nhiên , trong **Python** , có thể dùng dấu `\` để tiếp tục lệnh/mệnh đề ở dòng tiếp theo :
    ```py
    total = item_one + \
            item_two + \
            item_three
    ```
    Khối lệnh trên tương đương :
    ```
    total = item_one + item_two + item_three
    ```
- Những mệnh đề có chứa dấu `{}` , `[]` hoặc `()` thì không cần sử dụng `\` nếu muốn xuống dòng bên trong các dấu ngoặc :
    ```py
    days = ['Monday', 'Tuesday', 'Wednesday',
            'Thursday', 'Friday']
    ```
### **3.4) Quotation trong Python**
- **Python** sử dụng các dấu nháy đơn (`'`) , nháy kép (`"`) , hoặc nháy ba (`'''` hoặc `"""`) để biểu thị các chuỗi .
- Dấu nháy ba được sử dụng để kéo dài chuỗi qua nhiều dòng :
    ```py
    word = 'word'
    sentence = "This is a sentence."
    paragraph = """This is a paragraph. It is
    made up of multiple lines and sentences."""
    ```
### **3.5) Comment trong Python**
- Dấu hash (`#`) mà không ở trong 1 chuỗi thì sẽ bắt đầu cho 1 comment .
    ```py
    #!/usr/bin/python

    # First comment
    print("Hello, Python!") # second comment
    ```
- Comment nhiều dòng một lúc :
    ```py
    # This is a multiline
    # comment
    ```
    hoặc
    ```py
    '''
    This is a multiline
    comment.
    '''
    ```
### **3.6) Waiting for the User**
```py
#!/usr/bin/python

raw_input("\n\nPress the enter key to exit.")
```
### **3.7) Chạy nhiều lệnh trên cùng 1 dòng :**
- Sử dụng dấu `;` để ngăn cách giữa các lệnh :
    ```py
    import sys; x = 'foo'; sys.stdout.write(x + '\n')
    ```
