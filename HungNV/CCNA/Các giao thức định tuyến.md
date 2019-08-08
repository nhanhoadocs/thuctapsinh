# Các giao thức định tuyến (Routing protocol)
 #### Có các giao thức định tuyến như: 
  - Rip (Routing Information Protocol)
  - EIGRP (Enhanced Interior Gateway Routing Protocol)
  - OSPF (Open Shortest Path First)
  - BGP (BordeIGRP (Interior Gateway Routing Protocol)
  - IGRP (Interior Gateway Routing Protocol)
 ###### 2 giao thức định tuyến thông dụng nhất là Rip và OSPF.
**1.** Giao thức định tuyến RIP ( Routing Information protocol ) 
 Cho phép router trong 1 miền giao tiếp với nhau. Giá đường đi giữa hai thiết bị đầu cuối được xác định bằng số lượng các router trung gian trên đường đi đó. Độ dài tối đa của 1 tuyến đường là 15  
   - Truyền thông không tin cậy: Rip sử dụng giao thức udp để chuyển thông điệp 
 Gửi quảng bá broadcast và multicast 
   - Thuật toán distance vector : rip sử dung thuật toán distance vector. Các router hàng xóm trao đổi bảng định tuyến cho nhau 30s 1 lần trong các thông điệp rip, mỗi thông điệp chứa tối đa 25 địa chỉ đích tới.
   
**2.** Giao thức định tuyến OSPF (Open Shortest Path First)  
 - Định tuyến nội miền: Cho phép trao đổi thông tin giữa các router trong 1 miền.
   - Trao đổi các thông tin đã được kiểm chứng: Hai router trao đổi thông điệp OSPF với nhau có thể tiến hành thủ tục kiểm tra để xác định mình nhận được thông điệp đúng từ phía bên kia. Điều này ngăn ngừa được tin tặc tiến hành các cuộc tấn công bằng phương pháp gả mạo.
- Các bước tiến hành của OSPF:
   + Router tự bầu chọn cho mình 1 giá trị gọi là router id
   + Các cặp router id liên kêt trực tiếp với nhau thiết lập quan hệ láng giềng
   + Sau khi thiết lập quan hệ láng giềng, các router trong cùng 1 vùng sẽ trao đổi cơ sở dữu liệu, trạng thái đường đi với nhau 
   + Dùng giải tuật dijkstra để tính toán ra bảng định tuyến.
   
**3.** Giao thức định tuyến EIGRP(Enhance Interio Gateway Routing Protocol) 
* Ưu điểm: 
  - Đảm bảo hoạt động không bị lặp vòng khi tính toán đường đi, cho phép mọi router trong hệ thống mạng thực hiện đồng bộ cùng lúc khi có sự thay đổi xảy ra
  - Chỉ gửi thông tin cập nhật một phần và giới hạn chứ không gửi toàn bộ bàng định tuyến => tốn 1 lượng băng thông tối thiểu khi hệ thống mạng đã ổn định. EIGRP chỉ gửi thông tin cập nhật một phần cho router nào cần thông tin đó thôi chứ không gửi cho mọi router khác trong vùng. Gửi các gói hello theo định kỳ để duy trì liên lạc
  - Hỗ trợ VLSM và CIDA 
  - Cân bằng tải
  - Hỗ trợ tất cả các giao thức và cấu trúc dữ liệu ở layer 2
  - Hỗ trợ việc chứng thực 
  - Sử dụng trong mô hình mạng vừa và lớn
* Nhược điểm 
  -  Đây là giao thức độc quyền của cisco nên nó chỉ chạy trên thiết bị của cisco, trong khi không phải tổ chức nào cũng sử dựng toàn thiết bị của cisco
* Nguyên lý hoạt động
  - EIGRP lưu giữ các thông tin về đường đi trên ram, nhờ đó chúng đáp ứng nhanh chóng theo sự thay đổi, lưu giữ thông tin này thành từng bảng và từng cơ sở dữ  liệu khác nhau. 
  - Những router neighbor sẽ trao đổi thông tin lẫn nhau, cập nhật đầy đủ cấu trúc liên kết, topology mạng. Khi topoly mạng thay đổi nó sẽ cập nhật phần thay đổi.
  - Mỗi router sẽ tiên hành phân tích bảng EIGRP topology table, chọn ra con đường định tuyến có metric tốt để đến các subnet. Sau khi thực hiện các bước ở trên, hệ điều hành sẽ lưu bảng:
    + bảng láng giềng: Là bảng quan trọng nhất của EIGRP, trong đó có danh sách các router thân mật với nó. 
    + Bảng cấu trúc mạng: là bảng cung cấp dữ liệu để xây dựng nên bảng định tuyến của EIGRP. Thuật toán DUAL sẽ lấy thông tin từ bảng láng giềng và bảng cấu trúc để chọn đường có chi phí thấp nhất cho từng mạch đích. Bảng cấu trúc mạng chứa thông tin về tất cả các con đường mà router học được.
    
* Những thông tin chứa trong bảng cấu trúc:  
  - FD là thông tin địnht uyến nhỏ  nhất ma EIGRP tính được cho từng mạch đích
  - Router Sourch: Là nguồn phát khởi thông tin về một nguồn nào đó, phần thông tin này chỉ có đối với kết nối ngoài mạng EIGRP
  - RD: là thông số định tuyến đến 1 router láng giềng được thông báo qua
  - Thông tin về cổng giao tiếp mà router sử dụng để  đi đến mạch đich
  - Trạng thái đường đi: Trạng thái không tác động là trạng thái ổn định, sẵn sàng sử dụng được
  - Bảng định tuyến: Lưu giữu các danh sách các đường tốt nhất đến các mạng đích