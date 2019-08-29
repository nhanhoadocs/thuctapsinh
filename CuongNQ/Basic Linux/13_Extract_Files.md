# Extract Files
## **1) "`.gz`"** ( gzip )
- Nén file :
    ```
    # gzip /etc/file1
    ```
- Giải nén file :
    ```
    # gzip -d /etc/file1
    = # gunzip /etc/file1
    ```
## **2) "`.tar`"** ( tar )
- Có thể tạo 1 tệp đóng gói định dạng `tar` mà không nén ( tức là chỉ *gom* các tệp lại thành 1 tệp mới `.tar` mà không nén chúng , dung lượng vẫn có thể như cũ )
- Gom file :
    ```
    # tar -cvf file.tar file1 file2 file3
    ```
    - **Options** :
        - `-c` ( create ) : tạo 1 file mới
        - `-v` ( verbose ) : hiển thị quá trình gom file lên terminal
        - `-f` : khai báo tên file nén trong command 
    - `file.tar` : file nén
    - `file1 file2 file3` : các file thành phần
- Bung file :
    ```
    # tar -xvf file.tar
    ```
    - **Options** :
        - `-x` ( extract ) : giải nén ( untar ) gói định dạng `.tar`
## **3) "`.tar.gz`" , "`.tgz`"** ( gzip )
- Cả 2 định dạng này tương tự như nhau
- Nén file :
    ```
    # tar -czvf file.tar.gz file1 file2 file3
    ```
    - **Options** :
        - `-z` : khai báo sẽ dùng `gzip` để nén hoặc giải nén
- Giải nén file :
    ```
    # tar -xzvf file.tar.gz
    ```
- Liệt kê nội dung file nén :
    ```
    # tar -tvf file.tar.gz
    ```
    - **Options** :
        - `-t` : xem nội dung file nén
## **4) "`.tar.bz`" , "`tar.bz2`" , "`.tbz`"** ( bzip2 )
- Tương tự như `gzip` , `bzip2` là 1 chương trình nén file mã nguồn mở miễn phí .
- `Bzip2` không nhanh bằng `gzip` nhưng tỉ lệ nén tương đối tốt hơn `gzip` .
- Các định dạng "`.tar.bz`" , "`.tar.bz2`" , "`.tbz`" đều tương tự nhau .
- Chỉ cần thay tham số `z` trong `gzip` bằng `j` của `bzip2` để thực hiện lệnh .
- Nén file :
    ```
    # tar -cjvf file.tar.bz2 file1 file2 file3
    ```
- Giải nén file :
    ```
    # tar -xjvf file.tar.bz2
    ```
## **5) "`.zip`"** ( unzip )
- Trước tiên cần cài đặt chương trình `unzip` lên Linux
    ```
    # yum install -y unzip
    ```
- Nén file / thư mục :
    ```
    # zip -r file.zip file1 file2 file3
    ```
- Nén file / thư mục có mật khẩu bảo vệ được mã hóa :
    ```
    # zip -er file.zip file1 file2 file3
    ```
    <img src=https://i.imgur.com/dC40kyO.png>
- Giải nén file :
    ```
    # unzip file.zip
    ```
- Giải nén file vào 1 thư mục cụ thể :
    ```
    # unzip -d file_dir file.zip
    ```
    <img src=https://i.imgur.com/F0ct00d.png>