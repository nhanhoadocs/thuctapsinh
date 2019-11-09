# So sánh mô hình OSI và TCP/IP

## Mô hình TCP/IP

Giao thức [TCP/IP](https://www.totolink.vn/article/149-mo-hinh-tcp-ip-la-gi-chuc-nang-cua-cac-tang-trong-mo-hinh-tcp-ip.html)  được chia thành 4 tầng mạng:

- **Tầng ứng dụng**: Nhiệm vụ của tầng này đó là cung cấp các ứng dụng, trao đổi dữ liệu được chuẩn hóa. Trong tầng ứng dụng bao gồm nhiều giao thức cụ thể như HTTP, FTP, POP3, SMTP, SNMP. Mỗi giao thức này sẽ có chức năng và nhiệm vụ cụ thể.

- **Tầng mạng**: tầng này còn được gọi là tầng internet. Nhiệm vụ của tầng internet là xử lý các gói tin, sau đó kết nối với các mạng độc lập để vận chuyển các gói dữ liệu đã được mã hóa qua các ranh giới mạng. Tầng internet cũng bao gồm nhiều giao thức như giao thức IP, ICMP.

- **Tầng giao vận**: Nhiệm vụ của tầng giao vận là duy trì liên lạc đầu cuối trên toàn mạng. Tầng giao vận bao gồm giao thức TCP và UDP. Trong nhiều trường hợp giao thức UDP sẽ được thay thế TCP.

- **Tầng vật lý**: Các giao thức hoạt động trên tầng này là Ethernet, ARP. Đối với Ethernet thường sử dụng cho mạng cục bộ Lan.

![](https://imgur.com/ltnRuPb.png)

### Ưu điểm của mô hình TCP/IP

 - Ưu điểm thứ nhất khi sử dụng giao thức này là không thuộc hoặc chịu sự kiểm soát của bất kỳ công ty nào. Chính vì vậy khi sử dụng bạn có thể sửa đổi dễ dàng. Hơn hết, TCP/IP có khả năng tương thích với tất cả hệ điều hành, tất cả các loại phần cứng máy tính và mạng. Cho nên có thể giao tiếp với nhiều hệ thống khác nhau.

 - Ưu điểm thứ hai của giao thức TCP/IP chính là khả năng mở rộng cao. TCP/IP giống như một giao thức có thể định tuyến, thông qua mạng có thể xác định được đường dẫn hiệu quả nhất.

### Nguyên lý hoạt động của mô hình TCP/IP

 - Nguyên lý hoạt động của giao thức này là sự kết hợp giữa hai giao thức riêng biệt, đó là giữa giao thức kiểm soát truyền tin và giao thức internet. Đầu tiên giao thức IP sẽ cho phép các gói tin được gửi qua mạng bằng cách cho biết những gói tin này được gửi qua đâu và làm như thế nào.

 - Ngay sau khi được yêu cầu giao thức IP sẽ điều khiển truyền dẫn để giúp truyền những dữ liệu đáng tin cậy thông qua các kết nối mạng internet. Cuối cùng giao thức TCP sẽ kiểm tra lại các gói dữ liệu một lần nữa xem có lỗi và xảy ra vấn đề gì không. Nếu không có lỗi thì sẽ truyền đến vị trí cần thiết, trong trường hợp có lỗi thì sẽ gửi lại yêu cầu truyền lại.

## Mô hình OSI

 - Mô hình [OSI](https://www.totolink.vn/article/136-mo-hinh-osi-la-gi-chuc-nang-cua-cac-tang-giao-thuc-trong-mo-hinh-osi.html) hay còn được gọi là mô hình tham chiếu kết nối các hệ thống mở. Mô hình này đã được phát triển thành một phần trong kế hoạch Open Systems Interconnection do ISO và IUT-T khởi xướng.

 - Mô hình này chia giao tiếp mạng thành 7 lớp. Từ lớp 1 đến lớp 4 là những lớp thuộc cấp thấp và chỉ thực hiện các nhiệm vụ di chuyển dữ liệu. Những lớp từ 5 đến 7 thuộc những lớp cấp cao. Mỗi lớp này sẽ được thực hiện một nhiệm vụ đặc thù riêng mà sau đó sẽ chuyển tiếp dữ liệu đến lớp tiếp theo.

## So sánh mô hình OSI với mô hình TCP/IP 

![](https://imgur.com/MuMPDtd.png)

 - So với mô hình OSI thì giao thức TCP/IP được nhiều người tin cậy và sử dụng hơn. Bởi theo quan niệm thì mô hình OSI chỉ là mô hình cũ, công cụ để tham khảo. Ngược lại giao thức TCP/IP cho phép nới lỏng các quy tắc và cung cấp các nguyên tắc chung.

 - Nếu xét về phương pháp tiếp cận thì TCP/IP tiếp cận theo chiều ngang, còn OSI tiếp cận theo chiều dọc.

 - Điểm khác biệt lớn nhất giữa hai giao thức này có lẽ là sự kết hợp giữa các tầng với nhau. Đối với giao thức TCP/IP thì tầng phiên và tầng trình diễn được kết hợp với nhau trong tầng ứng dụng. Còn đối với mô hình OSI thì mỗi tầng khác nhau sẽ thực hiện một nhiệm vụ khác nhau.

 - Về thiết kế thì các giao thức trong TCP/IP được thiết kế trước rồi sau đó mới phát triển mô hình. Ngược lại trong OSI thì mô hình được phát triển trước sau đó mới phát triển giao thức.

