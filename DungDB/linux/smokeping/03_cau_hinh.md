# Cấu hình smokeping

Cấu hình mặc định của smokeping nằm ở `/etc/smokeping/config`

Cấu hình ví dụ

`/etc/smokeping/config`

    *** General ***

    owner     = Your Name Here                            # your name
    contact   = your.email@host.bla                       # your email
    mailhost  = your.smtp.server.bla                      # your mail server
    sendmail  = /bin/false                                # where the sendmail program is
    imgcache  = /srv/smokeping/imgcache                   # filesystem directory where we store files
    imgurl    = imgcache                                  # URL directory to find them
    datadir   = /srv/smokeping/data                       # where we share data between the daemon and webapp
    piddir    = /var/run                                  # filesystem directory to store PID file
    cgiurl    = http://localhost/smokeping/smokeping.fcgi  # exterior URL
    smokemail = /etc/smokeping/smokemail   
    tmail     = /etc/smokeping/tmail
    syslogfacility = local0
    # each probe is now run in its own process
    # disable this to revert to the old behaviour
    # concurrentprobes = no

    *** Database ***

    step     = 300
    pings    = 20

    # consfn mrhb steps total

    AVERAGE  0.5   1  1008
    AVERAGE  0.5  12  4320
        MIN  0.5  12  4320
        MAX  0.5  12  4320
    AVERAGE  0.5 144   720
        MAX  0.5 144   720
        MIN  0.5 144   720

    *** Presentation ***

    template = /etc/smokeping/basepage.html

    + charts

    menu = Charts
    title = The most interesting destinations
    ++ stddev
    sorter = StdDev(entries=>4)
    title = Top Standard Deviation
    menu = Std Deviation
    format = Standard Deviation %f

    ++ max
    sorter = Max(entries=>5)
    title = Top Max Roundtrip Time
    menu = by Max
    format = Max Roundtrip Time %f seconds

    ++ loss
    sorter = Loss(entries=>5)
    title = Top Packet Loss
    menu = Loss
    format = Packets Lost %f

    ++ median
    sorter = Median(entries=>5)
    title = Top Median Roundtrip Time
    menu = by Median
    format = Median RTT %f seconds

    + overview 

    width = 600
    height = 50
    range = 10h

    + detail

    width = 600
    height = 200
    unison_tolerance = 2

    "Last 3 Hours"    3h
    "Last 30 Hours"   30h
    "Last 10 Days"    10d
    "Last 400 Days"   400d

    *** Probes ***

    + FPing

    binary = /usr/bin/fping

    *** Targets ***

    probe = FPing

    menu = Top
    title = Network Latency Grapher
    remark = Welcome to the SmokePing website of Arch User. \
            Here you will learn all about the latency of our network.

    + targets
    menu = Targets
    title = Targets

    ++ CloudflareDNS
    
    menu = Cloudflare DNS
    title = Cloudflare DNS server
    host = 1.1.1.1

    ++ GoogleDNS

    menu = Google DNS
    title = Google DNS server
    host = 8.8.8.8

    ++ MultiHost

    menu = Multihost example
    title = CloudflareDNS and Google DNS
    host = /targets/CloudflareDNS /targets/GoogleDNS

- Phần General: Cá nhân hóa file cấu hình để phù hợp với thông tin của bạn. Lưu ý rằng nếu bạn chưa cài đặt chương trình sendmail (nghĩa là từ postfix hoặc sendmail) thì hãy sử dụng cái gì khác như là `/bin/false`. Các tập tin bạn chỉ định phải tồn tại hoặc smokeping sẽ lỗi.
- Phần Alert: Chưa tìm hiểu, để mặc định
- Phần Database: Sửa thành gửi 20 gói trong 1 phút

```
*** Database ***

step     = 60
pings    = 20
```

- Phần Presentation: Thêm thời gian mà biểu đồ hiển thị. Phần này thay đổi tùy ý, dữ liệu sẽ không bị ảnh hưởng. Khởi động lại dịch vụ smokeping và http sẽ cập nhật ngay.

```
"Last 5 Minutes"    5m
"Last 15 Minutes"    15m
"Last 30 Minutes"    30m
"Last 1 Hours"    1h
"Last 3 Hours"    3h
"Last 6 Hours"    6h
"Last 12 Hours"    12h
"Last 24 Hours"   24h
"Last 3 Days"    3d
"Last 7 Days"    7d
"Last 10 Days"    10d
"Last 30 Days"    30d
"Last 90 Days"    90d
"Last 180 Days"    180d
"Last 365 Days"    365d
```

- **Phần Probes**: Chỉ định probe nào hoạt động. Mặc định chỉ có probe `FPing` được bật. Phần này ta không cần cấu hình thêm.
- Phần Slaves: Chưa tìm hiểu, để mặc định hoặc comment out phần này. Lưu ý nếu sử dụng cài đặt `smokeping_secrets` trong phần Slaves, thì cần phải chạy lệnh `chmod 600 /etc/smokeping/smokeping_secrets` nếu không smokeping sẽ lỗi.
- **Phần Target**: Chỉ định host nào được thăm dò (ping đến). Tùy chỉnh phần này để để lấy số liệu thống kê từ các host bạn muốn thăm dò.

Nếu thay đổi các host để thăm dò thì khi khởi động lại dịch vụ smokeping sẽ không hiển thị. Cần phải xóa các file dữ liệu liên quan đến host cũ đi thì mới hiển thị được thông tin của các host mới thêm.

Tham khảo các probe khác tại đây: https://oss.oetiker.ch/smokeping/probe/index.en.html

## Xác định targets

Target là thứ cuối cùng được thêm vào cấu hình. Target là danh sách phân theo thứ bậc của các host đánh dấu các điểm cuối của các kết nối mạng mà hệ thống sẽ giám sát. Mỗi target sẽ chỉ định loại probe nào sẽ sử dụng, tích hợp lệnh ping bên ngoài vào SmokePing (ví dụ fping).

Các target được định cấu hình Trong phần `*** Targets ***` của tệp cấu hình SmokePing. Có rất nhiều biến có thể sử dụng để tùy chỉnh target của bạn. 

- probe: Lệnh ping được sử dụng để thăm dò độ trễ
- menu: Menu mặc định hiển thị trong GUI.
- title: Tiêu đề của trang SmokePing tương ứng.
- remark: Đoạn text sẽ xuất hiện trên trang.
- host: Địa chỉ IP hoặc điểm cuối máy chủ (hostname endpoint).

Config mặc định:

`**Targets** Section on /etc/smokeping/config`

```
. . .
*** Targets ***

probe = FPing

menu = Top
title = Network Latency Grapher
remark = Welcome to the SmokePing website of xxx Company. \
         Here you will learn all about the latency of our network
```

Sửa thành:

`**Targets** Section on /etc/smokeping/config`

```
. . .
*** Targets ***

probe = FPing

menu = Top
title = Network Latency Grapher
remark = Welcome to the SmokePing website of xxx Company. \
         Here you will learn all about the latency of our network

 + Site1

 menu = Site1
 title = Site1

 ++ Host1-175

 menu = Host1
 title = 10.10.34.175
 host = 10.10.34.175

 ++ Host2-176
 menu = Host2
 title = 10.10.34.176
 host = 10.10.34.176

 + Site2

 menu = Site2
 title = Site2

 ++ Host1-173

 menu = Host1
 title = 10.10.34.173
 host = 10.10.34.173

 ++ Host2-174
 menu = Host2
 title = 10.10.34.174
 host = 10.10.34.174

```

Giải thích:

Target được phân cấp, nghĩa là bạn có thể lồng các cấp Target để việc tổ chức dễ dàng hơn. Mỗi cấp độ Target lồng nhau sẽ tạo ra một menu con mới trong GUI của SmokePing hiển thị các biểu đồ khác nhau.

## Cấu hình multihost trên cùng một graph

Để cấu hình multi host thì các host phải được khai báo trước đó. Sau đó khai báo thêm một biểu đồ. Các host trong biểu đồ cần nhập đúng phần menu.

Ví dụ cụ thể:

```
 + Site1

 menu = Site1
 title = Site1

 ++ Host1-175

 menu = Host1
 title = 10.10.34.175
 host = 10.10.34.175

 ++ Host2-176
 menu = Host2
 title = 10.10.34.176
 host = 10.10.34.176

++ MultiHost

menu = Multihost
title = 175 va 176
host = /Site1/Host1-175 /Site1/Host2-176
```

Kết quả:

![Imgur](https://i.imgur.com/2tpD5Ny.png)

![Imgur](https://i.imgur.com/wb98j9x.png)