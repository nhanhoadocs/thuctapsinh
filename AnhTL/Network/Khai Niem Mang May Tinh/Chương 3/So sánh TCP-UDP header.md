# So sánh UDP và TCP header

###### TCP (Transmission Control Protocol - "Giao thức điều khiển truyền vận" ) và UDP (User Datagram Protocol - "giao thức gói dữ liệu người dùng")  là hai lớp vận chuyển tiêu chuẩn được sử dụng với Giao thức Internet .

![img](https://www.lifewire.com/thmb/uw63pSPbgC9daiNgY5aXwXxF2aE=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/tcp-header-56a1adc85f9b58b7d0c1a24f.png)

- Cả TCP và UDP đều sử dụng các tiêu đề  như một phần của dữ liệu tin nhắn đóng gói để truyền qua các kết nối mạng. Mỗi tiêu đề TCP và các tiêu đề UDP chứa một tập các tham số được gọi là các trường  được xác định bởi các đặc tả kỹ thuật giao thức
#### Định dạng tiêu đề TCP
- Mỗi tiêu đề TCP có mười trường bắt buộc với tổng kích thước 20 byte (160 bit ). Chúng cũng có thể tùy chọn bao gồm một phần dữ liệu bổ sung có kích thước lên tới 40 byte.

- Các tiêu đề TCP xuất hiện theo trình tự sau:

      Số cổng TCP nguồn - Source port number (2 byte)
      Số cổng TCP đích - destination port number (2 byte)
      Số thứ tự - Sequence number (4 byte)
      Số xác nhận - ACKnowledgement number (4 byte)
      Dữ liệu TCP bù - data offset (4 bit)
      Dữ liệu dành riêng - reverved (3 bit)
      Cờ điều khiển - control flags (tối đa 9 bit)
      Kích thước cửa sổ - Window size (2 byte)
      Tổng kiểm tra TCP - Checksum (2 byte)
      Con trỏ khẩn cấp - Urgent pointer (2 byte)
      Dữ liệu tùy chọn TCP - optional data (0-40 byte)
      
- Các tiêu đề cung cấp thông tin cụ thể:

  - **Source port number và destination port number** Số cổng TCP nguồn và đích là điểm cuối giao tiếp để gửi và nhận thiết bị.
  
    VD: client từ 1024 - 65535. server từ 1 - 1023

  - **Sequence number** Người gửi tin nhắn sử dụng số thứ tự để đánh dấu thứ tự của một nhóm tin nhắn (segment).  Cả người gửi và người nhận đều sử dụng trường số xác nhận  để truyền đạt số thứ tự của tin nhắn được nhận gần đây hoặc dự kiến sẽ được gửi.
  
  - **Acknowledgement number** Nếu cờ ACK bật thì giá trị của trường chính là số thứ tự gói tin tiếp theo mà bên nhận cần.
  
  - **Data offset** Trường có độ dài 4 bít qui định độ dài của phần header (tính theo đơn vị từ 32 bít). Phần header có độ dài tối thiểu là 5 từ (160 bit) và tối đa là 15 từ (480 bít).

  - **reserved** Dữ liệu dự trữ trong các header TCP luôn có giá trị bằng 0. Trường này phục vụ mục đích căn chỉnh tổng kích thước tiêu đề (quan trọng đối với hiệu quả xử lý dữ liệu máy tính).
  
  - **control flags** TCP sử dụng một bộ sáu cờ điều khiển tiêu chuẩn và ba cờ mở rộng (mỗi bit riêng lẻ (0 là tắt, 1 là bật) đại diện cho bật hoặc tắt ) để quản lý luồng dữ liệu trong các tình huống cụ thể.

  - **Window size** Người gửi TCP sử dụng một số được gọi là kích thước cửa sổ để điều chỉnh lượng dữ liệu họ gửi đến người nhận trước khi yêu cầu xác nhận lại. Nếu kích thước cửa sổ trở nên quá nhỏ, việc truyền dữ liệu mạng sẽ chậm một cách không cần thiết, trong khi nếu kích thước cửa sổ quá lớn, liên kết mạng có thể bị bão hòa (không thể sử dụng cho bất kỳ ứng dụng nào khác) hoặc người nhận có thể không thể xử lý dữ liệu đến nhanh chóng (cũng dẫn đến hiệu suất chậm). Các thuật toán window được tích hợp trong giao thức sẽ tự động tính toán các giá trị kích thước và sử dụng trường tiêu đề TCP này để phối hợp các thay đổi giữa người gửi và người nhận.
  
  - **checksum** các giá trị bên trong một tiêu đề TCP được tạo ra bởi người gửi giao thức như một kỹ thuật để giúp người nhận phát hiện tin nhắn được hỏng hoặc giả mạo.
  
  - **Urgent pointer** Trường con trỏ khẩn cấp thường được đặt thành 0 và bị bỏ qua, nhưng kết hợp với một trong các cờ điều khiển, nó có thể được sử dụng làm phần bù dữ liệu để đánh dấu một tập hợp con của thông điệp cần xử lý ưu tiên.
  
  - **optional data** Việc sử dụng dữ liệu TCP tùy chọn bao gồm hỗ trợ cho các thuật toán xác nhận và mở rộng. Trường này cùng không thuộc về header. Giá trị của trường này là thông tin dành cho các tầng trên (trong mô hình 7 lớp OSI).
   
#### Định dạng tiêu đề UDP

![img](https://www.gatevidyalay.com/wp-content/uploads/2018/10/UDP-Header.png)
- Vì UDP bị hạn chế đáng kể về khả năng so với TCP, nên các tiêu đề của nó nhỏ hơn nhiều. Một header UDP chứa 8 byte, được chia thành bốn trường bắt buộc sau:

      Số cổng nguồn - Source Port (2 byte)
      Số cổng đích - Destination Port (2 byte)
      Độ dài của dữ liệu - Length (2 byte)
      Tổng kiểm tra UDP - Checksum (2 byte)
  
  - **Source.** Trường này xác định cổng của người gửi thông tin và có ý nghĩa nếu muốn nhận thông
tin phản hồi từ người nhận. Nếu không dùng đến thì đặt nó bằng 0.

  - **Destination Port.** Số cổng UDP nguồn và đích là điểm cuối giao tiếp để gửi và nhận thiết bị (như TCP.)
  
  - **Length.** Trường này có độ dài 16 bit xác định chiều dài của toàn bộ datagram: phần header và dữ liệu. Chiều dài tối thiểu là 8 byte khi gói tin không có dữ liệu, chỉ có header.

  - **Checksum.** Tương tự như TCP, tổng kiểm tra UDP  cho phép người nhận kiểm tra chéo dữ liệu đến cho bất kỳ bit bị hỏng nào của tin nhắn.

#### Tóm lại UDP và TCP header khác nhau khá nhiều như:


- Số thứ tự - Sequence number (4 byte) 
  - TCP có đánh số thứ tự các segment còn UDP không có. đó là nguyên do khiến dữ liệu không được gửi đến máy chủ 1 cách tuần tự.
  
- Số xác nhận - ACKnowledgement number (4 byte)
  - server sẽ gửi lại 1 bản tin ACK phản hồi lại sau khi client gửi yêu cầu kết nối đến. Đây là cũng là quá trình bắt tay 3 bước trước khi gửi dữ liệu.
  - UDP thì không có tính xác nhận này. client cứ gửi gói tin đến mà không báo trước cho server là sẽ gửi, gửi 1 cách bừa bãi.
  
- Dữ liệu TCP bù - data offset (4 bit)
  - Khi dữ liệu chưa được gửi 1 đến đầy đủ hoặc bị lỗi tại 1 segment nào đó thì TCP sẽ bù bằng cách lấy dữ liệu dành riêng để gửi lại cho segment đấy.  
  - UDP không có cái này.
  
- Dữ liệu dành riêng - reverved (3 bit)
  - TCP có.
  - UDP không có.
  
- Cờ điều khiển - control flags (tối đa 9 bit)
  - TCP sẽ sử dụng các cờ này để làm quá trình bắt tay 3 bước trước khi gửi data.
  - UDP không có cờ này. 
   
- Kích thước cửa sổ - Window size (2 byte)
  - Người gửi TCP sử dụng cái này để điểu chỉnh dữ liệu họ gửi đến người nhận trước khi yêu cầu xác nhận lại. 
  - Các thuật nào trong window size này được tích hợp trong giao thức, sẽ tự động tính toán các giá trị, kích thước dữ liệu để phối hợp các thay đổi giữa người gửi và nhận.
  - UDP không có.

- Con trỏ khẩn cấp - Urgent pointer (2 byte)
  - TCP có.
  - UDP không có.
  
- Dữ liệu tùy chọn TCP - optional data (0-40 byte)
  - TCP có.
  - UDP cũng có thể có hoặc không.
  
## END
