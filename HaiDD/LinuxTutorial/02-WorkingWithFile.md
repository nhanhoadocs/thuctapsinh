# Thao tác trên tập tin


- Lấy danh sách các file và thư mục hiện hành: `# ls` 
- Lấy danh sách file và thư mục chi tiết: `# ll` 
- Chuyển thư mục (change directory): `# cd`
    - `cd /duong/dan/tuyet/doi` : chuyển tới thư mục `/doi/`
    - `cd` : chuyển về thư mục chính của người dùng
    - `cd A && ls` : chuyển tới thư mục A và hiện danh sách các file của nó.
    - `cd` -: chuyển về thư mục đang làm việc trước đó.
    - `cd ..` : chuyển về thư mục cha.
- Tạo 1 thư mục mới: `# mkdir <ten_thu_muc>`
- Tạo 1 tập tin: `# touch <ten_tap_tin>` 
- Tạo 1 tập tin dạng text: `# echo "" >> ~/<tên_tập tin>` 
- Xóa tập tin: `# rm` 
    - `rm <ten_tep_tin>` : xóa 1 tập tin
    - `rm <tap_tin_1> <tap_tin_2>` ... : xóa nhiều tập tin
    - `rm /a/b/c/<tap_tin>` : xóa tập tin theo đường dẫn
    - `rm -i <ten_tep_tin>` : xóa có xác nhận
    - `rm -f <ten_tap_tin>` : xóa không xác nhận
    - `rm -I <ten_thu_muc>/file*` : xóa hàng loạt file có kiểu `file[...]`
- Xóa thư mục: `# rmdir`
    - `rmdir <ten_thu_muc>` hoặc `rm -d` : xóa 1 thư mục rỗng
    - `rm -r <ten_thu_muc>` : xóa thư mục chứa các thư mục con và tập tin có xác nhận từng đối tượng.

- Mở tập tin: `# cat <tap_tin>`

- Khởi chạy trình soạn thảo Vi: 
    - Câu lệnh `vi <ten_file> `
    - Nếu file chưa tồn tại thì hệ thống sẽ tạo ra file đó.
    - Nhấn phím **I** (INSERT): chuyển sang trạng thái nhập văn bản.
    - Nhấn phím **Esc**: thoát khỏi trạng thái nhập
    - Nhập `:wq` (Để lưu sửa đổi file) hoặc `:q!` (Để thoát mà không lưu sửa đổi)
    
- Copy file: `# cp`
    - Copy file A thành file B tại thư mục hiện hành:
    ```
    # touch A.txt
    # cp A.txt B.txt
    ```
    - Copy nhiều file vào 1 thư mục khác:
    ```
    # mkdir lab
    # touch ./{A,B,C}.txt
    # touch ./{D,E}.exe
    # cp A.txt B.txt C.txt D.exe E.exe lab/
    ```

    - Copy file từ thư mục này sang thư mục khác:
    ```
    # cp /A/subA/fileA.txt B/subB/
    ```
    - Để xem thông tin quá trình copy, ta thêm -v: 
    ```
    # cp -v A.txt B.txt C.txt D.txt E.txt lab/
    `A.txt' -> `lab/A.txt'
    `B.txt' -> `lab/B.txt'
    `C.txt' -> `lab/C.txt'
    `D.txt' -> `lab/D.txt'
    `E.txt' -> `lab/E.txt'
    ```

    - Để giữ nguyên thuộc tính file khi copy ta thêm `-p`. Các thuộc tính giữ nguyên là: access time, modification date, user ID, group ID, file flag, file mode, access control lists.
    ```
    # cp -p /A/subA/fileA.txt B/subB/
    ```

- Copy thư mục: tương tự copy file. Ta thêm `-a` hoặc `-r`
    - `-r`: copy folder và file đệ quy, tức là copy toàn bộ thư mục hoặc file cấp con của thư mục được copy.
    - `-a`: bao gồm option `-r` và thực hiện việc duy trì các thuộc tính của file hoặc folder như file mode, ownership, timestamps, ...
- Copy không cho ghi đè file đang có: thêm `-n`
- Copy cho ghi đè file đang có không cần hỏi lại: thêm `-f`
- Xem thông tin trợ giúp về copy: `# man cp`

----

- So sánh 2 tệp tin hoặc 2 thư mục: `diff`
```
# diff -c file1.txt file2.txt
```

- Xác định kiểu file: 'file'
```
# file <đường_dẫn_tới file>
```
---




# Lệnh nén và giải nén

- Các option dùng với lệnh `tar`
    - `c` : tạo file nén .tar.
    - `x` : bung file nén .tar.
    - `v` : show quá trình nén hoặc giải nén dữ liệu ra màn hình.
    - `f` : chỉ định nén thành file.
    - `t` : Xem dữ liệu trong file nén.
    - `j` : tạo file nén với bzip2 có định dạng file.tar.bz2
    - `z` : tạo file nén với gzip có định dạng file.tar.gz.
    - `r` : thêm một file và thư mục vào file nén đã tồn tại.
    - `--wildcards` : tìm và xuất file bất kỳ trong file nén.

## 1. Các lệnh nén:
- Nén file/thư mục sang định dạng ".tar": `# tar -cvf`

    - `# tar -cvf filenenA.tar /root/A` : nén thư mục A thành file nén `filenenA.tar` và show quá trình nén.

-  Nén file/thư mục sang định dạng ".tar.gz": `# tar -cvzf`
    - `# tar -cvzf filenenA.tar.gz /root/A`

- Nén định dạng ".tar.bz2": `# tar -cvjf`
    - `# tar -cvjf filenenA.tar.gz /root/A`

Nếu cùng 1 dữ liệu thì tỉ lệ nén cao nhất là:  `.tar.bz2 > .tar.gz > .tar` 

## 2. Các lệnh giải nén:
- `# tar -xvf filenen.tar -C /root/A`
- `# tar -xvf filenen.tar.gz -C /root/A`
- `# tar -xvf filenen.tar.bz2 -C /root/A`

## 3. Xem nội dung file nén:
- `# tar -tvf filenen.tar | more`
- `# tar -tvf filenen.tar.gz | more`
- `# tar -tvf filenen.tar.bz2 | more`

## 4. Bung 1 file bất kì trong file nén:
Bung `file /B/Cfile1.txt` duy nhất:
```
tar -xvf /A/filenen.tar /B/C/file1.txt
tar -zxvf /A/filenen.tar.gz /B/C/file1.txt
tar -jxvf /A/filenen.tar.bz2 /B/C/file1.txt
```


**Bung 1 nhóm file giống nhau :** 
Bung các file có đuôi `.txt` trong file nén `filenen.tar`
```
tar -xvf /A/filenen.tar --wildcards '*.txt'
```


## 5. Thêm file và folder vào file nén:
Chỉ áp dụng với file định dạng `.tar`.

- Thêm file `abc.txt` vào `filenen.tar`

`# tar -rvf filenen.tar abc.txt` 

- Thêm thư mục A vào `filenen.tar`

`# tar -rvf filenen.tar A` 