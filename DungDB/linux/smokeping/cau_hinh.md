# Cấu hình smokeping

Cấu hình mặc định của smokeping nằm ở `/usr/local/etc/smokeping/config`


-------------------------------------



## Xác định targets

Target là thứ cuối cùng được thêm vào cấu hình. Target là danh sách phân theo thứ bậc của các host đánh dấu các điểm cuối của các kết nối mạng mà hệ thống sẽ giám sát. Mỗi target sẽ chỉ định loại probe nào sẽ sử dụng, tích hợp lệnh ping bên ngoài vào SmokePing (ví dụ fping).

Các target được định cấu hình Trong phần `*** Targets ***` của tệp cấu hình SmokePing. Có rất nhiều biến có thể sử dụng để tùy chỉnh target của bạn. 

- probe: Lệnh ping được sử dụng để thăm dò độ trễ
- menu: Menu mặc định hiển thị trong GUI.
- title: Tiêu đề của trang SmokePing tương ứng.
- remark: Đoạn text sẽ xuất hiện trên trang.
- host: Địa chỉ IP hoặc điểm cuối máy chủ (hostname endpoint).

Config mặc định:

`**Targets** Section on /usr/local/etc/smokeping/config`

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

`**Targets** Section on /usr/local/etc/smokeping/config`

```
. . .
*** Targets ***

probe = FPing

menu = Top
title = Network Latency Grapher
remark = Welcome to the SmokePing website of xxx Company. \
         Here you will learn all about the latency of our network

+ targets
menu = Targets
title = Targets' Latency Probed with fping

    ++ pkgmir_nyi
    menu = FreeBSD pkg Mirror (NYI)
    title = FreeBSD pkg Mirror Hosted by New York Internet, USA
    host = pkg0.nyi.freebsd.org

    ++ pkgmir_ydx
    menu = FreeBSD pkg Mirror (YDX)
    title = FreeBSD pkg Mirror Hosted by Yandex, Russia
    host = pkg0.ydx.freebsd.org
```

Giải thích:

Target được phân cấp, nghĩa là bạn có thể lồng các cấp Target để việc tổ chức dễ dàng hơn. Mỗi cấp độ Target lồng nhau sẽ tạo ra một menu con mới trong GUI của SmokePing hiển thị các biểu đồ khác nhau.