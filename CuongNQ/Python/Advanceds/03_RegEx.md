# RegEx
## **1) Giới thiệu**
- **RegEx** ( hay **Regular Expression** ) là một chuỗi ký tự hình thành một công thức tìm kiếm .
- **RegEx** có thể được sử dụng để kiểm tra xem liệu một chuỗi có chứa phần cần tìm hay không .
- **Python** có một **package** được tích hợp sẵn là `re` , có thể được sử dụng để làm việc với **regular expression** .
- Import module `re` :
    ```py
    import re
    ```
## **2) Các công thức đặc biệt trong RegEx**
### **2.1) Metacharacters**

| **Character** | **Mô tả** | **VD** |
|---------------|-----------|--------|
| `[]` | Một bộ ký tự | "`[a-m]`" |
| `\` | Ký hiệu một chuỗi đặc biệt | "`\d`" |
| `.` | Trùng khớp với bất kỳ ký tự nào , ngoại trừ `\n` | "`he..o`" |
| `^` | Bắt đầu với (chuỗi) ký tự theo sau | "`^hello`" |
| `$` | Kết thúc với (chuỗi) ký tự đứng trước | "`world$`" |
| `*` | Trùng khớp với 0 hoặc nhiều lần ký tự đứng trước nó | "`aix*`" |
| `+` | Trùng khớp với 1 hoặc nhiều lần ký tự đứng trước nó | "`aix+`" |
| `?` | Trùng khớp với 0 hoặc 1 lần ký tự đứng trước nó | "`aix?`" |
| `{n}` | Trùng khớp với đúng `n` lần ký tự đứng trước nó | "`al{2}`" |
| `x|y` | Trùng khớp với `x` hoặc `y` | "`falls|stays`" |
| `()` | Capture and Group | |

### **2.2) Chuỗi đặc biệt**

| **Character** | **Mô tả** | **VD** |
|---------------|-----------|--------|
| `\A` | 
| `\b` |
| `\B` |
| `\d` |
| `\D` | 
| `\s` |
| `\S` |
| `\w` |
| `\W` |
| `\Z` |

### **2.3) Bộ ký tự**

| **Bộ ký tự** | **Mô tả** |
|--------------|-----------|
| `[arn]` | 
| `[a-n]` |
| `[^arn]` |
| `[0123]` |
| `[0-9]` |
| `[0-5][0-9]` |
| `[a-zA-Z]` |
| `[+]` |

## **3) Các hàm trong RegEx**
### **3.1) Hàm `findall()`**
- Hàm `findall()` trả về một list chứa toàn tất cả kết quả trùng khớp với điều kiện tìm kiếm . Nếu không có kết quả trùng khớp , sẽ nhận được một list rỗng
- Cú pháp :
    ```py
    findall("need_string", string)
    ```
- **VD :**
    ```py
    import re

    str = "The rain in Spain"
    x = re.findall("ai", str)
    print(x)
    ```
    => Output :
    ```
    ['ai', 'ai']
    ```
### **3.2) Hàm `search()`**
- Hàm `search()` sẽ tìm kiếm kết quả trùng khớp trong một chuỗi , sau đó trả về **Match object** nếu trùng khớp . Nếu có nhiều kết quả trùng khớp , nó cũng chỉ trả về giá trị trùng khớp đầu tiên . Nếu không có kết quả trùng khớp , giá trị `None` sẽ được trả về .
- Cú pháp :
    ```py
    search("need_string", string)
    ```
- **VD :** Tìm kiếm chuỗi bắt đầu bằng `Hello` và kết thúc bằng `you` :
    ```py
    import re

    txt = "Hello all of you"
    x = re.search("^Hello.*you$", txt)
    print(x)
    if (x):
        print("Matched!")
    else:
        print("No match!")
    ```
    => Output :
    ```
    <_sre.SRE_Match object; span=(0, 16), match='Hello all of you'>
    Matched!
    ```
### **3.3) Hàm `split()`**
- Hàm `split()` trả về một list chính là chuỗi đã được chia ra bởi chuỗi nhập vào .
- Cú pháp :
    ```py
    split("split_text", string)
    ```
- **VD :**
    ```py
    import re

    txt = "Hello all of you"
    x = re.split("o", txt)
    print(x)
    ```
    => Output :
    ```
    ['Hell', ' all ', 'f y', 'u']
    ```
- Có thể kiểm soát số lần chuỗi bị phân tách bằng tham số `maxsplit` :
    ```py
    split("split_string", string, maxsplit)
    ```
    - **VD :**
        ```py
        import re

        txt = "Hello all of you"
        x = re.split("o", txt, 1)
        print(x)
        ```
        => Output :
        ```
        ['Hell', ' all of you']
        ```
### **3.4) Hàm `sub()`**
- Hàm `sub()` chó phép tìm kiếm và thay thế kết quả tìm được bằng một chuỗi cho trước .
- Cú pháp :
    ```py
    sub("find_string", "replace_string", string)
    ```
- **VD :**
    ```py
    import re

    txt = "Hello all of you"
    x = re.sub("o", "0", txt)
    print(x)
    ```
    => Output :
    ```
    Hell0 all 0f y0u
    ```
- Có thể điều chỉnh số lần thay thế chuỗi bằng tham số `count` :
    ```py
    sub("find_string", "replace_string", string, count)
    ```
    - **VD :**
        ```py
        import re

        txt = "Hello all of you"
        x = re.sub("o", "0", txt, 2)
        print(x)
        ```
        => Output :
        ```
        Hell0 all 0f you
        ```
## **4) Match Object**
- Một **match object** là một **object** chứa các thông tin về việc tìm kiếm và kết quả .
- Nếu không có kết quả tìm kiếm trùng khớp , giá trị `None` sẽ trả về , thay cho **match object** .
- **VD :** trả về 1 **match object** :
    ```py
    import re

    str = "The rain in Spain"
    x = re.search("ai", str)
    print(x) #this will print an object
    ```
    => Output :
    ```
    <_sre.SRE_Match object; span=(5, 7), match='ai'>
    ```
- **Match object** có các thuộc tính và phương thức để lấy thông tin về việc tìm kiếm và kết quả :
    - `.span()` : trả về **tuple** chứa vị trí bắt đầu , kết thúc của kết quả trùng khớp :
        ```py
        import re

        str = "The rain in Spain"
        x = re.search(r"\bS\w+", str)
        print(x.span())
        ```
        => Output:
        ```
        (12, 17)
        ```
    - `.string()` : trả về chuỗi ban đầu dùng để tìm kiếm :
        ```py
        import re

        str = "The rain in Spain"
        x = re.search(r"\bS\w+", str)
        print(x.string)
        ```
        => Output :
        ```
        The rain in Spain
        ```
    - `.group()` : trả về một phần của chuỗi mà có chứa kết quả trùng khớp :
        ```py
        import re

        str = "The rain in Spain"
        x = re.search(r"\bS\w+", str)
        print(x.group())
        ```
        => Output :
        ```
        Spain
        ```