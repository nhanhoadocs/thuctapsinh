# Text Commands
## **1) Hiển thị nội dung file ( display )**
### **1.1) `cat` ( concatenate )**
- Lệnh `cat` được dùng để hiển thị nội dung của file ra màn hình hoặc cũng có thể biến tấu khác như copy nội dung tập tin , tạo mới tập tin ,...
    ```
    # cat [options] [file]
    ```
    - **Options :**
        - `-n` : hiển thị nội dung file cùng số dòng
        - `-e` : hiển thị `$` ở cuối dòng 
        - `-T` : convert khoảng trắng TAB thành "`^I`"
- Hiển thị nội dung nhiều file cùng 1 lúc :
    ```
    # cat /etc/file1 /etc/file2
    = # cat /etc/file1 ; cat /etc/file2
    ```
- Tạo file rỗng mới :
    ```
    # cat file_rong.txt        ( file_rong.txt chưa tồn tại )
    = # touch file_rong.txt
- Hiển thị nội dung với lệnh `more` hoặc `less` để xem từ từ nội dung file :
    ```
    # cat song.txt | more
    # cat song.txt | less
    ```
- Hiển thị `$` ở cuối mỗi dòng :
    ```
    # cat -e file1.txt
    ```

    <p align=center><img src=https://i.imgur.com/1eWYY1l.png width=80%></p>

- Thay thế `TAB` bằng `^I` trong file :
    ```
    # cat -T file1.txt
    ```

    <p align=center><img src=https://i.imgur.com/vJ2DwoV.png width=80%></p>

- Copy nội dung file : sử dụng điều hướng **Standard Output ( stdout )** với option `>` để copy nội dung file nguồn lên file đích . Lưu ý là nội dung file nguồn sẽ ***ghi đè*** lên file đích làm mất nội dung file đích nếu có :
    ```
    # cat file1.txt > file2.txt
- Thêm nội dung vào cuối file : sử dụng option `>>` chuyển hướng mở rộng nội dung **stdout** :
    ```
    # cat file1.txt >> file2.txt
    ```
- Nhập nội dung từ màn hình shell vào file :
    ```
    # cat > file1.txt
    ```
    => Nhập nội dung :<br>
    => Gõ `Ctrl` + `Z` để lưu và thoát .

    <p align=center><img src=https://i.imgur.com/8XoobM6.png width=80%></p>

### **1.2) `more`**
- Tính năng gần giống `cat` nhưng trình bày theo từng trang , có thể dùng `space` để lật trang .
    ```
    # more [file]
    ```
### **1.3) `less`**
- Ưu việt hơn cả `cat` và `more` .
- Sử dụng phím "&uarr;" , "&darr;" hoặc "`PgUp`" , "`PgDn`" để xem nội dung file .
- Sử dụng phím `G` để trở về đầu văn bản hoặc `Shift` + `G` để đến cuối văn bản .
- Gõ "`/<text>`" để tìm kiếm 1 đoạn văn bản , gõ `N` để đi lại giữa các kết quả tìm kiếm và `Shift` + `N` để quay lại các kết quả tìm kiếm trước .
- Gõ `Q` để thoát lệnh .
    ```
    # less [file]
    ```
## **2) Lọc nội dung file ( filter )**
### **2.1) `head`**
- Là lệnh cho phép hiển thị *phần đầu* file .
    ```
    # head [options] [file]
    ```
    - **Options :**
        - `-n [number]` : số dòng muốn hiển thị ( mặc định là `10` )
### **2.2) `tail`**
- Là lệnh cho phép hiển thị phần cuối file.
    ```
    # tail [options] [file]
    ```
    - **Options :**
        - `-n [number]` : số dòng muốn hiển thị ( mặc định là `10` )
- Có thể dùng để xem nội dung file `log` :
    ```
    # tail -f /var/log/boot.log
    ```
### **2.3) `grep`**
- Là lệnh cho phép lọc dữ liệu theo từng dòng .
    ```
    # grep [options] [string] [file]
    ```
    - **Options :**
        - `-c` : đếm số lần xuất hiện của `string` trong file
        - `-n` : hiển thị số dòng có chứa `string` trong file
        - `-i` : tìm kiếm không phân biệt chữ hoa và chữ thường
        - `-w` : tim kiếm chính xác nội dung của `string`
### **2.4) `cut`**
- Là lệnh lọc dữ liệu theo cột
    ```
    # cut [options] [file]
    ```
    - **Options :**
        - `-d'signal'` : dấu hiệu nhận biết sự ngăn cách giữa các cột 
        - `-f` : vị trí cột muốn lấy
        - `-c -number` : số kí tự muốn lấy
- Lấy cột thứ `1` trong file `/etc/passwd` ( `signal` là `:`) :
    ```
    # cut -d: -f 1 /etc/passwd
    ```
    
    <img src=https://i.imgur.com/M1EXiIb.png>

- Lấy cột thứ `7` của file `/etc/passwd` có chứa từ `root` :
    ```
    # grep root /etc/passwd | cut -d: -f 7
    ```

    <img src=https://i.imgur.com/mS6puQA.png>

- Lấy `10` kí tự đầu tiên ở 5 dòng cuối file `/etc/passwd` :
    ```
    # tail -5 /etc/passwd | cut -c -10
    ```

    <img src=https://i.imgur.com/sArQyRX.png>

### **2.5) `wc` ( word count )**
- Được sử dụng để tìm kiếm thông tin về số lượng dòng , số lượng từ , byte hoặc số lượng kí tự của 1 file hoặc 1 biến có nội dung . Kết quả output mặc định hiển thị *số lượng dòng , số lượng từ , số lượng kí tự* của file .
    ```
    # wc [options] [file]
    ```
    - **Options :**
        - `-l` : đếm số lượng dòng
        - `-w` : đếm số lượng từ
        - `-c` : tính tổng byte 
        - `-m` : đếm số lượng kí tự ( =`-c` do 1 kí tự cũng bằng 1 `byte`)
        - `-L` : hiển thị dòng có nội dung dài nhất
- Sử dụng cơ bản :
    ```
    # wc file1.txt
    ```

    <img src=https://i.imgur.com/3TEYlyd.png>

    => Trong đó : `3` là *số dòng trong file* , `8` là *số lượng từ trong file* , `49` là *số lượng kí tự trong file* .
    