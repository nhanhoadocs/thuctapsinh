<a name="101 câu lệnh thao tác với linux"></a>

1. `!!` : Sử dụng lệnh trước đó vừa sử dụng 
- *Ví dụ ta sử dụng nó với lệnh `ll -s`*

![](../images/101/!!.png) 

2. `!(text)` : Sử dụng câu lệnh gần nhất bắt đầu với 1 chữ cái.
- *Ví dụ*

![](../images/101/!(text).png)

3. Copy file 
 ```
 cp (file_name){,.bak}
 ```

- Bạn có thể tự tạo một cái nếu bạn muốn chỉnh sửa tệp nhưng không thay đổi bản gốc. Vì vậy, thay vì di chuyển tệp ra khỏi thư mục gốc, ghi lại bằng dữ liệu mới hoặc xóa hoàn toàn, bạn có thể chỉ cần thêm `.bak` vào cuối tệp để giữ an toàn.

- *Ví dụ ta copy file `Jun.txt` su đó sử dụng lệnh `ll` để kiểm tra*

![](../images/101/cp.png)

4. Hoán đổi vị trí đứng với thư mục mẹ của nó. 

`cd -`

- *Ví dụ hoán đổi vị trí của thư mục `Test` với thư mục mẹ của nó là `OanhDT`*

![](../images/101/cd-.png)

5. Di chuyển ra thực mục mẹ của thư mục hiện tại.

`cd ..`

6. Di chuyển tới thư mục home 

`cd ~`

7. Di chuyển tới thư mục home 

`cd $HOME`

8. DI chuyển tới thư mục home 

`cd `

9. Cấp full quyền cho người sở hữu.QUyền đọc và ghi cho group và user

```
chmod 755 tên_file 
```

- Ví dụ phân quyền cho file linux 

![](../images/101/chmod.png)

Trong đó r viết tắt của read(đọc),w viết tắt của write (viết),và x viết tắt của execute (thực thi).

- Options

|Wildcards|Result|
|---|---|
|-f|chặn hầu hết các thông báo lỗi|
|-c|chỉ báo cáo khi có thay đổi|
|-v|đưa ra chuẩn đoán cho mọi tệp được xử lý|
|-R|thay đổi tập tin và thư mục đệ quy|


10. Cấp quyền thực thi cho user

```
chmod a+x file_name
```

11. Thay đổi quyền sở hữu của một file hoặc thư mục.

```
chown option user:group file/folder
```

- Ví dụ : thay đổi quyền sở hữu của thư mục DT sang user oanhdt.

![](../images/101/chown.png)

12. Tạo ra bản sao của file 

```
cp (file(file)).backup
```

13. Copy file1 thành file2

```
cp (file1) (file2)
```

14. Copy thư mục và file trong đó thành thư mục khác

```
cp -r <directory1> <directory2>/
```

- Ví dụ copy thư mục `DT` và các file trong thư mục đó thành thư mục `NEW`

![](../images/101/cp-r.png)

- Options 

|Wildcards|Result|
|---|---|
|-l|tập tin liên kết cứng thay vì sao chép|
|-i|nhắc nhở trước khi ghi đè|
|-L|luôn theo các liên kết tượng trưng trong nguồn|
|-s|liên kết tượng trưng thay vì sao chép|
|-u|chỉ sao chép khi tệp SOURCE mới hơn tệp đích hoặc khi tệp đích bị thiếu|

15. Hiển thị ngày tháng của máy tính 
`date`

![](../images/101/date.png)

16. Tạo file
```
dd if=/dev/sda1 of=/root/sda1.txt
```
- Ví dụ sao lưu ổ đĩa sang file .txt
![](../images/101/dd.png)

17. Hiển thị không gian đĩa 

`df -h`

![](../images/101/df.png)

Trong đó: 
- Filesystem: tên ổ đĩa 
- Size: không gian tổng 
- Used: Không gian đã sử dụng 
- Avail: Không gian trống 
- Use: Phần trăm đã sử dụng 
- Mounted on: Được gắn trên đâu trong cây thư mục root 18. Lấy thông tin của HDH và ghi vào tệp văn bản

- Option 

|Wildcards|Result|
|---|---|
|-k | Hiển thị dung lượng cho file sử dụng|
|-l |giới hạn danh sách cho các hệ thống tập tin cục bộ|
|-i |liệt kê thông tin inode thay vì sử dụng khối|
|-t |giới hạn danh sách cho các hệ thống tệp loại TYPE|


18. Lấy thông tin của hệ điều hành và ghi vào tệp văn bản.

```
dmesg>dmesg.txt
```

- Options

    |Wildcards |Result | 
    |----------|-------|
    | -c | xóa bộ đệm vòng sau khi in|  
    | -D |Vô hiệu hóa in tin nhắn đến bàn điều khiển| 
    | -d| hiển thị thời gian delta giữa các tin nhắn được in| 
    |-e |hiển thị giờ địa phương và đồng bằng thời gian ở định dạng có thể đọc được|
    |-f |giới hạn đầu ra cho các cơ sở được xác định|
    |-L|Tô màu tin nhắn|
    | -l|giới hạn đầu ra ở các mức xác định|
    |-t|không bao giờ in dấu thời gian tin nhắn|
    | -u| không gian hiển thị thông báo không gian người dùng|
    |-w| Theo dõi chờ tin nhắn mới |

19. Hiển thị thông tin hệ thống 

`dmidecode`

- Options 

|Wildcards|Result|
|---|---|
|-d|Đọc bộ nhớ từ file thiết bị|
|-V|Hiển thị phiên bản và thoát|
|-h|Hiển thị thông tin sử dụng và thoát|
|-s|Chỉ hiển thị giá trị của chuỗi DMI được xác định bởi KEYWORD|
|-t|Chỉ hiển thị các mục của loại TYPE từ danh sách sau: bios, hệ thống, ván chân tường, khung, bộ xử lý,bộ nhớ, bộ nhớ cache, kết nối, khe cắm|

20. Hiển thị thông tin BIOS
```
dmidecode -t 0
```

![](../images/101/bios.png)

21. Hiển thị thông tin CPU 

```
dmidecode -t 4
```

22. Kiểm tra các phần mềm đã cài đặt có tham số grep đi kèm 
``` 
dpkg –list | grep [search term]
```

23. Hiển thị tất cả các gói đã cài đặt 
```
dpkg -list|less
```

24. Ước tính không gian đĩa tệp 
```
du -bh (đường dẫn)
```

- Ví dụ

![](../images/101/du-bh.png)

25. Hiển thị biến môi trường 

`env` hoặc `set` 

- Biến môi trường gồm có tên biến và và giá trị được gán

26. In ra biến môi trường 

- Ví dụ gán biến x=1 và in ra 

![](../images/101/in.png) 

27. Hiển thị hình ảnh
28. Thoát khỏi terminal

`exit`

29. Hiển thị memory đã sử dụng 
`free`

![](../images/101/free.png)

- Options : 

|Wildcards|Result|
|---|---|
|-m|hiển thị dưới dang MB|
|-g|hiển thị dưới dạng G|
|-k|hiển thị dưới dạng kilobytes|

30. Hiển thị bản ghi hệ thống 

```
gnome-system-log
```

31. Tìm kiếm 1 chuỗi trong 1 file 

```
grep <string> <filename>
```

32. Hiển thị lịch sử sử dụng các dòng lệnh

`history`

33. Hiển thị tên của máy tính 
`hostname`

![](../images/101/hostname.png)

34. Hiển thị ngày tháng năm và giờ 

```
hwclock
```

![](../images/101/clock.png)

35. Hiển thị user id và group id của user hiện đang sử dụng 

`id`

![](../images/101/id.png)

36. Hiển thị ip và netmask trên máy 

`ip a`

![](../images/101/checkip.png)

37. Hiển thị thời gian shutdown gần nhất 

```
 last -x | grep shutdown | head -1
 ```

![](../images/101/shutdown.png)

38. Logout khỏi user hiện tại 

`logout`

39. Hiển thị các file, thư mục không bị ẩn trong thư mục hiện tại.

`ls`

- Options

|Wildcards|Result|
|---|---|
|-a|hiển thị cả những file bị ẩn |
|-l|sử dụng một định dạng danh sách dài|
|-s|in kích thước được phân bổ của mỗi tệp, trong các khối|
|-t|sắp xếp theo thời gian sửa đổi, mới nhất trước|
|-S|sắp xếp theo kích thước tập tin|

40. Hiển thị quyền truy cập đối với tất cả files bên trong thư mục

```
ls -l filename
```

41. Hiển thị các câu lệnh sẵn có trong trường hợp bạn quên.

`ls /usr/bin`

42. Hiển thị các modules hiện đang load trong kernel

`lsmod`

43. show thông tin phần cứng âm thanh, video,network 

```
lspci -nv | less
```

44. Đọc hướng dẫn sử dụng của câu lệnh 

`man`

- Ví dụ đọc hướng dẫn sử dụng của lệnh ls 

![](../images/101/man.png)

45. Tạo một thư mục 

```
mkdir <dir>
```

- Ví dụ tạo một thư mục tên NEW

![](../images/101/mkdir.png)

46. Di chuyển file tới một thư mục khác 

```
mv <file> <dir>
```

- Ví dụ chuyển file 1 từ folder NEW sang folder DT

![](../images/101/mv.png)

47. Đổi tên file 1 thành file 2 

```
mv file1 file2
```

![](../images/101/mvname.png)

48. Show bảng định tuyến 

```
netstat -rn
```

49. In ra các biến môi trường 

`printenv`

50. Hiển thị những process đang chạy được thực thi bởi chính user đang sử dụng.

`ps -Af`

51. Hiển thị thư mục đang đứng 

`pwd`

![](../images/101/pwd.png)

52. Xoá file 

```
rm filename
```

- VÍ dụ xóa file *minhkma.sh* trong folder DT

![](../images/101/rmfile.png)

- Options 

|Wildcards|Result|
|---|---|
|-f| bỏ qua các tệp và đối số không tồn tại, không bao giờ nhắc|
|-i|hỏi trước khi xóa|
|-r|xóa thư mục và nội dung của chúng một cách đệ quy| 
|-v|giải thích những gì đang được thực hiện|

53. Xóa thư mục và nội dung bên trong thư mục này 

```
rmdir -rf <dir>
```

54. Xóa các file có đuôi .txt

`rm *.txt`

- Ví dụ xóa các file có đuôi .txt trong thư mục DT 

![](../images/101/rmtxt.png)

55. Xóa thư mục trống 

`rmdir <dir>`

56. Hiển thị địa chỉ gate way mặc định 

`route`

57. Shutdown now 

```
shutdown -h now
```

58. Restart now 

```
shutdown - r now
```

59. SSH đến máy tính khác 

```
ssh <username>@<IP>
```

60. Sử dụng shell với quyền root. User của bạn cần có quyền su sang user root.

`sudo -i`

61. Sử dụng shell với quyền root.Giữ nguyên biến môi trường của user

 `sudo su`

 62. Nén tất cả các file và thư mục bên trong một thư mục xác định thành một file

 ```
 tar czf <filename>.txt <dir>
 ```

- Ví dụ nén tất cả các file và thư mục bên trong thư mục NEW thành file A.txt 

![](../images/101/tar.png)

63. Giải nén một file 

```
tar xzvf <filename>
```

64. Liệt kê các tiến trình đang được thực thi bằng CPU

`top`

65. Tạo một file trống 

```
touch <filename>
```

66. In ra tên của terminal bạn đang đứng.

`tty`

![](../images/101/terminal.png)

67. In ra tên nhân linux bạn đang đứng 

`uname -a`

![](../images/101/uname.png)

68. In ra kiến trúc vi sử lý mà máy bạn đang dùng

`unmae -m`

![](../images/101/-m.png)

- Options 

|Wildcards|Result|
|---|---|
|-n|in tên máy chủ nút mạng|
|-s|in tên máy chủ nút mạng|
|-v|in phiên bản kernel|
|-p| in loại bộ xử lý hoặc "không xác định"|
|-o|in ra hệ điều hành|

69. Trả về tóm tắt câu lệnh đó dùng để làm gì 

```
whatis <command>

```

- Ví dụ tóm tắt câu lệnh uname dùng để làm gì.

![](../images/101/whatis.png)

70. Trả về vị trí dduwngd của một chương trình trong hệ thống 

```
whereis <command>

```

![](../images/101/whereis.png)

71. Trả về đường dẫn của một ứng dụng

```
which <command>

```

![](../images/101/which.png)

72. In ra những người đang truy cập vào máy 

`who`

73. In ra tên mà bạn đang dùng để đăng nhập vào máy.

`whoami`

74. Ký hiệu biểu diễn thư mục home 

`~`

75. In ra thông tin của cpu 

```
cat /proc/cpuinfo

```

76. In ra thông tin bộ nhớ

```
cat /proc/meminfo

```

77. In ra các thiết bị kết nối 

```
cat /proc/net/dev

```

78. In ra thông tin hiệu suất 

```
cat /proc/uptime

```

79. In ra phiên bản 

```
cat /proc/vesion

```
80. In ra nội dung của một file 

```
cat <filename>

```

81. In ra các phân vùng ổ đĩa  

```
fdisk -l

```

|Wildcards|Result|
|---|---|
|c |chuyển cờ tương thích do|
|d |xóa một phân vùng|
|g |tạo bảng phân vùng GPT trống mới|
|l   |Danh sách các loại phân vùng đã biết
|m |in menu này|
|n |thêm một phân vùng mới|
|v|in ra phiên bản của chương trình|


82. Tìm file 

```
find / -name <filename>

```

83. Tạo một file nén đuôi .gz

```
gzip test.txt

```

![](../images/101/gz.png)

84. Giải nén một file .gz

```
gzip -d test.txt.gz

```

![](../images/101/gzip-d.png)

85. Tạo một file nén đuôi .tar

```
tar -cvf <filename>.tar file1 file2 folder1 folder2

```

![](../images/101/filetar.png)

86. Thêm mới,cập nhật nội dung cho file nén tar

``` 
tar -rvf filename.tar add_file1 add_file2


```
87. Download file từ internet 

```
wget <link>

```
88. In ra số người cuối cùng đăng nhập vào máy 
```
last -n x
```
x là số người bạn muốn in ra.

89. Hiển thị tiến trình dưới dạng tree

```
pstree
```
90. Hiển thị số giây mà hệ điều hành chạy 

```
grep time /proc/stat
```
91. Tạo một người dùng mới 

```
useradd name  
```
92. Thay đổi mật khẩu người dùng

```
passwd 
```
93. Hiển thị không gian đĩa đã được sử dụng 
```
du <option> <file>

```
- Opitons 

|Wildcards|Result|
|---|---|
|-c|hiển thị tổng số lớn|
|-x|bỏ qua các thư mục trên các hệ thống tập tin khác nhau|
|-s|cho phép chỉ hiển thị tổng cộng cho mỗi đối số|
|-0|kết thúc mỗi dòng đầu ra với 0 byte chứ không phải là một dòng mới|

94. Chấm dứt một ứng dụng 
```
kill <option> <process_name>
```
- Options

|Wildcards|Result|
|---|---|
|-s|Hiển thị cách gửi các tín hiệu đến các quy trình|
|pid|hiển thị cách sử dụng một PID với lệnh kill|
|-L|Lệnh này được sử dụng để liệt kê các tín hiệu có sẵn trong một định dạng bảng|
|l|hiển thị tất cả các tín hiệu có sẵn mà bạn có thể sử dụng|

95. Hiển thị trạng thái của file 

```
stat <options> <file_name>
```

- Options 

|Wildcards|Result|
|---|---|
|-f|hiển thị trạng thái hệ thống tập tin thay vì trạng thái tập tin|
|-c|sử dụng format chỉ định thay vì mặc định|
|-t|in thông tin ở dạng terse|

96. Sắp xếp các dòng của một tệp văn bản

```
sort <options> <file>
```
- Options 

|Wildcards|Result|
|---|---|
|-b| Bỏ qua khoảng trống ở đầu dòng|
|-r| đảo ngược thứ tự sắp xếp ban đầu|
|-n| sử dụng giá trị số để sắp xếp|
|-u|Loại bỏ các dòng lặp lại một khóa trước đó|
|-o|chỉ định tệp đầu ra|

97. Cắt một dòng và trích xuất văn bản.

```
cut <options> <file>
```
- Options 

|Wildcards|Result|
|---|---|
|-b|trích xuất các byte cụ thể|
|-c|cắt theo ký tự|

98. echo 
- Lệnh echo dùng để hiển thị đoạn văn bản lên màn hình 

```
echo <options> ...

```

- Options 

|Wildcards|Result|
|---|---|
|-t|cách ra một khoảng rộng như ta nhấn tab|
|\n|xuống dòng từ chỗ có optons \n|
|*|in ra file và thư mục như với lệnh `ls`|
|"" > <file_name>|ghi thêm thông tin vào file|






































