<a name="Quản lý triến trình">


# Quản lý triến trình

## 1. Các kiểu tiến trình

- Các tiến trình hệ thống 
    - Thường thuộc về root
    - không có giao diên tương tác 
    - Thương được chạy dưới dạng tiến trình ngầm
    - Đảm nhiệm các nhiệm vụ chung, phục vụ mọi người sử dụng.
    - Ví dụ:
        - Ipsched: Quản lý cá dịch vụ in ấn
        - Cron: Tự động thực hiện một lệnh/chương trình vào một thời gian xác định
        - Inetd: Quản lý các dịch vụ mạng

- Các tiến trình cuả người sử dụng
    - Thực hiện các nhiệm vụ của một người dùng cụ thể 
        - Thực hiện dưới dạng một shell tương ứng với một sự đăn nhập
        - Thực hiện dưới dạng lệnh thông qua shell
    - Thường được thực hiện, quản lý bằng một terminal
    - Ví dụ:
        - cp
        - vi
        - man
        - ...

## 2. Lệnh ps 

- Hiền thị các tiếng trình
    - Theo ngầm định, lệnh ps hiển thi các tiến trình thuộc về người sử dụng terminal
    - Sử dụng tùy chọn aux để hiển thì tất cả các tiến trình đàn chạy trong máy

 ```
    [root@localhost ~]# ps
   PID TTY          TIME CMD
 14664 pts/0    00:00:00 bash
 14679 pts/0    00:00:00 ps
[root@localhost ~]# ps aux
USER        PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root          1  0.0  0.6 128016  6540 ?        Ss   Jun16   0:04 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
root          2  0.0  0.0      0     0 ?        S    Jun16   0:00 [kthreadd]
root          3  0.0  0.0      0     0 ?        S    Jun16   0:00 [ksoftirqd/0]
root          5  0.0  0.0      0     0 ?        S<   Jun16   0:00 [kworker/0:0H]
root          7  0.0  0.0      0     0 ?        S    Jun16   0:00 [migration/0]
root          8  0.0  0.0      0     0 ?        S    Jun16   0:00 [rcu_bh]
root          9  0.0  0.0      0     0 ?        S    Jun16   0:05 [rcu_sched]
root         10  0.0  0.0      0     0 ?        S<   Jun16   0:00 [lru-add-drain]
root         11  0.0  0.0      0     0 ?        S    Jun16   0:01 [watchdog/0]
root         12  0.0  0.0      0     0 ?        S    Jun16   0:00 [watchdog/1]
root         13  0.0  0.0      0     0 ?        S    Jun16   0:00 [migration/1]
root         14  0.0  0.0      0     0 ?        S    Jun16   0:00 [ksoftirqd/1]
root         16  0.0  0.0      0     0 ?        S<   Jun16   0:00 [kworker/1:0H]
root         18  0.0  0.0      0     0 ?        S    Jun16   0:00 [kdevtmpfs]
root         19  0.0  0.0      0     0 ?        S<   Jun16   0:00 [netns]
root         20  0.0  0.0      0     0 ?        S    Jun16   0:00 [khungtaskd]
root         21  0.0  0.0      0     0 ?        S<   Jun16   0:00 [writeback]

```

## 3. Trạng thái tiến trình
- S : Đang ngủ
- R : Đang chạy
- T : Dừng
- Z : Không xác định

- Lệnh kill
    - Gửi một tín hiệu đến một tiến trình (định danh của tiến trình được xác định dưới dạng một tham số của lệnh). 
        - Theo ngầm định, tín hiệu gửi đi là tín hiệu 15 (SIGTERM – kết thúc tiến trình) 
        -  Tùy chọn -9: gửi tín hiệu 9 (SIGKILL – hủy tiến trình) 
        - Tùy chọn –l: liệt kê tất cả các tín hiệu có thể sử dụng. 
    - Lệnh killall: dùng để kết thúc tất cả các tiến trình của một câu lệnh thông qua việc truyền tên của câu lệnh dưới dạng một tham số. 
    -  Quyền hủy tiến trình thuộc về người sở hữu tiến trình

- Độ ưu tiên cảu các tiến trình
    - Tất cả các tiến trình đều có độ ưu tiên bạn đâu được ngầm định là O
     Mức độ ưu tiên của tiến trình giao đông trong khoảng -19 đén +19
        - Chỉ người sử dụng có quyền root với coa thể giảm gía trị biển diễn độ ưu tiên của tiến trình .một người sử dụng thông trường chỉ cso thể giảm độ ưu tiên của tiến trình thông qua việc tắng giá trị biểu diễn độ ưu tiên
    -  Lệnh nice cho phép thay đổi độ ưu tiên của một tiến trình ngay khi bắt đầu thực hiện lệnh tương ứng với tiến trình. 
    - Lệnh renice cho phép thay đổi độ ưu tiên của một tiến trình sau khi đã chạy.

- Lệnh top
- Hiển thị và cập nhật các thông tin sau của các tiến trình đang chạy: 
    - Phần trăm sử dụng CPU 
    - Phần trăm sử dụng bộ nhớ trong 
-  $ top [–d] 
    - Tùy chọn –d cho phép xác định thời gian định kỳ cập nhật thông tin (tính theo giây). 
- Lệnh top cho phép người sử dụng tương tác và quản lý các tiến trình (thay đổi độ ưu tiên, gửi các tín hiệu, …)

- Các kiểu thực thi
    - Thực thi nhiều lệnh độc lập 
        - Sử dụng ký tự ; để thực thi nhiều lệnh liên tiếp, các lệnh này hoạt động độc lập với nhau. 
        - $cp public/* perso; rm -r public 
    - Thực thi nhiều lệnh phụ thuộc nhau 
        - Sử dụng ký hiệu && để thực thi nhiều lệnh liên tiếp, các lệnh này phụ thuộc nhau, lệnh sau chỉ được thực hiện nếu lệnh trước không gặp lỗi. 
        - `$cp public/* perso && rm -r publi`

- Chạy ở chế độ hiện (foreground và chạy ở chế độ ngầm (background)  
    - Quá trình chạy ở chế độ hiện sẽ tiến hành theo những bước như sau: 
        - Thực hiện quá trình « fork », nhân bản tiến trình cha (trong trường hợp thực thi các lệnh, đó sẽ là tiến trình shell) 
        - Thực hiện quá trình « wait », đưa tiến trình cha vào trạng thái ngủ (sleep). 
        -  Thực hiện quá trình « exec », thực thi tiến trình con. 
        - Sau khi tiến trình con thực thi xong, một tín hiệu « đánh thức » sẽ được gửi đến tiến trình cha. 
        - Do quá trình chạy như trên => trong quá trình thực hiện tiến trình con, người sử dụng không thể tương tác với tiến trình cha.
    - Quá trình chạy ở chế độ ngầm cho phép thực thi tiến trình cha và tiến trình con một cách độc lập. 
    - Ví dụ: $ emacs& 
    - Sau khi thực hiện lệnh trên, emacs sẽ chạy ở chế độ ngầm, người sử dụng có thể tiếp tục sử dụng console để thực thi các lệnh khác