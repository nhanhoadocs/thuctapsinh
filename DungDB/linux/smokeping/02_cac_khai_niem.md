# Các khái niệm 

## Probe (Thăm dò)

Trong smokeping có nhiều loại probe khác nhau nhưng để cho đơn giản, chúng ta dùng probe mặc định là FPing (ping đến toàn bộ các host). 

Trong biểu đồ trên thì FPing sẽ gửi 20 gói tin đến host cần thăm dò trong 5 phút. Có thể cấu hình chỗ này tùy ý. 

Trong hệ thống test, gửi 20 gói trong mỗi phút.

## RTT (Round trip time)

RTT (round trip time) là thời gian tính từ khi gửi gói tin đến khi nhận được lại gói tin.

Ví dụ

![Imgur](https://i.imgur.com/RkMXYk4.png)

Lệnh ping gửi gói tin đến google.com và phải mất 53 mili giây để google.com gửi lại gói tin.

## Packet loss (mất gói tin)

Lệnh FPing gửi các gói tin đến host, nếu các host đó không gửi lại gói tin thì sẽ tính là mất gói tin. 

Các màu sắc khác nhau thể hiện số lượng gói tin bị mất khác nhau. (Ví du như Xanh lá: không mất gói nào/20 gói, Lam nhạt: mất 1 gói/20, Tím: mất 10 gói/20, Đỏ: mất 19 gói/20)

## Average (Trung bình cộng)

Khái niệm này mọi người đều đã hiểu.

## Median (số trung vị)

Giải thích dễ hiểu:

Giả sử có 19 người nghèo và 1 tỉ phú trong một căn phòng. Mọi người đều bỏ tất cả tiền trong túi mình ra và đặt lên một cái bàn. Mỗi người nghèo đặt 5 đồng lên bàn; người tỉ phú đặt 1 tỷ đồng (109 đồng) lên đó. Khi đó, tổng số là 1.000.000.095 đồng. Nếu đem chia đều số tiền đó cho 20 người, mỗi người được 50.000.004 đồng và 75 xu. Số tiền đó là trung bình cộng của số tiền mà mỗi người đã đem vào phòng. Nhưng số trung vị lại là 5 đồng, vì ta có thể chia thành 2 nhóm mỗi nhóm 10 người, và nói rằng mọi người trong nhóm thứ nhất mang không nhiều hơn 5 đồng và mọi người trong nhóm thứ hai mang không dưới 5 đồng. Theo nghĩa đó, số trung vị là số tiền mà một người **điển hình** mang tới. Ngược lại, giá trị trung bình không điển hình chút nào, do không có ai - người nghèo hoặc tỉ phú - mang đến một số tiền xấp xỉ 50.000.004,75 đồng.

Theo đó, có thể hiểu trong biểu đồ smokeping thì median RTT là giá trị RTT điển hình thường thấy trong biểu đồ.

![Imgur](https://i.imgur.com/tqVaiAL.png)

Trong biểu đồ trên thì median RTT là 11.6 ms

**Chú ý:**

Một lần đo (1 lần thăm dò) trong hệ thống test là 20 gói/phút. Mỗi lần đo sẽ có  median, packet loss, standard deviation khác nhau. **Average median** có nghĩa là lấy trung bình cộng của các median của nhiều lần đo.

## Standard deviation (Độ lệch chuẩn)

Khái niệm này khá khó hiểu. Độ lệch chuẩn là căn bậc hai của phương sai cho biết bình quân giá trị của các lượng biến cách giá trị trung bình chung là bao nhiêu đơn vị. 

Giải thích cho dễ hiểu:

Độ lệch chuẩn càng lớn thì biểu đồ càng nhiều biến động => mức độ ổn định của mạng không cao.

**average loss** là trung bình cộng số gói bị mất trong nhiều lần đo

**average standard deviation** trung bình cộng của độ lệch chuẩn trong nhiều lần đo

## Tỷ lệ của average median và standard deviation

am/s

Phần này chưa hiểu