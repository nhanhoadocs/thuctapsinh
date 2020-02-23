## Kiểm tra dung lượng ổ đĩa trong Linux  

Là một admin hệ thống, bạn luôn muốn chắc chắn rằng bạn có đủ không gian đĩa để cho máy chủ hoạt động tốt không? Thật may mắn, Linux hỗ trợ rất nhiều lệnh giúp bạn kiểm tra điều đó. Trong bài viết này, chúng ta cùng tìm hiểu 2 lệnh cơ bản là `df` và `du`. 

**1. Lệnh `df`** 
Lệnh “df” viết tắt của “disk filesystem“, nó được dùng để lấy toàn bộ thông tin về lượng ổ cứng khả dụng và lượng ổ cứng đã dùng của các file hệ thống trên linux.
Cách đơn giản nhất để kiểm tra dung lượng đĩa là ta sử dụng lệnh `df`:  
```
# df
Filesystem     1K-blocks    Used Available Use% Mounted on
udev              461408       0    461408   0% /dev
tmpfs              98512    1252     97260   2% /run
/dev/sda2       20508240 3974648  15468788  21% /
tmpfs             492552       0    492552   0% /dev/shm
tmpfs               5120       0      5120   0% /run/lock
tmpfs             492552       0    492552   0% /sys/fs/cgroup
/dev/loop0         91264   91264         0 100% /snap/core/7917
/dev/loop1         90624   90624         0 100% /snap/core/7270
tmpfs              98508       0     98508   0% /run/user/1000

```
Trong đó:  
- **filesystem**: tên filesystem có thể trùng với phân vùng đĩa  
- **1K-blocks**: Số lượng khối (block) có trong filesystem có kích thước 1Kb. 
- **Used**: Số lượng 1K-block được sử dụng trong filesystem.  
- **Available**: Số lượng 1K-block đang có sẵn.  
- **Use%**: Phần trăm đĩa đã sử dụng trong filesystem.  
- **Mounted on**: Nơi mount  

Lệnh `df` được đi kèm với một số tùy chọn để hiển thị nội dung rõ ràng và thân thiện với người dùng hơn.  
Tùy chọn `-h` cho ta một cái nhìn trực quan hơn khi đọc các thông số ở chế độ chi tiết :bytes, megabytes and gigabytes.   
```
root@ubuntusrv:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            451M     0  451M   0% /dev
tmpfs            97M  1.3M   95M   2% /run
/dev/sda2        20G  3.8G   15G  21% /
tmpfs           482M     0  482M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           482M     0  482M   0% /sys/fs/cgroup
/dev/loop0       90M   90M     0 100% /snap/core/7917
/dev/loop1       89M   89M     0 100% /snap/core/7270
tmpfs            97M     0   97M   0% /run/user/1000
```  

### Kiểm tra không gian đĩa cụ thể  

Để kiểm tra space của một đĩa cụ thể, bạn sử dụng lệnh `df` với cú pháp:  
```
df <option> path
```  
Một số ví dụ:  
- Kiểm tra dung lượng đĩa của phân vùng 
```
root@ubuntusrv:~# df -h /
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        20G  3.8G   15G  21% /
```  
Bạn có thể thêm cờ `output` đi kèm lệnh:  
```
df -h --output='field1', 'field2' /
```  
- Kiểm tra kích thước và phần trăm đĩa đã sử dụng, ta gõ lệnh:  
```
root@ubuntusrv:~# df -h --output='size','pcent' /
 Size Use%
  20G  21%
```  
Danh sách tất cả các cột có sẵn để lọc cùng với lệnh `df`: `source`, `fstype`, `itotal`, `iused`, `ivail`, `ipcent`, `size`, `used`, `pcent`, `avail`, `file` và `taget`.  

### Kiểm tra `Inode usage` trong Linux  
Trong Linux các tệp được liên kết chặt chẽ với các inode trong filesystem.   
Hệ thống của bạn đang quản lý một bảng inode (inode table), nơi các mục nhập trỏ đến các khối dữ liệu trên đĩa vật lý của bạn.   
Tuy nhiên bảng inode này bị giới hạn về kích thước cho nên bạn có thể hết các mục inode trước khi hết dung lượng đĩa.  
Tóm lại nếu hệ thống của bạn xử lý quá nhiều tệp, thì nó không thể phân bổ thêm không gian cho các tệp mới, ngay cả khi đĩa của bạn có sẵn 30GB.  
Để kiểm tra lượng inode đã sử dụng, ta dùng lệnh `df` đi kèm cờ `inodes`  
```
root@ubuntusrv:~# df --inodes
Filesystem      Inodes IUsed   IFree IUse% Mounted on
udev            115352   446  114906    1% /dev
tmpfs           123138   719  122419    1% /run
/dev/sda2      1310720 74765 1235955    6% /
tmpfs           123138     1  123137    1% /dev/shm
tmpfs           123138     3  123135    1% /run/lock
tmpfs           123138    18  123120    1% /sys/fs/cgroup
/dev/loop0       12829 12829       0  100% /snap/core/7917
/dev/loop1       12823 12823       0  100% /snap/core/7270
tmpfs           123138    10  123128    1% /run/user/1000
```  
Với tùy chọn `-h` bạn có thể đọc thông tin dễ dàng hơn:  
```
root@ubuntusrv:~# df -h --inodes /
Filesystem     Inodes IUsed IFree IUse% Mounted on
/dev/sda2        1.3M   74K  1.2M    6% /
```  

**Lệnh du**  
`du` là một công cụ dòng lệnh được cung cấp với Linux, nhằm báo cáo dung lượng ổ đĩa được sử dụng bởi các **thư mục** và **file**. `du` là viết tắt của từ “disk usage”. Đây là công cụ chính để phân tích không gian ổ đĩa trong dòng lệnh.

Cú pháp:  
```
du <option> <path|file>
du <option> <path1> <path2> <path3>  
```
- Kiểm tra dung lượng của một file cụ thể  
Ví dụ để kiểm tra kích thước của một file `.bashrc`, bạn có thể chạy lệnh:  
```
root@ubuntusrv:~# du ~/.bashrc
4       /root/.bashrc
```  
Mặc định kích thước hiển thị là kilobytes, tuy nhiên bạn có thể thay đổi sang định dạng size khác với tùy chọn `B`. Ví dụ ở đây tôi muốn hiển thị sang kích thước megabytes.  
```
root@ubuntusrv:~# du -BM ~/.bashrc
1M      /root/.bashrc
```  
Kích thước size sẽ được làm tròn với số gần nhất. Trong trường hợp này, kích thước tệp `.bashrc` không phải là 1Mb nhưng nó được làm tròn tự động.  
Bạn cũng có thể chọn hiển thị thông tin kích thước dễ đọc hơn với đơn vị kilobyte:  

```
root@ubuntusrv:~# du -h ~/.bashrc
4.0K    /root/.bashrc  
```

Tùy chọn `-h` có thể đi kèm với `--apparent-size` để lấy kích thước thực của file đó.    
```
root@ubuntusrv:~# du -h --apparent-size ~/.bashrc
3.1K    /root/.bashrc
```  
## Kiểm tra không gian đĩa đã sử dụng cho thư mục  
Bạn có thể kiểm tra không gian đĩa được sử dụng cho thư mục bằng lệnh `du` với tên đường dẫn cụ thể. Tuy nhiên trong một vài trường hợp bạn không muốn nhìn thấy output của tất cả file hoặc thư mục riêng lẻ, bạn có thể sử dụng tùy chọn `-shc`  
```
root@ubuntusrv:~# du -shc /home
40K     /home
40K     total
root@ubuntusrv:~# du -shc /home /var/log
40K     /home
43M     /var/log
44M     total
``` 
Ý nghĩa của các tùy chọn:  
- `-s`: dùng để tóm tắt, nó sẽ hiển thị tổng số đường dẫn được cung cấp thay vì hiển thị danh sách tất cả các tệp và thư mục.   
- `-h`: để con người có thể đọc được, nó sẽ hiển thị kết quả với các đơn vị.
- `-c`: đối với tổng số lớn, nếu bạn chỉ định nhiều đường dẫn, nó sẽ tổng hợp chúng để tạo ra tổng số lớn cho chúng.  

## Kiểm tra không gian đĩa sử dụng cho hình ảnh và text  
Trong một vài trường hợp, bạn có thể muốn kiểm tra không gian đĩa sử dụng cho các file text và những hình ảnh của bạn.  
```
root@ubuntusrv:~# find / -name *.png 2> /dev/null | xargs du -ch
1.0K    /snap/core/7917/usr/lib/python3.5/idlelib/Icons/idle_16.png
2.0K    /snap/core/7917/usr/lib/python3.5/idlelib/Icons/idle_32.png
3.5K    /snap/core/7917/usr/lib/python3.5/idlelib/Icons/idle_48.png
512     /snap/core/7917/usr/share/icons/hicolor/48x48/apps/gvim.png
512     /snap/core/7917/usr/share/icons/locolor/16x16/apps/gvim.png
512     /snap/core/7917/usr/share/icons/locolor/32x32/apps/gvim.png
2.0K    /snap/core/7917/usr/share/pixmaps/debian-logo.png
1.0K    /snap/core/7270/usr/lib/python3.5/idlelib/Icons/idle_16.png
2.0K    /snap/core/7270/usr/lib/python3.5/idlelib/Icons/idle_32.png
3.5K    /snap/core/7270/usr/lib/python3.5/idlelib/Icons/idle_48.png
512     /snap/core/7270/usr/share/icons/hicolor/48x48/apps/gvim.png
512     /snap/core/7270/usr/share/icons/locolor/16x16/apps/gvim.png
512     /snap/core/7270/usr/share/icons/locolor/32x32/apps/gvim.png
2.0K    /snap/core/7270/usr/share/pixmaps/debian-logo.png
8.0K    /usr/share/info/gnupg-card-architecture.png
48K     /usr/share/info/gnupg-module-overview.png
4.0K    /usr/share/icons/locolor/32x32/apps/gvim.png
4.0K    /usr/share/icons/locolor/16x16/apps/gvim.png
8.0K    /usr/share/icons/hicolor/64x64/apps/apport.png
0       /usr/share/icons/hicolor/64x64/mimetypes/text-x-apport.png
4.0K    /usr/share/icons/hicolor/48x48/apps/gvim.png
4.0K    /usr/share/icons/hicolor/48x48/apps/apport.png
0       /usr/share/icons/hicolor/48x48/mimetypes/text-x-apport.png
4.0K    /usr/share/icons/hicolor/32x32/apps/apport.png
0       /usr/share/icons/hicolor/32x32/mimetypes/text-x-apport.png
4.0K    /usr/share/gitweb/static/git-favicon.png
4.0K    /usr/share/gitweb/static/git-logo.png
4.0K    /usr/share/pixmaps/language-selector.png
4.0K    /usr/share/pixmaps/htop.png
4.0K    /usr/share/pixmaps/debian-logo.png
4.0K    /usr/share/language-selector/data/language-selector.png
8.0K    /usr/share/plymouth/ubuntu-logo.png
136K    total
``` 
Hoặc các file text:  
```
[root@centos7srv ~]# find / -name *.txt 2> /dev/null | xargs du -ch
4.0K    /etc/pki/nssdb/pkcs11.txt
4.0K    /var/cache/yum/x86_64/7/base/mirrorlist.txt
4.0K    /var/cache/yum/x86_64/7/timedhosts.txt
4.0K    /var/cache/yum/x86_64/7/extras/mirrorlist.txt
4.0K    /var/cache/yum/x86_64/7/updates/mirrorlist.txt
4.0K    /usr/lib/python2.7/site-packages/decorator-3.4.0-py2.7.egg-info/SOURCES.txt
4.0K    /usr/lib/python2.7/site-packages/decorator-3.4.0-py2.7.egg-info/dependency_links.txt
4.0K    /usr/lib/python2.7/site-packages/decorator-3.4.0-py2.7.egg-info/top_level.txt
4.0K    /usr/lib/python2.7/site-packages/pyudev-0.15-py2.7.egg-info/SOURCES.txt
4.0K    /usr/lib/python2.7/site-packages/pyudev-0.15-py2.7.egg-info/dependency_links.txt
4.0K    /usr/lib/python2.7/site-packages/pyudev-0.15-py2.7.egg-info/top_level.txt
```  

Như vậy tôi đã chia sẻ một vài thao tác với lệnh df, du để kiểm tra dung lượng đĩa được sử dụng trong một vài trường hợp khác nhau. Bạn đọc có thể tham khảo thêm một vài tùy chọn đi kèm của các lệnh bằng cách gõ `man du` hoặc `man df`. Chúc các bạn thành công!