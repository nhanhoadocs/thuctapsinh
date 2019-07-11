# Command Line File management

**1. Create folder (mkdir)**
  - mkdir -p: tạo thư mục cha và con cùng lúc.
  
    `` VD: mkdir -p dir1/ dir2 ``
    
  - mkdir -m: tạo thư mục hiện tại với quyền truy cập.
  
    `` VD: mkdir -m 700 dir ``
    
**2.  di chuyển qua lại các thư mục (cd)**
- Di chuyển tới thư mục home

    `` cd ``
    
- Di chuyển ra thư mục mẹ của thư mục hiện tại.

    `` cd .. ``
    
- Hoán đổi vị trí đứng với thư mục này và thư mục mẹ của nó.

    `` cd - ``
    
- Di chuyển tới thư mục home

    `` cd ~ ``
    
- Di chuyển tới thư mục home

   `` cd $home``
   
- Di chuyển vào trong thư mục sbin

    `` cd /usr/sbin ``
    
**3. Lệnh dùng để copy (cp)**
 - sao chép từ file1 sang file2
 
`` cp file1 file2``

- chép file vào thự mục

`` cp file /thưmục ``

- kiểm tra xem có ghi đè không.

    `` cp -i ``
    
- Sao chép mà không cần xác nhận là có ghi đè hay không.

   `` cp -f ``
   
- Nếu đích sao chép có cùng tên tệp, tạo bản sao lưu và sao chép.

    `` cp -b ``
    
- Sao chép tất cả nội dung của thư mục1 sang thư mục2 

    `` cp -r thưmục1 thưmục2 ``
    
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
- **Phải để stt trước mỗi string-line để chúng nhận biết được để join**.
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

`` Filesystem                 Size    Used    Avail   Use%  Mounted on

/dev/mapper/centos-root        38G    3.6G    34G     10%     / ``

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

- Tìm tất cả file rỗng trong thư mục home

``# find ~ -empty``
**17. Ước tính không gian đĩa, tệp**
`` du -h (đường dẫn) ``

or

`` du (đường dẫn) ``
- Ví dụ:

``

du -h /home/aaz
4.0K	/home/aaz/akc/aaz
4.0K	/home/aaz/akc
8.0K	/home/aaz

``
- Trong đó: 4.0k là kích thước của thư mực, tính theo byte. Còn Đầu ra của lệnh trên hiển thị số lượng khối đĩa trong thư mục /home/aaz cùng với các thư mục con của nó.

**18. In ra biến môi trường**
[root@localhost ~]# a=100
[root@localhost ~]# echo $a
100
``echo $PATH ``
- Biến PATH cho thấy đường dẫn tới các thư mục chứa câu lệnh (chương trình) để chạy khi bạn gõ trên terminal, các mục cách nhau dấu “:” ví dụ /usr/local/sbin; /usr/local/bin...

- Ví dụ khi bạn cài phần mềm ffmpeg (thư viện chuyên chỉnh sửa video, audio …), hay khi các bạn cài phần mềm imagemagick trên Linux thì các chương trình của ffmpeg, imagemagick sẽ được lưu ở mục /usr/local/bin hoặc là ở /sbin …

- Với biến PATH như trên thì bạn không cần biết ffmpeg, imagick cài ở đâu, mỗi khi bạn gõ lệnh ffmpeg hay convert (của imagick) trên terminal thì hệ thống tự biết tìm đến mục chứa nó để chạy.

**19. ssh**
- Login vào remote host

`` ssh -l jsmith remotehost.example.com ``

- Debug ssh client

`` ssh -v -l jsmith remotehost.example.com ``

- Hiển thị phiên bản ssh

`` $ ssh -V ``

`` OpenSSH_3.9p1, OpenSSL 0.9.7a Feb 19 2003 ``

**20. Check version đang sử dụng.**
``cat /etc/centos-release``
``CentOS Linux release 7.6.1810 (Core) ``

**21. Hiển thị memory đã sử dụng**
`` free ``

**22. Hiển thị số giây mà hệ điều hành chạy**
``grep btime /proc/stat | grep -Eo [[:digit:]]+``
``1559725057``

**23. Gán và xem giá trị với echo**
- Xem giá trị trong file.
``echo tên_file``
- Gán giá trị vào file.
`` echo giá_trị_cần_gán > tên_file ``
- Gán giá trị tiếp vào dữ liệu đã có sẵn.
`` echo giá_trị_cần_gán >> tên_file ``

**24. Hiển thị tên thư mục đang làm việc**
``pwd``

**25. Liệt kê các danh mục trong thư mục hiện hành**
``ls``
- Liệt kê danh mục tập tin trong thư mục 1 cách chi tiết.
`` ls -l ``
- Liệt kê tất cả các tập tin, kể cả các tập tin ẩn (thường có tên bắt đầu bằng một dấu chấm)
`` ls -a ``
- Liệt kê tên các thư mục nằm trong thư mục hiện hành.
`` ls -d ``
- Xếp lại các tập tin theo ngày đã tạo ra, bắt đầu bằng những tập tin mới nhất.
`` ls -t ``
- Xếp lại các tập tin theo kích thước, từ to nhất đến nhỏ nhất.
`` ls -S ``
- Liệt kê theo từng trang một, nhờ tiện ích << more >>
`` ls -l | more ``

**26. Chuyển tên tập tin/ thư mục.
`` mv ``
- chuyển tên tập tin file1 thành tên file2
`` mv file1 file2 ``

- Chuyển tên thưmục1 thành thưmục2
`` mv thưmục1 thưmục2 ``

- Chuyển tập tin file1 vào thư mục1
`` mv file1 thưmục1 ``

- Chuyển file1 vào thưmục1 rồi đồng thời đổi tên tên tin thành file2

`` mv file1 thưmục1/file2 ``

**27. xóa bỏ tập tin/ thư mục **
`` rm ``

- Xóa  bỏ tập tin file trong thư mục hiện hành.

`` rm file ``

- Xóa bỏ thư mục trống mang tên thưmục1

`` rmdir thưmục1 ``

- Xóa bỏ thư mục mang tên thưmục1 và tất cả các tập tin trong đó. 

`` rm -rf thưmục1 ``

**28. So sánh nội dung của 2 tập tin hoặc thư mục.
`` diff file1 file2.