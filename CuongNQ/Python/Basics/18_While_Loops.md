# Vòng lặp While
## **1) Vòng lặp `While`**
- Cú pháp :
    ```py
    while expression:
        # while-block
    ```
- Cách hoạt động : đầu tiên , **Python** sẽ kiểm tra giá trị `boolean` của `expression` . Nếu là `False` , thì bỏ qua `while-block` và đến với câu lệnh tiếp theo . Ngược lại , sẽ thực hiện toàn bộ câu lệnh trong `while-block` . Sau khi thực hiện xong , quay ngược lại kiểm tra giá trị `boolean` của `expression` một lần nữa , nếu `False` thì bỏ qua `while-block` , còn `True` thì tiếp tục thực hiện `while-block` . Và sau khi thực hiện xong lại quay về kiểm tra giá trị `boolean` của `expression` như những lần trước .
- **VD :**
    ```py
    >>> k = 5
    >>> while k > 0:
    ...     print('k =', k)
    ...     k-=1
    ...
    k = 5
    k = 4
    k = 3
    k = 2
    k = 1
    ```
## **2) Lệnh `break` và `continue`**
> **Lưu ý** : 2 câu lệnh này chỉ có thể dùng trong các vòng lặp
### **2.1) Lệnh `break`**
- Lệnh `break` dùng để kết thúc vòng lặp . Nó nằm trong block của vòng lặp nào thì vòng lặp đó sẽ kết thúc khi chạy câu lệnh này .
- Trong trường hợp vòng lặp a chứa vòng lặp b , trong vòng lặp b chạy câu lệnh `break` thì chỉ vòng lặp b kết thúc , còn vòng lặp a thì không .
- **VD :**
    ```py
    ```
### **2.2) Lệnh `continue`**
- Lệnh `continue` dùng để chạy tiếp vòng lặp
- Cú pháp :
    ```py
    while expression
        # while-block-1
        continue
        # while-block-2
    ```
    => Khi thực hiện xong `while-block-1` , câu lệnh continue sẽ tiếp tục vòng lặp , không quan tâm những câu lệnh ở dưới continue và như vậy nó đã bỏ qua `while-block-2` .
## **3) Vòng lặp `While-else`**`*`
- Cú pháp :
    ```py
    while expression
        # while-block
    else
        # else-block
    ```
- Cấu trúc này gần tương tự như `while` bình thường. Thêm một điều, khi vòng lặp while kết thúc thì khối lệnh `else-block` sẽ được thực hiện .
