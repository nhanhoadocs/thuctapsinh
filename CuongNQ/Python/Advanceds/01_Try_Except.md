# Lệnh Try...Except
- Khối lệnh `try` cho phép kiểm tra một khối lệnh xem có bị lỗi không .
## **1) Cấu trúc `try - except`**
- Cú pháp :
    ```py
    try
        # try-block
    except
        # except-block
    ```
- Công dụng : khi có lệnh nào đó trong khối `try-block` gây ra lỗi , thay vì hiển thị lỗi theo**Python** , khối lệnh `except-block` sẽ được thực hiện . Nếu các lệnh trong `try-block` không bị lỗi , `except-block` sẽ không được thực hiện .
- **VD :**
    ```py
    try:
        print(Hello)         # thiếu dấu ''
    except:
        print("Co loi xay ra")
    ```
    => Output :
    ```
    Co loi xay ra
    ```
- Nếu không sử dụng cấu trúc `try...except` , câu lệnh trên sẽ báo lỗi :
    ```
    Traceback (most recent call last):
    File "/home/cuongnq/code/test_5.py", line 1, in <module>
        print(Hello)
    NameError: name 'Hello' is not defined
    ```
## **2) Cấu trúc `try - except - except ...`**
- Có thể định nghĩa nhiều `except-block` , trong trường hợp muốn những khối `except` riêng cho từng loại `error` trả về .
- Cú pháp :
    ```py
    try:
        # try-block
    except error_name_1:
        # except-block-1
    except error_name_2:
        # except-block-2
        ...
    except:
        # except-block-n
    ```
- **VD :**
    ```py
    try:
        print(x)
    except NameError:
        print("Variable 'x' is not defined")
    except:
        print("Something else went wrong")
    ```
    => Output :
    ```
    Variable 'x' is not defined
    ```
- Bảng các lỗi thường gặp trong **Python** :

    | **Error_Name** | **Nguyên nhân** |
    |---------------|-----------------|
    | `AssertionError` | |
    | `AttributeError` | |
    | `EOFError` | |
    | `FloatingPointError` | |
    | `GeneratorExit` | |
    | `ImportError` | |
    | `IndentationError` | |
    | `IndexError` | |
    | `KeyError` | |
    | `KeyboardInterrupt` | |
    | `MemoryError` | |
    | `NameError` | |
    | `NotImplementedError` | |
    | `OSError` | |
    | `OverflowError` | |
    | `ReferenceError` | |
    | `RuntimeError` | |
    | `StopIteration` | |
    | `SyntaxError` | |
    | `SystemError` | |
    | `SystemExit` | |
    | `TabError` | |
    | `TypeError` | |
    | `UnboundLocalError` | |
    | `UnicodeError` | |
    | `UnicodeEncodeError` | |
    | `UnicodeDecodeError` | |
    | `UnicodeTranslateError` | |
    | `ValueError` | |
    | `ZeroDivisionError` | |
    
## **3) Cấu trúc `try - except - else`**
- Sử dụng cấu trúc `else` để định nghĩa khối lệnh muốn thực hiện khi `try-block` không bị lỗi .
- Cú pháp :
    ```py
    try:
        # try-block
    except:
        # except-block
    else:
        # else-block
    ```
- **VD :**
    ```py
    try:
        print("Hello")
    except:
        print("Something went wrong")
    else:
        print("Nothing went wrong")
    ```
    => Output :
    ```
    Nothing went wrong
    ```
## **4) Cấu trúc `try - except - finally`**
- Khối lệnh `finally` sẽ luôn được thực hiện chi dù `try-block` có lỗi hay không .
- Cú pháp :
    ```py
    try:
        # try-block
    except:
        # except-block
    finally:
        # finally-block
    ```
- **VD :**
    ```py
    try:
        print(x)
    except:
        print("Something went wrong")
    finally:
        print("The 'try except' is finished")
    ```
    => Output :
    ```
    Something went wrong
    The 'try except' is finished
    ```
- Cấu trúc này rất có ích trong việc đóng mở file :
    ```py
    try:
        f = open("demofile.txt")
        f.write("Lorum Ipsum")
    except:
        print("Something went wrong when writing to the file")
    finally:
        f.close()
    ```
    => Output :
    ```
    Something went wrong when writing to the file
    ```
