# Cấu trúc rẽ nhánh với `if`
## **1) Các cấu trúc với `if`**
### **1.1) Cấu trúc `If`**
- Cú pháp :
    ```py
    if expression:
        # If-block
    ```
    > **Lưu ý :** tất cả các câu lệnh nằm trong `if-block` là các câu lệnh có lề thụt vào trong so với câu lệnh `if`. 
### **1.2) Cấu trúc `If - elif`**
- Cú pháp :
    ```py
    if expression-1:
        # if-block-1
    elif expression-2:
        # if-block-2
    ....
    elif expression-n:
        # if-block-n
    ```
### **1.3) Cấu trúc `If - else`**
- Cú pháp :
    ```py
    if expression:
        # if-block
    else expression:
        # else-block
    ```
### **1.4) Cấu trúc `If - elif - else`**
- Cú pháp :
    ```py
    if expression-1:
        # if-block-1
    elif expression-2:
        # if-block-2
    ....
    elif expression-(n-1):
        # if-block-(n-1)
    else expression-n:
        # if-block-n
    ```
## **2) Block trong Python**
- Với đa số các ngôn ngữ lập trình hiện nay , thường dùng dấu ngoặc `{}` để phân chia các `block` .
- Riêng đối với **Python** lại sử dụng việc định dạng code để suy ra các `block` .
- Các lưu ý về định dạng của `code block` trong **Python** :
    - Câu lệnh mở đầu `block` kết thúc bằng dấu `:` , sau khi sử dụng câu lệnh có dấu `:` buộc phải xuống dòng và lùi lề vào trong và có tối thiểu một câu lệnh để không bỏ trống `block` .
    - Những dòng `code` cùng lề thì là cùng 1 `block` .
    - Một `block` có thể có nhiều `block` khác .
    - Khi căn lề `block` không sử dụng cả `Tab` và `Space` .
    - Nên sử dụng `4-space` để căn lề 1 `block` .
- **VD :**
    ```py
    a = 3

    if a - 1 < 0:
        print('a nhỏ hơn 1')
        if a < 0:
            print('a nhỏ hơn 0')
        else:
            print('a không nhỏ hơn 0')
    elif a - 1 > 0:
        print('a lớn hơn 1')
        if a - 2 > 0:
            print('a lớn hơn 2')
            if a - 3 > 0:
                print('a lớn hơn 3')
        elif a - 2 == 0:
            print('a bằng 2')
        else:
            print('1 < a < 2')
    else
        print('a bằng 1')
    ```

