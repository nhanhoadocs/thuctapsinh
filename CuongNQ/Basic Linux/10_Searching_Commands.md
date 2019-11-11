# Searching Commands
## **1) `find`**
- Là lệnh tìm kiếm mạnh nhất với nhiều tham số nhưng thường tốn thời gian hơn các lệnh khác .
    ```
    # find [không_gian_tìm_kiếm] [tiêu_chuẩn_tìm_kiếm (options)]
    ```
- **TH1 :** Tìm theo ***tên*** :
    - **Options :** `-name [file_name]`
    - **VD1 :** Tìm file có tên `root` trong thư mục `/` :
        ```
        # find / -name root 
        ```
    - **VD2 :** Tìm file có đuôi "`.conf`" trong thư mục `/etc` :
        ```
        # find /etc -name *.conf
        ```
- **TH2 :** Tìm theo ***timestamp*** :
    - **Options :**
        - `-atime` ( ***access time*** ) : thời gian file được read hoặc write
        - `-mtime` ( ***modify time*** ) : thời gian file được modify
        - `-ctime` ( ***change time*** ) : thời gian thông tin ( meta-data ) của file thay đổi ( như owner , type , permission ,... )
    - **VD :** Tìm file có sự thay đổi mới xảy ra trong 2 ngày vừa qua trong `/etc` :
        ```
        # find /etc -ctime -2
        ```
- **TH3 :** Tìm theo ***permission*** :
    - **Options :** `-perm [number_mode]`
    - **VD1 :** Tìm file có permission là `644` trong `/etc` :
        ```
        # find /etc -perm 644
        ```
    - **VD2 :** Tìm file có permission *ít nhất là* `644` ( bao gồm cả `744` )
        ```
        # find /etc/ -perm -644
        ```
- **TH4 :** Tìm theo kích thước file ( ***file size*** ) :
    - **Options :** `-size n` ( `n` là kích cỡ cần tìm )
    - **VD :** Tìm file có dung lượng `1000K` trong `/etc` :
        ```
        # find /etc -size 1000K       ( file = 1000K )
                          +1000K      ( file > 1000K )
                          -1000K      ( file < 1000K )
        ```
- **TH5 :** Tìm theo user sở hữu file ( ***owner*** )
    - **Options :** `-uid [UID]`
- **TH6 :** Tìm theo group sở hữu file ( ***owner group*** ) : 
    - **Options :** `-gid [GID]`
- **TH7 :** Tìm theo cấp của thư mục con ( ***depth level*** ):
    - **Options :** 
        - `-maxdepth [level]`
        - `-mindepth [level]`
- **TH8 :** Tìm theo thể loại ( ***type*** ) :
    - **Options :** `-type [features]`
        - `f` : file thường     `-empty` :file rỗng
        - `d` : thư mục   `-empty` : thư mục rỗng
        - `l` : symbolic link ( soft link )
        - `c` : character devices
        - `b` : block devices
- **TH9 :** Các tùy chọn khác :
    - `-amin` , `-mmin` , `-cmin` : tìm kiếm theo phút
    - `-name head*` : tìm file bắt đầu bằng `head`
## **2) `which`**
- `which` là 1 chương trình đơn giản và nhỏ gọn có mục đích xác định đường dẫn các file thực thi . Nó cho phép user có thể sử dụng output của chương trình làm thông tin đường dẫn tuyệt đối thành input cho các lệnh hay shell script khác .
- `which` sẽ chỉ tìm kiếm đường dẫn các file chương trình nào nằm trong các directory được liệt kê cở biến môi trường `$PATH` .

    <img src=https://i.imgur.com/nulI1ri.png>

- Cấu trúc lệnh :
    ```
    # which [options] [command]
    ```
    - **Options :** `-a` : hiển thị toàn bộ các đường dẫn file chương trình được tìm thấy trên các thư mục 
- **VD :**

    <img src=https://i.imgur.com/IASStpp.png>

## **3) `whereis`**
- `whereis` là chương trình giúp tìm 3 thông tin sau về 1 chương trình hoặc 1 command trên Linux :
    - Đường dẫn file binary
    - Đường dẫn vị trí source code
    - Đường dẫn vị trí trong manual cho chương trình hay command đó
- Cấu trúc lệnh :
    ```
    # whereis [options] [program/command]
    ```
- Tìm đường dẫn đến chương trình : mặc định , `whereis` sẽ tìm cả 3 thông tin liên quan :
    
    <img src=https://i.imgur.com/1Hz8hc6.png>

- Chỉ định loại thông tin tìm kiếm :
    - **Options :** 
        - `-b` : chỉ tìm file binary
        - `-m` : chỉ tìm file manual
        - `-s` : chỉ tìm file source code
    
    <img src=https://i.imgur.com/JDEsXw0.png width=70%>

- Giới hạn tìm kiếm ở thư mục cụ thể :
    - **Options :** 
        - `-B /path/dir` : giới hạn tìm kiếm file binary
        - `-M /path/dir` : giới hạn tìm kiếm file manual
        - `-S /path/dir` : giới hạn tìm kiếm file source code
    
    <img src=https://i.imgur.com/wB7sbYK.png>