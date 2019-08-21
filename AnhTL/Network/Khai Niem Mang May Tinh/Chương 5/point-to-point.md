# Point-to-point (PPP)
- Point-to-Point Protocol (PPP) là một giao thức liên kết dữ liệu, thường được dùng để thiết lập một kết nối trực tiếp giữa 2 nút mạng. Nó có thể cung cấp kết nối xác thực, mã hóa việc truyền dữ liệu...
- PPP được sử dụng bằng nhiều kiểu mạng vật lý khác nhau, bao gồm cáp tuần tự (serial cable), dây điện thoại, mạng điện thoại, radio và cáp quang giống như SONET. Đa phần các nhà cung cấp dịch vụ Internet đều sử dụng PPP cho khách hàng để truy cập Internet. 
- Hai kiểu đóng gói dữ liệu của PPP là PPPoE (Point-to-Point Protocol over Ethernet) và PPPoA (Point-to-Point Protocol over ATM), chúng được sử dụng bởi các nhà cung cấp dịch vụ Internet để kết nối tới dịch vụ Internet.

#### 1. PPPoE (Point-to-Point Protocol over Ethernet)
- PPPoE là từ viết tắt của giao thức điểm-điểm trên Ethernet. PPPoE là một giao thức mạng có nguồn gốc từ một giao thức cũ hơn, được gọi là PPP, mà bạn đoán, là viết tắt của Giao thức điểm-điểm.
- PPPoE được thiết kế để quản lý cách dữ liệu được truyền qua mạng Ethernet (mạng cáp), và nó cho phép một kết nối máy chủ duy nhất được chia giữa nhiều máy khách, sử dụng Ethernet. Kết quả là, nhiều khách hàng có thể kết nối với cùng một máy chủ từ Nhà cung cấp dịch vụ Internet và truy cập internet, đồng thời. Để đơn giản hóa, PPPoE là một phiên bản hiện đại của các kết nối quay số cũ, được phổ biến trong những năm 80 và 90.
- PPPoE cũng có khả năng cung cấp các tính năng mạng cần thiết, như xác thực, mã hóa và nén dữ liệu.

**PPPoE được sử dụng để làm gì?**
- PPPoE chủ yếu được các nhà cung cấp dịch vụ internet sử dụng để cung cấp kết nối internet cho người đăng ký của họ. Để giúp bạn hiểu cách họ sử dụng PPPoE, đây là một ví dụ siêu thực về cách thức hoạt động của nó:

- Các kết nối quay số cũ như cuộc trò chuyện qua điện thoại giữa bạn và 1 người ở Công Ty Phần Mềm Nhân Hóa. Chỉ có hai người có thể tham gia vào cuộc trò chuyện. Tuy nhiên, nếu người đó muốn nói chuyện với tất cả các nhóm của bạn thì sao? Nếu cuộc hội thoại của bạn là kết nối quay số, tất cả các nhóm của bạn sẽ phải tập trung xung quanh tai nghe điện thoại tương tự. Nó sẽ làm cho một cuộc trò chuyện hài hước và không hiệu quả, phải không? Giao thức mạng PPP cũ hơn giống như vậy: chỉ có một kết nối duy nhất là có thể.

- PPPoE đã thay đổi điều đó và cho phép nhiều thiết bị khách sử dụng cùng một mạng để kết nối với một máy chủ duy nhất. Nó giống như 1 người ở Công Ty Phần Mềm Nhân Hòa nói với tất cả các nhóm của bạn, nhưng bạn sẽ có một loa để bạn không phải nghe xung quanh một tai nghe nhỏ.

- Đi xa hơn, PPPoE là một giao thức mạng cũng cung cấp các tính năng mạng cần thiết, như xác thực, mã hóa dữ liệu và nén dữ liệu. Do đó, PPPoE là một trong những phương tiện được ưu tiên nhất trong việc cung cấp truy cập internet.

**Cần những gì để thiết lập kết nối internet PPPoE?**
- Nếu Nhà cung cấp dịch vụ Internet của bạn sử dụng PPPoE, thì bạn cần ít nhất hai thứ, từ ISP:

  - Chỉ định cho bạn một ID (tên người dùng) và mật khẩu duy nhất.
  - Bộ định tuyến modem kết nối bạn với mạng của nhà cung cấp dịch vụ interne.t
- Nếu ISP của bạn không cung cấp cho bạn bộ định tuyến (bạn cũng không mua cho mình một bộ định tuyến), thì bạn phải cấu hình kết nối PPPoE theo cách thủ công, trên máy tính của bạn.

#### 2. PPPoA (Point-to-Point Protocol over ATM)
- Giao thức điểm-điểm qua ATM ( PPPoA ) là giao thức liên kết dữ liệu lớp 2 thường được sử dụng để kết nối modem với ISP qua đường dây điện thoại.

- Giao thức Point-to-Point trên ATM (PPPoA) đóng gói các khung bên trong ATM Adaption Layer 5. Máy ATM có nghĩa là chế độ chuyển không đồng bộ, một loại chuyển đổi sử dụng bộ chia kênh thời gian theo cách không đồng bộ.

- Nó cung cấp các tính năng PPP tiêu chuẩn như xác thực , mã hóa và nén . Nó cũng hỗ trợ (cũng như PPPoE).

- Nó cũng tránh các vấn đề mà PPPoEoE mắc phải, liên quan đến việc đôi khi cần sử dụng IP MTU từ 1492 byte trở xuống, thấp hơn 1500 byte tiêu chuẩn.

- Việc sử dụng PPPoA so với PPPoE không có ý nghĩa về mặt địa lý; thay vào đó, nó thay đổitùy theo nhà cung cấp.