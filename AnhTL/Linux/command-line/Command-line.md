# Command-line

**1. Create folder (mkdir)**
  - mkdir -p: tạo thư mục cha và con cùng lúc.
  
    `` VD: mkdir -p dir1/ dir2 ``
  - mkdir -m: tạo thư mục hiện tại với quyền truy cập.
  
    `` VD: mkdir -m 700 dir ``
    
**2.  di chuyển qua lại các thư mục (cd)**
- Di chuyển tới thư mục home

    `` cd ``
- Di chuyển ra thư mục mẹ của thư mục hiện tại.

    `` cd . . ``
- Hoán đổi vị trí đứng với thư mục này và thư mục mẹ của nó.

    `` cd - ``
- Di chuyển tới thư mục home

    `` cd ~ ``
- Di chuyển tới thư mục home

   `` cd $home``
- Di chuyển vào trong thư mục sbin

    `` cd /usr/sbin ``
    
**3. Lệnh dùng để copy (cp)**
 - sao chép từ user1 sang user2
 
`` cp home/user1 user2 ``
- kiểm tra xem có ghi đè không.

    `` cp -i ``
- Sao chép mà không cần xác nhận là có ghi đè hay không.

   `` cp -f ``
- Nếu đích sao chép có cùng tên tệp, tạo bản sao lưu và sao chép.

    `` cp -b ``
- Sao chép tất cả nội dung của thư mục 

    `` cp -r ``
    
**4. Cấp quyền sở hữu (chmod)**
- Cấp full quyền cho người sở hữu. Quyền đọc, viết và thực thi cho group và user

  `` chmod 755 tên_file ``
- Cấp quyền thực thi cho toàn bộ user

  `` chmod a+x tên_file ``
- Thay đổi quyền sở hữu một file hoặc thư mục

    `` chown option user:group file/folder ``
    - VD: Ta đã dùng user root tạo ra folder aaz  và chuyển quyền sở hữu sang user khác.
    
``    [root@localhost home]# ll
    total 4
    drwxr-xr-x.  3 **root**  root    51 Jun  4 15:52 aaz
    drwxr-xr-x.  3 root  root    47 Jun  4 15:51 akc
    drwx------. 15 user1 user1 4096 Jun  4 15:17 user1
    [root@localhost home]# chown user1 aaz
    [root@localhost home]# ll
    total 4
    drwxr-xr-x.  3 **user1** root    51 Jun  4 15:52 aaz
    drwxr-xr-x.  3 root  root    47 Jun  4 15:51 akc
    drwx------. 15 user1 user1 4096 Jun  4 15:17 user1 ``

**5. Tạo user (adduser, useradd)**
- Tạo user mới

`` adduser tên_user ``
- Dùng --help bên dưới để hiện ra các option.

`` adduser --help ``

**6. Thay đổi quyền sở hữu (Chgrp)**
- thay đổi quyền sở hữu file

`` chgrp tên_ngươi_sở_hữu aaz ``
- Dùng lệnh --help để hiện ra các tùy option.

`` chgrp --help ``

**7. Dừng công việc đang hoạt động(exit)**
- Các công việc sẽ bị dừng lại

`` exit ``

**8. Connect tới ftp server (ftp)**

``ftp host``

**9. Tạm dừng hệ thống (halt)**

`` halt -p ``

**10. Kết hợp hai tệp lại với nhau (Join)**
- Liên kết các lĩnh vực của cả 2 file:

`` join -j file1 file2 ``
- Liên kết các lĩnh vực của file1

`` join -j1 file1 file2 ``
- Liên kết các lĩnh vực của file2

`` join -j2 file1 file2 ``

**11. Thống kê mạng (netstat)**
- Được sử dụng để hiển thị thông tin rất chi tiết về cách máy tính giao tiếp với các máy tính hoặc thiết bị mạng khác.

`` netstat -a ``
- dùng lệnh --help để hiện thị ra các option khác.

`` netstat --help``

**12. Hiển thị giờ thứ ngày tháng năm của máy tính**

``date``
**13. Hiển thị không gian đĩa**

``df -h``
`` Filesystem               Size   Used   Avail  Use%  Mounted on
/dev/mapper/centos-root      38G   3.6G   34G    10%   / ``
- Trong đó: filesystem: tên ổ đĩa. - size: không gian tổng - Used: Không gian đã sử dụng - Avail: Không gian trống - Use: Phần trăm đã sử dụng - Mounted on: Được gắn trên đầu trong cây thư mục root 18. Lấy thông tin của HDH và ghi vào tệp văn bản.

**14. Truy xuất thông tin hữu ích của các thành phần phần cứng trong hệ thống của ta ở định dạng có thể đọc được.**

``dmidecode``
- Dưới đây là các option để hiện thị ra các thông tin cần thiết " có thể ghi số thay cho tên "
![img](https://scontent.fhan5-4.fna.fbcdn.net/v/t1.15752-9/62001377_609159889588549_237152666562592768_n.png?_nc_cat=104&_nc_oc=AQmueFogFTXuZfMWNqJ0UpXyCQtLMDOvLjXbKbFw3gVFox_UJRJcAnzaPKlvZ53SUc8&_nc_ht=scontent.fhan5-4.fna&oh=aafd7477777d31f47ed3f3bd012e1f2a&oe=5D56A305)

  - VD: ``dmidecode -t 7`` (là hiện thành phần của cache)

**15. Tìm một string trong file (không phân biệt chữ hoa và chữ thường)**

`` grep -i "string" file_name ``
- Tìm kiếm đệ quy string trong tất cả file.

`` grep -r "string"  * ``

**16. Tìm file theo tên (không phân biệt chữ hoa và chữ thường)**

`` find -iname "MyCProgram.c" ``
- Thực thi lệnh lên file tìm được.

`` find -iname "MyCProgram.c" -exec md5sum {} \;``

Tìm tất cả file rỗng trong thư mục home

# find ~ -empty
