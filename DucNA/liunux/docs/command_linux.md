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
cd 
cd $HOME 
```
7. Cấp full quyền cho người sở hữu. Quyền đọc, thực thi cho group và user 
```
chmod 755 (tên file)
```
8. Cấp quyền thực thi cho tất cả user 
```
chmod a+x (tên file)
```
9. Thay đổi quyền sở hữu một file hoặc thư mục 
10. copy file1 thành file2
```
cp (file1) (file2)
```
11. copy thư mục và file trong đó thành thư mục khác 
```
cp -r <directory1> <directory2>/
```
12. Hiển thị giờ thứ ngày tháng năm của máy tính
```
date
``` 
13. Sao lưu dữ liệu 
14. Hiển thị không gian đĩa 
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
15. Lấy thông tin của HDH và ghi vào tệp văn bản 
```
dmesg>dmesg.txt
```
16. Hiển thị thông tin hệ thống 
```
dmidecode
```
17. Hiển thị thông tin BIOS
```
dmidecode -t 0
```
18. Hiển thị thông tin CPU 
```
dmidecode -t 4
```
19. Tìm kiếm các gói đã cài đặt liên quan đến `zip`
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
20. Hiển thị tất cả các gói đã cài đặt 
```
dpkg -L
```
21. 
22. In ra biến môi trường 
```
anhduc@anhduc:~$ x=10
anhduc@anhduc:~$ echo $x
10 
```
23. Hiển thị biến môi trường 
```
env 
```
24. Hiển thị hình ảnh 
```
anhduc@anhduc:~/Pictures$ eog hinh-nen-may-tinh-anime-buon-2.jpg
```
25. Thoát khỏi terminal 
```
exit 
```
26. Hiển thị memory đã sử dụng 
```
free
```
27. Hiển thị bản ghi hệ thống 
```
gnome-system-log
```
28. Tìm kiếm một chuỗi trong một file 
```
grep <string> <filename>
```
29. Số giây mà hệ điều hành chạy 
```
anhduc@anhduc:~$ grep btime /proc/stat | grep -Eo [[:digit:]]+
1554705396
```
30. Hiển thị một 1000 lệnh cuối cùng 
```
history | less
```
31. Hiển thị tên của máy tính 
```
hostname 
```
32. Hiển thị ngày tháng năm giờ 
```
anhduc@anhduc:~$ sudo hwclock --show
2019-04-08 16:55:36.171201+0700
```
33. Hiểu thị uid và gid của user 
```
anhduc@anhduc:~$ id
uid=1000(anhduc) gid=1000(anhduc) groups=1000(anhduc),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin),126(sambashare),129(libvirt),1001(libvirtd)
```