# 101 commands 
1. Sử dụng lệnh trước đó vừa sử dụng 
```
!!
```
- Ta thử nó với lệnh `echo` 
```
anhduc@anhduc:~$ echo linux 
linux
anhduc@anhduc:~$ !!
echo linux 
linux
```
2. Sử dụng lệnh gần nhất bắt đầu bằng 1 chữ cái
```
!(text)
```
```
anhduc@anhduc:~/Downloads/Github/linux$ cd ..
anhduc@anhduc:~/Downloads/Github$ echo linux 
linux
anhduc@anhduc:~/Downloads/Github$ !c
cd ..
anhduc@anhduc:~/Downloads$ 
```
- Đầu tiên ta di chuyển ra khỏi thư mục linux bằng `cd..` rồi dùng `echo` xong rồi dùng lệnh trên để chứng minh rằng nó sử dụng lệnh gần nhất với chữ cái đầu tiên ta yêu cầu 
3. Tạo ra một bản copy 
```
cp (tên file){,.bak}
``` 
- Sử dụng lệnh với một file và kiểm tra kết quả 
```
anhduc@anhduc:~/Desktop$ cp file{,.bak}
anhduc@anhduc:~/Desktop$ ll
-rw-rw-r--  1 anhduc anhduc     8 Thg 4  8 15:31 file
-rw-rw-r--  1 anhduc anhduc     8 Thg 4  8 15:32 file.bak
```
4. Hoán đổi vị trí đứng với thư mục này và thư mục mẹ của nó
```
cd -
```
5. Di chuyển ra thư mục mẹ của thư mục hiện tại 
```
cd ..
```
6. Di chuyển tới thư mục home
```
cd ~
```
7.  Di chuyển tới thư mục home
```
cd $HOME
```
8. Di chuyển tới thư mục home
```
cd 
```
9. Cấp full quyền cho người sở hữu. Quyền đọc, thực thi cho group và user 
```
chmod 755 (tên file)
```
10. Cấp quyền thực thi cho tất cả user 
```
chmod a+x (tên file)
```
11. Thay đổi quyền sở hữu một file hoặc thư mục 
```
chown option user:group file/folder
```
- Ví dụ ta dùng user root tạo ra file test111 và chuyển quyền sở hữu sang cho user khác. và ta sẽ thấy sự thay đổi của nó.
```
[root@localhost ~]# mkdir test111
[root@localhost ~]# ll
total 940036
drwxr-xr-x. 2 root root         6 16:15  9 Th04 test111
[root@localhost ~]# chown anhduc test111/
[root@localhost ~]# ll
total 940036
drwxr-xr-x. 2 anhduc root         6 16:15  9 Th04 test111
```
12. Tạo ra bản sao của file 
```
cp (file(file)).backup
```
13. copy file1 thành file2
```
cp (file1) (file2)
```
14. copy thư mục và file trong đó thành thư mục khác 
```
cp -r <directory1> <directory2>/
```
15. Hiển thị giờ thứ ngày tháng năm của máy tính
```
date
``` 
16. Sao lưu dữ liệu 
```
dd if=/dev/vda1 of=/root/vda1.anh
```
- Ta sao lưu ổ đĩa sang một file ảnh của nó 
```
[root@localhost ~]# dd if=/dev/vda1 of=/root/vda1.anh
601697+0 records in
601696+0 records out
308068352 bytes (308 MB) copied, 1,39882 s, 220 MB/s
```
17. Hiển thị không gian đĩa 
```
df -h
```
```
anhduc@anhduc:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       458G   35G  400G   8% /
```
Trong đó: 
    - Filesystem: tên ổ đĩa 
    - Size: không gian tổng 
    - Used: Không gian đã sử dụng 
    - Avail: Không gian trống 
    - Use: Phần trăm đã sử dụng 
    - Mounted on: Được gắn trên đâu trong cây thư mục root
18. Lấy thông tin của HDH và ghi vào tệp văn bản 
```
dmesg>dmesg.txt
```
19. Hiển thị thông tin hệ thống 
```
dmidecode
```
20. Hiển thị thông tin BIOS
```
dmidecode -t 0
```
21. Hiển thị thông tin CPU 
```
dmidecode -t 4
```
22. Tìm kiếm các gói đã cài đặt liên quan đến `zip`
```
anhduc@anhduc:~$ sudo dpkg --get-selections | grep zip  
bzip2						install
gzip						install
libarchive-zip-perl				install
libperlio-gzip-perl				install
p7zip						install
p7zip-full					install
unzip						install
zip						install
```
23. Hiển thị tất cả các gói đã cài đặt 
```
dpkg -L
```
24. Ước tính không gian đĩa, tệp 
```
du -bh (đường dẫn)
```
```
[root@localhost ~]# du -bh /root/test/
45	/root/test/

```
25. In ra biến môi trường 
```
anhduc@anhduc:~$ x=10
anhduc@anhduc:~$ echo $x
10 
```
26. Hiển thị biến môi trường 
```
env 
```
27. Hiển thị hình ảnh 
```
anhduc@anhduc:~/Pictures$ eog hinh-nen-may-tinh-anime-buon-2.jpg
```
28. Thoát khỏi terminal 
```
exit 
```
29. Hiển thị memory đã sử dụng 
```
free
```
30. Hiển thị bản ghi hệ thống 
```
gnome-system-log
```
31. Tìm kiếm một chuỗi trong một file 
```
grep <string> <filename>
```
32. Số giây mà hệ điều hành chạy 
```
anhduc@anhduc:~$ grep btime /proc/stat | grep -Eo [[:digit:]]+
1554705396
```
33. Hiển thị một 1000 lệnh cuối cùng 
```
history | less
```
34. Hiển thị tên của máy tính 
```
hostname 
```
35. Hiển thị ngày tháng năm giờ 
```
anhduc@anhduc:~$ sudo hwclock --show
2019-04-08 16:55:36.171201+0700
```
36. Hiển thị user id (uid) và group id (gid) của user hiện đang sử dụng

```
id
```

37. Hiển thị địa chỉ IP và netmask trên máy

```
ifconfig
```

38. Hiển thị thông tin của wireless interface

```
iwconfig
```

39. Hiển thị thông tin của wireless network

```
iwconfig
```

40. Kill process theo tên.

```
killall process-name
```

41. Hiển thị khoảng thời gian shutdown gần đây nhất

```
last -x | grep shutdown | head -1 
```

42. Logout khỏi user hiện tại

```
logout
```

43. Hiển thị các file, thư mục không bị ẩn trong thư mục hiện tại. Có thể sử dụng option `-a` để hiển thị cả những file bị ẩn.

```
ls
```

44. Hiển thị quyền truy cập đối với tất cả files bên trong thư mục

```
ls -l filename
```

45. Hiển thị tất cả các lệnh sẵn có trong trường hợp bạn quên

```
ls /usr/bin
```

46. Hiển thị thêm thông tin về network

```
lshw -C network
```

47. Hiển thị các modules hiện đang load trong kernel

```
lsmod
```

48. Show thông tin phần cứng âm thanh, video, network

```
lspci -nv | less
```

49. Hiển thị thông tin về USB bus trong hệ thống và các thiết bị kết nối đến nó.

```
lsusb
```

50. Đọc hướng dẫn sử dụng của câu lệnh

```
man <command>
```

51. Tạo một thư mục tại vị trí chỉ định

```
mkdir <dirname>
```

52. Move một file tới một thư mục khác

```
mv <file> <dir>
```

53. Đổi tên file1 thành file2

```
mv file1 file2
```

54. Show bảng định tuyến

```
netstat -rn
```

55. In ra các biến môi trường

```
printenv
```

56. Hiển thị những process đang chạy được thực thi bởi chính user đang sử dụng.

```
ps -Af
```

57. Hiển thị thư mục đang đứng

```
pwd
```

58. Xóa file

```
rm <filename>

```

59. Xóa thư mục và nội dung bên trong thư mục này

```
rm -rf <dir>
```

60. Xóa tất cả các file có đuôi `.txt` trong thư mục đang đứng

```
rm *.txt
```

61. Xóa thư mục (chỉ xóa khi thư mục đó là trống)

```
rmdir <dir>
```

62. Hiển thị địa chỉ gateway mặc định 

```
route
```

63. Xóa hoàn toàn mọi thông tin và dấu vết của 1 file không cho khôi phục lại. -n 7 ghi đè lên file 7 lần. -z ghi đè lần cuối bằng không để ẩn shred. -u thực hiện xóa file khi thự hiện xong, -v hiển thị quá trình thực hiện

```
shred -zuv -n 7 <file>
```

64. Shutdown now

```
shutdown -h now
```

65. Restart now

```
shutdown -r now
```

66. SSH đến máy tính khác

```
ssh <username>@<IP>
```

67. Sử dụng shell với quyền root. User của bạn cần có quyền su sang user root.

```
sudo -i
```

68. Sử dụng shell với quyền root. Câu lệnh này khác với `sudo -i` là nó giữ nguyên biến mối trường của user.

```
sudo su
```

69. Nén tất cả các file và thư mục bên trong một thư mục xác định thành một file

```
tar czf <dirname>.tgz <dirname>
```

70. Giải nén một file

```
tar xzvf <filename>
```
71. Liệt kê các tiến trình đang được thực thi bằng CPU. Bấm `q` để `quit` và bấm `h` để xem hướng dẫn
```
top
```
Ngoài ra, với lệnh `top` bạn có thể xem các thông số khác như `ram`, `swap`, `buff/cache`, `sleeping` và `zombie`
Bạn có thể tải `htop` về để xem với giao diện đẹp hơn `top` và nhiều option hơn.



72. Tạo một file mới-trống nếu nó chưa tồn tại ở thư mục bạn đang đứng
```
touch <filename>
```

73. In ra tên của `terminal` bạn đang sử dụng
```
tty
```
74. In ra nhân linux của máy bạn đang dùng
```
uname -a
```
75. In ra kiến trúc vi sử lý mà máy bạn đang dùng
```
uname -m
```
76. Trả về tóm tắt câu lệnh là gì từ `man` . Trang `man` là hướng dẫn sử dụng tất cả câu lệnh của Linux
```
whatis <commmand>
```
77. Trả về vị trí của một chương trình trong hệ thống
```
whereis <command>
```
78. Tră về đường dẫn của một ứng dụng
```
which <command>
```
79. In ra những người đang truy cập vào máy
```
who
```
80. In ra tên mà bạn đang đăng nhập vào máy
```
whoammi
```
81. In ra những dòng cuối của file `test.log` trong khi vẫn đnang bị viết bởi một chương trình khác
```
tail –follow test.log
```
82. Bỏ

83. Dùng toán tử `\` trước một khoảng trắng để mở một file mà tên file có dấu cách. Ví dụ ta sẽ mở file là 
`stupid file name.txt` 
```
cat stupid\ file\ name.txt
```
84. Kí hiệu kiểu diễn thư mục home của bạn
```
~
```
85. Bỏ

86. In ra thông tin của CPU
```
cat /proc/cpuinfo
```
87. In ra thông tin bộ nhớ
```
cat /proc/meminfo
```
88. In ra các thiết bị kết nối
```
cat /proc/net/dev
```
89. In ra thông tin hiệu suất
```
cat /proc/uptime
```
90. In ra phiên bản nhân hệ thống
```
cat /proc/version
```
91. In ra nội dung của một file
```
cat <filename>
```
92. In ra các phân vùng
```
fdisk -l
```
93. In ra các thuộc tính/nén của file hoặc package
```
file <package_name>
```
94. Tìm file 
```
find / -name <filename>
```
95. Tạo 1 file nén đuôi .gz
```
gzip test.txt
```
96. Giải nén 1 file đuôi .gz
```
gzip -d test.txt.gz
```
97. Hiển thị thông tin chi tiết khi nén bằng opion -l
```
gzip -l *.gz
```
98. Hiện thị trạng thái của file 
```
stat filename.txt
```
99. Download a` file từ internet
```
wget <link>
```
Wget là một công cụ máy tính tạo ra từ GNU Project. 
Bạn có thể dùng nó để trích xuất dữ liệu và nội dung từ nhiều web servers khác nhau. 
Tên của nó là kết hợp của World Wide Web và từ get.
Nó hỗ trợ download qua FTP, SFTP, HTTP, và HTTPS.

100. In ra danh sách 10 người đăng nhập cuối cùng vào máy
```
last -n 10
```
101. Hiển thị tiến trình của hệ thống dưới dạng `tree`
```
pstree
```
# Chuc cac ban thanh cong
