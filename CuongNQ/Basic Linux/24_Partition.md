# Linux Partition
## **1) MBR và GPT**
- Là 2 tiêu chuẩn ổ cứng quy định cách thức nhập xuất dữ liệu , sắp xếp và phân vùng ổ đĩa .
- **MBR ( Master Boot Record )** : là `512 bytes` đầu tiên của 1 thiết bị lưu trữ . Nó chứa hệ thống nạp khởi động và **partition table** của ổ cứng . Nó đóng vai trò quan trọng trong quá trình khởi động hệ thống **BIOS** .
    - Hỗ trợ ổ cứng tối đa `2TB` 
    - Hỗ trợ tối đa `4` phân vùng / `1` ổ đĩa ( `3` **primary** + `1` **extended** )
- **GPT ( GUID Partition Table )** : là chuẩn mới thay thế cho **MBR** . Nó kết hợp với **UEFI** - đang thay thế **BIOS** trên nhiều mainboard
    - Hỗ trợ ổ cứng tối đa `1ZB` ( = `1 tỷ TB` )
    - Hỗ trợ tối đa `128` phân vùng / `1` ổ đĩa ( `128` **primary** )
    - Chỉ hỗ trợ các máy tính dùng chuẩn **UEFI**
## **2) Công cụ phân vùng ổ cứng**
### **2.1 ) `fdisk`**
- Chỉ để tạo phân vùng dưới `2TB`
- Chỉ hỗ trợ ổ cứng chuẩn **MBR** 
- Cấu trúc lệnh :
    ```
    # fdisk [options] [/dev/...]
    ```
    - **Options :** `-l` : liệt kê tất cả các ổ cứng và các partition
    - **Command** sử dụng trong lệnh :
        - `n` : tạo mới 1 partition
        - `p` : hiển thị **partition table**
        - `q` : thoát mà không lưu thay đổi
        - `w` : lưu thay đổi và thoát
        - `d` : xóa 1 partition
### **2.2) `gdisk`**
- Hỗ trợ ổ cứng chuẩn **GPT**
- Cấu trúc lệnh :
    ```
    # gdisk [options] [/dev/...]
    ```
    - **Options :** 
        - `-l` : liệt kê các ổ cứng và phân vùng chuẩn **GPT**
        - `-g` : chuyển ổ cứng từ **MBR** sang **GPT**
        - `-m` : chuyển ổ cứng từ **GPT** sang **MBR**
    - **Command** : tương đương lệnh `fdisk`
### **2.3) `parted`**
- Tên đầy đủ là **GNU Parted 3.x**
- Hoạt động với tất cả các chuẩn ổ cứng như **MBR** , **GPT** ,...
- Hỗ trợ nhiều tính năng hơn `fdisk` và cũng dễ sử dụng hơn .
- Cấu trúc lệnh : 
    ```
    # parted [options] [/dev/...]
    ```
    - **Options :** 
        - `-l` : liệt kê các ổ cứng và phân vùng
        - `-v` : hiển thị version của **GNU Parted**
    - **Command** :
        - `mkpart [type] [start] [end]` : tạo 1 phân vùng mới
            - **Type** : "`btrfs`" , "`ext3`" , "`ext4`" , "`fat16`" , "`fat32`" , "`hfs`" , "`linux-swap`" , "`ntfs`" , "`reiserfs`" , "`xfs`" + "`primary`" , "`logical`" , "`extended`"
            - **Start** , **End** : mặc định là đơn vị `MB`
        - `mklabel [label type]` : tạo nhãn cho ổ cứng
            - **Label Type** : "`gpt`" , "`msdos`" , "`loop`" , "`sun`" , "`mac`"
        - `name [partition_name]` : đặt tên cho phân vùng
            - Chỉ hoạt động trên ổ cứng chuẩn GPT , MAC , PC98
        - `print` : in ra ***partition table*** của ổ cứng
        - `quit` : thoát khỏi `parted`
        - `resizepart [partition][end]` : thay đổi kích cỡ partition
        - `rm [partition]` : xóa partition
        - `set [partition] [flag] [state]` : gắn cờ
            - **Flag** : "`boot`" , "`root`" , "`swap`" , "`hidden`" , "`raid`" , "`lvm`" , "`lba`" , "`legacy-boot`" , "`palo`"
            - **State** : `on` / `off`
        - `unit [unit]` : chọn đơn vị khi hiển thị trong `parted`
            - **Unit** : "`s`" ( sectors ) , "`B`" ( Bytes ) , "`kB`" , "`MB`" , "`MiB`" , "`GB`" , "`TB`" , "`TiB`" , "`%`" ( phần trăm ổ đĩa ) , "`cyl`" ( cylinders )
### **2.4) `mkfs`**
- Là công cụ để format phân vùng
- Cấu trúc lệnh :
    ```
    # mkfs.[type] [/dev/...]
    ```
    - **Type :** "`xfs`" , "`ext4`" ,...Mặc định là `ext2`
### **2.5) `mkdir`**
### **2.6) `mount`**
### **VD : Tạo phân vùng 10GB từ 1 ổ cứng mới**
- **B1 :** Kiểm tra dung lượng ổ cứng hiện tại :
    ```
    # fdisk -l
    ```
    <img src=https://i.imgur.com/YclkWZG.png>
- **B2 :** Tạo 1 phân vùng với `parted` :
    ```
    # parted /dev/sda
    ```
    <img src=https://i.imgur.com/dnuPdEp.png>
- **B3 :** Tạo 1 **GPT disklabel partition table** :
    ```
    (parted) mklabel gpt
    ```
    <img src=https://i.imgur.com/qdrkaYZ.png>

- **B4 :** Set đơn vị mặc định là `GB` :
    ```
    (parted) unit GB
    ```
- **B5 :** Tạo partition `10G`
    ```
    (parted) mkpart primary 0 10
    ```
    hoặc 
    ```
    (parted) mkpart primary 0.00GB 10.00GB
    ```
    <img src=https://i.imgur.com/XQ14n67.png>
- **B6 :** Quit và Save cấu hình :
    ```
    (parted) quit
    ```
- **B7 :** Định dạng lại filesystem cho partition
    ```
    # mkfs.xfs /dev/sda1
    ```
    hoặc
    ```
    # mkfs.ext4 /dev/sda1
    ```
    <img src=https://i.imgur.com/lMQghwV.png>

- **B8 :** Tạo 1 thư mục rồi mount phân vùng `sda1` vừa tạo :
    ```
    # mkdir /DATA
    # mount /dev/sda1 /DATA
    # df -h
    ```
    <img src=https://i.imgur.com/gGXC2jR.png>

- **B9 :** Lưu mount point vào file `/etc/fstab` :
    - **Cách 1 :** Chỉnh sửa thủ công :
        ```
        # vi /etc/fstab
        ```
    - **Cách 2 :** Dùng lệnh `echo` để update thông tin vào `fstab` :
        ```
        # echo dev/sda1 /DATA xfs defaults 0 0 >> /etc/fstab
        ```


