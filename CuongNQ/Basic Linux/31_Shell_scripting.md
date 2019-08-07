# Shell Scripting
## **1) Shell script là gì ?**
- **Shell** là chương trình giao tiếp với người dùng , chấp nhận các lệnh nhập từ keyboard và thực thi nó .
- Nếu muốn sử dụng nhiều lệnh chỉ bằng 1 lệnh , có thể lưu chuỗi lệnh vào file text và bảo **shell** thực thi chuỗi lệnh thay vì tự nhập vào các lệnh .
- **Shell-script** là 1 chuỗi các lệnh được viết trong *plain-text* file ( giống **batch** trong MS-DOS nhưng mạnh mẽ hơn ) .
- Ưu điểm :
    - **Shell-script** có thể nhận input từ user , file hoặc output từ màn hình .
    - Tiện lợi để tạo nhóm lệnh riêng 
    - Tiết kiệm thời gian
    - Tự động làm các công việc đã được lên lịch
## **2) Cách tạo và thực thi shell-script**
- **B1 :** Tạo file `shell.sh`
    - Sử dụng `vi` , `emacs` , `gedit` ,... để tạo nội dung cho file :
    ```
    #!/bin/bash
    echo "hello world"
    ```
    - Dòng đầu tiên luôn là "`#!/bin/bash`" . Đây là cú pháp bắt buộc .
    - Sau "`#`" được hiểu là comment - chú thích của các đoạn code .
- **B2 :** Cấp quyền **execute** cho file :
    ```
    # chmod 755 shell.sh
    ```
    hoặc
    ```
    # chmod 0777 shell.sh
    ```
- **B3 :** Thực thi file shell :
    ```
    # ./shell.sh
    ```
    hoặc
    ```
    # bash shell.sh
    ```
    hoặc
    ```
    # sh shell.sh
    ```
## **3) Biến trong shell**
### **3.1) Biến hệ thống**
- Tạo ra bởi hệ thống và quản lý bởi Linux .
- Tên biến là chữ hoa
- Để show các biến hệ thống , dùng lệnh `env` hoặc `printenv`
- Một số biến hệ thống quan trọng :
    - `BASH` = `/bin/bash` - tên **shell**
    - `BASH_VERSION` = `1.14.7(1)` - phiên bản của **shell**
    - `COLUMN` = `80` - số cột cho màn hình
    - `HOME` = `/home/cuongnq` - thư mục `home` của user
    - `LINE` = `25` - số dòng của màn hình
    - `LOGNAME` = `cuongnq` - tên đăng nhập của user
    - `OSTYPE` = `Linux` - loại hệ điều hành
    - `PATH` = `/usr/bin:/sbin:/bin:/usr/sbin` - thiết lập đường dẫn của biến môi trường
    - `PWD` = `/root` - thư mục hiện hành
    - `SHELL` = `/bin/bash` - tên shell
    - `USER` = `root` - user đang login
- Cách gọi biến hệ thống :
    ```
    # echo $HOME
    # echo $USER
    ```
### **3.2) Biến do người dùng tạo ra**
- Cú pháp : `tên_biến` = `value`
- Tên biến phải bắt đầu bằng ký tự .
- Không có dấu cách 2 bên toán tử "`=`" khi gán giá trị cho biến .
    ```
    a=1    -> Đúng
    a= 1 hoặc a =1     -> Sai
    ```
- Tên biến có phân biệt chữ HOA và chữ thường .
- Một biến không có giá trị khởi tạo thì giá trị bằng NULL .
- Không dùng dấu "`?`" , "`*`" để đặt tên các biến .
- Lệnh `echo` để in ra các giá trị của biến :
    ```
    # echo [options] [string,variable,...]
    ```
    - **Options :**
        - `-n` : không in kí tự xuống dòng 
        - `-e` : cho phép hiểu những kí tự theo sau dấu "`\`"
            - `\a` : alert ( tiếng chuông )
            - `\b` : backspace ( xóa kí tự trước )
            - `\c` : không xuống dòng
            - `\e` : xóa ký tự tiếp theo
            - `\f` : form feed
            - `\n` : xuống dòng
            - `\r` : về đầu dòng
            - `\t` : tab ngang
            - `\v` : xuống cách 1 dòng
            - `\\` : dấu `\`
    - **VD :**
        ```
        # echo -e "Hello\tTuan"
        Hello   Tuan
        # echo -e "Hello\nTuan"
        Hello
        Tuan
        ```
## **4) Các phép toán số học**
### **4.1) Lệnh `expr`**
- Cú pháp :
    ```
    # expr toán_hạng_1 toán_tử toán_hạng_2
    ```
    - Toán tử :
        - `+` : cộng
        - `-` : trừ
        - `\*` : nhân
        - `/` : chia lấy phần nguyên
        - `%` : chia lấy phần dư
- **VD :** 
    ```
    # expr 10 \* 2
    20
    ```
> ***Chú ý :** Phải có dấu cách trước và sau toán tử*
### **4.2) Các dấu ngoặc**
- Tất cả các ký tự trong dấu ngoặc kép đều không có ý nghĩa tính toán , trừ những ký tự sau `\` hoặc `$` .
- Dấu nháy ngược `(``)`  : yêu cầu thực thi lệnh
- **VD :** 
    ```
    # echo "ngay hom nay la : `date`"
    ngay hom nay la : Friday May 24 08:27:49 +07 2019
    # echo `expr 1 + 2`
    3
    # echo "expr 1 + 2"
    expr 1 + 2
    ```
### **4.3) Kiểm tra trạng thái trả về của lệnh vừa thực hiện**
- Cú pháp :
    ```
    # echo $?
    ```
    - **Output :** 
        - `1` : Lệnh trước đó có lỗi
        - `0` : Lệnh trước đó không có lỗi
- **VD :** File `abc.txt` không tồn tại
    ```
    # rm abc.txt
    # echo $?
    1            -> Lệnh trước có lỗi ( xóa file không tồn tại )
    ```
## **5) Các phép toán kiểm tra**
- So sánh biến số :
    - `-eq` ( `==` ) : bằng ( *equal* )
    - `-ne` ( `!=` ) : khác ( *not equal* )
    - `-lt` : nhỏ hơn ( *less than* )
    - `-le` : nhỏ hơn hoặc bằng ( *less or equal* )
    - `-ge` : lớn hơn hoặc bằng ( *greater of equal* )
    - `-gt` : lớn hơn ( *greater than* )
- So sánh chuỗi :
    - `string1 = string2` : true nếu 2 chuỗi bằng nhau ( chính xác từng ký tự )
    - `string1 != string2` : true nếu 2 chuỗi không giống nhau
    - `-n string1` : true nếu `string1` không rỗng
    - `-z string1` : true nếu `string1` rỗng
- Kiểm tra điều kiện trên tập tin :
    - `d file` : true nếu file là thư mục
    - `e file` : true nếu file có tồn tại
    - `f file` : true nếu file là tập tin thường
    - `s file` : true nếu kích cỡ file khác `0`
    - `u file` : true nếu **SUID** được thiết lập trên file
    - `g file` : true nếu **SGID** được thiết lập trên file
    - `r file` : true nếu file cho phép **read**
    - `w file` : true nếu file cho phép **write**
    - `x file` : true nếu file cho phép **execute**
- Toán tử logic :
    - `! expression` : NOT
    - `expression1 , -a , expression2` : AND
    - `expression1 && expression2` : AND
    - `expression1 , -0 , expression2` : OR
    - `expression1 || expression2` : OR
## **6) Cấu trúc điều khiển trong Shell-script**
### **6.1) Cấu trúc rẽ nhánh `If`**
- Cú pháp 
    ```bash
    if điều_kiện
    then
        command1
        ....
    fi
    ```
### **`If...else`**
- Cú pháp :
    ```bash
    if điều_kiện then
        command1
        ....
    else
        command2
        ....
    fi
    ```
### **6.2) Vòng lặp `For`**
- Cú pháp :
    ```bash
    for tên_biến in danh_sách
    do
        command1
        ....
    done
    ```
    hoặc
    ```bash
    for (( expr1 ; expr2 ; expr3 ))
    do
        command1
        ....
    done
    ```
- **VD1 :**
    ```bash
    for i in 1 2 3 4 5
    do
        echo $i
    done
    => Output : 1 2 3 4 5
    ```
- **VD2 :**
    ```bash
    for (( i=0 ; i<=5 ; i++ ))
    do
        echo $i
    done
    => Output : 1 2 3 4 5
    ```
### **6.3) Vòng lặp `While`**
- Cú pháp :
    ```bash
    while [điều_kiện]
    do 
        command1
        ....
    done
    ```
- **VD :**
    ```bash
    #!!/bin/sh
    echo " Nhap vao cac so can tinh tong , nhap so am de exit "
    sum = 0
    read i
    while [ $i -ge 0 ]            # nếu i>=0
    do
        sum = `expr $sum + $i`
        read i                    # nhận giá trị từ người dùng
    done
    echo " Tong : $sum ."

    => Output : Nhap vao cac so de tinh tong , nhap vao cac so am de exit
    1
    5
    4
    -1
    Tong : 10 . 
    ```
> ***Chú ý :***
- Để thóat khỏi các vòng lặp `for` và `while` ta dùng lệnh `break` . Lệnh `break (n)` cho phép ra khỏi `n` mức của vòng lặp .
- Lệnh `continue` cho phép bỏ qua các lệnh còn lại để bắt đầu chu trình mới .
### **6.4) Cấu trúc `case`**
- Cú pháp :
    ```bash
    case $bien in
        case1.1/case1.2) statement1...
        case2) statement2...
        ...
    esac
    ```
## **7) Một số cú pháp hỗ trợ**
### **7.1) Lệnh `test`**
- Lệnh `test` dùng để kiểm tra 1 biểu thức đúng hay không và trả lại , sử dụng các câu lệnh điều khiển ( `if` , `while` ,...) . Output là :
    - `0` nếu biểu thức đúng
    - `khác 0` nếu biểu thức sai
- Cú pháp :
    ```bash
    test biểu_thức
    ```
    hoặc
    ```bash
    [biểu_thức]
    ```
### **7.2) Lệnh `read`**
- Dùng để lấy dữ liệu nhập từ bàn phím và lưu vào biến .
- Cú pháp :
    ```
    ```
### **7.3) Lệnh `let`**
- **VD :** 
    - `let "z=$z+3"`
    - `let "z+=3"`
    - `let "z=$m*$n"`
### **7.4) Cú pháp `$((...))`**
- **VD :**
    - `z=$((z+3))`
    - `z=$(($m*$n))`