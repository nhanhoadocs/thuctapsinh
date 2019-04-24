# 1.Khái niệm
- `fdisk` là một lệnh được sử dụng để xem và quản lý các phân vùng ổ cứng trên linux. Nó là một trong những công cụ tốt nhất để có thể quản lý phân vùng ổ cứng. 
- Lưu ý:
    - khi dùng `fdisk` thì nó sẽ xóa hết dữ liệu trong phân vùng. thế nên khi dùng lệnh `fidsk` chú ý sao lưu dữ liệu quan trọng lại rồi mới tiến hành dùng lệnh 
    - Bạn không thể di chuyển các ứng dụng từ phân vùng này qua phân vùng khác mà không gỡ cài đặt.
# 2. Một số option của lệnh fdisk
- `fdisk -l`: giúp ta liệt kê các danh sách phân vùng của ổ cứng 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/fdisk/Screenshot%20from%202018-11-29%2013-54-39.png)
- `lsblk` cũng giống như lệnh `fdisk -l` nhưng nó chỉ liệt kê chứ không hiển thị ít thông tin hơn `fdisk -l`
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/fdisk/Screenshot%20from%202018-11-29%2013-53-34.png)
- `fdisk /dev/sda`: đây là lệnh giúp ta bước vào ổ đĩa và bắt đầu làm việc với các phân vùng trong ổ đĩa  
- ![](https://github.com/duckmak14/anh/blob/master/linux/LVM/Screenshot%20from%202018-11-18%2010-08-38.png)
    - Sau khi vào được bên trong ổ đĩa thì các bước làm việc như tạo một phân vùng xóa phân vùng đã được viết ở trong bài LVM 
- `fdisk -l /dev/sda`: chỉ kiểm tra phân vùng của riêng ổ đĩa sda 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/fdisk/Screenshot%20from%202018-11-29%2013-48-50.png)
- `fdisk -s /dev/sda1` : lệnh kiểm tra size của phan vùng 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/fdisk/Screenshot%20from%202018-11-29%2014-03-43.png)
- `fdisk -v` : hiển thị thông tin phiên bản 
- ![](https://github.com/duckmak14/linux/blob/master/dd_fdisk_mount/fdisk/Screenshot%20from%202018-11-29%2014-00-08.png)
