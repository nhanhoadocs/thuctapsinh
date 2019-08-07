# Quá trình Boot và các Runlevels
<img src=https://i.imgur.com/WazovyQ.png>

### **1) System Startup**
- Đây là bước đầu tiên của quá trình khởi động , ở bước này **BIOS** thực hiện 1 công việc gọi là **POST ( Power-on Self-test )** . **POST** là quá trình kiểm tra tính sẵn sàng phần cứng nhằm kiểm tra thông số và trạng thái của các phần cứng máy tính như bộ nhớ , CPU , thiết bị lưu trữ , card mạng ,... Nếu quá trình **POST** kết thúc thành công , **BIOS** sẽ cố gắng tìm kiếm và boot 1 hệ điều hành được chứa trong các thiết bị lưu trữ như ổ cứng , CD/DVD , USB .
- Thông thường **BIOS** sẽ kiểm tra ổ đĩa mềm hoặc CD-ROM xem có thể khởi động từ chúng được không , rồi đến phần cứng . Thứ tự của việc kiểm tra các ổ đĩa phụ thuộc vào các cấu hình trong **BIOS** .
    - Nếu **BIOS** không tìm thấy boot device thì sẽ cảnh báo `No boot device found` .
    - Nếu hệ điều hành **Linux** được cài đặt trên đĩa cứng thì sẽ tìm đến **Master Boot Record ( MBR )** tại **sector** đầu tiên của ổ cứng đầu tiên .
### **2) MBR Loading**
- **MBR ( Master Boot Record )** được lưu trữ tại **sector** đầu tiên của 1 thiết bị lưu trữ dữ liệu , vd `/dev/hda` hoặc `/dev/sda` .
- **MBR** rất nhỏ , chỉ `512 byte` .
- **MBR** chứa thông tin :
    - **Primary boot loader code** ( `446 byte` ) : cung cấp thông tin boot loader và vị trí boot loader trên ổ cứng .
    - **Partition table information** ( `64 byte` ) : lưu trữ thông tin các partition .
    - **Magic number** ( `2 byte` ) : được sử dụng để kiểm tra **MBR** , nếu **MBR** bị lỗi thì nó sẽ khôi phục lại .
### **3) GRUB Loader**
- Sau khi xác định vị trí Boot Loader , bước này sẽ thực hiện load Boot Loader vào bộ nhớ và đọc thông tin cấu hình sau đó hiển thị **GRUB boot menu** để user lựa chọn . Nếu user không chọn OS thì sau khoảng thời gian được định sẵn , **GRUB** sẽ load **kernel** default vào memory để khởi động .
- Đối với các hệ thống sử dụng **EFI/UEFI** , các firmware **UEFI** sẽ đọc dữ liệu Boot Manager để tìm các ứng dụng **UEFI** . Firmware sẽ chạy ứng dụng **UEFI** .
### **4) Kernel**
- **Kernel** của hệ điều hành sẽ được nạp vào trong **RAM** . Khi **kernel** hoạt động thì việc đầu tiên đó là thực thi quá trình **INIT** .
### **5) Runlevels ( INIT )**
- Đây là giai đoạn chính của quá trình boot . Quá trình này bắt đầu bằng việc đọc file `/etc/inittab` :
    - **Runlevel** `0` : ***halt*** - tắt hệ thống
    - **Runlevel** `1` : ***single-user mode*** - không cấu hình network , khởi động các tiến trình và cho phép đăng nhập user *non-root* 
    - **Runlevel** `2` : ***multi-user mode*** - không cấu hình network , khởi động các tiến trình
    - **Runlevel** `3` : ***multi-user mode with networking*** - khởi động hệ thống bình thường trên giao diện dòng lệnh
    - **Runlevel** `4` : ***undefined***
    - **Runlevel** `5` : ***X11*** - khởi động hệ thống trên giao diện đồ họa
    - **Runlevel** `6` : ***reboot*** - khởi động lại hệ thống
### **6) User Prompt**
- Người dùng đăng nhập và sử dụng

## **Thiết lập chế độ khởi động mặc định**
- **Multi-user.target** ( **INIT 3** ) : Chế đô dòng lệnh Command Mode ( non-graphics ) . User chỉ sử dụng các lệnh ( command ) để thao tác . Ở chế độ này Server dùng rấ ít RAM .
- **Graphical.target** ( **INIT 5** ) : Chế độ GUI , mặc định khi install OS ở chế độ GNOME là ta đang sử dụng **Graphical.target**
- Các lệnh thiết lập :
    - Thiết lập **Multi-user.target** mặc định khi khởi động :
        ```
        # systemctl set-default multi-user.target
        ```
    - Thiết lập **Graphical.target** mặc định khi khởi động :
        ```
        # systemctl set-default graphical.target
        ```
    - Kiểm tra chế độ mặc định khi khởi động hiện tại :
        ```
        # systemctl get default
        ```
    - Chuyển đổi tạm thời từ **graphical** -> **multi-user** :
        ```
        # systemctl isolate multi-user.target
        hoặc
        # init 3
        ```
    - Chuyển đổi tạm thời từ **multi-user** -> **graphical** :
        ```
        # systemctl isolate graphical.target
        hoặc
        # init 5
        ```