MẠNG MÁY TÍNH 
I. Network
1. Các khái niệm cơ bản
- Mạng ( networking): chỉ khái niệm kết nối các thiết bị lại với nhau nhằm mục đích chia sẻ thông tin. Khái niệm mạng liên quan đến nhiều vấn đề, bao gồm :
 + Giao thức truyền thông (protocol): mô tả những nguyên tắc mà tất cả các thành phần cần tuân thủ để có thể trao đổi với nhau
 + Topo ( mô hình ghép nối mạng/ hình trạng mạng): mô tả cách thức nối các thiết bị với nhau
 + Địa chỉ: mô tả cách thức định vị một đối tượng trên mạng
 + Định tuyến (routing): mô tả cách thức truyền dữ liệu từ thiết bị này sang thiết bị khác 
 + Tính tin cậy ( reliability): giải quyết tính toàn vẹn của dữ liệu, đảm bảo dữ liệu được nhận chính xác như dữ liệu được gửi đi
 + Khả năng liên tác (interoperability): chỉ mức độ các sản phẩm phần mềm và phần cứng của hãng sản xuất khác nhau có thể làm việc cùng nhau
 + An ninh (securiity): đảm bảo an toàn haowjc bảo về tất cả các thành phần của mạng
 + Chuẩn (standard): thiết lập các quy tắc và luật lệ cụ thể cần phải tuân theo
=> Mạng máy tính là tập hợp các máy tính và các thiết bị phụ trợ khác dử dụng chung một nhóm giao thức để chia sẻ tài nguyên thông qua các phương tiện truyền thông mạng.
2. Phân loại mạng máy tính 
a. Phân loại theo diện hoạt động
- LAN (local area network) - mạng cục bộ : liên kết các tài nguyên máy tính trong một vùng địa lí có kích thức hạn chế như một phòng, vài phòng, .... Theo IEEE xác định bán kính của LAN nhỏ hơn 10km
- WAN (wide area network) - mạng diện rộng: liên kết các tài nguyên máy tính trong một vùng địa lí có bán kính trên 100km. Có thể coi mạng WAN gồm nhiều mạng LAN khác nhau 
- MAN ( metropolitan area netwwork) - mạng đô thị: liên kết các tài nguyên máy tính trong một thành phố. MAN có bán kính lớn hơn LAN nhưng lại nhỏ hơn WAN
- PAN (personal area network) - mạng cá nhân: chỉ mạng máy tính nhỏ sử dụng trong gia đình.
- GAN ( gobal area network) - mạng toàn cầu: là mạng của các WAN trải rộng trên phạm vi toàn cầu.
b. Phân loại theo mô hình ghép nối
- Point-to-point ( điểm - điểm): gồm nhiều nút , mỗi nút chỉ liên kết với một nút liền kề nó. Nếu một nút muốn liên kết với nút không liền kề thì nút đó phải liên kết thông qua rất nhiều nút khác 
 + Star ( hình sao) : có một hub xử lí trung tâm - hub này là trung tâm truyền tin cho tất cả các nút
  ![Mô hình sao](https://imgur.com/dTRyDR9.png)
 + Tree ( cây ) : là mô hình phân cấp gồm một nút gốc hoặc hub nối đến các nút mức hai hoặc ba, các thiết bị mức hai lại được nối đến các thiết bị mức ba, mức bốn,..
  ![Mô hình Cây](https://imgur.com/eGVZGej.png)
- Broadcast ( điểm - nhiều - điểm): mô hình này gốm các nút dùng chung một kênh truyền thông, dữ liệu từ một máy gửi đi sẽ được truyền đến tất cả các nút tham gia kênh dùng chung. Các máy sẽ kiểm tra xem liệu có phải là đích đến của thông điệp nhận được hay khoogn bằng các hkieemr tra địa chỉ đến của thông điệp. Các máy không phải là đích của thông điệp sẽ ỏ qua thông điệp. mô hình phổ biến là bus và ring
  ![Mô hình Bus](https://imgur.com/oIslHLG.png)
  ![Mô hình Ring](https://imgur.com/8kKYQwq.png)
- Mutildrop ( đa chặng) 

