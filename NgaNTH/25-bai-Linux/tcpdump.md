## Tìm hiểu về tcpdump trong Linux  
Mục lục  
1. [Cài đặt tcpdump](#1)
2. [Bắt gói tin với tcpdump](#2)
3. [Tìm hiểu về output format](#3)
4. [Lọc gói tin](#4)
5. [Kiểm tra nội dung gói tin](#5)
6. [Lưu các capture vào một tệp](#6)  

`tcpdump` là một tiện ích dòng lệnh cho phép bạn nắm bắt và phân tích lưu lượng mạng đi qua hệ thống của bạn. Nó thường được sử dụng để giúp khắc phục sự cố mạng, cũng như một công cụ bảo mật.  
Một công cụ mạnh mẽ và linh hoạt bao gồm nhiều tùy chọn và bộ lọc, `tcpdump` có thể được sử dụng trong nhiều trường hợp. Vì là công cụ dòng lệnh, rất lý tưởng khi chạy trong các máy chủ hoặc thiết bị từ xa không có GUI, để thu thập dữ liệu có thể được phân tích sau. Nó cũng có thể được khởi chạy trong background hoặc như một công việc được lên lịch bằng cách sử dụng các công cụ như cron.  

<a name="1"></a>
**1. Cài đặt tcpdump**  
`tcpdump` có trong một vài bản distro Linux, vì vậy đó là một thuận lợi để giúp bạn cài đặt. Kiểm tra `tcpdump` đã được cài đặt chưa, ta gõ lệnh `which tcpdump`:   
```
[root@client ~]# which tcpdump
/usr/bin/which: no tcpdump in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin)
```
Nếu trong máy chưa có tcpdump thì ta tiến hành cài đặt bằng lệnh:  
```
# yum install -y tcpdump
```
`tcpdump` yêu cầu libpcap, đây là một thư viện để chụp gói mạng. Nếu nó không được cài đặt, nó sẽ tự động được thêm vào như một dependency.  

<a name="2"></a>
**2. Bắt gói tin với tcpdump**  

Bắt gói tin để gỡ lỗi hoặc phân tích, `tcpdump` yêu cầu với quyền root hoặc phải có `sudo` trước hầu hết các lệnh.  
Đầu tiên ta sử dụng lệnh `tcpdump -D` để xem những interface có sẵn để bắt:  
<img src="https://i.imgur.com/OUSeWpi.png">

Trong ví dụ trên, bạn có thể nhìn thấy các giao diện có sẵn trong máy của tôi. Đặc biệt interface `any` cho phép bắt gói tin trong bất kì interface nào hoạt động.  
 - *Bắt tất cả các gói tin của bất kỳ interface nào*  
 ```
 # tcpdump -i any
 ```
 <img src="https://i.imgur.com/sjDtj9F.png">  

  `tcpdump` sẽ tiếp tục bắt các gói tin cho đến khi có tín hiệu ngắt. Xử dụng `Ctrl+C` để thoát. 
  Để giới hạn gói tin được bắt và stop thì ta sử dụng tùy chọn `-c`:  

  <img src="https://i.imgur.com/eORVeTH.png">  

  Trong trường hợp này, `tcpdump` sẽ dừng bắt gói tin tự động sau khi nó đã bắt được 5 gói tin. Điều này rất có ích trong những kịch bản khác - ví dụ nếu bạn đang xử lý sự cố kết nối thì bắt một vài gói tin đầu là đủ. Điều này cũng rất có ích khi ta dùng để bắt những gói tin đặc biệt.  
  Mặc định, `tcpdump` giải quyết các địa chỉ IP và port theo tên (giống như các ví dụ trên). Khi xử lý sự cố các vấn đề về mạng nó sẽ trở lên dễ dàng hơn khi sử dụng địa chỉ IP và số port. Để vô hiệu hóa độ phân giải tên thì sử dụng tùy chọn `-n` và độ phân giải port thì dùng tùy chọn `-nn`.  

<img src="https://i.imgur.com/1vWMmKQ.png">  

Như được hiển thị ở trên, đầu ra chụp hiện hiển thị địa chỉ IP và số cổng. Điều này cũng ngăn `tcpdump` tra cứu DNS, giúp giảm lưu lượng mạng trong khi xử lý sự cố mạng.

Bây giờ bạn có thể chụp các gói mạng, hãy khám phá ý nghĩa của đầu ra này.

<a name="3"></a>
**3. Tìm hiểu về output format**

`tcpdump` có khả năng bắt và giải mã rất nhiều giao thức khác nhau như TCP, UDP, ICMP... Bạn có thể tìm hiểu chi tiết ở [đây](http://www.tcpdump.org/manpages/tcpdump.1.html#lbAG). Một gói tin TCP phổ biến được bắt bởi tcpdump sẽ có format như sau:  
```
09:54:57.996417 IP 192.168.152.134.22 > 192.168.152.1.49926: Flags [P.], seq 48:160, ack 1, win 361, length 112
```

- Trường đầu tiên: `09:54:57.996417` biểu thị dấu thời gian của gói nhận giống như 1 đồng hồ local.  
- Tiếp theo `IP` thể hiện giao thức tầng mạng. Ở đây là IPv4 còn nếu gói tin là IPv6 thì có giá trị IP6.  
- Trường tiếp theo: `192.168.152.134.22` là địa chỉ IP  và port nguồn. Nó được follow bởi địa chỉ IP và cổng đích `192.168.152.1.49926`. 
- Sau nguồn và đích thì bạn cần phải tìm cờ TCP ( `Flags [P.]`). Các giá trị điển hình của trường này là:  
| Value | Flag Type | Description |  
|-------|-----------|-------------|  
| S | SYN | Bắt đầu kết nối |  
| F | FIN | Kết thúc kết nối |     
| T | PUSH | Đẩy dữ liệu |  
| R | RST | Thiết lập lại kết nối |  
| . | ACK | Báo nhận |  

Trường này có thể là sự kết hợp của nhiều giá trị, ví dụ như [s.] là gói SYN-ACK.   
- Tiếp theo là số thứ tự (seq) của dữ liệu được chứa trong packet. Gói đầu tiên được bắt thì nó là 1 số tuyệt đối. Các gói tiếp theo sử dụng một số tương đối giúp cho việc theo dõi dễ dàng hơn. Ví dụ số thứ tự là `seq 48:160`có nghĩa là gói này sẽ chứa các byte từ 48 đến 160 của luồng này. 
- Trường tiếp theo thể hiện số lượng nhận `ack 1`. Trong trường hợp này, nó là 1 vì là bên gửi dữ liệu. Phía bên nhận dữ liệu, trường này thể hiện số byte dự kiến (data) tiếp theo của luồng. Ví dụ số ack của gói tiếp theo có thể là 160.  
- Tiếp theo là trường thể hiện kích thước cửa sổ (Window size) `win 361`, đại diện cho số byte có sẵn trong bộ đệm nhận, theo sau là các tùy chọn TCP như MSS (Maximum Segment Size - Kích thước phân đoạn tối đa) hoặc Quy mô cửa sổ (Window Scale).
- Cuối cùng là độ dài gói dữ liệu `length 112`. Độ dài được tính bằng byte của dữ liệu tải trọng. Length là khác nhau giữa các byte cuối cùng và byte đầu tiên của sequence number.  

Bây giờ chúng ta sẽ xem cách lọc các gói để thu hẹp vùng kết quả, giúp xử lý các lỗi cụ thể được dễ dàng hơn. 

<a name="4"></a>
**4. Lọc gói tin**  

Như đã đề cập ở trên, `tcpdump` bắt rất nhiều các gói tin, cả những gói tin mà không liên quan đến vấn đề mà bạn đang cần xử lý. Ví dụ nếu bạn đang xử lý một vấn đề kết nối với web server, bạn không quan tâm đến SSH traffic. Vì vậy xóa các gói tin SSH từ output sẽ giúp ta dễ dàng hơn để giải quyết các vấn đề thực tế.  
Một trong những đặc trưng mạnh mẽ của `tcpdump` là có khả năng lọc các gói tin bắt được thông qua địa chỉ IP, port nguồn, đích, các giao thức...  

**4.1 Protocol**

Để lọc các gói tin bằng giao thức, ta sẽ chỉ định giao thức đó bằng dòng lệnh. Giả sử ở đây là giao thức icmp. 
```
sudo tcpdump -i any -c5 icmp
```
Ở cửa sổ terminal khác ta thực hiện ping đến 1 địa chỉ. Tôi sẽ ping đến google.com.  
```
ping google.com
PING google.com (216.58.199.110) 56(84) bytes of data.
64 bytes from hkg07s22-in-f14.1e100.net (216.58.199.110): icmp_seq=1 ttl=128 time=39.2 ms
```

Quan sát kết quả: `tcpdump` chỉ bắt và hiển thị những gói tin liên quan icmp.

<img src="https://i.imgur.com/XybEPJD.png">  

**4.2 Host**  
Giới hạn bắt chỉ những gói tin liên quan của host cụ thể thì ta sử dụng host đó.  
Ví dụ ở đây tôi chỉ bắt các gói tin liên quan đến host (đến và đi) `192.168.152.134`.  

<img src="https://i.imgur.com/Uazwzu1.png">  

**4.3 Port**  
Để lọc những gói tin dựa trên các service mong muốn hoặc port, sử dụng lọc `port`. Ví dụ bạn muốn bắt gói tin liên quan đến dịch vụ web (HTTP) thì sử dụng lệnh:  
```
# tcpdump -i any -c5 -nn port 80
```  

**4.4. Source IP/hostname**  
Bạn có thể lọc các gói tin dựa trên địa chỉ IP nguồn hoặc IP đích. Ở đây tôi bắt gói tin đi từ source `192.168.152.134`.  

<img src="https://i.imgur.com/r6g8XYQ.png">

**4.5 Biểu thức phức hợp**  
Bạn cũng có thể kết hợp các bộ lọc bằng cách sử dụng các toán tử logic `and`, `or` để tạo các biểu thức phức tạp hơn. Ví dụ: để lọc các gói từ địa chỉ IP nguồn 192.168.152.134 và chỉ dịch vụ HTTP, hãy sử dụng lệnh này:
```
# tcpdump -i any -c5 -nn src 192.168.152.134 and port 80
```  
Bạn có thể tạo nhiều biểu thức phức hợp bằng cách nhóm các bộ lọc vào dấu ngoặc đơn

```
# tcpdump -i any -c5 -nn "port 80 and (src 192.168.152.134 or src 54.204.39.132)"
```  
<a name="5"></a>
**5. Kiểm tra nội dung gói tin**  
Ở các ví dụ trước, chúng ta mới chỉ kiểm tra các header của gói tin như thông tin nguồn, đích, port. Đôi khi chúng ta cần tất cả những thông tin này để xử lý xự cố kết nối mạng nhưng cũng có lúc ta cần kiểm tra nội dung 
của gói để đảm bảo thông điệp ta đang gửi đi có chứa những gì ta cần hoặc những điều ta muốn nhận.  
Để quan sát nội dung gói tin, tcpdump cung cấp 2 flag bổ sung đó là: `-x`: in ra nội dung ở dạng mã hex và `ASCII` hoặc `-A: để in ra nội dung ở dạng mã ASCII.  
```
$ tcpdump -i any -c10 -nn -A port 80
```  
<img src="https://i.imgur.com/cOgpmQb.png"> 

Khi quan sát được nội dung của gói tin HTTP ta có thể dễ dàng hơn trong việc xử lý sự cố với các cuộc gọi API.   

<a name="6"></a>
**6. Lưu các capture vào một tệp** 
Tính năng hữu ích khác được cung cấp bởi tcpdump là có khả năng lưu trữ những capture vào trong một file vì vậy bạn có thể phân tích các kết quả sau này. 
Để lưu các gói tin bắt được vào một file ta sử dụng tùy chọn `-w`. Ở đây tôi ghi nội dung các gói tin bắt được vào file có tên là `capture_content.pcap`:  
Để đọc file ghi nội dung bắt gói tin, ta sử dụng tùy chọn `-r`:  
Bạn cũng có thể sử dụng bất kỳ bộ lọc nào mà ta đã tìm hiểu ở trên để lọc nội dung từ tệp, giống như bạn làm với dữ liệu thời gian thực. Ví dụ: kiểm tra các gói trong tệp chụp từ địa chỉ IP nguồn 192.168.152.134 bằng cách thực hiện lệnh này:
<img src="https://i.imgur.com/stoQyJT.png">  

