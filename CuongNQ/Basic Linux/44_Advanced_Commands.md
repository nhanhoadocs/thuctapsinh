# Advanced Commands
## **1) `sed`**
- **`sed`** là một trong những công cụ mạnh mẽ trong Linux giúp chúng ta có thể thực hiện các thao tác với văn bản như tìm kiếm, chỉnh sửa, xóa..
- **`sed`** chấp nhận văn bản đầu vào có thể là nội dung từ một file có trên hệ thống hoặc từ standard input hay stdin .
- Cấu trúc lệnh :
    ```
    # sed [options] [scripts] [input_file]
    ```
    - **Options :**
        - `-i` ( *in-place substitution* )  : chỉnh sửa trực tiếp vào file
    - **Scripts :**
        - `s` ( *substitution* ) :
        - `g` ( *global replacement* ) :
        - `p` ( *print* ) :
- **VD :** Có file `test.txt` :
    ```
    Dong thu mot cua doan van thu mot cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu BA cua doan van thu BA cua bai van thu BA
    #Dong cuoi cung cua tac pham thu Mot
    ```
- **TH1 :** **Tìm kiếm và thay thế ( *phân biệt chữ hoa và chữ thường* )** : tìm kiếm từ `mot` và thay thế bằng từ `MOT` :
    ```
    # sed `s/mot/MOT/` text.txt      ( tùy chọn `g` có thể bỏ qua )
    ```
    - Màn hình terminal sẽ hiện ra nội dung sau khi thay thế , tuy nhiên nội dung file vẫn không bị ảnh hưởng :
        ```
        Dong thu MOT cua doan van thu mot cua bai van thu mot
        Dong thu Hai cua doan van thu Hai cua bai van thu Hai
        Dong thu BA cua doan van thu BA cua bai van thu BA
        #Dong cuoi cung cua tac pham thu Mot
        ```
- **TH2 :** **Tìm kiếm và thay thế ( *phân biệt chữ hoa và chữ thường* )** : tìm kiếm từ `mot` và thay thế bằng từ `MOT` :
    ```
    # sed 's/mot/MOT/i' text.txt
    ```
    - Màn hình terminal sẽ hiện ra nội dung sau khi thay thế , tuy nhiên nội dung file vẫn không bị ảnh hưởng :
        ```
        Dong thu MOT cua doan van thu mot cua bai van thu mot
        Dong thu Hai cua doan van thu Hai cua bai van thu Hai
        Dong thu BA cua doan van thu BA cua bai van thu BA
        #Dong cuoi cung cua tac pham thu MOT
        ```
- **TH3 :** **Tìm kiếm và thay thế ( *thay đổi luôn nội dung file* )** : tìm kiếm từ `mot` và thay thế bằng từ `mOt` :
    ```
    # sed -i 's/mot/MOT/i' test.txt
    ```
    ```
    # vi text.txt
    Dong thu MOT cua doan van thu mot cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu BA cua doan van thu BA cua bai van thu BA
    #Dong cuoi cung cua tac pham thu MOT
    ```
- **TH4 :** **Tìm kiếm và thay thế ( *lưu nội dung thay đổi ra file mới* )** :
    ```
    # sed -i '.modified' 's/mot/MOT' test.txt
    ```
    - Câu lệnh trên sẽ tạo ra file `text.txt.modified` :
        ```
        # vi text.txt.modified
        Dong thu MOT cua doan van thu mot cua bai van thu mot
        Dong thu Hai cua doan van thu Hai cua bai van thu Hai
        Dong thu BA cua doan van thu BA cua bai van thu BA
        #Dong cuoi cung cua tac pham thu Mot
        ```
- **TH5 :** **Tìm kiếm và thay thế ( *nhiều hơn 1 từ / 1 dòng* )** : mặc định các lệnh trên chỉ thay thế từ đầu tiên của dòng . Tùy chọn `/1` , `/2` , `/3` sẽ giúp chỉ rõ vị trí từ cần thay thế . VD : 
    ```
    # sed -i 's/mot/MOT/2' test.txt
    ```
    ```
    # vi text.txt
    Dong thu mot cua doan van thu MOT cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu BA cua doan van thu BA cua bai van thu BA
    #Dong cuoi cung cua tac pham thu MOT
    ```
- **TH6 :** **Tìm kiếm và thay thế ( *tất cả các từ* )** : sử dụng tùy chọn `/g` để thay thế tất cả các từ đúng yêu cầu trong cả file :
    ```
    # sed -i 's/mot/MOT/g' test.txt
    ```
    ```
    # vi text.txt
    Dong thu MOT cua doan van thu MOT cua bai van thu MOT
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu BA cua doan van thu BA cua bai van thu BA
    #Dong cuoi cung cua tac pham thu MOT
    ```
- **TH7 :** **Tìm kiếm và thay thế ( *tất cả các từ của dòng sau vị trí n* )** : sử dụng tùy chọn `/'n'g` để thay thế tất cả các từ thỏa mãn từ thứ `n` trở đi trong dòng :
    ```
    # sed -i 's/mot/MOT/2g' test.txt
    ```
    ```
    # vi text.txt
    Dong thu mot cua doan van thu MOT cua bai van thu MOT
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu BA cua doan van thu BA cua bai van thu BA
    #Dong cuoi cung cua tac pham thu mot
    ```
- **TH7 :** **Tìm kiếm và thay thế ( *chỉ định trong dòng n* )** : 
    ```
    # sed -i '3 s/BA/ba' test.txt     ( chỉ thay thế trong dòng số 3 )
    ```
    ```
    # vi text.txt
    Dong thu mot cua doan van thu MOT cua bai van thu MOT
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu ba cua doan van thu ba cua bai van thu ba
    #Dong cuoi cung cua tac pham thu mot
    ```
- **TH8 :**  **Tìm kiếm và thay thế** ( *từ dòng thứ `x` đến dòng thứ `y`* ) :
    ```
    # sed -i '1,3 s/mot/MOT' test.txt
    ```
    ```
    # vi text.txt
    Dong thu MOT cua doan van thu mot cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu ba cua doan van thu ba cua bai van thu ba
    #Dong cuoi cung cua tac pham thu mot
    ```
    hoặc thay thế từ dòng `n` đến cuối file :
    ```
    # sed -i '2,$ s/mot/MOT' test.txt
    ```
    ```
    # vi text.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu ba cua doan van thu ba cua bai van thu ba
    #Dong cuoi cung cua tac pham thu MOT
    ```    
- **TH9 :** **Tìm kiếm và thay thế** ( *nhân đôi những dòng bị thay thế* ) :
    ```
    # sed 's/Hai/HAI/p` test.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    Dong thu HAI cua doan van thu Hai cua bai van thu Hai
    Dong thu HAI cua doan van thu Hai cua bai van thu Hai
    Dong thu ba cua doan van thu ba cua bai van thu ba
    #Dong cuoi cung cua tac pham thu mot
    ```
- **TH10 :** **Tìm kiếm và thay thế** ( *in ra những dòng bị thay thế* ) :
    ```
    # sed -n 's/Hai/HAI/p' test.txt
    Dong thu HAI cua doan van thu Hai cua bai van thu Hai
    ```
- **TH11 :** **Xóa dòng** ( *xóa dòng thứ `n`* ) :
    ```
    # sed '2d' test.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    Dong thu ba cua doan van thu ba cua bai van thu ba
    #Dong cuoi cung cua tac pham thu mot
    ```
- **TH12 :** **Xóa dòng** ( *xóa dòng cuối cùng* ) :
    ```
    # sed '$d' test.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu ba cua doan van thu ba cua bai van thu ba
    ```
- **TH13 :** **Xóa dòng** ( *xóa từ dòng thứ `x` đến dòng thứ `y`* ) :
    ```
    # sed '2,4d' test.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    ```
    hoặc xóa từ dòng thứ *n* đến cuối file :
    ```
    # sed '2,$d' test.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    ```
- **TH14 :** **Xóa dòng** ( *xóa dòng có chứa đoạn `abc`* )
    ```
    # sed '/#/d' test.txt
    Dong thu mot cua doan van thu mot cua bai van thu mot
    Dong thu Hai cua doan van thu Hai cua bai van thu Hai
    Dong thu ba cua doan van thu ba cua bai van thu ba
    ```
>### **Áp dụng** : In ra file cấu hình nguyên bản của service ( không có *comment#* )
- **VD :** Lọc file `/etc/httpd/conf/httpd.conf`

    <img src=https://i.imgur.com/hPukCpT.png>

    ```
    # sed -i '/#/d' /etc/httpd/conf/httpd.conf   (Xóa dòng comment)
    # sed -i '/^$/d' /etc/httpd/conf/httpd.conf  (Xóa dòng trống)
    ```
    <img src=https://i.imgur.com/55bjjra.png>