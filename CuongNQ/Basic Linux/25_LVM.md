# LVM - Logical Volume Manager
- **Logical Volume Manager ( LVM )** là phương pháp cho phép ấn định không gian đĩa cứng thành những ***Logical Volume*** khiến cho việc thay đổi kích thước trở nên dễ dàng hơn so với ***partition*** .
- Với kỹ thuật **LVM** , có thể thay đổi kích thước phân vùng mà không cần phải sửa lại table của OS . Điều này rất hữu ích với trường hợp đã sử dụng hết phần bộ nhớ còn trống của partition và muốn mở rộng dung lượng của nó .
- Vai trò của **LVM** : **LVM** là kỹ thuật quản lý việc thay đổi kích thước lưu trữ của ổ cứng :
    - Không để hệ thống bị gián đoạn hoạt động
    - Không làm hỏng dịch vụ
    - Có thể kết hợp với cơ chế ***hot swapping*** ( phương pháp thay thế nóng các thành phần bên trong máy tính )
## **1) Mô hình các thành phần trong LVM**
<p align=center><img src=https://i.imgur.com/UqevOfJ.png></p>

### **1.1) Hard drives - Drives**
- Là các thiết bị lưu trữ dữ liệu , có dạng `/dev/xxxx`
### **1.2) Partition**
- Là các phân vùng của **hard drives** , mỗi **hard drive** có `4` **partition** trong đó **partition** bao gồm 2 loại là ***primary partition*** và ***extended partition*** :
- **Primary Partition** : 
    - Là phân vùng chính , có thể boot
    - Mỗi đĩa cứng có thể có tối đa `4` phân vùng này
- **Extended Partition** :
    - Là phân vùng mở rộng chứa dữ liệu , trong nó có thể tạo các **logical partition**
### **1.3) Physical Volume** 
- Là 1 tên gọi khác của **partition** trong kỹ thuật **LVM** , nó là những thành phần cơ bản được sử dụng bởi **LVM**
- Một **Physical Volume** không thể mở rộng ra ngoài phạm vi 1 ổ đĩa .
- Có thể kết hợp nhiều **Physical Volume** thành một **Volume Group** .
### **1.4) Volume Group**
- Nhiều **Physical Volume** trên những ổ đĩa khác nhau kết hợp lại thành 1 **Volume Group**
- **Volume Group** được dùng để tạo ra các **Logical Volume** , trong đó người dùng có thể tạo , thay đổi kích thước , gỡ bỏ và sử dụng .
> ***Lưu ý :** Boot Loader không thể đọc `/boot` khi nó nằm trên **Logical Volume Group** . Do đó không thể sử dụng **LVM** với **boot mount point*** .
### **1.5) Logical Volume**
- **Volume Group** được chia nhỏ thành các **Logical Volume** , mỗi **Logical Volume** có ý nghĩa tương tự 1 partition . Nó được dùng cho các mount point và được format với những định dạng khác nhau như `ext2` , `ext3` , `ext4` , `xfs` ,...
- Khi dung lượng của **Physical volume** được sử dụng hết ta có thể đưa thêm ổ đĩa mới bổ sung cho **Volume Group** và do đó tăng được dung lượng của **Logical Volume** .<br>**VD :** Có thể tạo ra 4 ổ đĩa mỗi ổ `5GB` , kết hợp thành 1 **Volume Group** `20G`  , có thể tạo ra 2 **Logical Volume** mỗi cái `10G` .
#### **1.5.1) Linear Volumes ( ~ Span Volume )**
<p align=center><img src=https://i.imgur.com/wirelIY.png width=50%></p>

- Là một **Logical Volume** bình thường được tạo ra từ **Volume Group**
- Các **Physical Volume** thành phần tạo nên **Volume Group** không nhất thiết phải giống nhau về dung lượng .
- Có thể tạo ra nhiều **Linear Volume** với dung lượng tùy ý trên **Volume Group** được tạo ra .
- **Linear** không có khả năng đáp ứng vấn đề an toàn dữ liệu ( **Fault Tolerancing** ) , và tốc độ xử lý dữ liệu ( **Load Balancing** )
#### **1.5.2) Stripped Logical Volume ( ~ RAID 0 )**
- Khi dữ liệu được ghi vào **Logical Volume** , file system sẽ đẩy dữ liệu xuống các **Physical Volume** .
- Có thể kiểm soát việc ghi dữ liệu vào các **Physical Volume** bằng cách tạo ra **Stripped Logical Volume** .
    <p align=center><img src=https://i.imgur.com/rV2nIz8.png width=30%></p> 
- **Stripping** giúp tăng cường hiệu suất đọc/ghi dữ liệu bằng cách quyết định trước việc ghi dữ liệu vào **Physical Volume** theo tuần tự . Quá trình đọc/ghi có thể được thực hiện song song .
<p align=center><img src=https://i.imgur.com/TIfzYVP.png width=50%></p>

- Trong hình trên :
    - Luồng dữ liệu thứ nhất được ghi vào **PV1**
    - Luồng dữ liệu thứ hai được ghi vào **PV2**
    - Luồng dữ liệu thứ ba được ghi vào **PV3**
    - Luồng dữ liệu thứ 4 được lưu vào **PV1**
    - Kích thước của 1 luồng dữ liệu không vượt quá kích thước của 1 **PE**  .
- **Stripped Logical Volume** có thể được mở rộng .<br>**VD :** Có 1 ổ **Stripped** đã sử dụng hết dung lượng của **Volume Group** ( được tạo thành từ 2 **Physical Volume** ) . Nếu muốn tăng thêm kích thước cho **Stripped Volume** , phải nhóm thêm vào **Volume Group** 2 **Physical Volume** khác nữa , nếu chỉ nhóm thêm 1 thì sẽ không được .
- **Striped** đáp ứng được vấn đề tốc độ xử lý dữ liệu ( **Load Balancing** ) , tuy nhiên không đáp ứng được vấn đề an toàn dữ liệu ( **Fault Tolerancing** )
#### **1.5.3) RAID**
- **LVM** hỗ trợ **RAID 0 / 1 / 5 / 6 / 10** .
- **LVM RAID Volume** hỗ trợ **snapshot** .
- **RAID 1 ( Mirror Volume )**

    <p align=center><img src=https://i.imgur.com/tnkSBuJ.png width=30%></p>

    - Yêu cầu `2*n` **physical volumes** thành phần .
    - Dữ liệu khi chép trên **mirror** sẽ được backup sang **physical volume** thứ 2 ( vì thế dung lượng trên **mirror volume** chỉ bằng `1/2` dung lượng khi ta cấu hình ) . 
    - **Mirror Volume** đáp ứng nhu cầu an toàn dữ liệu ( **Fault Tolerancing** ) , nhưng không làm tăng tốc độ truy xuất dữ liệu .
- **RAID 5**

    <p align=center><img src=https://i.imgur.com/D1LWhKI.png width=40%></p>

    - **RAID 5 Volume** là giải pháp kết hợp các loại volume ( **Striped Volume RAID-0** , **Mirror Volume RAID-1** ) .
    - **RAID 5** đòi hỏi phải sử dụng `3` ổ đĩa cứng vật lý trở lên , và sử dụng thuật toán ***Parity*** ( ***parity*** là đoạn mã để nó kiểm tra tính toàn vẹn của dữ liệu ) . Khi 1 trong 3 đĩa bị hỏng , **RAID 5** sẽ dựa vào các phần dữ liệu còn + ***parity*** để build lại dữ liệu ) .
    - Vì phải chứa thêm bit ***Parity*** nên dung lượng của **RAID 5 Volume** sẽ chỉ bằng `2/3` dung lượng ta cấu hình ( trong trường hợp có 3 ổ đĩa tham gia cấu hình **RAID 5** ) ( `1/3` còn lại là để chứa bit ***Parity*** ) .
    - **RAID 5** đáp ứng cả 2 vấn đề an toàn dữ liệu ( **Fault Tolerangcing** ) , và tăng tốc độ xử lý dữ liệu ( **Load Balancing** ) . 
- **RAID 6**

    <p align=center><img src=https://i.imgur.com/B1RR5sX.png width=40%></p>

    - **RAID 6** là một dạng cải tiến từ **RAID 5** .
    - Ở **RAID 5** thì mỗi một dữ liệu được tách thành hai vị trí lưu trữ trên hai **physical volume** khác nhau , nhưng ở **RAID 6** thì mỗi dữ liệu lại được lưu trữ ở ít nhất ba vị trí ( trở lên ) .<br>=> Giúp cho sự an toàn của dữ liệu tăng lên so với **RAID 5** .
    - **RAID 6**  yêu cầu tối thiểu `4` ổ cứng , với `4` ổ cứng thì chúng cho phép hư hỏng đồng thời đến `2` ổ cứng mà hệ thống vẫn làm việc bình thường , điều này tạo ra một xác xuất an toàn rất lớn .<br>=> **RAID 6** thường chỉ được sử dụng trong các máy chủ chứa dữ liệu cực kỳ quan trọng .
- **RAID 10**

    <p align=center><img src=https://i.imgur.com/3Dy1W2E.png width=40%></p>

    - **RAID 10** là sự kết hợp từ **RAID 0** và **RAID 1** ( **RAID 1 + 0** )
    - **RAID 10** hoạt động không chỉ đơn giản là đọc và ghi dữ liệu , mà nó còn tự động sao lưu dữ liệu , đồng thời giúp quá trình thay thế hoặc cứu dữ liệu **RAID 10** trở nên dễ dàng hơn mỗi khi có một ổ cứng bị lỗi .
    - **RAID 10** đòi hỏi tối thiểu 4 **physical volumes** .
    - Phương thức ghi đồng thời lên tất cả 4 **volume** , 2 volume dạng “**striping**” và 2 volume dạng “**mirror**” – 4 ổ đĩa này phải giống nhau về dung lượng và kiểu loại .

#### **1.5.4) Thinly-Provisioned Logical Volumes ( Thin Volumes )**
- **Thin Volume** được tạo ra có 1 dung lượng chia sẵn ( ***allocated size*** ) nhưng chỉ chiếm dung lượng của ổ đĩa đúng bằng dung lượng của dữ liệu thực tế có trên **Volume**  ( ***used size*** ) .
- **VD :** chia ổ ảo `30G` nhưng hiện tại chỉ sử dụng `10G` thì trên ổ đĩa vật lý chỉ chiếm `10G` không gian thực .

    <img src=https://i.imgur.com/cYzr8td.jpg>

#### **1.5.5) Thickly-Provisioned Logical Volumes ( Thick Volumes )**
- **Thick Volume** được tạo ra có 1 dung lượng chia sẵn ( ***allocated size*** ) và chiếm đúng bằng đó dung lượng của ổ đĩa mặc dù dữ liệu bên trong ít hơn .
- **VD :** chia ổ ảo `30G` , thực tế đang sử dụng hết `10G` nhưng trên ổ đĩa vật lý vẫn chiếm `30G` không gian đĩa .

    <img src=https://i.imgur.com/B4XiRaQ.jpg>

#### **1.5.6) Snapshot Volumes**
- Tính năng **LVM Snapshot** cung cấp tạo ra 1 bản sao ổ đĩa tại thời điểm hiện tại mà không làm gián đoạn các dịch vụ .
- Khi thực hiện **snapshot** trên ổ đĩa gốc , tính năng này sẽ thực hiện tạo ra 1 bản sao của vùng dữ liệu đang có trên máy tính và có thể dùng nó để khôi phục lại trạng thái cũ .
- Vì **snapshot** chỉ lưu lại các vùng dữ liệu thay đổi sau khi thực hiện , nên **snapshot volume** cần một dung lượng tối thiểu của đĩa cứng . **VD :** Nếu ít thực hiện thay đổi trên ổ đĩa , **snapshot volume** chỉ chiếm khoảng `3-5%` dung lượng của đĩa cứng .
- **Snapshot** chỉ thực hiện tạo ra 1 bản sao ảo , không thể thay thế hoàn toàn quá trình sao lưu dữ liệu .
#### **1.5.7) Thinly-Provisioned Snapshot Volumes**
#### **1.5.8) Cache Volumes**
- **LVM** hỗ trợ việc sử dụng các ổ cứng tốc độ cao ( như **SSD** ) để chi lại cache cho các ổ cứng tốc độ chậm hơn ( như **HDD** ) .

    <p align=center><img src=https://i.imgur.com/bpTzibn.png></p>

- Có thể tạo ra **cache logical volume** để cải thiện hiệu suất của các **logical volume** có sẵn hoặc tạo **cache volume** gồm các **SSD** tốc độ cao với dung lượng lưu trữ thấp và các **HDD** tốc độ chậm với dung lượng lưu trữ cao .

### **1.6) Physical Extend ( PE )**
- Là 1 đại lượng thể hiện 1 khối dữ liệu dùng làm đơn vị tính dung lượng của **Logical Volume** .
- Mặc định `1PE = 4MB`
## **2) Ưu điểm và nhược điểm của LVM**
### **2.1) Ưu điểm**
- Có thể gom nhiều đĩa cứng vật lý lại thành 1 đĩa ảo dung lượng lớn
- Có thể tạo ra các vùng dung lượng lớn nhỏ tùy ý
- Có thể thay đổi các vùng dung lượng đó dễ dàng , linh hoạt
### **2.2) Nhược điểm**
- Các bước thiết lập phức tạp , khó khăn hơn
- Càng gắn nhiều đĩa cứng và thiết lập càng nhiều **LVM** thì hệ thống khởi động càng lâu
- Khả năng mất dữ liệu khi 1 trong các đĩa cứng vật lý bị hỏng
- Windows không thể nhận ra vùng dữ liệu của **LVM** . Nếu *dual-boot* Windows sẽ không thể truy cập dữ liệu chứa trong **LVM**
## **3) Các lệnh trong LVM**
- **Physical Volume** :
    - `pvcreate` : tạo **physical volume**
    - `pvdisplay` , `pvs` : xem **physical volume** đã tạo
    - `pvremove` : xóa **physical volume**
- **Volume Group** :
    - `vgcreate` : tạo **volume group**
    - `vgdisplay` , `vgs` : xem **volume group** đã tạo
    - `vgremove` : xóa **volume group**
    - `vgextend` : tăng dung lượng của **volume group**
    - `vgreduce` : giảm dung lượng của **volume group**
- **Logical Volume** :
    - `lvcreate` : tạo **logical volume**
    - `lvdisplay` , `lvs` : xem **logical volume** đã tạo
    - `lvremove` : xóa **logical volume**
    - `lvextend` : tăng dung lượng **logical volume**
    - `lvreduce` : giảm dung lượng **logical volume**
## **4) Các bước tạo Linear Volume**
- Thêm 4 ổ cứng `sdb` , `sdc` , `sdd` , `sde` vào Server
- **B1 :** Kiểm tra các hard drive có trên hệ thống :
    ```
    # lsblk
    ```
    hoặc
    ```
    # fdisk -l
    ```
    <img src=https://i.imgur.com/fYW0gzw.png>

- **B2 :** Tạo **partition** :
    - Từ các hard disk trên hệ thống , tạo ra các partition .
    - Dùng lệnh `fdisk` ( có thể dùng `parted` )
        ```
        # fdisk /dev/sdb
        ```
        <img src=https://i.imgur.com/7MCR1ml.png>

        - `n` : tạo mới partition

            <img src=https://i.imgur.com/qu3evFC.png>

        - `p` : tạo partition `primary`
        - `1` : tạo partition `primary` thứ nhất
        - Dòng "`First sector (2048-41943039,defaul 2048)`" để **default**
        - Dòng "`Last sector,+sector or size {K,M,G} (2048-41943039),default 41943039`"<br>=> `+10G` để tạo ra phân vùng `10GiB`

            <img src=https://i.imgur.com/UOW9Rae.png>

        - `t` : tùy chọn thày đổi định dạng partition
        - `8e` : thay đổi về định dạng **LVM**
        - `w` : lưu lại và thoát
    - Tương tự tạo thêm partition với các hard disk khác .

        <img src=https://i.imgur.com/uKTlRLr.png>

- **B3 :** Tạo **physical volume** :
    - Tạo các **physical volume** là `/dev/sdb1` , `/dev/sdc1` , `/dev/sdd1` , `/dev/sde1` :
        ```
        # pvcreate /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1
        ```
        <img src=https://i.imgur.com/jdc5MCL.png>

    - Kiểm tra lại bằng lệnh `pvs` hoặc `pvdisplay` :

        <img src=https://i.imgur.com/fTGUtA6.png>
- **B4 :** Tạo **volume group** :
    - Nhóm các **physical volume** thành 1 **volume group** bằng câu lệnh
        ```
        # vgcreate vg-demo1 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1    ( vg-demo1 là tên volume group )
        ```
        <img src=https://i.imgur.com/OIWku0W.png>
    - Kiểm tra lại bằng lệnh `vgs` hoặc `vgdisplay` :
        
        <img src=https://i.imgur.com/JLJlbQQ.png>

- **B5 :** Tạo **logical volume** :
    - Từ 1 **volume group** , có thể tạo ra các **logical volume** bằng lệnh :
        ```
        # lvcreate -L 25G -n lv-demo1 vg-demo1
        ```
        - Trong đó :
            - `-L` : chỉ ra dung lượng của **logical volume**
            - `-n` : chỉ ra tên của **logical volume**

        <img src=https://i.imgur.com/rCpo27M.png>

    - Có thể tạo nhiều **logical volume** từ 1 **volume group**
    - Kiểm tra lại bằng lệnh `lvs` hoặc `lvdisplay` :

        <img src=https://i.imgur.com/jPNJKpL.png>
    
- **B6 :** Format **logical volume**
    ```
    # mkfs.xfs /dev/vg-demo1/lv-demo1
    ```
    <img src=https://i.imgur.com/KxV0vlZ.png>

- **B7 :** Mount và sử dụng :
    ```
    # mkdir demo1
    # mount /dev/vg-demo1/lv-demo1 demo1
    # df -h => kiểm tra
    ```
    <img src=https://i.imgur.com/9OQPhz4.png>

- **B8 :** Lưu cấu hình vào file `/etc/fstab`
    ```
    # echo /dev/vg-demo1/lv-demo1 /demo1 xfs defaults 0 0
    ```
## **5) Các bước tạo Stripped Volume - RAID 0**
- Thêm 4 ổ cứng `sdb` , `sdc` , `sdd` , `sde` vào Server .
- Các bước thực hiện tương tự **Linear Volumes** cho đến hết bước tạo **Volume Group** .
- Tạo **stripped logical volume** :
    - Từ 1 **volume group** , có thể tạo ra các **stripped volume group** bằng lệnh :
        ```
        # lvcreate -L 25G -i4 -I64 -n lv-stripped-1 vg-demo1
        ```
        - Trong đó :
            - `-L` : chỉ ra dung lượng của **logical volume**
            - `-i4` : thông báo tạo **stripped volume** trên 4 ổ **physical** ( có thể thay đổi )
            - `-I64` : kích thước các luồng dữ liệu tuần tự ( **stripe** ) được ghi trên các **physical volume**
            - `-n` : chỉ ra tên của **stripped logical volume**

        <img src=https://i.imgur.com/YJsz0hh.png>

    - Có thể tạo ra nhiều **stripped logical volume** từ 1 **volume group**
    - Kiểm tra lại bằng lệnh `lvs` hoặc `lvdisplay` :

        <img src=https://i.imgur.com/mV13ucw.png>
    
    - Có thể tạo ra **stripped volume** có dung lượng được tính bằng số **PE** ( ***physical extend*** - mặc định = `4MB` ) bằng lệnh :
        ```
        # lvcreate -l 100 -i4 -I64 -n lv-stripped-1 vg-demo1
        ```
        - Trong đó :
            - `-l` : chỉ ra dung lượng tính bằng **PE** của **logical volume**
        => Dung lượng của **volume** tạo ra là `100 * 4 = 400MB`
        - Kiểm tra :

            <img src=https://i.imgur.com/oZ38LeX.png>

## **6) Các bước tạo Mirror Volume - RAID 1**
- Thêm 4 ổ cứng `sdb` , `sdc` , `sdd` , `sde` vào Server .
- Các bước thực hiện tương tự **Linear Volumes** cho đến hết bước tạo **Volume Group** .
- Tạo **mirror logical volume** :
    - Từ 1 **volume group** , có thể tạo ra các **mirror volume group** bằng lệnh :
        ```
        # lvcreate -L 15G -m1 -n lv-mirror-1 vg-demo1
        ```
        - Trong đó :
            - `-L` : chỉ ra dung lượng của **logical volume**
            - `-m1` : chỉ định tạo ra 1 **logical volume** với 1 **mirror** đi kèm ( nếu là `-m2` sẽ tạo ra 2 **mirror** , ổ sẽ bị chia làm 3 )
            - `-n` : chỉ ra tên của **mirror logical volume**
        - Kiểm tra : Lệnh trên tạo ra 1 **logical volume** với dung lượng `15G` đồng thời tạo ra 1 **mirror** `15G` ẩn => chiếm dung lượng `30G` của **volume group** :

            <img src=https://i.imgur.com/0ewtv24.png>
            <img src=https://i.imgur.com/LtlOoJJ.png>
    - 1 **mirror logical volume** chia thiết bị được sao chép thành các vùng ( **region** ) có kích thước mặc định là `512kB` . Do giới hạn của hạ tầng , các **mirror** lớn hơn `1,5TB` không thể sử dụng các **region** có kích cỡ `512kB` mà yêu cầu kích cỡ tối thiểu bằng `2MB` . Với **mirror** dung lượng `4TB` , nên để **region** `4MB` . Với **mirror** dung lượng `5TB` , nên để **region** `8MB` :
        ```
        # lvcreate -L 3T -m1 -R 4 -n lv-mirror-1 vg-demo1
        ```
## **7) Cách thay đổi dung lượng Logical volume trên LVM**
- **B1 :** Kiểm tra các thông tin hiện có : 
    ```
    # pvs
    # vgs
    # lvs
    ```
    - Giả sử `lv-demo1` đã đầy và cần tăng kích thước .
    - Để tăng kích thước , phải kiểm tra xem **volume group** còn dư dung lượng để kéo giãn **logical volume** không . **Logical volume** thuộc 1 **volume group** nhất định , nếu **volume group** đã cấp phát hết thì **logical volume** cũng không tăng dung lượng lên được .
    - Để kiểm tra , dùng lệnh `vgdisplay`
    - Chú ý 2 trường thông tin :
        - "`VG Status     resizeable`"  => có thể co dãn được
            <img src=https://i.imgur.com/SrFM4pJ.png>
        - "`Free PE / Size    3836 /14.98 GiB`"   
            <img src=https://i.imgur.com/2xRx0ny.png>  


- **B2.1 :** Tăng kích thước dung lượng **logical volume** :
    ```
    # lvextend -L +5G /dev/vg-demo1/lv-demo1
    ```
    - `-L` : tùy chọn để thay đổi kích thước
    - Sau khi tăng kích thước **logical volume** thì dung lượng đã được tăng nhưng file system trên **volume** này vẫn chưa thay đổi :
        ```
        # resize2fs /dev/vg-demo1/lv-demo1
        ```
- **B2.2 :** Giảm kích thước **logical volume** :
    - Trước tiên phải unmount **logical volume** muốn giảm :
        ```
        # umount /dev/vg-demo1/lv-demo1
        ```
    - Giảm kích thước của **logical volume** :
        ```
        # lvreduce -L 5G /dev/vg-demo1/lv-demo1
        ```
    - Format lại **logical volume** :
        ```
        # mkfs.xfs /dev/vg-demo1/lv-demo1
        ```
    - Mount lại **logical volume** :
        ```
        # mount /dev/vg-demo1/lv-demo1 demo1
        ```
- **B3 :** Kiểm tra kết quả :
    ```
    # df -h
    ```
## **8) Cách thay đổi dung lượng Volume Group trên LVM**
- Chính là việc nhóm thêm **physical volume** hay bỏ nhóm **physical volume** ra khỏi **volume group** .
- **B1 :** Kiểm tra thông tin partition :
    ```
    # vgdisplay
    ```
    hoặc
    ```
    # lsblk
    ```
- **B2.1 :** Nhóm thêm 1 partition vào **volume group** :
    ```
    # vgextend /dev/vg-demo1 /dev/sdb2
    ```
    ( hệ thống sẽ tự động chuyển `/dev/sdb2` thành **physical volume** )
- **B2.2 :** Cắt 1 partition ra khỏi **volume group**
    ```
    # vgreduce /dev/vg-demo1 /dev/sdb2
    ```
## **9) Cách xóa Logical Volumes , Volume Group , Physical Volume**
### **9.1) Xóa Logical Volume**
- **B1 :** Unmount **logical volume** :
    ```
    # umount /dev/vg-demo1/lv-demo1
    ```
- **B2 :** Xóa **logical volume** :
    ```
    # lvremove /dev/vg-demo1/lv-demo1
    ```
### **9.2) Xóa Volume Group**
- Trước khi xóa **volume group** , phải đảm bảo xóa hết **logical volume** :
- Xóa **volume group** bằng lệnh :
    ```
    # vgremove /dev/vg-demo1
    ```
### **9.3) Xóa Physical Volume**
- ```
  # pvremove /dev/sdb2
  ```
