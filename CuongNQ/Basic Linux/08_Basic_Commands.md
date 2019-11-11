# Các lệnh Linux cơ bản
**1)** [**man**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#1-l%E1%BB%87nh-tr%E1%BB%A3-gi%C3%BAp--man---manual-)  
**2)** [**pwd**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#21-pwd--print-name-of-currentworking-directory-)  | [**cd**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#22-cd--change-directory-) | [**ls**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#23-ls--list-directory-contents-) | [**cp**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#24-cp--copy-) | [**mv**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#25-mv--move-) | [**mkdir**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#26-mkdir--make-directory-) | [**touch**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#27-touch) | [**rm**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#28-rm--remove-) | [**du**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#29-du) | [**tree**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#210-tree) |<br>
**3)** [**shutdown**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#31-shutdown) | [**reboot**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#32-reboot) | [**init**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#33-init) | [**date**](https://github.com/QuocCuong97/INTERN/blob/master/docs/linux/08_Basic_Commands.md#34-date) |<br>

-------------------------


- Dòng lệnh **shell** có dạng tổng quát như sau :
<p align=center><strong><i>command &emsp;&emsp;[option]&emsp;&emsp;arguments</i></strong></p>

- Trong đó :
    - ***command***  - tên lệnh
    - ***options*** - các tùy chọn , thường bắt đầu bằng `-` hoặc `--` . Nhiều tùy chọn có thể kết hợp bằng 1 kí hiệu `-` <br>**VD :** `ls -l -a` <=> `ls -la`
    - ***arguments*** - tham số lệnh
> **Chú ý** : dòng lệnh shell có phân biệt *chữ thường* và *chữ hoa*

> ## **Thủ thuật khi gõ lệnh**
- Dùng phím "&uarr;" , "&darr;" để xem lại các lệnh vừa gõ
- Dùng tổ hợp `Ctrl` + `C` để hủy lệnh gõ lệnh
- Gõ `clear` để làm mới màn hình Terminal ( hoặc sử dụng tổ hợp `Ctrl` + `L` )
- Dùng phím `Tab` để gõ nhanh tên file hoặc lệnh
- Dùng lệnh `history` để xem lại lịch sử gõ lệnh
- Gõ `![number]` với number là số thứ tự của câu lệnh trong mục `history` để thực hiện nhanh câu lệnh
- Gõ `Ctrl` + `R` để tìm kiếm các lệnh đã gõ trước đó
## **1) Lệnh trợ giúp : `man`  ( manual )**
- Dùng để xem hướng dẫn dùng 1 lệnh cụ thể trong Linux .
    ```
    #  man <tên lệnh>
    ```
- Sử dụng "&uarr;" , "&darr;" hoặc `PgUp` , `PgDn` để di chuyển trong các trang manual .
- Gõ `Shilf` + `G` để đi đến cuối trang manual .
- Gõ `G` để đi lên đầu trang manual .
- Gõ `/` + `Từ khóa` để tìm kiếm trong manual , sau đó gõ `n` để đi đến từng kết quả tìm kiếm , gõ `Shift` + `n` để đến kết quả tìm kiếm trước đó .
- Gõ `q` để thoát trợ giúp lệnh .
## **2) Các lệnh file system thiết yếu**
### **2.1) `pwd` ( print name of current/working directory )**
- Cho biết thư mục hiện hành đang làm việc .
### **2.2) `cd` ( change directory )**
- Dùng để chuyển vị trí làm việc sang thư mục khác .
    ```
    # cd [path]
    ```
    - `cd /etc` - Chuyển đến thư mục `/etc` ( thư mục bất kỳ - đường dẫn tuyệt đối )
    - `cd usr` - Chuyển đến thư mục `usr` là thư mục con của thư mục hiện hành - đường dẫn tương đối )
    - `cd ..` - Chuyển đến thư mục cha
    - `cd` - Chuyển đến thư mục home của user hiện tại
    - `cd ~` - Chuyển đến thư mục home của user hiện tại
    - `cd -` - Chuyển đến thư mục mình vừa rời đi trước đó
    - `/` -> `cd /etc/sysconfig/network-scripts` -> `cd .. / .. / ..` -> `/`
### **2.3) `ls` ( list directory contents )**
- Dùng để xem ( liệt kê ) nội dung thư mục
    ```
    # ls [options] [path]
    ```
    - **Options** : 
        - `-l` : liệt kê chi tiết
        - `-a` : liệt kê tất cả các file ẩn<br>
        ( `ls -l` = `ll`  ;  `ls -l -a` = `ls -la` )
        - `-tr` : liệt kê các file theo thứ tự thời gian mới nhất dưới cùng
        - `-h` : liệt kê file size theo định dạng quen thuộc ( `K M G` )
        - `-S` : sắp xêp kích cõ file từ cao xuống thấp
        - `-t` : tìm file được chỉnh sửa gần nhất

- Ý nghĩa các cột kết quả khi thực hiện lệnh `ls -l` :

    <p align=center><img src=https://i.imgur.com/MnjXLvf.png width=100%></p>

    | STT | Meanings |
    |-----|----------|
    | 1 | File type and access permission |
    | 2 | Number of Hardlink to the file |
    | 3 | Owner and the creator of the file |
    | 4 | Group of the owner |
    | 5 | File size in Bytes |
    | 6 | Date and Time |
    | 7 | Directory or File Name |
- Tìm file được chỉnh sửa gần nhất :
    ```
    # ls -t | head -1
    install.log
    ```
- Lấy tên file , thư mục cách nhau bằng dấu `,` ; `""` ; `''` :
    ```
    # ls -1m
    install.log, install.logold, music
    # ls -1mQ
    "install.log", "install.logold", "music"
    # ls -1m --qouting-style='shell-always
    'install.log', 'install.logold', 'music'`
    ```

- Liệt kê những file có tên tương tự theo ý muốn :
    ```
    # ls -l insta*
    -rw-r--r- 1 root root 102092 Dec 18 11:57 install.log
    -rw-r--r- 1 root root 102092 Dec 16 17:26 install.log
    ```
### **2.4) `cp` ( copy )**
- Dùng để copy file / thư mục
    ```
    # cp [options] source destination
    ```
    - **Options** :
        - `-r` , `-R` : sao chép toàn bộ thư mục
        - `-v` : hiển thị quá trình copy
        - `-a` : copy toàn bộ thư mục như `-r` và thực hiện thêm việc duy trì thuộc tính của file
        - `-p` : copy file lẻ và giữ lại thuộc tính của file
        - `-n` : ép buộc lệnh copy không được ghi đè nếu file nguồn và file đích cùng tên
        - `-f` : ép buộc lệnh copy ghi đè nếu file nguồn và file đích cùng tên
- Copy file `A` thành file `B` :
    ```
    # touch A.txt       ( tạo file A rỗng )
    # cp A.txt B.txt
    ```
- Copy nhiều file cùng lúc vào thư mục :
    ```
    # touch ./{A,B,C}.txt     ( tạo file rỗng )
    # mkdir -p ./lab/         ( tạo thư mục rỗng )
    # cp A.txt B.txt C.txt ./lab/
    ```
- Copy thư mục `mydir_1` và đổi tên thành `mydir_2` tại thư mục hiện hành :
    ```
    # cp -R mydir_1 mydir_2
    ```
- Copy file từ thư mục khác vào thư mục hiện hành :
    ```
    # cp /root/anaconda-ks.cfg .
    ```
### **2.5) `mv` ( move )**
- Dùng để đổi tên / di chuyển thư mục hoặc file từ nơi này sang nơi khác .
    ```
    # mv [options] source destination
    ```
    - **Options** :
        - `-i` : cảnh báo trước khi di chuyển với tập tin / thư mục mà đích đã có rồi
        - `-f` : ghi đè khi di chuyển với tập tin / thư mục đích đã có rồi
        - `-v` : hiển thị quá trình di chuyển , đổi tên
- Đổi tên file và thư mục :
    ```
    # mv dir1 dir2
    ```
- Di chuyển file vào thư mục :
    ```
    # mv file5 /tmp
    ```
- Di chuyển file `my_file` vào thư mục `dir1` đồng thời đổi thành `new_file` :
    ```
    # mv my_file dir1/new_file
    ```
### **2.6) `mkdir` ( make directory )**
- Dùng để tạo thư mục .
    ```
    # mkdir [options] directory_name
    ```
    - **Options** :
        - `-p` : cho phép tạo cả thư mục con khi chưa có thư mục cha
        - `-v` : hiển thị quá trình tạo thư mục
        - `-m` : tạo thư mục với phân quyền cụ thể
- Tạo nhiều thư mục cùng lúc : 
    ```
    # mkdir thu1 thu2 thu3
    = # mkdir /root/thu{1,2,3}
    = # mkdir /root/{thu1,thu2,thu3}
    ```
- Tạo thư mục kể cả thư mục cha nếu chưa có :
    ```
    # mkdir -p dir3/dir4        ( chưa có dir3 )
    ```
- Tạo thư mục với phân quyền cụ thể :
    ```
    # mkdir -m 440 dir2
            ( 440 : permission value )
    ```
### **2.7) `touch`**
- Dùng để tạo file mới ( file rỗng )
    ```
    # touch <file_name>
    ```
- Tạo nhiều file :
    ```
    # touch file1 file2 file3
    = # touch file{1,2,3}
    = # touch {file1,file2,file3}
    ```
### **2.8) `rm` ( remove )**
- Dùng để xóa file / thư mục
- Lệnh này được coi là 1 lệnh nguy hiểm của Linux .
    ```
    # rm [options] [file/dir]
    ```
    - **Options** : 
        - `-f` : xóa không cần hỏi
        - `-i` : hỏi trước khi xóa<br>
        Mặc định , tùy chọn `-i` được sử dụng .
        - `-R` , `-r` : xóa toàn bộ thư mục , kể cả thư mục con
        - `-d` : xóa 1 thư mục rỗng ( = `rmdir` )
> **Chú ý** : Lệnh `rm -rf /` sẽ xóa toàn bộ file system ( **nguy hiểm** )
### **2.9) `du` ( disk usage )**
- Dùng để xem dung lượng của thư mục .
    ```
    du [option] [path]
    ```
    - **Options** :
        - `-s` : xuất kết quả theo summarize ( tổng dung lượng )
        - `-h` : in kích thước mà người dùng có thể đọc
        - `-k` : hiển thị thông tin theo kylobyte
        - `-m` : hiển thị thông tin theo megabyte
### **2.10) `tree`**
- Hỗ trợ người dùng liệt kê các file và thư mục tại 1 thư mục theo dạng hình cây rất đẹp và dễ nhìn , nó sẽ quét sâu hết tất cả các sub-folder .
- Sau khi liệt kê hết tất cả thì chương trình `tree` sẽ trả về thông tin tổng số lượng file hoặc thư mục đã được liệt kê .
- Mặc định lệnh `tree` không được cài đặt trên Linux . Cài đặt như sau :
    ```
    # yum install tree      (RHEL/CentOS)
    # apt-get install tree  (Ubuntu/Debian)
    ```
- Cấu trúc lệnh :
    ```
    # tree [option] [path_directory]
    ```
    - **Options** :
        - `-a` : liệt kê cả các file / thư mục ẩn
        - `-L` + `[number]` : giới hạn số lượng sub-directory sẽ được liệt kê
        - `-d` : chỉ liệt kê thư mục , không liệt kê file<br><br>
            <img src=https://i.imgur.com/iMO8mWM.png>
## **3) Các lệnh hệ thống**
### **3.1) `shutdown`**
- Tắt hệ thống hoặc khởi động lại.
    ```
    # shutdown [options] [time] [wall]
    ```
    - **Options** :
        - `-h` : shutdown
        - `-r` : restart
        - `-c` : cancel pending shutdown 
    - **Time** : 
        - `now` : thực hiện ngay lập tức
        - `hh:mm` : ấn định thời gian ( hẹn giờ )
        - `+m` : sau `m` phút sẽ thực hiện
    - **Wall** : `Message thông báo`
- **VD :** Restart Server sau 10p với thông báo "Khoi dong lai Server"
    ```
    # shutdown -r +10 "Khoi dong lai Server"
    ```
### **3.2) `reboot`**
- Khởi động lại Server :
    ```
    # reboot
    ```
### **3.3) `init`**
-   ```
    # init [number]
    ```
    - **Number** : 
        - `3` : restart
        - `0` : shutdown
### **3.4) `date`**
- Xem ngày giờ hệ thống :
    ```
    # date
    ```
## **4) Các lệnh kiểm tra performance và thông tin hệ thống**
### **4.1) Lệnh xem thông tin CPU**
- ### **`cat /proc/cpuinfo`**

    <img src=https://i.imgur.com/cId2XoW.png>

- ### **`nproc`** - hiển thị số nhân của CPU

    <img src=https://i.imgur.com/lYhtbLV.png width=45%>

### **4.2) Lệnh xem thông tin RAM**
- ### **`cat /proc/meminfo`**

    <img src=https://i.imgur.com/f9mvdQT.png width=70%>

- ### **`free [options]`**
    - **Options** : 
        - `-b` : hiển thị theo bytes
        - `-k` : hiển thị theo kilobytes
        - `-m` : hiển thị theo megabytes
        - `g` : hiển thị theo gigabytes
        - `--tera` : hiển thị theo terabytes
        - `-h` : hiển thị theo kiểu tự động<br><br>
            <img src=https://i.imgur.com/AVcYoF9.png width=100%>
### **4.3) Lệnh xem thông tin ổ cứng**
- ### **`df` ( disk free )**
    ```
    # df [options]
    ```
    - **Options** : 
        - `-a` : hiển thị thông tin của các hệ thống tập tin cùng với tất cả
        - `-h` : hiển thị theo mức sử dụng dung lượng ổ cứng theo định dạng dễ đọc
        - `-k` : hiển thị thông tin dung lượng theo kilobytes
        - `-m` : hiển thị thông tin dung lượng theo megabytes
        - `-i` : hiển thị thông tin dung lượng theo inodes
        - `-T` : hiển thị loại file system ( ext4 , xfs ,...)
        - `-t` : hiển thị thông tin dựa trên loại file system
        - `--help` : hiển thị trợ giúp lệnh `df`<br><br>
            <img src=https://i.imgur.com/qjrF7WI.png>

    - Hiển thị tất cả dung lượng ổ đĩa theo định dạng dễ đọc :
        ```
        # df -ha
        ```
    - Hiển thị các loại file system :
        ```
        # df -Th
        ```
    - Hiển thị thông tin dựa trên loại file system
        ```
        # df -t |ext4|xfs|ext3 ...|
        ```
### **4.4) Lệnh xem phiên bản CentOS , RHEL**
- ### **`rpm` ( Red Hat Package Manager )**
    ```
    # rpm --query centos-release     ( CentOS )
    # rpm --query redhat-release     ( RedHat)
    ```

    <img src=https://i.imgur.com/aHsqVxS.png>
- ### **`lsb-release`  ( Linux Standard Base )**
    ```
    # yum install -y redhat-lsb
    # lsb_release -d
    ```
- ### **`cat /etc/centos-release`**
- ### **`cat /etc/redhat-release`**
- ### **`cat /etc/system-release`**
- ### **`cat /etc/os-release`**
- ### **`hostnamectl`**
### **4.5) Lệnh xem kiến trúc hệ điều hành**
- ### **`arch`**
- ### **`uname -p`**

    <img src=https://i.imgur.com/W8TI0Ty.png width=80%>
    
### **4.6) Lệnh hiển thị thông tin kernel**
- ### **`uname [options]`**
    - **Options** :
        - `-a` : hiển thị toàn bộ thông tin
        - `-r` : hiển thị phiên bản kernel
        - `-p` : hiển thị kiến trúc linux ( x86 hoặc x64 )
        - `-s` : hiển thị tên kernel ( thường là Linux )
        - `-m` : giống `-p`<br>
    => Hiển thị thông tin cần thiết : `# uname -rps`<br><br>
        <img src=https://i.imgur.com/pQr5uCF.png>
- ### **`cat /proc/version`**
    - Thuật ngữ **SMP - Support Multicore-Processor** : kernel hỗ trợ multicore và multi CPU

        <img src=https://i.imgur.com/2CkQQbJ.png>

### **4.7) Lệnh xem thông tin model , serial , ...phần cứng**
- ### **`dmidecode -t [number]`**
    <details>
    <summary>Bảng mã <strong>Dmidecode</strong></summary>
    <i>
    0 - BIOS<br>
    1 - System<br>
    2 - Baseboard<br>
    3 - Chassis<br>
    4 - Processor<br>
    5 - Memory Controller<br>
    6 - Memory Module<br>
    7 - Cache<br>
    8 - Port Connector<br>
    9 - System Slots<br>
    10 - On Board Devices<br>
    11 - OEM Strings<br>
    12 - System Configuration Options<br>
    13 - BIOS Language<br>
    14 - Group Associations<br>
    15 - System Event Log<br>
    16 - Physical Memory Array<br>
    17 - Memory Device<br>
    18 - 32-bit Memory Error<br>
    19 - Memory Array Mapped Address<br>
    20 - Memory Device Mapped Address<br>
    21 - Built-in Pointing Device<br>
    22 - Portable Battery<br>
    23 - System Reset<br>
    24 - Hardware Security<br>
    25 - System Power Control<br>
    26 - Voltage Probe<br>
    27 - Cooling Device<br>
    28 - Temperature Probe<br>
    29 - Electrical Current Probe<br>
    30 - Out-of-band Remote Access<br>
    31 - Boot Integrity Services<br>
    32 - System Boot<br>
    33 - 64-bit Memory Error<br>
    34 - Management Device<br>
    35 - Management Device Component<br>
    36 - Management Device Threshold Data<br>
    37 - Memory Channel<br>
    38 - IPMI Device<br>
    39 - Power Supply<br>
    40 - Additional Information<br>
    41 - Onboard Devices Extended Information<br>
    42 - Management Controller Host Interface<br>
    </i>
    </details>
### **4.8) Lệnh xem tên server**
- ### **`hostname`**


        
    

