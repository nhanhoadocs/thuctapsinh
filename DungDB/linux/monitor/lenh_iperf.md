# Iperf

## Kiểm tra tốc độ của card mạng

ethtool 

vd:

    ethtool ens33

## Giới thiệu    

Iperf là một công cụ miễn phí, dùng để đo lường lượng dữ liệu mạng (throughput) tối đa mà một server có thể xử lý. Công cụ này rất hữu ích để truy tìm ra các vấn đề đối với hệ thống mạng bởi Iperf có thể xác định được server nào không xử lý được lượng dữ liệu mạng (throughput) mà người quản trị mạng mong đợi.

Iperf rất hữu ích và có thể được sử dụng để đo lường throughput giữa hai máy chủ có sự khác biệt về vị trí địa lý.

## Cài đặt

Trên Debian/Ubuntu

    apt-get install iperf

Trên CentOS/Fedora

    yum install epel-release -y
    yum install iperf -y

## Các option

`-c`: chỉ ra địa chỉ IP của server để iperf kết nối đến

`-f`, `--format`: Chỉ ra định dạng của kết quả hiển thị. 'b' = bps, 'B' = Bps, 'k' = Kbps, 'K' = KBps,...

`-i`, `--interval`: Thời gian lấy mẫu để hiển thị kết quả tại thời điểm đó ra màn hình

`-p`, `--port`: Định ra cổng để nghe, mặc định nếu không sử dụng tham số này là cổng 5001

`-u`, `--udp`: Sử dụng giao thức UDP, mặc định iperf sử dụng TCP

`-P`, `--parallel`: Chỉ ra số kết nối song song được tạo, nếu là Server mode thì đây là giới hạn số kết nối mà server chấp nhận

`-b`: Định ra băng thông tối ta có thể truyền, chỉ sử dụng với UDP, client mode

`-t`: Tổng thời gian của kết nối, tính bằng giây

`-M`: Max segment size

`-l`: Buffer size

`-w`, `--window`: Trường Windows size của TCP

## Sử dụng Iperf

Iperf phải được cài đặt trên hai máy chủ sử dụng cho việc kiểm tra network throughput. Trong trường hợp bạn sử dụng Iperf để kiểm tra giữa máy chủ tại vHost và máy tính cá nhân của bạn, bạn phải cài đặt Iperf trên máy tính của bạn. Bạn nên sử dụng Iperf để kiểm tra giữa máy chủ của vHost và một máy chủ tại đặt tại nhiều vị trí khác nhau để có đánh giá chính xác nhất bởi kết quả của việc kiểm tra có thể bị tác động bởi sự giới hạn của các nhà mạng (ISP)

## TCP Clients & Servers

Iperf yêu cầu cần có hai máy chủ để kiểm tra, một sẽ đóng vai trò và hoạt động như server, máy chủ còn lại sẽ là client kết nối tới máy chủ mà bạn đang kiểm tra tốc độ mạng.

### 1. Trên máy chủ tại vHost, bạn cho chạy Iperf như là Server

    iperf -s

Bạn sẽ thấy kết quả xuất ra trên màn hình như sau:

![Imgur](https://i.imgur.com/gGCunCP.png)

### 2. Trên máy chủ còn lại đóng vài trò là client, kết nối tới máy chủ thứ nhất. Thay thế IP "10.10.34.173" với IP của server mà bạn đang kiểm tra

    iperf -c 10.10.34.173

Bạn sẽ thấy kết quả xuất ra gần giống như sau:

![Imgur](https://i.imgur.com/eAWCvTK.png)

### 3. Bạn cũng sẽ thấy kết quả tương tự trên Iperf server

![Imgur](https://i.imgur.com/l1yhvCs.png)

### 4. Để stop Iperf trên server, nhấn `CTRL + C`

## UDP Clients & Servers

### 1. Chạy Iperf trên server

    iperf -s -u

![Imgur](https://i.imgur.com/QAwfXPu.png)

### 2 Kết nối client tới Iperf server, thay thế "10.10.34.173" với IP của server mà bạn kiểm tra. Tham số -u mang ý nghĩa chỉ định thực hiện kết nối thông qua giao thức UDP

    iperf -c 10.10.34.173 -u

![Imgur](https://i.imgur.com/CK3BNME.png)

Kết quả trả về là 1.05 Mbits/sec thấp hơn khá nhiều so với việc kiểm tra với kết nối TCP trước đó. Có điều này là bởi mặc định Iperf giới hạn băng thông cho kết nối UDP là 1 Mb/s

### 3. Bạn có thể tùy chỉnh kết quả trên với tham số `-b`, thay thế với giá trị băng thông tối đa mà bạn muốn kiểm tra

    iperf -c 10.10.34.173 -u -b 100m

Câu lệnh trên thực hiện kiểm tra với băng thông 100Mb nếu có thể đạt được. Tham số -b chỉ sử dụng cho kết nối UDP, bởi mặc định Iperf không giới hạn với việc kiểm tra bằng kết nối TCP

![Imgur](https://i.imgur.com/H0d3LaX.png)

## Kiểm tra kết nối 2 chiều

Với tham số -d bạn có thể thực hiện kiểm tra tốc độ mạng hai chiều, sau khi kiểm tra tốc mạng lần nhất giữa client và server, thì hai máy chủ này sẽ đổi vai trò cho nhau và thực hiện lại việc kiểm tra lần hai.

    iperf -c 10.10.34.173 -d

![Imgur](https://i.imgur.com/SJToKqq.png)

Xem thêm:

https://docs.vhost.vn/article.php?id=232

## Kết hợp với nload để kiểm tra băng thông

Mô hình:

![Imgur](https://i.imgur.com/ROC39F3.png)

Client: 10.10.34.177

Server: 10.10.34.173

2 máy ảo ở đây cùng cụm KVM2

### Thực hiện

Trên server

    iperf -s

Trên Client, thực hiện đẩy gói TCP tới server, kiểm tra traffic network trên card ens3 của Client.
Thực hiện đẩy iperf TCP

    iperf -c 10.10.34.173 -i1 -t 100 -m

Giải thích tham số câu lệnh :

`-c` : địa chỉ host của iperf server (10.10.34.173)

`-i` : khoảng thời gian giữa 2 lần report kết quả 
theo giây (1s)

`-t` : thời gian thực hiện đẩy traffic theo giây (100s)

`-m` : in ra MTU header

Bandwidth được đẩy lên ~11 Gbits/sec

Kiểm tra trên network traffic của cả client và server. Sử dụng câu lệnh để nload để xem traffic network trên port p1p2. Để chỉ rõ port p1p2, sử dụng option -d như bên dưới :

    nload -d p1p2

Trên client, interface sẽ có Outgoing traffic ~11 Gbits/sec.

![Imgur](https://i.imgur.com/zixHmdX.png)

Trên server, interface sẽ có Incoming traffic ~11 Gbits/sec.

![Imgur](https://i.imgur.com/hXRxOLX.png)

Vậy ở đây ta thấy được tốc độ tối đa mà KVM support cho 2 máy cùng 1 cụm kết nối với nhau là ~11 Gbits/sec

### Thực hiện với 2 máy ảo khác cụm KVM (TCP)

Client: 10.10.34.179 (Cụm KVM1)

Server: 10.10.34.173 (Cụm KVM2)

2 máy khác cụm KVM có thể mô phỏng truyền tải giữa 2 máy vật lý.

### Thực hiện

Trên server

    iperf -s

Trên Client, thực hiện đẩy gói TCP tới server, kiểm tra traffic network trên card ens3 của Client.
Thực hiện đẩy iperf TCP

    iperf -c 10.10.34.173 -i1 -t 100 -m

Giải thích tham số câu lệnh :

`-c` : địa chỉ host của iperf server (10.10.34.173)

`-i` : khoảng thời gian giữa 2 lần report kết quả theo giây (1s)

`-t` : thời gian thực hiện đẩy traffic theo giây (100s)

`-m` : in ra MTU header

Bandwidth được đẩy lên ~900 Mbits/sec

Kiểm tra trên network traffic của cả client và server. Sử dụng câu lệnh để nload để xem traffic network trên port p1p2. Để chỉ rõ port p1p2, sử dụng option -d như bên dưới :

    nload -d p1p2

Trên client, interface sẽ có Outgoing traffic ~900 Mbits/sec.

![Imgur](https://i.imgur.com/4780VFq.png)

Trên server, interface sẽ có Incoming traffic ~900 Mbits/sec.

![Imgur](https://i.imgur.com/AOJHeIR.png)

### Thực hiện với 2 máy ảo khác cụm KVM (UDP)

Client: 10.10.34.179 (Cụm KVM1)

Server: 10.10.34.173 (Cụm KVM2)

2 máy khác cụm KVM có thể mô phỏng truyền tải giữa 2 máy vật lý.

### Thực hiện

Trên server

    iperf -s -u

Trên Client, thực hiện đẩy gói TCP tới server, kiểm tra traffic network trên card ens3 của Client.
Thực hiện đẩy iperf TCP

    iperf -c 10.10.34.173 -u -b 1000m -i1 -t 100 -m

Giải thích tham số câu lệnh :

`-c` : địa chỉ host của iperf server (10.10.34.173)

`-i` : khoảng thời gian giữa 2 lần report kết quả theo giây (1s)

`-t` : thời gian thực hiện đẩy traffic theo giây (100s)

`-m` : in ra MTU header

Bandwidth được đẩy lên ~900 Mbits/sec

Kiểm tra trên network traffic của cả client và server. Sử dụng câu lệnh để nload để xem traffic network trên port p1p2. Để chỉ rõ port p1p2, sử dụng option -d như bên dưới :

    nload -d p1p2

Trên client, interface sẽ có Outgoing traffic ~900 Mbits/sec.

![Imgur](https://i.imgur.com/QnOJqjh.png)

Trên server, interface sẽ có Incoming traffic ~900 Mbits/sec.

![Imgur](https://i.imgur.com/44GZxh7.png)

https://github.com/ducnc/iperf