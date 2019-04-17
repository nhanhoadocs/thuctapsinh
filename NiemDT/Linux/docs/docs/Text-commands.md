# Mục lục

[1. Echo](#echo)

[2. Export](#export)

[3. Cat](#cat)

[4. Sed](#sed)

[5. Grep](#grep)

[6. Awk](#awk)

[7. Sort](#sort)

[8. Uniq](#uniq)

[9. Paste](#paste)

[10. Join](#join)

[11. Tr](#tr)

[12. Wc](#wc)

[13. Tee](#tee)

[14. Cut](#cut)

<a name = "echo">

# 1. echo
`echo` là một câu lệnh để hiển thị một đoạn văn bản lên màn hình

Cú pháp `echo -option ký_tự`

 * Để hiển thị một đoạn ký tự lên màn hình ta chỉ cần dùng lệnh `echo đoạn_ký_tự`
```
[root@localhost ~]# echo tim hieu lenh echo
tim hieu lenh echo
```
 * Ta cũng có thể gán một giá trị và dùng lênh `echo` để gọi giá trị đó ra
```
[root@localhost ~]# x=50
[root@localhost ~]# echo gia tri cua x la $x
gia tri cua x la 50
```
*Chú ý:* option `-e` cho phép hệ thống hiểu được các option sau dấu `\` 

 * Option `\b` sẽ bỏ dấu cách trước nó
```
[root@localhost ~]# echo -e "test \bthanh \bcong"
testthanhcong
```
 * Option `\n` sẽ xuống dòng từ chỗ có option `\n`
```
[root@localhost ~]# echo -e "Test \nThanh \nCong"
Test 
Thanh 
Cong
```
 * Option `\t` sẽ cách ra một khoảng rộng như ta bấm `Tab` khi nhập liệu
```
[root@localhost ~]# echo -e "Test \tThanh \tCong"
Test 	Thanh 	Cong
```
 * Ta có thể sử dụng kết hợp nhiều option một lúc
```
[root@localhost ~]# echo -e "\n\tTest \n\tThanh \n\tCong"

	Test 
	Thanh 
	Cong
```
 * Option `\v`
```
[root@localhost ~]# echo -e "\vTest \vThanh \vCong"

Test 
     Thanh 
           Cong
```
 * Dùng lệnh `echo` để in ra tất cả các file và thư mục như với lệnh `ls`
```
[root@localhost ~]# echo *
anaconda-ks.cfg file1 filetest test test1
```
 * Tìm kiếm tất cả các file trong thư mục có đuôi nào đó. Ví dụ hiển thị ra tất cả các file có đuôi `.txt` trong thư mục đang đứng
 ```
 [root@localhost test]# echo *.txt
file1.txt
```
 * Ghi cái gì đó vào file 
 ```
 [root@localhost ~]# echo "day là file 1" > file1
[root@localhost ~]# cat file1
day là file 1
```

<a name = "export">

# 2. Export
`export` là một trong các lệnh bash shell. Lệnh `export` đánh dấu một biến môi trường được `export` với bất kỳ quy trình con mới được chia nhỏ và do đó nó cho phép một tiến trình con kế thừa tất cả các biến được đánh dấu.
### Option
 * `-p` hiển thị danh sách tên được export trong shell hiện tại`.
 * `-n` remove tên từ danh sách export.
 * `-f` tên được export dưới dạng hàm.
### Một số ví dụ
Hiển thị danh sách tên được export trong shell hiện tạo
```
niemdt@niemdt:~$ export -p
declare -x CLUTTER_IM_MODULE="xim"
declare -x COLORTERM="truecolor"
declare -x DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
declare -x DEFAULTS_PATH="/usr/share/gconf/ubuntu.default.path"
declare -x DESKTOP_AUTOSTART_ID="10cf2ea1759c8c177154390536498058800000018380019"
declare -x DESKTOP_SESSION="ubuntu"
declare -x DISPLAY=":0"
declare -x GDMSESSION="ubuntu"
declare -x GIO_LAUNCHED_DESKTOP_FILE="/home/niemdt/.config/autostart/guake.desktop"
declare -x GIO_LAUNCHED_DESKTOP_FILE_PID="2174"
declare -x GNOME_DESKTOP_SESSION_ID="this-is-deprecated"
declare -x GNOME_SHELL_SESSION_MODE="ubuntu"
declare -x GPG_AGENT_INFO="/run/user/1000/gnupg/S.gpg-agent:0:1"
declare -x GTK_IM_MODULE="ibus"
declare -x GTK_MODULES="gail:atk-bridge"
declare -x GUAKE_TAB_UUID="0ed58c6e-850f-44c5-83c7-24f1a7984f52"
declare -x HOME="/home/niemdt"
declare -x IM_CONFIG_PHASE="2"
declare -x LANG="en_US.UTF-8"
declare -x LC_ADDRESS="vi_VN"
declare -x LC_IDENTIFICATION="vi_VN"
declare -x LC_MEASUREMENT="vi_VN"
declare -x LC_MONETARY="vi_VN"
declare -x LC_NAME="vi_VN"
declare -x LC_NUMERIC="vi_VN"
declare -x LC_PAPER="vi_VN"
declare -x LC_TELEPHONE="vi_VN"
declare -x LC_TIME="vi_VN"
declare -x LESSCLOSE="/usr/bin/lesspipe %s %s"
declare -x LESSOPEN="| /usr/bin/lesspipe %s"
declare -x LIBVIRT_DEFAULT_URI="qemu:///system"
declare -x LOGNAME="niemdt"
declare -x LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
declare -x MANDATORY_PATH="/usr/share/gconf/ubuntu.mandatory.path"
declare -x OLDPWD
declare -x PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
declare -x PWD="/home/niemdt"
declare -x QT4_IM_MODULE="xim"
declare -x QT_ACCESSIBILITY="1"
declare -x QT_IM_MODULE="ibus"
declare -x SESSION_MANAGER="local/niemdt:@/tmp/.ICE-unix/1838,unix/niemdt:/tmp/.ICE-unix/1838"
declare -x SHELL="/bin/bash"
declare -x SHLVL="1"
declare -x SSH_AGENT_PID="1934"
declare -x SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"
declare -x TERM="xterm-256color"
declare -x TEXTDOMAIN="im-config"
declare -x TEXTDOMAINDIR="/usr/share/locale/"
declare -x USER="niemdt"
declare -x USERNAME="Niemdt"
declare -x VTE_VERSION="5202"
declare -x WINDOWPATH="2"
declare -x XAUTHORITY="/run/user/1000/gdm/Xauthority"
declare -x XDG_CONFIG_DIRS="/etc/xdg/xdg-ubuntu:/etc/xdg"
declare -x XDG_CURRENT_DESKTOP="ubuntu:GNOME"
declare -x XDG_DATA_DIRS="/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop"
declare -x XDG_MENU_PREFIX="gnome-"
declare -x XDG_RUNTIME_DIR="/run/user/1000"
declare -x XDG_SEAT="seat0"
declare -x XDG_SESSION_DESKTOP="ubuntu"
declare -x XDG_SESSION_ID="2"
declare -x XDG_SESSION_TYPE="x11"
declare -x XDG_VTNR="2"
declare -x XMODIFIERS="@im=ibus"
```
Thay đổi 1 export
`export TÊN=giá_trị`
Xóa một tên trong danh sách export 
`export -n TÊN`
Ta có thể xây dựng một hàm sau đó dùng lệnh `export -f tên_hàm`
Sau đó khi ta gõ hàm đó thì nó sẽ tự động thực hiện hàm đó.

<a name = "cat">

# 3. Cat
`cat` là lệnh được dùng để đọc một file.
### Một số option
 * `cat tên_file` để đọc một file(chỉ rõ đường dẫn đến file nếu không đứng ở thư mục chứa file đó)
```
[root@localhost ~]# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
```
 * Hiển thị nhiều file lên cùng một lúc ` cat file1 file2 file3`
```
[root@localhost ~]# cat file2 file3
Day la file 2

day la file 3
```
 * `cat >tên_file` để tạo một file và ta có thể ghi luôn vào file đó. Khi ghi xong thì nhấn tổ hợp `Ctrl` `d` để lưu.
```
[root@localhost ~]# cat >file10
day la file 10 
[root@localhost ~]# cat file10
day la file 10 
```
 * Option `-n` để hiển thị thứ tự từng dòng 
```
[root@localhost ~]# cat -n /etc/passwd
     1	root:x:0:0:root:/root:/bin/bash
     2	bin:x:1:1:bin:/bin:/sbin/nologin
     3	daemon:x:2:2:daemon:/sbin:/sbin/nologin
     4	adm:x:3:4:adm:/var/adm:/sbin/nologin
     5	lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
     6	sync:x:5:0:sync:/sbin:/bin/sync
     7	shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
     8	halt:x:7:0:halt:/sbin:/sbin/halt
     9	mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
    10	operator:x:11:0:operator:/root:/sbin/nologin
    11	games:x:12:100:games:/usr/games:/sbin/nologin
    12	ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
    13	nobody:x:99:99:Nobody:/:/sbin/nologin
    14	systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
    15	dbus:x:81:81:System message bus:/:/sbin/nologin
    16	polkitd:x:999:998:User for polkitd:/:/sbin/nologin
```
 * Option `-e` để thêm ký tự `$` vào cuối mỗi dòng.
```
[root@localhost ~]# cat -e /etc/passwd
root:x:0:0:root:/root:/bin/bash$
bin:x:1:1:bin:/bin:/sbin/nologin$
daemon:x:2:2:daemon:/sbin:/sbin/nologin$
adm:x:3:4:adm:/var/adm:/sbin/nologin$
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin$
sync:x:5:0:sync:/sbin:/bin/sync$
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown$
halt:x:7:0:halt:/sbin:/sbin/halt$
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin$
```
 * Sử dụng để đọc từ 1 file và ghi văn bản đó vào 1 file khác. 
Vd ghi nội dung `file3` vào trong `file10` lúc này nội dung của `file10` sẽ bị ghi dè bởi `file3`
```
[root@localhost ~]# cat file3
day la file 3
[root@localhost ~]# cat file10
day la file 10 
[root@localhost ~]# cat file3 > file10
[root@localhost ~]# cat file10
day la file 3
```
 * Ghi nội dung của 1 file vào cuối một file khác chứ không phải ghi đè
```
[root@localhost ~]# cat file3 >> file10
[root@localhost ~]# cat file10
day la file 10
day la file 3
```

<a name = "sed">

# 4. Sed
`sed` là một trong những công cụ mạnh mẽ trong Linux giúp ta có thể thực hiện các theo tác với văn bản như tìm kiếm, chỉnh sửa, xóa,...Khác với các trình soạn thảo thông thường, `sed` chấp nhận văn bản đầu vào có thể là một file trên hệ thống hoặc từ standard input hay stdin. Chính vì vậy `sed` còn được gọi là `stream editor`
## Một số option hay dùng
 * `-n` ngăn chặn việc tự dộng in không gian mẫu.
 * `-e` thêm tệp lệnh vào các lệnh được thực thi (thực hiện cùng lúc nhiều lệnh)
 * `-f` thêm nội dung của script-file vào các lệnh được thực thi.
 * `-i` lưu thay đổi vào file được chỉ ra.
## Một số ví dụ
### 1. Thay thế một chuỗi
Cú pháp ` sed 's/chuỗi 1/chuỗi 2/' tên_file` 
Trong đó chữ `s` đầu tiên để mô tả rằng đây là phép thay thế. Ở đây trong file chỗ nào có `chuỗi 1` sẽ được thay thế bằng `chuỗi 2`. `tên_file` là tên file mà ta muốn thay thế trong file đó. 
Nhưng với cú pháp này thì thay sẽ chỉ thay thế và in lên trên màn hình và nó sẽ không được ghi thay đôỉ đó vào file.
Nếu muốn thay đổi và lưu luôn vào file đó ta thêm option `-i` 
### 2. Thay thế tất cả các xuất hiện của mẫu
Với cú pháp ở trên, `sed` chỉ thay thế sự xuất hiện đầu tiên của mẫu trong mỗi dòng. Nếu chúng ta muốn thay thế tất cả xuất hiện của mẫu trong văn bản, chúng ta cần thêm tham số `g` vào cuối như sau:
` sed 's/chuỗi 1/chuỗi 2/g' tên_file` 

Hậu tố `/g` có nghĩa là nó sẽ thay thế các xuất hiện của mẫu cho đến cuối văn bản, mặc định nó sẽ bắt đầu với xuất hiện đầu tiên của mẫu.

Đôi khi chúng ta không muốn thay thế tất cả xuất hiện của mẫu, mà chỉ muốn thay thế từ xuất hiện thứ N của mẫu cho đến cuối văn bản. Để làm việc này, chúng ta có thể sử dụng dạng `/Ng`
VD:
```
niemdt@niemdt:~$ echo thisthisthisthis | sed 's/this/THIS/2g'
thisTHISTHISTHIS
```
Nếu chúng ta chỉ muốn thay thế xuất hiện thứ N của mẫu trong văn bản, sử dụng dạng `/N`
Nếu chúng ta chỉ muốn thay thế xuất hiện thứ N của mẫu trong văn bản, sử dụng dạng `/N`
VD:
```
niemdt@niemdt:~$ echo thisthisthisthis | sed 's/this/THIS/2'
thisTHISthisthis
```
### 3. Xóa các dòng trống
Các dòng trống có thể được đối chiếu với biểu thức chính quy `^$`
`sed '/^$/d' tên_file`
### 4. Kết hợp nhiều biểu thức
Có nhiều cách để kết hợp nhiều biểu thức với nhau
 * Sử dụng toán tử `|` : `sed 'expression' | sed 'expression'`
 * Sử dung option `-e` : `sed -e 'expression' -e 'expression'`
VD
```
niemdt@niemdt:~$ echo abc | sed -e 's/a/A/' -e 's/c/C/'
AbC
```

<a name = "grep">

# 5. grep
`grep` là lệnh được dùng để tìm kiếm một chuỗi trong file chỉ định.
### 1. Tìm một chuỗi trong một file
Nếu muốn tìm một chuỗi nào đó trong file duy nhất thì có thể dùng theo cú pháp sau:
`grep "chuỗi" tên_file`
Kết quả hiển thị ngay trên màn hình command line theo dòng nào có chứa chuỗi sẽ hiển thị cả dòng trong file đó ra và chuỗi sẽ được hihglight.
### 2. Tìm chuỗi trong nhiều file cùng lúc 
Để làm được việc này ta cần chỉ ra điểm chung của tất cả các file muốn thực hiện tìm kiếm.
VD tôi muốn tìm chuỗi `ngày tháng` trong tất cả các file có đuôi `.txt`
`grep "ngày tháng" *.txt`
### 3. Tìm kiếm không phân biệt chữ hoa chữ thường
Bình thường nếu đã chắc chắn chuỗi định tìm kiếm như thế nào và chỉ muốn có kết quả chính xác chuỗi đó thì không phải thêm option `-i`. Khi khai báo thêm nó `grep` sẽ thực hiện tìm kiếm gần đúng không phân biệt chữ hoa chữ thường.
`grep -i "chuỗi" tên_file`
### 4. Tìm kiếm chính xác với grep -w
Nếu ta tìm kiếm với những lệnh trên thì kết quả trả về chưa hẳn đúng theo mong muốn của ta. Kết quả thường thừa so với yêu cầu bởi `grep` sẽ tìm theo cả chuỗi con, ví dụ tìm `no` thì `not` `nothing` cũng chứa chuỗi `no` nên cũng sẽ trả về kết quả. Do đó muốn tìm chính xác chuỗi mong muốn thì thêm option `-w`
`grep -w "chuỗi" tên_file`
### 5. Hiển thị thêm dòng trước, sau, xung quanh dòng chứa kết quả.
Có những trường hợp phải thao tác với file rất lớn, nên có thể hiển thị ra các dòng trước, sau hoặc xung quanh dòng kết qủa sẽ có thể hữu ích.
`grep -A n "chuỗi" tên_file` hiển thị ra `n` dòng sau dòng kết quả
`grep -B n "chuỗi" tên_file` hiển thị ea `n` dòng trước dòng kết quả
`grep -C n "chuỗi" tên_file` hiển thị ra `n` dòng xung quanh dòng kết quả.
### 6. Tìm kiếm tất cả các file trong thư mục con
Để tìm kiếm một chuỗi nào đó trong tất cả các file trong một thư mục ta sử dụng option `-r`. Ta `cd` vào thư mục đó và dùng lệnh:
`grep -r "chuỗi" *`
Hoặc `grep -r "chuỗi" tên_folder`
### 7. Tìm kiếm ngược
Tìm kiếm ngược là chỉ tìm những dòng không chứa một chuỗi nào đó. Để làm điều này ta sử dụng option `-v`
`grep -v "chuỗi" tên_file`
### 8. Đếm số kết quả
Option `-c` hiển thị có bao kết quả trả về
`grep -c "chuỗi" tên_file`
### 9. Chỉ hiển thị tên file 
Sẽ có một vài trường hợp mà ta chỉ quan tâm xem từ khóa bạn đang tìm xuất hiện trong những file nào. Lúc này sử dụng option `-l`
`grep -l "chuỗi" *`
hoặc `grep -l "chuỗi" thư_mục`
### 10. Hiển thị số thứ tự của dòng kết quả.
Trong một file rất lớn thì nhu cầu biết được xem kết quả ở dòng nào thì điều đó là rất cần thiết. Option `-n` sẽ làm được điêu này
`grep -n -w "chuỗi" tên_file`
### 11. Ứng dụng
Trong thực tế thì hay bắt gặp nhất có lẽ là sử dụng một lệnh kép 
VD `yum list installed | grep dd` để kiểm tra xem câu lệnh `dd` đã được cài đặt hay chưa.

<a name = "awk">

# 6. awk
`awk` được sử dụng để trích xuất sau đó in nội dung cụ thể của một tệp và thường được sử dụng để tạo báo cáo. Nó là một tiện ích mạnh mẽ và ngôn ngữ lập trình được giải thích, được sử dụng để thao tác các file dữ liệu, truy xuất và xử lý văn bản. Nó hoạt động tốt với các trường (chứa một phần dữ liệu duy nhất, về cơ bản là một cột) và các bản ghi (một tập các trường, về cơ bản là một dòng trong một lệnh).
Cú pháp `awk 'BEGIN{commands 1} pattern {commnads 2} END{commands 3}' tên_file`
Trong đó:
`BEGIN{commands 1}` chứa các khai báo được thực thi trước khi `awk` đọc nội dung dữ liệu.
`pattern` gồm các điều kiện dùng để lọc nội dung các dòng dữ liệu.
`commands 2` là các khai báo sẽ được thực thi trên các dòng trùng khớp với `pattern` phía trước nó.
` END{commands 3}` chứa các khai báo được thực thi khi `awk` đọc xong nộ dung dữ liệu.
### 1. Hoạt động của `awk` 
 * Thực thi các khai báo trong khối `BEGIN{commands 1}`
 * Đọc một dòng từ tập tin hoặc stdin, và thực thi khối `pattern{commands 2}`. Lặp lại bước này cho đến cuối tập tin.
 * Khi đến cuối dòng dữ liệu nhập vào , thực thi khối END{commands 3}.
Khối `BEGIN` và khối `END` là các khối tùy chọn (có thể có hoặc không).
Khối quan trọng nhất là khối `pattern {commands}, khối này gồm 2 thành phần:
 * pattern: là mẫu đồi chiếu được cung cấp, dùng để đối chiếu, so sánh với nội dung của các dòng dữ liệu. Pattern có thể là một biểu thức chính quy, điều kiện,..
 * `{commands}` là các lệnh sẽ được thực thi với các dòng dữ liệu trùng khớp với pattern ở trên.
Khối này cũng là khối tùy chọn. Nếu khối này không được cung cấp, mặc định thì {print} được thực thi để in ra từng dòng đã đọc. Khối này được thực thi cho từng dòng được đọc bởi `awk`. Nó giống 1 vòng lặp `while` cho việc đọc các dòng, với những khai báo nằm bên trong nội dung của vòng lặp.
Khi một dòng được đọc, `awk` kiểm tra xem pattern được cung cấp có có khớp với dòng đó không. Nếu khớp nó sẽ thực thi các khai báo bên trong `{}`

Nếu `pattern` không được dùng, tất cả các dòng sẽ trùng khớp và các khai báo bên trong `{}` sẽ được thực thi cho tât cả các dòng dữ liệu.
```
[root@localhost ~]# echo -e "line1\nline2" | awk 'BEGIN{ print "Start" } { print } END{ print "End" }'
Start
line1
line2
End
```
### 2. Các biến đặc biệt
 * `NR` số của bản ghi hiện tại, tương ứng với số dòng hiện tại khi nó sử dụng các dòng như các bản ghi.
 * `NF` Số lượng các trường (cột), tương ứng với số lượng các trường trong bản ghi hiện tại đang thực thi(các trường được phân cách bởi khoảng trắng).
 * `$0` Biến chứa nội dung văn bản của dòng hiện tại đang thực thi.
 * `$1` Biến chứa văn bản của trường thứ nhất.
 * `$2` Biến chứa văn bản của trường thứ 2.
 ...
### 3. Một số ví dụ
 * Sử dụng đối số `-v` chúng ta có thể truyền các giá trị bên ngoài vào `awk`
VD
```
[root@localhost ~]# VAR=10000
[root@localhost ~]# echo | awk -v VARIABLE=$VAR '{ print VARIABLE }'
10000
```
 * Đọc một dòng xác định bằng `getline`. Thông thường `awk` đọc tất cả các dòng trong một tập tin. Nếu chúng ra muốn đọc một dòng cụ thể, chúng ta có thể sử dụng hàm getline.
 Cú pháp là `getline var`. Biến `var` chứa nội dung của dòng. Nếu `getline` không có đối số chúng ta có thể truy cập nội dung của dòng bằng việc sử dụng các biến $0, $1, $2.
### Các hàm thao tác trong chuỗi awk
 * length(string): trả về chiều dài của chuỗi.
 * index(string, search_string): Trả về vị trí mà search_string được tìm thấy trong string.
 * split(string,array,delimiter): lưu trữ 1 danh sách các chuỗi được tạo bằng việc sử dụng dấu phân cách trong mảng.
 * substr(string, start-position, end-position): Trả về chuỗi con được tạo từ chuỗi có nội dung từ vị trí bắt đầu (start-position) đến vị trị kết thức (end-position).
 * sub(regex, replacement_str, string): Thay thế chuỗi đầu tiên trùng khớp với biểu thức chính quy (regex) bằng chuỗi thay thế (replacement_str).
 * gsub(regex, replacement_str, string): Tương tự với hàm sub(), nhưng nó thay thế mọi trường hợp trùng khớp với biểu thức chính quy (regex).
 * match(regex, string): Trả về kết quả là 1 chuỗi trùng khớp với biểu thức chính quy (regex) có được tìm thấy trong string hay không. Nó trả về kết quả khác 0 nếu có trùng khớp, ngược lại thì trả về 0. 2 biến đặc biệt tương ứng với hàm match() là RSTART và RLENGTH. Biến RSTART chứa vị trí nơi chuỗi trùng khớp bắt đầu. Biến RLENGTH chứa độ dài của chuỗi trùng khớp với biểu thức chính quy.

<a name = "sort">

# 7. sort
`sort` là một câu lệnh dùng để sắp xếp theo thứ tự các dòng trong một file dữ liệu nào đó.
Mặc định thì `sort` sẽ xem xét chữ cái cái(hoặc số) đầu tiên của dòng để đối chiếu. `sort` sẽ sắp xếp nó như sau:
 * Dòng nào bắt đầu bằng số sẽ được xếp trước những dòng bắt đầu bằng chữ
 * Nếu bắt đầu bằng chữ thì dòng nào có chữ cái đầu tiên xuất hiện trước trong bảng chữ cái trước thì đứng trước.
 * Những dòng chữ cái đầu tiên là chữ thường sẽ xuất hiện trước các dòng chữ cái đầu tiên là chữ hoa nếu là cùng chữ cái.
Cú pháp: `sort [option] [file]`
### Một số option
 * `-o` để ghi dữ liệu sắp xếp vào 1 file. `sort -o file_out_put file`
 * `-r` Sắp xếp theo chiều ngược lại.
 * `-c` để kiểm tra xem file đầu vào đã được sắp xếp chưa.
 * `-k` để chỉ ra bạn muốn lấy trường nào làm căn cứ để  sắp xếp. Cú pháp `sort -k x.n file` trong đó `x` là trường thứ `x` còn `n` là chữ cái thứ `n` của trường `x`

<a name = "uniq">

# 8. Uniq
`uniq` câu lệnh được sử dụng để báo cáo hoặc các dòng in ra trong 1 file.
#### Cú pháp
`uniq [option] [file input] [file output]`
Nếu không có file input thì nó nhận kết quả nhập vaò từ bàn phím.
Nếu không có file output thì kết quả sẽ được in ra màn hình.
#### Một số option
VD file1 của tôi có nội dung như sau
```
[root@localhost ~]# cat file1
aaaaaaaaaaaaaa
aaaaaaaaaaaaaa

bbbbbbb
aaaaaaaaaaaaaa
aaaaaaaaaaaaaa
bbbbbbb
bbbbbbb
```
 * Nếu không có option thì những dòng giống nhau mà liền kề với nhau chỉ được in ra một lần.
```
 [root@localhost ~]# uniq file1
aaaaaaaaaaaaaa

bbbbbbb
aaaaaaaaaaaaaa
bbbbbbb
```
 * `-c` in ra giống với ko có option nhưng sẽ được tính số dòng giống nhau đó và in ra số đó phía trước
```
 [root@localhost ~]# uniq -c file1
      2 aaaaaaaaaaaaaa
      1 
      1 bbbbbbb
      2 aaaaaaaaaaaaaa
      2 bbbbbbb
```
 * `-d` chỉ in ra những dòng trùng lặp
```
[root@localhost ~]# uniq -d file1
aaaaaaaaaaaaaa
aaaaaaaaaaaaaa
bbbbbbb
```
 * `-u` chỉ in ra những dòng không trùng lặp
```
[root@localhost ~]# uniq -u file1

bbbbbbb
```

<a name = "paste">

# 9. Paste
`paste` là lệnh được sử dụng để hiển thị các dùng tương ứng của các file trên cùng một dòng.
Cú pháp 
`paste [option] [file1] [file2]`
Nếu một trong 2 file được thay bởi dấu `-` thì file đó sẽ được nhập vào từ bàn phím.
VD
Tôi có 2 file như sau
```
[root@localhost ~]# cat file2
file2
file02
file002
file000002
[root@localhost ~]# cat file1
file1
file01
file001
```
 * Không có option 
```
[root@localhost ~]# paste file1 file2
file1	 file2
file01	 file02
file001	 file002
	     file000002
```
 * `-d` Thay khoảng trắng giữa 2 file trương đương trên cùng một dòng bằng một ký tự liệt kê phía sau
```
[root@localhost ~]# paste -d : file1 file2
file1:file2
file01:file02
file001:file002
:file000002
```
 * `-s` sẽ paste vào sau một file thay vì dán song song trên mỗi dòng
```
[root@localhost ~]# paste -s file1 file2
file1	file01	file001
file2	file02	file002	file000002
```

<a name = "join">

# 10. Join
`join` là câu lệnh để join các dòng dữ liệu của 2 files có 1 trường dữ liệu chung.
Cú pháp
`join [option] [file1] [file2]`
#### option
 * `-o định_dạng` chỉ ra định dạng của kết quả trả về
 * `-1 n` join vào trường `n` của file 1
 * `-2 n` join vào trường `n` của file 2
 * `-t ký_tự` sử dụng `ký_tự` làm phân cách cho trường đầu vào và đầu ra.

<a name = "tr">

# 11. Tr
`tr` là một tiện ích để chuyển các các ký tự được chỉ ra thành ký tự khác hoặc xóa chúng.
### Một số ví dụ hay dùng
 * Chuyển chữ thường thành chữ hoa
`cat tên_file | tr a-z A-Z `
 * Thay thế kí tự này bằng ký tự khác
`cat tên_file | tr 'ký_tự_cũ' 'ký_tự_mới'`
 * Xóa các ký tự hoặc từ trong file
` cat tên_file | tr -d 'cái cần xóa'`
 * Xóa tất cả ký tự không thể in ra trong file
`cat tên_file | tr -d '[:print:]'`

<a name = "wc">

# 12. Wc
`wc`- word count: thường được sử dụng để tìm kiếm thông tin về số lượng dòng, số lượng từ, byte hoặc số lượng ký tự của một file hoặc một biến có nội dung.
Cú pháp:
`wc [option] tên_file`
##### Option
 * `-c` tính tổng byte
 * `-m` tính tổng số ký tự
 * `-w` tổng số từ
 * `-l` tổng số dòng
 * `-L` số byte của dòng text có dộ dài lớn nhất.
Nếu không có option 
```
niemdt@niemdt:~$ wc test
 4  6 33 test
```
Khi đó trả về 3 trường trong đó `4` là số lượng dòng. `16` là số lượng từ. `33` là số byte.

<a name = "tee">

# 13. tee
`tee` là câu lệnh cho phép lấy dữ liệu đầu ra của 1 lệnh nào đó và ghi thông tin đó vào 1 file

VD
`ls -l | tee test`
Lệnh này sẽ ghi danh sách trả về màn hình cảu lệnh `ls -l` sẽ được ghi vào file `test`. 
Với lệnh trên thì nó sẽ ghi đè lênh dữ liệu có sẵn trong file `test` nếu muốn nó ghi xuống dưới mà không ghi đè ta dùng thêm option `-a`
`ls -l | tee -a test`

<a name = "cut">

# 14. Cut
`cut` là một tiện ích giúp ta cut, trích xuất mội dung của tập tin theo cột. Nó cũng có thể chỉ ra dấu phân cách đặc biệt các cột (cột được coi như trường).
Cú pháp:
`cut [option] [tên file]`
#### Option
 * `-b n` trích xuất ra byte thứ `n` của mỗi dòng. Hoặc `-b n-m` trích xuất từ byte thứ `n` đến byte thứ `m` của mỗi dòng.
 * `-c n` tích xuất ra ký tự thứ `n` của mỗi dòng. Hoặc `-c n-m` trích xuất từ ký tự thứ `n` đến ký tự thứ `m` của mỗi dòng.
 * `-f n` tích xuất ra trường thứ `n` của mỗi dòng. Hoặc `-c n-m` trích xuất từ trường thứ `n` đến trường thứ `m` của mỗi dòng. Nếu muốn in cũng lúc 2 trường `n` và `m` ta dùng dấu `,` để phân các `-f n,m`
Nếu in cùng lúc nhiều trường muốn thay dấu phân cách giữa các trường bằng một kí tự nào đó ta thêm option `--output-delimiter='ký_tự'`