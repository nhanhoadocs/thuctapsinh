# Các lệnh để monitor hệ thống Linux

http://www.netinstructions.com/how-to-monitor-your-linux-machine/

## Tham khảo

https://haydenjames.io/

https://www.tecmint.com/command-line-tools-to-monitor-linux-performance/

## Mục lục
1. [Lệnh Netstat](#netstat)
2. [Lệnh ss](#ss)
3. [Lệnh top](#top)
4. [Lệnh htop](#htop)
5. [Lệnh lsof](#lsof)
6. [Lệnh vmstat](#vmstat)
7. [Lệnh nload](#nload)
7. [Lệnh ps](#ps)


## 1. Lệnh Netstat <a name="netstat"></a>

Lệnh netstat trên linux là một lệnh nằm trong số các tập lệnh để giám sát hệ thống trên linux. netstat giám sát cả chiều in và chiều out kết nối vào server, hoặc các tuyến đường route, trạng thái của card mạng. lệnh netstat rất hữu dụng trong việc giải quyết các vấn đề về sự cố liên quan đến network như là lượng connect kết nối, traffic, tốc độ, trạng thái của từng port, IP …

- Kiểm tra tổng quát

        netstat -a

- Kiểm tra các port đang sử dụng phương phức TCP

        netstat -at

- Kiểm tra các port đang sử dụng phương phức UDP

        netstat -au

- Kiểm tra các port đang ở trạng thái listening

        netstat -l

- Kiểm tra các port đang listen dùng phương thức TCP

        netstat -lt

- Kiểm tra các port đang listen dùng phương thức UDP

        netstat -lu

- Kiểm tra được port đang lắng nghe sử dụng dịch vụ gì

        netstat -plnt

- Hiển thị bảng định tuyến

        netstat -rn

- Kiểm tra những kết nối thông qua port 80

        netstat -an | grep :80 | sort

- Kiểm tra có bao nhiêu gói SYN_REC trên server. Đối với con số thì tùy thuộc vào server của bạn, ví dụ nếu mỏi ngày có tầm 20 đến 30 kết nối, bổng dưng một ngày lên cả 100 -> 1000 kết nối thì  -> server bị ddos.

        netstat -np | grep SYN_REC | wc -l

Xem thêm: 

https://www.tecmint.com/20-netstat-commands-for-linux-network-management/

## 2. Lệnh ss <a name="ss"></a>

Công cụ ss được sử dụng để giúp chúng ta cách hiển thị tất cả các thông tin của socket mạng trong hệ thống Linux. Nó cho phép hiển thị thông tin như netstat và sẽ hiển thị nhiều thông tin trạng thái hơn các công cụ khác. Lệnh ss sẽ lấy thông tin trực tiếp từ kernel.

Lệnh ss cung cấp cho chúng ta các thông tin về:

- Tất cả các TCP sockets.
- Tất cả các UDP sockets.
- Tất cả các kết nối ssh/ftp/http/https.
- Tất cả các tiến trình được kết nối với máy chủ.
- Lọc trạng thái như: SYN-RECV, SYN-SENT,TIME-WAIT, địa chỉ port.

**Sử dụng:**

- Sử dụng lệnh `ss` không chứa các tùy chọn để liệt kê tất cả các kết nối bất kì ở tất cả các trạng thái.

        ss

- Sử dụng tùy chọn `-a` kết hợp với lệnh `ss` để hiển thị danh sách các listen socket và non-listen socket:

        ss -a

- Sử dụng lệnh `ss` với tùy chọn `-l` hiển thị các listen socket

        ss -l

- Lệnh `ss` giúp chúng ta hiển thị tất cả các kết nối bằng giao thức TCP bằng cách sử dụng tùy chọn `-t`

        ss -t

- Có thể kết hợp tùy chon `-l` với tùy chọn `-t` bên trên để hiển thị các listen TCP đang kết nối

        ss -lt

- Lệnh `ss` giúp chúng ta hiển thị tất cả các kết nối UDP socket bằng cách sử dụng tùy chọn `-u` và tùy chọn `-a`

        ss -ua

- Có thể kết hợp tùy chon `-l` với tùy chọn `-u` bên trên để hiển thị các listen UDP đang kết nối

        ss -lu

- Có thể hiển thị PID (ID của tiến trình) của các socket đang được kết nối chúng ta sử dụng tùy chọn `-p`

        ss -p

- Khi chúng ta muốn liệt kê tổng các trạng thái của socket trên máy chủ của chúng ta thì sử dụng lệnh `ss` với tùy chọn `-s`

        ss -s

- Để hiển thị các địa chỉ IPV4 của socket đang kết nối chúng ta sử dụng tùy chọn `-4`

        ss -4

- Để hiển thị các địa chỉ IPV6 của socket đang kết nối chúng ta sử dụng tùy chọn `-6`

        ss -6

- Lệnh `ss` cho phép chúng ta lọc socket port number hoặc address number. Để hiển thị tất cả các kết nối của socket đích hoặc socket nguồn của ssh chúng ta thực thi lệnh

        ss -at '( dport = :22 or sport = :22 )'

    hoặc

        ss -at '( dport = :ssh or sport = :ssh )'

Xem thêm:

https://blogd.net/linux/theo-doi-ket-noi-mang-tren-linux-dung-lenh-ss/

## 3. Lệnh top <a name="top"></a>

Lệnh top trong Linux được sử dụng để hiển thị tất cả các tiến trình đang chạy trong môi trường Linux.

![Imgur](https://i.imgur.com/fR23jYk.png)

Thông tin sau được hiển thị khi bạn chạy lệnh top trong Linux:

Dòng 1:
- Thời gian
- Máy tính đã chạy được bao lâu rồi
- Số lượng người dùng
- Trung bình tải
- Trung bình tải hiển thị thời gian load hệ thống trong 1, 5 và 15 phút cuối.

Dòng 2
- Tổng số nhiệm vụ
- Số lượng tác vụ đang chạy
- Số lượng tác vụ trong trạng thái “ngủ”
- Số lượng tác vụ đã dừng
- Số lượng tác vụ zombie (tiến trình không tồn tại)

Dòng 3
- Mức sử dụng CPU bởi người dùng theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi hệ thống theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi các tiến trình có mức ưu tiên thấp theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi idle process (tiến trình cho biết bộ xử lý đang rảnh rỗi) theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi io wait (thời gian CPU không hoạt động để chờ I/O disk hoàn thành) theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi việc ngắt phần cứng theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi việc ngắt phần mềm theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi steal time (thời gian CPU ảo “chờ” CPU thực, trong khi bộ ảo hóa đang phục vụ bộ xử lý ảo khác) theo tỷ lệ phần trăm

Dòng 4
- Tổng bộ nhớ hệ thống
- Bộ nhớ trống
- Bộ nhớ đã sử dụng
- Bộ nhớ đệm buffer cache

Dòng 5
- Tổng swap có sẵn
- Tổng swap còn trống
- Tổng swap đã sử dụng
- Bộ nhớ khả dụng

(Swap là RAM ảo, được sử dụng khi bộ nhớ vật lý (RAM) bị đầy.)

**Bảng chính**
- ID tiến trình
- Người dùng
- Mức độ ưu tiên
- Mức độ nice (gọi một tập lệnh shell với mức độ ưu tiên cụ thể)
- Bộ nhớ ảo được sử dụng bởi tiến trình
- Bộ nhớ “thường trú” mà một tiến trình sử dụng (tức là tiến trình luôn ở trong bộ nhớ và không thể chuyển ra thiết bị lưu trữ khác)
- Bộ nhớ có thể chia sẻ
- CPU được sử dụng bởi tiến trình theo tỷ lệ phần trăm
- Bộ nhớ được sử dụng bởi tiến trình theo tỷ lệ phần trăm
- Thời gian tiến trình đã được chạy
- Lệnh

**Giữ lệnh top luôn chạy trong nền trên máy tính Linux:**

Bạn có thể dễ dàng giữ lệnh top luôn chạy mà không cần phải nhập lệnh vào terminal mỗi lần mở máy.

Để tạm dừng lệnh top và tiếp tục sử dụng terminal, nhấn CTRL + Z trên bàn phím.

Để đưa lệnh top trở lại foreground, hãy nhập `fg`.

**Các option:**

`-h` - Hiển thị phiên bản hiện tại

```
[root@localhost ~]# top -h
  procps-ng version 3.3.10
Usage:
  top -hv | -bcHiOSs -d secs -n max -u|U user -p pid(s) -o field -w [cols]
[root@localhost ~]# 
```

`-c` - Tham số này chuyển đổi trạng thái cột lệnh từ hiển thị lệnh sang hiển thị tên chương trình và ngược lại

`-d` - Chỉ định thời gian trễ khi refresh màn hình

Ví dụ: Refresh màn hình sau mỗi 5 giây:

    top -d 5

`-O` - Lấy danh sách các cột để sắp xếp theo thứ tự

    top -O | less

`-o` - Sắp xếp theo trường được đặt tên

Ví dụ:

    top -o %CPU


`-p` - Chỉ hiển thị các tiến trình với ID được chỉ định

Cú pháp:
    
    top -p <PID>

Ví dụ:
```
[root@localhost ~]# top -p 1
top - 14:27:06 up 33 min,  1 user,  load average: 0.00, 0.01, 0.02
Tasks:   1 total,   0 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  1882188 total,  1626260 free,   104636 used,   151292 buff/cache
KiB Swap:  2097148 total,  2097148 free,        0 used.  1615240 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    1 root      20   0  125424   3792   2572 S   0.0  0.2   0:01.04 systemd
```

`-u` - Chỉ hiển thị những tiến trình của người dùng được chỉ định

Ví dụ: 

    top -u root

`-i` - Không hiển thị các idle task

Chế độ xem mặc định trong top có thể hơi lộn xộn và nếu bạn chỉ muốn xem các tiến trình đang hoạt động (nghĩa là những tiến trình không ở chế độ idle - “nhàn rỗi”) thì bạn có thể chạy lệnh sau:

    top -i

Xem thêm: 

https://quantrimang.com/dung-lenh-top-linux-xem-tien-trinh-dang-chay-162613

https://www.tecmint.com/12-top-command-examples-in-linux/

## 4. Lệnh htop <a name="htop"></a>

### 4.1. Cài đặt:

Trên Ubuntu/Debian:

    apt-get install htop

Trên RHEL/CentOS:

    yum install epel-release

    yum install htop

### 4.2. Ưu điểm của lệnh htop:

- Hỗ trợ thao tác chuột
- Cho phép bạn cuộn cả chiều ngang và chiều dọc, để xem tất cả mọi tiến trình và hoàn thành các dòng lệnh
- Cho phép bạn kết thúc một quá trình mà không cần biết PID
- Bắt đầu nhanh hơn lệnh top
- Lệnh top yêu cầu bạn nhập PID hoặc giá trị ưu tiên để thay đổi mức ưu tiên hoặc gia hạn một tiến trình, còn htop thì không

### 4.3. Sử dụng:

Gõ lệnh

    htop

![Imgur](https://i.imgur.com/aqCEPPE.png)

**Các thành phần**

3 thành phần:

- Header: Phần header hiển thị các số liệu hệ thống bao gồm CPU, Ram, Swap, các tác vụ đang chạy, load average và thời gian hoạt động (Uptime).

![Imgur](https://i.imgur.com/IUS9qtd.png)

- Body: Phần này liệt kê tất cả các tiến trình đang chạy.

![Imgur](https://i.imgur.com/Ijd8X5I.png)

- Footer: Phần này hiển thị các tùy chọn menu của htop

![Imgur](https://i.imgur.com/9I8Yjx8.png)

**Hướng dẫn sử dụng:**

#### 4.3.1. Mức sử dụng CPU

![Imgur](https://i.imgur.com/pkInZQQ.png)

- Màu xanh dương: Tiến trình với mức ưu tiên thấp
- Màu xanh lá cây: Tiến trình người dùng
- Màu đỏ: Tiến trình kernel
- Màu vàng: Thời gian IRQ
- Màu đỏ tươi: Thời gian Soft IRQ
- Xám: Thời gian chờ IO

#### 4.3.2. Mức dùng bộ nhớ RAM

![Imgur](https://i.imgur.com/OOQkjpS.png)

- Màu xanh lá cây: Bộ nhớ đã sử dụng
- Màu xanh dương: Bộ nhớ đệm
- Màu vàng: Bộ nhớ cache

#### 4.3.3. Tải trung bình (Load average)

![Imgur](https://i.imgur.com/JFpX8BY.png)

Tải trung bình (Load average) là thước đo lượng công việc mà hệ thống thực hiện. Load average cho ta thấy được trung bình khối lượng công việc hệ thống phải xử lý trong mỗi khoảng thời gian 1 phút, 5 phút và 15 phút. Thông số load average còn phụ thuộc vào server có bao nhiêu CPU. Ví dụ server có một CPU có load average là 1.0 cho thấy sử dụng 100%.

#### 4.3.4. Thông tin tiến trình

![Imgur](https://i.imgur.com/f0pfSYq.png)

Htop sẽ liệt kê tất cả các tiến trình đang chạy trên hệ thống với thông tin về số lượng cpu, bộ nhớ mà mỗi tiến trình đang sử dụng cũng như lệnh được sử dụng để bắt đầu tiến trình.

- PID: Số ID của tiến trình.
- USER: Chủ sở hữu tiến trình.
- PR: Mức độ ưu tiên của tiến trình. Con số càng thấp, mức độ ưu tiên càng cao.
- NI: Giá trị nice value của tiến trình, ảnh hưởng đến mức độ ưu tiên của nó.
- VIRT: Tiến trình sử dụng bao nhiêu bộ nhớ ảo.
- RES: Tiến trình sử dụng bao nhiêu RAM vật lý, được đo bằng kilobyte.
- SHR: Bộ nhớ chia sẻ mà tiến trình đang sử dụng.
- S: Tình trạng hiện tại của tiến trình (zombied, sleeping, running, uninterruptedly sleeping, traced).
- %CPU: Tỷ lệ phần trăm CPU được sử dụng bởi tiến trình.
- %MEM: Tỷ lệ phần trăm RAM vật lý được sử dụng bởi tiến trình.
- TIME+: Tiến trình xử lý đã sử dụng bao nhiêu thời gian.
COMMAND: Tên của lệnh bắt đầu tiến trình.

### 4.3.5. Một số phím tắt

- Di chuyển dấu nhắc trong danh sách các tiến trình theo chiều dọc hoặc ngang bằng phím mũi tên
- Kill mộ tiến trình bằng cách nhấn phím F9
- Renice một tiến trình bằng cách nhấn phím F7 hoặc F8
- Liệt kê các tập tin được sử dụng bởi một tiến trình bằng cách nhấn phím I
- Chỉ hiển thị tiến trình của một người dùng bằng cách nhấn phím U
- Hiển thị các tiến trình được sắp xếp theo một cột bất kỳ bằng cách nhấn phím F6
- Hiển thị các tiến trình trong chế độ xem dạng cây bằng cách nhấn phím F5

### 4.3.6. Các tùy chọn

`–d` – delay (hiển thị độ trễ giữa các bản cập nhật, tính bằng 1/10 giây).

`–C` – no-color (chế độ đơn sắc)

`–h` – help (hiển thị thông báo trợ giúp và thoát)

`–u` – user=USERNAME (chỉ hiển thị các tiến trình của một người dùng nhất định)

`–h` – pid=PID (chỉ hiển thị các PID đã cho)

`–s` – sort-key COLUMN (Sắp xếp theo cột này)

`–v` – version (thông tin phiên bản đầu ra và thoát)

Xem thêm: 

https://haydenjames.io/htop-quick-guide-customization/

https://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/

https://tech.bizflycloud.vn/giam-sat-thong-voi-htop-833.htm

## 5. Lệnh lsof (LiSt Open Files) <a name="lsof"></a>

### Lệnh cơ bản và output giải thích

Output của lsof có một dòng header từng cột thể hiện các nội dung tương ứng. 

![Imgur](https://i.imgur.com/uCpcEUy.png)

Chú thích output của chương trình lệnh
- COMMAND : 9 kí tự đầu tiên của tên chương trình lệnh tương ứng với tiến trình.
- PID : thông tin PID của tiến trình.
- USER : user thực thi tiến trình đó. Có thể là UID hoặc username.
- FD : File Descriptor của file được liệt kê, hoặc các thông tin khác hay mode (w,u,r) của file.

        + cwd : là thư mục đang hoạt động của tiến trình

        + txt : program text (code và data)

        + mmap : memory-mapped file

        + rtd : root directory

        + DEL : Linux map file đã bị xoá.

        + w : đang truy cập ghi xuống dữ liệu

        + u : đang truy cập ghi và đọc dữ liệu
        
        + r : đang truy cập đọc dữ liệu

- TYPE :

        + REG : file bình thường

        + sock : socket.

        + ipv4/ipv6 : socket ipv4/v6
        
        + DIR : thư mục

- DEVICE : số đại diện của thiết bị như partition mà file nằm trên partition đó.

- SIZE/OFF : dung lượng của file.
- NODE : số node của file.
- NAME : tên file.

### Liệt kê các tiến trình đang mở 1 file

Có thể liệt kê các tiến trình nào đang mở 1 file cụ thể bằng cách đưa đường dẫn file thành tham số sau lệnh.

![Imgur](https://i.imgur.com/NFLyGcU.png)

### Liệt kê các file được mở bởi 1 tiến trình

Để liệt kê các file đã được mở bởi 1 tiến trình có thông tin PID cụ thể thì ta thêm option `-p` và chỉ định rõ thông tin PID của tiến trình đó.

![Imgur](https://i.imgur.com/rA5CjxU.png)

### Liệt kê các file đã được mở bởi 1 user cụ thể

Ta chỉ cần chỉ định thêm option `-u` và tên user có tồn tại trên hệ thống.

![Imgur](https://i.imgur.com/zFpXdr2.png)

Cũng có liệt kê đối với user khác nhưng loại trừ 1 user cụ thể nào đó với tham số `^`.

        lsof -u ^root

### Liệt kê các file đã được mở trong 1 directory

Với option `+D` thì lsof sẽ tìm cả các thông tin opened-files ở các sub-directory, thư mục con luôn.

Còn nếu chỉ không muốn tìm cả sub-dir thì chỉ cần dùng `+d`

![Imgur](https://i.imgur.com/Bu0exH5.png)

### Liệt kê các file đã mở theo tên tiến trình

Ta dùng option `-c` và chỉ định tên tiến trình.

        lsof -c ssh

        lsof -c init

![Imgur](https://i.imgur.com/Ln2MiM6.png)

### Kill tất cả hoạt động của 1 user cụ thể

Đôi khi bạn muốn tắt hết tiến trình liên quan đến 1 user. Thì câu lệnh sau sẽ giúp bạn làm điều đó. Option `-t` sẽ liệt kê các thông tin PID và không có các output trả về khác.

Ví dụ:

        kill -9 `lsof -t -u thuctap`

### Liệt kê các tiến trình đang lắng nghe trên port cụ thể

Bạn cần chú ý option “-i” và tham số “:” cùng số port cụ thể.

        lsof -i :25

        lsof -i TCP:80

![Imgur](https://i.imgur.com/1atZ62t.png)

### Liệt kê tất cả kết nối TCP/UDP hay IPv4/v6

Ta dùng option `-i` để liệt kê tất cả các kết nối của giao thức TCP hay UDP.

        lsof -i tcp

        lsof -i udp

![Imgur](https://i.imgur.com/EnOAbmL.png)

Để hiển thị tất cả các kết nối của hệ thống. Cũng như muốn chỉ định riêng việc liệt kê kết nối từ IPv4 hay v6.

        lsof -i

        lsof -i 4

        lsof -i 6

### Liệt kê tất cả các file network đang được sử dụng bởi 1 tiến trình

Ta làm theo câu lệnh sau bằng cách kết hợp các option tương ứng

        lsof -i -a -p 5252

        lsof -i -a -c ssh

![Imgur](https://i.imgur.com/tsb1Q6W.png)

Xem thêm: 

https://www.tecmint.com/10-lsof-command-examples-in-linux/

## 6. Lệnh vmstat <a name="vmstat"></a>

`vmstat` là một công cụ thập thập và báo cáo dữ liệu về tài nguyên sử dụng memory, swap và processer trong thời gian thực. `vmstat` có thể được sử dụng để xác định các vấn đề liên quan đến hiệu suất, memory sử dụng.

Nếu bạn gõ lệnh vmstat không có tham số, nó sẽ hiển thị cho bạn một tập hợp các giá trị. Các giá trị này là mức trung bình cho mỗi thống kê, kể từ khi máy tính được khởi động lại lần cuối. Những số liệu này không phải là các giá trị ở thời điểm hiện tại.

![Imgur](https://i.imgur.com/coHMnFK.png)

### Phân tích output

Có các cột Procs, Memory, Swap, IO, System và CPU. Cột cuối cùng (cột ngoài cùng bên phải) chứa dữ liệu liên quan đến CPU.

**Procs**

- r: Số lượng các tiến trình có thể chạy được. Đây là những tiến trình đã và đang chạy hoặc chờ đợi một chu kỳ CPU mới.
        
- b: Số lượng tiến trình trong trạng thái sleep liên tục. Thực chất thì những tiến trình này không “ngủ”, mà chúng chỉ đang chặn system call (là khi chương trình gọi một hàm hoặc một service nào đó nằm trong kernel của hệ điều hành) và không thể bị gián đoạn cho đến khi hành động hiện tại được hoàn thành. Thông thường, những tiến trình này diễn ra khi driver thiết bị đang chờ một số tài nguyên “rảnh rỗi”. Bất kỳ sự gián đoạn nào xảy ra đối với những quy trình này khi đang trong hàng đợi đều được xử lý khi quy trình tiếp tục hoạt động như bình thường.

**Memory**

- swpd: Dung lượng bộ nhớ ảo được sử dụng. Nói cách khác, đây là số lượng bộ nhớ đã bị hoán đổi.
- free: Dung lượng bộ nhớ nhàn rỗi (hiện không sử dụng).
- buff: Dung lượng bộ nhớ được sử dụng làm buffer.
- cache: Dung lượng bộ nhớ được sử dụng làm cache.
Swap
- si: Lượng bộ nhớ ảo được swap in từ không gian hoán đổi.
- so: Lượng bộ nhớ ảo được swap out vào không gian hoán đổi.

**IO**

- bi: Các khối nhận được từ một thiết bị khối. Số lượng khối dữ liệu được sử dụng để trao đổi bộ nhớ ảo trở lại RAM.
- bo: Các khối gửi đến một thiết bị khối. Số lượng khối dữ liệu được sử dụng để trao đổi bộ nhớ ảo ra khỏi RAM và vào không gian hoán đổi.

**System**

- in: Số lượng gián đoạn mỗi giây, bao gồm cả xung nhịp.
- cs: Số lượng context switch mỗi giây. Context switch là khi kernel hoán đổi từ xử lý chế độ hệ thống sang xử lý chế độ người dùng.

**CPU**

Các giá trị này là tất cả tỷ lệ phần trăm của tổng thời gian CPU.

- us: Thời gian chạy code không phải kernel.
- sy: Thời gian chạy code kernel.
- id: Thời gian nhàn rỗi.
- wa: Thời gian chờ đợi đầu vào hoặc đầu ra.
- st: Thời gian có được từ một máy ảo. Đây là thời gian một máy ảo phải chờ hypervisor (phần mềm giám sát máy ảo) hoàn thành việc phục vụ các máy ảo khác trước khi nó có thể quay lại và xử lý máy ảo này.

### Sử dụng một khoảng thời gian

Bạn có thể yêu cầu vmstat cung cấp cập nhật thường xuyên cho những số liệu này bằng cách sử dụng giá trị delay. Giá trị delay được cung cấp trong vài giây. Để cập nhật số liệu thống kê cứ sau 5 giây, hãy sử dụng lệnh sau:

        vmstat 5

`Ctrl + C` để dừng

![Imgur](https://i.imgur.com/mktnn5L.png)

### Sử dụng giá trị count

Sử dụng giá trị delay quá thấp sẽ gây thêm áp lực cho hệ thống. Nếu bạn cần có các bản cập nhật nhanh để cố gắng chẩn đoán sự cố, bạn nên sử dụng giá trị count cũng như giá trị delay.

Giá trị count cho vmstat cho biết có bao nhiêu lần cập nhật cần thực hiện trước khi thoát và đưa bạn trở lại Command Prompt. Nếu bạn không cung cấp giá trị count, vmstat sẽ chạy cho đến khi nó bị dừng bởi tổ hợp phím Ctrl+C.

Để vmstat cung cấp một bản cập nhật cứ sau 5 giây, nhưng chỉ trong 4 lần cập nhật, hãy sử dụng lệnh sau:

        vmstat 5 4

Sau 4 lần cập nhật, vmstat sẽ dừng lại.

![Imgur](https://i.imgur.com/hirInZ0.png)

### Thay đổi các đơn vị


Bạn có thể chọn hiển thị số liệu thống kê bộ nhớ và hoán đổi theo kilobyte hoặc megabyte bằng tùy chọn `-S` (ký tự đơn vị). Tùy chọn này phải được theo sau bởi một trong các đơn vị `k`, `K`, `m` hoặc `M`. Chúng đại diện cho:

- k: 1000 byte
- K: 1024 byte
- m: 1000000 byte
- M: 1048576 byte

Để cập nhật số liệu thống kê bộ nhớ và hoán đổi cứ sau 10 giây, hiển thị bằng megabyte, hãy sử dụng lệnh sau:

        vmstat 10 -S M

Số liệu thống kê bộ nhớ và hoán đổi hiện được hiển thị bằng megabyte. Lưu ý rằng tùy chọn -S không ảnh hưởng đến thống kê khối IO. Chúng luôn được hiển thị trong các khối.

![Imgur](https://i.imgur.com/2pxsgDi.png)

### Bộ nhớ hoạt động và không hoạt động

Nếu bạn sử dụng tùy chọn `-a` (active), các cột bộ nhớ buff và cache được thay thế bằng các cột “**inact**” và “**active**”. Như bạn có thể đoán, những cột này cho thấy lượng bộ nhớ không hoạt động và hoạt động.

Để xem hai cột này thay vì cột buff và cache, hãy bao gồm tùy chọn `-a`, như được hiển thị:

        vmstat 5 -a -S M

Các cột “inact” và “active” bị ảnh hưởng bởi tùy chọn `-S` (ký tự đơn vị).

![Imgur](https://i.imgur.com/HeHFHPo.png)

### Hiển thị bộ đếm sự kiện và thống kê bộ nhớ


Để hiển thị một trang của bộ đếm sự kiện và thống kê bộ nhớ, hãy sử dụng tùy chọn `-s` (stats). Lưu ý rằng, chữ s viết thường

        vmstat -s

Mặc dù số liệu thống kê được báo cáo phần lớn giống như thông tin được tạo ra từ lệnh vmstat mặc định, một số dữ liệu trong đó được phân chia chi tiết hơn.

Ví dụ, đầu ra mặc định kết hợp cả thời gian CPU của user nice và non-nice vào cột us. Còn tùy chọn -s (stats) liệt kê các thống kê này một cách riêng biệt.

![Imgur](https://i.imgur.com/4JbvhoF.png)

### Hiển thị thống kê ổ đĩa

Bạn có thể có được một danh sách thống kê ổ đĩa tương tự bằng cách sử dụng tùy chọn `-d` (disk).

        vmstat -d

![Imgur](https://i.imgur.com/gIe4WOZ.png)

Đối với mỗi ổ đĩa, có 3 cột được hiển thị, đó là **Reads**, **Writes** và **IO**.

**IO** là cột ngoài cùng bên phải. Lưu ý rằng cột sec trong **IO** được đo bằng giây nhưng thống kê dựa trên thời gian trong cột **Reads** và **Writes** được đo bằng mili giây.

Đây là ý nghĩa của các cột:

**Reads**

- total: Tổng số lần đọc ổ đĩa.
- merged: Tổng số lần đọc được nhóm.
- sectors: Tổng số các sector đã được đọc.
- ms: Tổng số thời gian tính bằng mili giây đã được sử dụng để đọc dữ liệu từ ổ đĩa.

**Writes**

- total: Tổng số lần ghi ổ đĩa.
- merged: Tổng số các lần ghi được nhóm lại.
- sectors: Tổng số các sector được ghi.
- ms = Tổng số thời gian, tính bằng mili giây, đã được sử dụng ghi dữ liệu vào ổ đĩa.

**IO**

- cur: Số lượng lần đọc hoặc ghi ổ đĩa hiện tại.
- sec: Thời gian tính bằng giây cho bất kỳ việc đọc hoặc ghi nào đang được thực hiện.

### Hiển thị số liệu thống kê ổ đĩa tóm tắt

Sử dụng tùy chọn `-D` để hiển thị nhanh số liệu thống kê tóm tắt cho hoạt động của ổ đĩa

        vmstat -D

Số lượng ổ đĩa có thể trông cao bất thường. Máy tính được sử dụng làm ví dụ trong bài viết này đang chạy Ubuntu. Với Ubuntu, mỗi khi bạn cài đặt một ứng dụng từ Snap, một hệ thống file pseudo-filesystem squashfs được tạo ra sẽ gắn vào thiết bị /dev/loop.

Điều khó chịu là các mục thiết bị này được tính là thiết bị ổ cứng bởi nhiều lệnh và tiện ích Linux.

![Imgur](https://i.imgur.com/xMrdnqL.png)

### Hiển thị thống kê phân vùng

Để xem số liệu thống kê liên quan đến một phân vùng cụ thể, hãy sử dụng tùy chọn `-p` (partition) và cung cấp định danh phân vùng làm tham số dòng lệnh.

Ở đây chúng ta sẽ xem xét phân vùng sda1. Chữ số một cho biết đây là phân vùng đầu tiên trên thiết bị sda, đây là ổ cứng chính cho máy tính này.

Ví dụ:

        vmstat -p sda1

Thông tin trả về cho thấy tổng số lần đọc, ghi ổ đĩa vào và từ phân vùng đó, cũng như số lượng các sector có trong các hành động đọc và ghi ổ đĩa.

Xem thêm: 

https://www.tecmint.com/linux-performance-monitoring-with-vmstat-and-iostat-commands/

https://quantrimang.com/cach-su-dung-lenh-vmstat-tren-linux-164611

## 7. Lệnh nload <a name="nload"></a>

Lệnh nload hiển thị mức sử dụng mạng hiện tại

Cài đặt:
```
-------- On CentOS and RHEL -------- 
# yum install epel-release
# yum install nload

-------- On Fedora 22+ --------
# dnf install nload
-------- On Ubuntu / Debian --------
$ sudo apt install nload
```

Sử dụng:
```
$ nload
Or
$ nload eth0
```

![Imgur](https://i.imgur.com/GzaeSUV.png)

Key Shortcuts:

- Use left and right arrow keys or Enter/Tab key to switch the display to the next network device or when started with the -m flag, to the next page of devices.
- Use `F2` to show the option window.
- Use `F5` to save current settings to the user’s config file.
- Use `F6` to reload settings from the config files.
- Use `q` or `Ctrl+C` to quit nload.

Các option:

`-m`: Hiển thị nhiều card cùng lúc

        nload -m

![Imgur](https://i.imgur.com/a9X8iWw.png)

`-a`: đặt độ dài tính bằng giây của cửa sổ thời gian để tính trung bình. Mặc định là 300

        nload -a 400

`-t`: Thay đổi thời gian làm mới interval theo mili giây. Mặc định là 500. Nếu giảm xuống dưới 100 thì giá trị sẽ không chính xác.

        nload -ma 400 -t 600

`devices`: Có thể chỉ định card mạng cụ thể bằng lệnh sau: (Mặc định là tất cả các card mạng)

        nload devices ens33

https://linux.die.net/man/1/nload

https://blog.cloud365.vn/linux/kiem-tra-bang-thong-mang-voi-nload-va-iperf/

https://www.tecmint.com/nload-monitor-linux-network-traffic-bandwidth-usage/

## 8. Lệnh ps <a name="ps"></a>

https://news.cloud365.vn/ps-command-tim-hieu-va-huong-dan-su-dung/

https://quantrimang.com/cong-dung-cua-lenh-ps-trong-linux-163904

https://blogd.net/linux/cac-vi-du-ve-lenh-ps-theo-doi-tien-trinh-tren-linux/

https://news.cloud365.vn/ps-command-nhung-tuy-chon-huu-ich-khi-su-dung-lenh-ps/

`ps` (hay Process Status) là một tiện ích của Unix/Linux dùng để xem thông tin của các tiến trình đang chạy trong hệ thống. Đây có thể nói là một tiện ích quan trọng giúp bạn hiểu chuyện gì đang diễn ra trên hệ thống

Tiện ích ps sẽ đọc thông tin tiến trình từ một file ảo nằm trong thư mục /proc. Nó sẽ cung cấp một số tuỳ chọn để cho bạn dễ dàng xem thông tin của các tiến trình

Sử dụng:

        ps [option]

Dùng lệnh `man ps` để xem các option 


iostat
iotop