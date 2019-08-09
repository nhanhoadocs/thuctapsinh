# Chương 3: Tầng giao vận
###### Dịch vụ dồn kênh, phân kênh
  - Công việc chuyển dữ liệu trong segment tới đúng tiến trình dữ liệu gọi là phân kênh
  - Tại thiết bị gửi, tầng giao vận nhận dữ liệu từ nhiều tiến trình ứng dụng khác nhau, tạo segment chứa dữ liệu cùng với một số thông tin tiêu đề và cuối cùng chuyển segment xuống tầng mạng, quá trình này gọi là dồn kênh
##### **1.** TCP ( Tranmission Control protocol )
Là một giao thức quan trọng được sử dụng trong việc truyền dữ liệu qua một mạng nào đó. Một giao thức trong phạm vi mạng là một tập hợp các quy tắc và trình tự kiểm soát việc thực hiện truyền dữ liệu sao cho tất cả mọi người trên thế giới bất kể vị trí địa lý, bất kể ứng dụng, phần mềm họ đang sử dụng đều có thể thao tác theo cùng 1 phương thức giống nhau được gọi là TCP
* TCP kiểm soát độ tin cậy của việc truyền dẫn
* Là giao thức kết nối
* Hỗ trợ cơ chế Full duplex ( truyền và nhận cùng 1 lức )
* Cung cấp cơ chế đánh số gói tin; để ráp các gói tin đúng ở điểm nhận
* Phục hồi dữ liệu bị mất ( A gửi cho B mà không thấy xác nhận sẽ bắt đầu tiến trình gửi lại)
* Giao thức TCP có khả năng định tuyến 
* TCP đảm bảo dữ liệu tới đích trong thời gian xác định, mỗi gói tin nhận được sẽ được gửi thông báo xác nhận
* Tcp cung cấp khả năng kiểm soát lỗi và lưu lượng
###### Nhiệm vụ của TCP
+ Kiểm soát mức độ tin cậy của việc truyền dữ liệu
+ Dữ liệu được truyền theo dạng gói tin ( phân thành các gói tin), các gói này là cụm dữ liệu được truyền hoàn toàn độc lập trên mạng, được hợp lại khi chúng đến địa chỉ đích và được trả lại dữ liệu gốc.
+ TCP chịu trách nhiệm hoàn toàn trong quá trình truyền tải
+ Tất cả gói tin đều tới đích, không có gói nào bị sót hay thất lạc
+ TCP có cơ chế sửa lỗi như Stop and Wait, go back và Repeat để phát hiện và Retransmission.
+ TCP sử dụng Flow control để điều khiển tốc độ đẩy data từ Client lên Server và tốc độ Response từ server tới client

##### **2.** UDP ( User Datagram Protocol ) 
Là giao thức không kết nối
+ Kiểm soát đường truyền được sử dụng chủ yếu để thiết lập các kết nối có độ trễ thấp và không chịu lỗi giữa các ứng dụng internet
+ UDP chạy phía trên lớp giao thức mạng (IP) và đôi khi được biết đến như là TCP/IP hoặc UDP/IP ( 2 khái niệm này lại trái ngược nhau)
+ UDP gửi đi các thông điệp được gọi là các Datagram ( gói dữ liệu ) và được xem là phương thức giao tiếp trực tiếp tốt nhất.
+ UDP không cung cấp khả năng kiểm soát lỗi và lưu lượng
+ UDP được coi là giao thức không kết nối bởi UDP không cần đến 1 mạch điện ảo để thiết lập trước khi truyền dữ liệu
+ UDP cung cấp 2 service không được lớp IP hỗ trợ: một là số port giúp phân biệt các yêu cầu khác nhau từ user và một dịch vụ checksum( tùy chọn ) để xác minh dữ liệu đến còn nguyên vẹn.
+ UDP được sử dụng là một giao thức lý tưởng cho các ứng dụng mạng mà trong đó độ trễ là 1 yếu tố tối quan trọng như trong giao tiếp game, âm thanh, video.
+ Không có cơ chế phục hồi dữ liệu ( không quan tâm gói tin có đến đích hay bị mất )
+ Là loại giao thức Connection less ( nghĩa là có gói tin nào là đẩy ngay vào đường truyền mà không cần thiết lập kết nối trước )
+ Dữ liệu truyền đi dưới dạng datagram
###### Cơ chế bắt tay 3 bước của tcp:
Tcp bằng cách gửi gói tin ACK từ máy đích sang máy nhận, trong suốt quá trình truyền gói tin, máy gửi yêu cầu máy đích xác nhận đã nhận đủ các gói tin đã gửi, nếu cí gói tin bị mất, máy đích sẽ yêu cầu máy gửi gửi lại, thường xuyên kiểm tra gói tin có bị lỗi hay không, ngoài ra còn cho phép quy định số lượng gói tin được gửi trong 1 lần gửi, điều này đảm bảo máy nhận nhận được đầy đủ các gói tin mà máy gửi gửi đi.
- cải thận tốc độ gửi `window size`
> sự giống nhau của tcp và udp: đều sử dụng để gửi các bit dữ liệu (các gói tin), được xây dựng trên giao thức ip (gói này được gửi đến 1 địa chỉ ip)

