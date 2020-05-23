# Raid
https://hostingviet.vn/cong-nghe-raid-raid-0-raid-1-raid-5-raid-10

https://quantrimang.com/tim-hieu-ve-raid-41762

## Khái niệm

RAID là viết tắt của Redundant Array of Inexpensive Disks (Hệ thống đĩa dự phòng). Đây là hệ thống hoạt động bằng cách kết nối một dãy các ổ cứng có chi phí thấp lại với nhau để hình thành một thiết bị nhớ đơn có dung lượng lớn hỗ trợ hiệu quả cao và đáng tin cậy hơn so với các giải pháp trước đây.

## Ưu điểm

Có 3 lý do chính để áp dụng RAID:

- Dự phòng
- Hiệu quả cao
- Giá thành thấp

Sự dự phòng là nhân tố quan trọng nhất trong quá trình phát triển RAID cho môi trường máy chủ. Dự phòng cho phép sao lưu dữ liệu bộ nhớ khi gặp sự cố. Nếu một ổ cứng trong dãy bị trục trặc thì nó có thể hoán đổi sang ổ cứng khác mà không cần tắt cả hệ thống hoặc có thể sử dụng ổ cứng dự phòng. Phương pháp dự phòng phụ thuộc vào phiên bản RAID được sử dụng.

Có 3 cấp độ RAID sử dụng cho hệ thống máy tính để bàn là RAID 0, RAID 1 và RAID 5.

## RAID 0

RAID 0 thực ra không phải là cấp độ RAID hợp lệ. Cấp độ 0 được đưa ra không thể cung cấp cấp độ dự phòng nào cho các dữ liệu được lưu trữ. Do vậy nếu một ổ cứng bị lỗi thì sẽ gây nguy hiểm cho dữ liệu.

RAID 0 sử dụng một kĩ thuật gọi là “striping”. “Striping” phân chia khối dữ liệu đơn như trong hình vẽ và trải chúng qua các ổ cứng. Tác dụng của striping là làm tăng hiệu quả thực thi. Có thể ghi được hai khối dữ liệu cùng lúc tới hai ổ cứng, hơn hẳn so với một ổ cứng như trước đây.

Dưới đây là ví dụ cho thấy dữ liệu đã được ghi vào RAID 0 như thế nào. Mỗi dòng trong biểu đồ biểu diễn một khối dữ liệu và mỗi cột biểu diễn một ổ cứng khác nhau. Những số trong bảng đại diện cho các khối dữ liệu. Các số giống nhau biểu thị một khối dữ liệu được lặp lại.

|               | Ổ cứng 1      | Ổ cứng 2 |
| ------------- |:-------------:| --------:|
| Khối 1        | 1             |    2     |
| Khối 2        | 3             |        4 |
| Khối 3        | 5             |        6 |

Do vậy, nếu cả 6 khối dữ liệu trong bảng kết hợp thành một file dữ liệu duy nhất thì có thể đọc và ghi tới các ổn cứng nhanh hơn nhiều so với đọc trên một ổ. Mỗi ổ khi hoạt động song song với nhau chỉ có thể đọc được 3 khối dữ liệu trong khi nó cần sử dụng thêm một ổ đơn để đọc hết 6 khối dữ liệu. Hạn chế của kĩ thuật này là nếu một ổ gặp sự cố thì dữ liệu sẽ không hoạt động. Cần phải truy cập tất cả 6 khối dữ liệu mới có thể đọc được dữ liệu nhưng chỉ có thể truy cập vào 3 khối.

Thuận lợi:

- Tăng hiệu quả lưu trữ.
- Không làm mất dung lượng dữ liệu.

Bất lợi:

- Không có ổ dự phòng.

**Đối tượng sử dụng:** Thích hợp với những dịch vụ cần lưu trữ và truy xuất với tốc độ cao. Chẳng hạn như dịch vụ video streaming, chạy cơ sở dữ liệu... (đối với hình thức lưu trữ này khuyến cáo nên có hình thức sao lưu backup.)

## RAID 1

RAID 1 mới là phiên bản thực sự đầu tiên. RAID cung cấp phương pháp dự phòng dữ liệu đơn giản bằng kĩ thuật “mirroring” (nhân bản dữ liệu). Kĩ thuật này cần 2 ổ cứng riêng biệt có cùng dung lượng. Một ổ sẽ là ổ hoạt động, ổ còn lại là ổ dự phòng. Khi dữ liệu được ghi vào ổ hoạt động thì đồng thời nó cũng được ghi vào ổ dự phòng.

Đây là ví dụ cho thấy dữ liệu được ghi vào RAID 1 như thế nào. Mỗi dòng trong biểu đồ biểu diễn một khối dữ liệu và mỗi cột biểu diễn một ổ cứng khác nhau. Những số trong bảng đại diện cho các khối dữ liệu. Các số giống nhau biểu thị một khối dữ liệu được lặp lại.

|               | Ổ cứng 1      | Ổ cứng 2 |
| ------------- |:-------------:| --------:|
| Khối 1        | 1             |    1     |
| Khối 2        | 2             |    2     |
| Khối 3        | 3             |    3     |

RAID 1 cung cấp một phiên bản dự phòng dữ liệu đầy đủ cho hệ thống. Nếu một ổ gặp sự cố, ổ còn lại vẫn còn hoạt động. Hạn chế của kĩ thuật này là dung lượng RAID chỉ bằng dung lượng nhỏ nhất của hai ổ cứng nếu như dung lượng lưu trữ trên hai ổ được sử dụng độc lập.

Thuận lợi:

- Cung cấp dự phòng dữ liệu toàn diện.

Bất lợi:

- Dung lượng lưu trữ chỉ lớn bằng dung lượng ổ nhỏ nhất.
- Không tăng hiệu suất thực thi.
- Nhiều thời gian chết để thay đổi ổ hoạt động khi có sự cố.

**Đối tượng sử dụng:** Các dịch vụ lưu trữ, các website vừa và nhỏ không yêu cầu quá cao về tốc độ đọc ghi (in/out) của ổ cứng. Các đối tượng yêu cầu sự an toàn về dữ liệu như các dịch vụ kế toán, lưu trữ thông tin khách hàng, bất động sản v.v…

## RAID 0+1

Đây là sự kết hợp RAID mà một số hãng sản xuất đã thực hiện để gộp các lợi ích của hai phiên bản lại với nhau. Sự kết hợp này chỉ áp dụng với các hệ thống có **ít nhất 4 ổ cứng**. Các kĩ thuật “mirroring” và “striping” kết hợp với nhau tạo ra hiệu quả dự phòng. Thiết lập đầu tiên của các ổ được kích hoạt và các dữ liệu sẽ được phân chia qua đó, thiết lập thứ hai sẽ phản chiếu những dữ liệu này sang ổ thứ hai.

Ví dụ sau cho thấy dữ liệu được ghi vào RAID 0+1 như thế nào. Mỗi dòng trong biểu đồ biểu diễn một khối dữ liệu và mỗi cột biểu diễn một ổ cứng khác nhau. Những số trong bảng đại diện cho các khối dữ liệu. Các số giống nhau biểu thị một khối dữ liệu được lặp lại.

|               | Ổ cứng 1      | Ổ cứng 2 |Ổ cứng 3 |Ổ cứng 4 |
| ------------- |:-------------:| --------:|--------:|--------:|
| Khối 1        | 1             |    2     |    1    |    2    |
| Khối 2        | 3             |    4     |    3    |    4    |
| Khối 3        | 5             |    6     |    5    |    6    |

Trong trường hợp này, các khối dữ liệu sẽ được phân chia qua các ổ và được phản chiếu giữa hai thiết lập. Hiệu quả thực thi của RAID 0 được tăng lên vì ổ cứng chỉ phải mất một nửa thời gian thực hiện so với một ổ riêng lẻ mà vẫn đảm bảo sự dự phòng. Hạn chế chính của phương pháp này là giá thành bởi nó cần phải có ít nhất 4 ổ cứng.

Thuận lợi:

- Tăng hiệu quả thực thi.
- Dữ liệu được dự phòng toàn bộ.

Bất lợi:

- Yêu cầu số lượng ổ cứng lớn.
- Khả năng truy xuất dữ liệu giảm một nửa.

## RAID 10 hay 1+0

RAID 10 gần giống như RAID 0+1. Thay vì phân chia dữ liệu giữa các thiết lập ổ đĩa rồi phản chiếu chúng thì hai ổ cứng đầu tiên sẽ được phản chiếu với nhau. Đây là thiết lập RAID lồng. Hai cặp ổ 1 và 2, 3 và 4 sẽ phản chiếu lẫn nhau. Sau đó chúng sẽ được thiết lập thành các dãy phân chia dữ liệu.

Dưới đây là một ví dụ cho thấy dữ liệu được ghi vào RAID 10 như thế nào. Mỗi dòng trong biểu đồ biểu diễn một khối dữ liệu và mỗi cột biểu diễn một ổ cứng khác nhau. Những số trong bảng đại diện cho các khối dữ liệu. Các số giống nhau biểu thị một khối dữ liệu được lặp lại.

|               | Ổ cứng 1      | Ổ cứng 2 |Ổ cứng 3 |Ổ cứng 4 |
| ------------- |:-------------:| --------:|--------:|--------:|
| Khối 1        | 1             |    1     |    2    |    2    |
| Khối 2        | 3             |    3     |    4    |    4    |
| Khối 3        | 5             |    5     |    6    |    6    |

Cũng thiết lập giống như RAID 0+1, RAID 10 cần tối thiểu là 4 ổ cứng để thực hiện chức năng của mình. Tuy nhiên dữ liệu được bảo vệ bằng RAID 10 an toàn hơn RAID 0+1 rất nhiều.

Thuận lợi:

- Tăng hiệu quả thực thi.
- Dữ liệu được dự phòng toàn bộ.


Bất lợi:

- Yêu cầu số lượng ổ cứng lớn.
- Khả năng truy xuất dữ liệu giảm một nửa.

**Đối tượng sử dụng:** Raid 10 thích hợp với tất cả các đối tượng sử dụng (từ những yêu cầu về hiệu suất đến việc đảm bảo an toàn dữ liệu).

## RAID 5

RAID 5 mạnh nhất cho hệ thống các máy để bàn. Đặc trưng của chúng là cần phải có một bộ điều khiển phần cứng quản lý các dãy ổ cứng nhưng một số hệ điều hành máy tính có thể thực hiện điều này qua các phần mềm. Phương pháp này sử dụng phân chia “parity” (chẵn lẻ) để duy trì dự phòng dữ liệu. Cần ít nhất 3 ổ cứng có năng xuất cao như nhau để áp dụng RAID 5.

“Parity” là là một phép toán nhị phân so sánh 2 khối dữ liệu với một khối dữ liệu thứ 3 dựa trên 2 khối đầu tiên. Cách giải thích đơn giản nhất là chẵn và lẻ. Nếu tổng của 2 khối dữ liệu là chẵn thì số bit là chẵn, nếu tổng của 2 khối dữ liệu là lẻ thì số bit là lẻ. Do đó phép toán 0+0 and 1+1 đều bằng 0 còn 0+1 or 1+0 sẽ bằng 1. Dựa trên phép toán nhị phân này, một ổ trong dãy bị trục trặc thì thì sẽ cho phép các bit “parity” khôi phục lại dữ liệu khi ổ đó được thay thế.

Sau đây là một ví dụ cho thấy dữ liệu được ghi vào RAID 5 như thế nào. Mỗi dòng trong biểu đồ biểu diễn một khối dữ liệu và mỗi cột biểu diễn một ổ cứng khác nhau. Những số trong bảng đại diện cho các khối dữ liệu. Các số giống nhau biểu thị một khối dữ liệu được lặp lại. “P” là các bit “parity” cho hai khối dữ liệu

|               | Ổ cứng 1      | Ổ cứng 2 |Ổ cứng 3 |
| ------------- |:-------------:| --------:|--------:|
| Khối 1        | 1             |    2     |    P    | 
| Khối 2        | 3             |    P     |    4    | 
| Khối 3        | P             |    5     |    6    |

Các bit “parity” luân chuyển giữa các ổ cứng sẽ làm tăng hiệu xuất và độ tin cậy cho dữ liệu. Dải ổ cứng vẫn sẽ tăng hiệu xuất thông qua một ổ riêng lẻ bởi vì nhiều ổ thì khả năng ghi dữ liệu sẽ nhanh hơn một ổ. Dữ liệu cũng được dự phòng toàn bộ nhờ các bit “parity”. Trường hợp ổ 2 bị lỗi thì dữ liệu có thể được phục hồi dựa trên dữ liệu và các bit trên hai ổ còn lại. Dung lượng dữ liệu giảm là do các khối dữ liệu chẵn lẻ. Trong thực tế nếu n là số lượng ổ và z là dung lượng thì ta có công thức sau:

**(n-1)*z = Dung lượng**

Trong trường hợp có 3 ổ cứng với dung lượng 500GB /ổ thì tổng dung lượng sẽ là (3-1)x500GB = 1000 GB

Thuận lợi:

- Tăng dung lượng lưu trữ
- Dữ liệu được dự phòng toàn bộ
- Khả năng hoán đổi nhanh 24x7

Bất lợi:

- Giá thành cao
- Hiệu quả thực thi giảm trong quá trình phục hồi

**Đối tượng sử dụng:** Tất cả những website, dịch vụ, ứng dụng có số lượng truy cập và yêu cầu tài nguyên từ nhỏ đến vừa và lớn.