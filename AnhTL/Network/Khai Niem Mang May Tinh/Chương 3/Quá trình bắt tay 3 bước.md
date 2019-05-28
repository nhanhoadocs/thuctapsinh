# Quá trình bắt tay 3 bước (three way - handshake)
- Đầu tiên trước khi tìm hiểu về quá trình bắt tay 3 bước ta nên tìm hiểu các cờ (flag) được sử dụng trong quá trình này.

#### TCP Flag Options
- 1 TCP Segment mang theo dữ liệu trong khi những cái khác chỉ đơn giản là báo nhận cho dữ liệu nhận được trước đó. Quá trình bắt tay 3 bước sử dụng SYN và ACK có sẵn trong TCP giúp hoàn thiện kết nối trước khi dữ liệu được truyền.
Mỗi TCP Segment đều có mục đích và điều này được xác định với sự trợ giúp của TCP Flag Options, cho phép bên gửi hoặc bên nhận chỉ ra cờ nên được sử dụng để các Segment xử lý 1 cách chính xác ở phía bên kia. Ta hãy nhìn vào hình sau và cùng phân tích:

![img](http://3.bp.blogspot.com/-FkXHhJObUc0/UcZe7bjuMVI/AAAAAAAAAI4/6mYHyA44oBE/s1600/tcp-analysis-section-4-1.gif)

- Hình trên ta có thể thấy 2 cờ được sử dụng trong bắt tay 3 bước và truyền dữ liệu là SYN và ACK.
Với tất cả các cờ, giá trị bằng '1' được hiểu là cờ đấy đang được bật. Ví dụ trong hình chỉ có cờ SYN được bật, và chúng ta dựa vào đó đoán được đây là Segment đầu tiên của 1 kết nối TCP mới.
**Mỗi cờ có độ dài 1 bit và có 6 cờ tất cả nên tổng cộng TCP Flags có độ dài 6 bits.**
3 cờ phổ biến nhất hay ít nhất mà chúng ta có nghe nói tới là cờ SYN, cờ ACK và cờ FIN lần lượt dùng để thiết lập kết nối, báo nhận thành công và kết thúc kết nối. Các cờ còn lại ít được biết đến nhưng nó có vai trò rất quan trọng. Chúng ta sẽ đi tìm hiểu tất cả 6 cờ này ngay bây giờ.

  - **Cờ đầu tiên - Urgent Pointer.** Cờ này để xác định dữ liệu đến là "khẩn cấp" tức là nâng độ ưu tiên của Segment. Những Segment có cờ Urgent Pointer được bật không phải chờ đợi cho đến khi các Segment trước đó được xử lý mà được gửi trực tiếp và xử lý ngay lập tức.
  
  - **Cờ thứ 2 - ACKnowledgement.** Cờ ACK được sử dụng để xác nhận việc nhận thành công các gói tin. Khi client gửi yều cầu kết nối trong đó có cờ syn, Sau khi server nhận được cờ syn rồi thì sẽ phản hồi lại cho client 1 gói tin gồm có cờ syn và 1 cờ ACK đi sau nó để báo là đã nhận gói dữ liệu vừa nhận được.
 
  - **Cờ thứ 3 - PUSH.** Cờ PUSH giống như cờ Urgent Pointer, tồn tại để đảm bảo rằng các dữ liệu được ưu tiên và được xử lý tại nơi gửi hoặc nơi nhận. Cờ này cụ thể được sử dụng khá thường xuyên ở đầu và cuối của việc truyền dữ liệu, ảnh hưởng đến cách dữ liệu được xử lý ở cả 2 đầu. Khi sử dụng, cờ PUSH làm cho các Segment chắc chắn được xử lý 1 cách chính xác và ưu tiên thích hợp ở cả 2 đầu của kết nối.
  
    - Khi 1 máy muốn gửi dữ liệu của nó, nó tạm thời được cất trong bộ đệm TCP, 1 khu vực đặc biệt trong bộ nhớ, cho đến khi Segment đã đạt đến 1 kích thước nhất định và sau đó được gửi đến bên nhận. Thiết kế này đảm bảo rằng việc chuyển giao dữ liệu là hiệu quả nhất có thể mà không phải đợi thời gian và băng thông bằng cách tạo ra nhiều Segment, nhưng kết hợp chúng vào 1 hoặc nhiều cái lớn hơn.
    
  - **Cờ thứ 4 - Reset (RST).** Cờ RST là cờ được sử dụng khi 1 Segment đến mà không được dự định dùng trong kết nối hiện thời. Nói cách khác, nếu ta gửi 1 gói tin đến 1 máy chủ để thiết lập kết nối và không có dịch vụ nào chờ đợi để trả lời yêu cầu, máy chủ sẽ tự động gửi 1 gói tin trả lời với cờ RST được bật. Điều này chỉ ra rằng máy chủ đã thiết lập lại kết nối.
  
  - **Cờ thứ 5 - SYNchronisation.** Cờ thứ 5 trong TCP Flag Options có lẽ thường được sử dụng nhất trong truyền thông sử dụng TCP. Như chúng ta đã biết, cờ SYN được sử dụng để khởi tạo quá trình bắt tay 3 bước trong TCP.

  ![img](http://3.bp.blogspot.com/-YdnNrdrzWTE/UcZ0e9Dk9II/AAAAAAAAAJI/mFMItmh_z9M/s1600/tcp-analysis-section-4-2.gif)

  - Trong hình trên, Host A cần phải tải dữ liệu từ Host B sử dụng giao thức TCP. Quá trình bắt tay 3 bước được thực hiện trước khi việc truyền dữ liệu xảy ra. Trong quá trình bắt tay 3 bước, chúng ta thấy có tổng cộng 2 cờ SYN được truyền. Khi trao đổi dữ liệu và kết nối mới đã được tạo ra, chúng ta sẽ thấy nhiều cờ SYN được gửi và nhận.
  
  - **Cờ thứ 6 - FIN.** Cờ cuối cùng mà chúng ta nói đến ở đây là cờ FIN, viết tắt của từ FINished. Cờ này luôn xuất hiện khi các gói dữ liệu cuối cùng được trao đổi giữa 1 kết nối.
  
  - Một chú ý quan trọng là khi 1 máy gửi 1 cờ FIN để đóng kết nối, nó vẫn có thể tiếp tục nhận dữ liệu cho tới khi máy bên kia cũng thực sự đóng kết nối, mặc dù điều này chỉ xảy ra trong 1 số hoàn cảnh nhất định.
  
    - Thủ tục ngắt kết nối được thực hiện như sau:
    
     ![img](http://4.bp.blogspot.com/-Wv3F4Z50Htc/UcZ3BZkBKCI/AAAAAAAAAJY/GKrU18CWBqw/s1600/tcp-analysis-section-4-3.gif)

  - Hình trên thể hiện quá trình ngắt kết nối giữa máy A và máy B. Một khi việc truyền dữ liệu hoàn tất, máy A gửi 1 gói tin với cờ FIN và ACK được thiết lập. Tại thời điểm này, ứng dụng của máy A sẽ không nhận bất kỳ 1 dữ liệu nào nữa và sẽ đóng kết nối từ bên máy A.
  - Khi máy B nhận được yêu cầu đóng kết nối, máy B gửi 1 báo nhận ACK cho máy A để thông báo đã nhận được yêu cầu và thông báo cho ứng dụng ở máy B là ứng dụng bên máy A yêu cầu đóng kết nối. Khi 2 công việc này hoàn thành, máy B gửi 1 gói tin có cờ FIN và ACK được bật để đóng kết nối bên phía mình.
  - TCP hoạt động ở 2 hướng. Trong ví dụ, lưu lượng từ máy A đến máy B và ngược lại. Ngoài ra nó còn yêu cầu cả 2 bên đóng kết nối từ phía mình, do đó cả 2 bên đều gửi cờ FIN để báo rằng kết nối được đóng ở phía nó.
  - Bước cuối cùng, bước 4, máy A chấp nhận yêu cầu máy B gửi ở bước 3 và gửi báo nhận cho máy B, thủ tục đóng kết nối hoàn tất.
  
#### Dưới đây là hình tóm góm cách thức hoạt động của quá trình bắt tay 3 bước:
![img](http://4.bp.blogspot.com/_KfmgMzD_pv4/S_tB8jUYtDI/AAAAAAAAAA0/N16SMwFoWaA/s1600/tcp-1.jpg)

## END

