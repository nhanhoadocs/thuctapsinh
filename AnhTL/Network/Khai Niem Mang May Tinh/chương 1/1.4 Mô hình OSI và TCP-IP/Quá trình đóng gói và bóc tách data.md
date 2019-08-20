# Quá trình đóng gói và tách data của mô hình TCP/IP

## 1. Quá trình đóng gói data
- Tại tầng 4 (Applicaiton) sẽ làm kiêm luôn nhiệm vụ của 2 tầng presentation và session của mô hình OSI, Nó sẽ gửi, định dạng dữ liệu, thiết lâp, duy trì phiên làm việc và sẽ được đóng thành các data và kèm theo 1 header. Rồi được chuyển xuống cho tầng Transport.
  - Tầng này thì có rất nhiều giao thức như:DNS,SMTP,FTP,POP3... mà em đã giới thiệu chi tiết ở bài trước.

- Tại tầng 3 (Transport) có 2 giao thức TCP và UDP sẽ làm nhiệm vụ (phân tách-segment) data và sẽ đưa toàn bộ các segment này vào TCP/UDP header và kèm theo data của tầng 4 để chuyển xuống tầng 2 - Internet.
  - Tầng này có 2 giao thức TCP và UDP mà em đã nói chi tiết ở bài trước.

- Khi xuống đến tầng 2 - Internet. Tầng này tương đương với tầng Network của mô hình OSI. Sẽ làm nghiệm vụ định tuyến (gói tin-packet) data mà tầng trên gửi xuống. Nên đi đường nào, đường nào tốt ưu nhất bằng cách xác định địa chỉ logic ( địa chỉ IP ) của máy nguồn/đích. Rồi tiếp tục gộp header và data của tầng trên thành 1 data to hơn và kèm theo IP header rồi gửi xuống cho tầng dưới.

- Xuống đến tầng 1 - Network Accesss. Tầng này làm kiêm nhiệm vụ của 2 tầng Data Link Và Physical của mô hình OSI. tầng này sẽ đóng data và header của tầng trên thành 1 Data khác. Tại tầng này có giao thức (ARP-Address Resolution Protocol) 
  - Giao thức ARP để chuyển đổi địa chỉ IPv4 sang địa chỉ MAC bằng cách gửi 1 bản tin ARP request đến tất cả các máy trong mạng LAN. Trong bản tin đó có chứa địa chỉ IP của máy đích, máy nào nhận được kiểm tra là đúng địa chỉ IP của máy mình thì sẽ gửi lại 1 bản tin ARP reply bao gồm địa chỉ MAC của máy đó. (Chi tiết em sẽ nói trong bài sau).
- Tầng này khi gộp data và header của tầng trên thành 1 data rồi và sau khi giao thức ARP có được địa chỉ MAC thì nó kèm theo 3 header đó là MAC header, LLC và header Mac CRC. 
  - Logical Link Control (LLC): Có nhiệm vụ bảo vệ lớp trên từ bất cứ phương pháp truy cập cụ thể nào hoặc truy cập đường truyền cụ thể nào. Các lớp trên không lo lắng về cách kết nối của chúng tới mạng Ethernet bởi vì LLC điều khiển giao diện này.

  - (MAC-Media Access Control ) MAC header thì để xác định chính xác ai là người nhận vì mỗi máy chỉ có 1 địa chỉ MAC duy nhất.

  - MAC CRC (Cyclic Redundancy Check) để kiểm tra và phát hiện lỗi.

- Toàn bộ data và header này sẽ được đóng gói thành 1 frame và độ dài của byte tùy thuộc vào dữ liệu được gửi và nó sẽ chuyển sang dạng bit (0,1) để truyền qua đường truyền vật lý.

    - Hình ảnh minh họa quá trình đóng gói data.
![img](https://s3.amazonaws.com/hs-wordpress/wp-content/uploads/2017/12/12223317/433_071.gif)

## 2. Quá trình bóc tách data.
Sau khi gửi sang bên người nhận thì việc bóc tách dữ liệu chỉ cần làm ngược lại khi đóng gói.

- Khi (Tầng 1 - Network Access) nhận được dữ liệu bên máy gửi thì nó sẽ giải mã các bit (0,1) rồi đưa lại thành 1 frame và dùng giao thức **MAC CRC** và **MAC Header** để kiểm tra lỗi và xác định xem ai là người nhận. sau khi kiểm tra xong thì nó sẽ loại bỏ 2 header này đi và gửi data và header còn lại lên tầng 2.
- Tầng 2 sau khi nhận được data và header của tầng 1 thì nó sẽ kiểm tra IP header để xác định đường đi đến người nhận. Sau khi xác định xong thì nó sẽ loại bỏ IP Header này đi và gửi data và header còn lại lên tầng 3 là tầng Transport.
- Tầng 3 Transport khi đã nhận được dữ liệu thì nó sẽ sử dụng header TCP/UDP để ghép các segment kia lại.
  - Đối với UDP thì sau khi nhận được dữ liệu và nó ghép xong thì nó sẽ không cần quan tâm đến là lỗi hay không. 
  - Còn TCP thì sẽ xác nhận từng segment và gửi phản hổi lại cho bên máy gửi là đã nhận rồi thì bên máy gửi mới tiếp tục gửi các segment tiếp theo cho đến khi không còn segment nào. 
  - Sau khi ghép dữ liệu xong 1 cách tuần tự thì nó sẽ loại bỏ header này và gửi data lên tầng tiếp theo là tầng Applicaiton.
- Tầng Applicaiton sau khi nhận được data từ lớp dưới thì nó chỉ có nhiệm vụ là chuyển toàn bộ data này cho máy nhận như thể trạng bạn đầu.

      ( Có thể tham khảo quy trình bóc tách hình trên )

