<a name= "Quản lý đĩa và hệ thống file" >

# Quản lý đĩa và hệ thống file

## Nội dung:
- Khái niệm đĩa,phân vùng và hệ thống tệp
- Quản lý đĩa
- Quản lý phân vùng
- Quản lý hệ thống tệp
- Qaunr lý hạn ngạch

---------------------------

- Các khái niệm cơ bản

    - Các loại đĩa vật lý
        - IDE, SCSI, USB, SATA, LVM 
        - Ký hiệu /dev/hdX, /dev/sdX, /dev/fdX 
        - X là chữ cái
    - Phân vùng
        - /dev/hdaX, /dev/sdbX, … 
        - X là một số nguyên
    - Hệ thống tệp
        - Tổ chức logics của phân vùng 
        - NTFS, EXT2, EXT3, SWAP, ……..   

- Tổ chức của ổ đĩa

    - Master boot record 
    - Boot record 
    -  Primary partition (tối đa 4) 
    - Extended Partition 
    - Logical Partition

- Quản lý phân vùn
    - Công cụ: pdisk, fdisk 
    - Thao tác 
        - Hiển thị thông tin về các phân vùng 
        - Xóa phân vùng 
        - Thay đổi cấu hình của phân vùng 
        - Tạo các phân vùng mới 
        - Ghi các thay đổi vào MBR

- Quản lý hệ thống tệp
    - Tạo ra hệ thống tệp-định dạng 
    - Kiểm tra hệ thống tệp 
    - Tối ưu hệ thống tệp 
    - Sử dụng hệ thống tệp

- Tạo ra hệ thống tệp
    - mkfs 
        - Tạo ra hệ thống tệp trên phân vùng trống 
        - -t để khai báo kiểu hệ thống tệp 
    - Liên kết với các lệnh tạo hệ thống tệp tương ứng 
    - mk2fs, mkfs.ext2 tạo ra hệ thống tệp linux (ext2) 
    - mk2fs -j, mkfs.ext3 tạo ra hệ thống tệp linux (ext3) 

- Định dạng hệ thống tệp ext2
    - -b kích thước block 
    - -i số lượng byte cho 1 inode 
    - -c Số lần mount 
    - -j Có nhật ký? 
    - -m dự trữ 
    - -r số block dự trữ 
    - -g, -u nhóm và NSD được dùng dự trữ

- Sử dụng các hệ thống tệp
    - Thực hiện câu lệnh mount 
        - Điểm mount 
        - Thiết bị được mount 
        - Kiểu hệ thống tệp 
        - Các tiêu chí khác 
            - Đọc, ghi, hạn ngạch, …… 
    - Ảnh hưởng đến tệp mtab 
    - umount: giải phóng thiết bị 
    - fuser: các tiến trình đang sử dụng tệp
- Kiểm tra ổ đĩa
    - Tìm các block bị lỗi 
    - Tìm các sector bị lỗi 
    - Sửa chữa khi cần ! 
    - Có thể được thực hiện tự động 
        - fdisk  -f /dev/sda1
- Mount khi khởi động hệ thống

```
-  /etc/fstab [root@localhost ~]# cat /etc/fstab #device mount point fs       option dump chk /dev/VolGroup00/LogVol00 / ext3    defaults      1 1 LABEL=/boot             /boot ext3    defaults      1 2 tmpfs                   /dev/shm tmpfs  defaults      0 0 devpts                  /dev/pts                devpts  gid=5,mode=620  0 0 sysfs                   /sys                    sysfs   defaults        0 0 proc                    /proc                   proc    defaults        0 0 /dev/VolGroup00/LogVol01 swap                    swap    defaults        0 0
```
- Các thao tác trên ổ đĩa
    - df 
        - Hiển thị các thông tin về ổ đia 
    - dd 
        - copy từ ổ đĩa này sang ổ đĩa khá

- Tạo và quản lý bộ nhớ ảo
    - Khái niệm bộ nhớ ảo 
        - Bộ nhớ trên đĩa cứng sử dụng khi không đủ bộ nhớ vật lý 
    - Bộ nhớ ảo sử dụng trong Linux 
        - Phân vùng riêng biệt, được tạo ra khi cài đặt 
    - Sử dụng tệp cho bộ nhớ ảo 
        - Các phân vùng được quản lý như các tệp 
        - mkswap /test/swap.img; swapon /test/swap.img 
    - Sử dụng phân vùng cho bộ nhớ ảo 
        - Thay đổi phân vùng sử dụng cho swap 
        - mkswap /dev/sda5; swapon /dev/sda5 
    - Sử dụng nhiều bộ nhớ ảo 
        - Cùng một lúc sử dụng nhiều bộ nhớ ảo khác nhau 
    - Tự động hóa việc cấu hình swap 
        - /etc/fstab


    