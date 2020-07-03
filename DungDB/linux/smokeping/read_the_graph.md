# Cách đọc biểu đồ smokeping

Smokeping là một công cụ đo độ trễ. Nó gửi các gói kiểm tra ra mạng và đo lượng thời gian chúng cần để đi từ nơi này sang nơi khác và quay trở lại.

RTT (round trip time) là thời gian tính từ khi smokeping gửi gói tin đến khi nhận được lại gói tin. 

Với mỗi vòng đo, smokeping gửi đi vài gói tin. Sau đó sắp xếp các thời gian khứ hồi (round trip time / RTT) khác nhau và chọn số trung bình / số ở giữa (median). Có nghĩa là khi có 10 giá trị thời gian, giá trị thứ 5 sẽ được chọn. Các giá trị khác sẽ được vẽ dưới dạng màu xám nhạt liên tiếp ở nền.

Đôi khi các gói test được gửi đi nhưng không quay trở lại. Đây gọi là mất gói tin (packet-loss). Màu săc của đường số trung bình thay đổi theo số lượng gói bị mất.

Tất cả các thông tin này sẽ thể hiện tình trạng sức khỏe của mạng (network health). Ví dụ, mất gói tin là một điều không đột nhiên xảy ra. Nó có thể do thiết bị trong mạng bị quá tải hoặc một lỗi cấu hình router. 

Biến động nhiều của giá trị RTT (round trip time) cũng biểu thị mạng bị quá tải. Nó hiển thị trên biểu đồ giống như khói, càng nhiều khói thì càng nhiều biến động.

Smokeping không chỉ giới hạn trong việc kiểm tra RTT của các gói tin. Nó còn có thể thực hiện các task tại đầu xa (remote end), ví dụ như tải một trang web. Điều này sẽ cho ra một "bức tranh" về tính khả dụng của web server và tình trạng sức khỏe của mạng.

## Biểu đồ tổng quan

![Imgur](https://i.imgur.com/u4FZSt0.png)

Biểu đồ tổng quan hiển thị các phép đo hiện tại cho mục tiêu. Nếu mục tiêu đang được đo bởi cả master lẫn slave thì dữ liệu từ cả hai sẽ được hiển thị.

- av md: average median () 
- av ls: average loss (tổn thất trung bình). Số lượng gói tin bị mất trung bình
- av sd: average standard deviation of the multiple measurements in each round (độ lệch chuẩn trung bình của nhiều phép đo trong mỗi vòng)
- am/as: tỉ lệ của average median và average standard deviation

## Biểu đồ chi tiết

![Imgur](https://i.imgur.com/LIZwkZz.png)

Dòng có màu miêu tả số lượng gói tin mất và vùng tối xung quanh đường kẻ cho thấy mức độ biến đổi giữa các probe riêng lẻ. Ta có thể zoom trong biểu đồ này.

- avg, max, min, now: average, maximum, minimum, current median
- sd: standard deviation of the median. Sai lệch chuẩn của số trung bình
- am/s: tỉ lệ của average median và standard deviation

## Biểu đồ multihost

![Imgur](https://i.imgur.com/cRo5nzd.png)

- av md: average median RTT
- av ls: average loss (trung bình cộng số lượng gói tin mất của các host)
- av sd: độ lệch chuẩn trung bình của nhiều phép đo trong mỗi vòng
- am/as: tỉ lệ của average median và average standard deviation

Tham khảo: 

https://oss.oetiker.ch/smokeping/doc/reading.en.html

Ví dụ: 

Hệ thống test đã dựng, biểu đồ tổng quát ví dụ:

![Imgur](https://i.imgur.com/tMyKx8W.png)

Cột dọc là RTT. Đơn vị sẽ là ms (mili giây) hoặc us (micro giây)

- 1s = 1.000 ms
- 1s = 1.000.000 us

Hàng ngang là thời gian trong ngày, trong tháng, trong năm.

Các thông số bên dưới:

- **median RTT** là giá trị RTT **điển hình**, **phổ biến** trong biểu đồ. Màu xanh là màu hiển thị cho host này. Thông tin chi tiết hiển thị trong biểu đồ chi tiết.

- **average median** là av md, trong biểu đồ trên là 697us. Tất cả các median trong biểu đồ này có giá trị trung bình là 697us.

- **average loss** là trung bình cộng các gói tin bị mất là 0.1%.

- **Tỉ lệ average median và average deviation**: chưa hiểu ý nghĩa để làm gì

Biểu đồ ví dụ 2: Biểu đồ chi tiết

![Imgur](https://i.imgur.com/tqVaiAL.png)

- **median RTT** là giá trị RTT điển hình, phổ biến trong biểu đồ. Mỗi chấm xanh là một giá trị median. Cột chứa dấu chấm đó là 1 lần đo. Phần màu xám hoặc màu đen là các giá trị khác của lần đo. Màu xám càng đậm thì mạng càng không ổn định. Cột càng cao thì thời gian RTT càng cao.

- Ở đây có các giá trị chi tiết hơn như trung bình cộng med RTT, max med RTT, min med RTT, và med RTT hiện tại.

- Tương tự như trên có các giá trị trung bình cộng, max, min, now cho số gói tin bị mất

- Màu sắc thể hiện số gói tin bị mất trong các lần đo.

- Probe: Phương pháp thăm dò (Dùng mặc định là FPing)