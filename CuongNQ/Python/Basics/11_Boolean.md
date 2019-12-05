# Kiểu dữ liệu Boolean
## **1) Khái niệm**
- **Boolean** là một kiểu dữ liệu mà các ngôn ngữ lập trình ngày này đều thường xuyên sử dụng .
- Kiểu dữ liệu này có 2 giá trị :
    - `True` - đúng
    - `False` - sai
## **2) Boolean trong các toán tử so sánh**
### **2.1) So sánh giữa số với số**
- Bảng các toán tử so sánh trong **Python** :

    | Toán học | Python |
    |----------|--------|
    | > | > |
    | < | < |
    | = | == |
    | &ge; | >= |
    | &le; | <= |
    | &ne; | != |

- **VD :**
    ```py
    >>> 3 > 1
    True
    >>> 5 + 2 == 10
    False
    ```
### **2.2) So sánh giữa 2 iterable cùng loại**
- Khi so sánh 2 **iterable** cùng loại , **Python** sẽ lấy lần lượt từng phần tử trong **iterable** ra so sánh .
- **VD :**
    ```py
    >>> 'Hello' == 'Hello'
    True
    >>> 'Hello' == 'hello'
    False
    ```
- **Python** sẽ so sánh các ký tự bằng cách đưa chúng về dưới dạng số `ASCII` bằng hàm `ord()` . [Tra bảng mã ASCII](http://www.asciitable.com/)
    - Khi so sánh bằng các toán tử `==` , `<=` , `>=` thì **Python** sẽ so sánh hết các phần tử .
    - Khi so sánh bằng các toán tử `<` , `>` , `!=` thì nhiều lúc **Python** sẽ không phải đi hết các giá trị **iterable** . Nếu như ở vị trí `i` nào đó mà nó thấy 2 giá trị không bằng nhau nó sẽ dừng lại .
