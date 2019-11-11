# NFS (Network File System)
### 1. Giới thiệu và cách hoạt động
 #### Giới thiệu :   
NFS là một trong những phương pháp được sử dụng để chia sẻ dữ liệu trên các hệ thống vật lý.  
Được phát triển bởi SunMicrosystems và năm 1984, cho phép người dùng xem, tùy chọn lưu trữ và cập nhật trên máy tính từ xa.  
Sử dụng TCP và UDP để truy cập và phân phối dữ liệu tùy thuộc vào phiên bản được sử dụng.   
Cơ chế hệ thống tệp cho phép lưu trữ và truy xuất dữ liệu từ nhiều đĩa và thư mục.   

 #### Cách hoạt động :
 
 Để truy cập dữ liệu được lưu trữ trên 1 máy chủ, server sẽ triển khia các quy trình nền NFS để cung cấp dữ liệu cho khách hàng. Quản trị viên máy chủ xác định những gì cần cung cấp và đảm bảo có thể nhận ra các máy khách được xác nhận.  
 Từ client, yêu cầu quyền truy cập vào dữ liệu đã xuất, bằng cách sử dụng lệnh mount.
 
 Server NFS tham chiếu tệp cấu hình /etc/export để xác định xem máy khách có được phép truy cập vào bất kỳ hệ thống nào không. Sau khi xác minh, tất cả hoạt động tập tin và thư mục được phép sử dụng trên Client
 
 **1. Mô hình truy cập từ xa** :  
 
 ![Imgur](https://i.imgur.com/yMjslcT.png)  
 Client sẽ gửi yêu cầu từ xa để truy cập file trên Server
 
 **2. Mô hình tải lên tải xuống** :
 
 ![Imgur](https://i.imgur.com/5GyjrIP.png)  
 Client sẽ tải xuống old file để truy cập và thực hiện trên client, khi client thực hiện xong, file sẽ được tải về server.
 
### 2. Các phiên bản
- NFSv2: Tháng 3 năm 1989
  - Có thể sử dụng cả TCP và UDP qua mạng IP ( cổng 2049 )
  - Ban đầu chỉ hoạt động trên UDP  
- NFSv3: Tháng 6 năm 1995
     - An toàn và mạnh mẽ hơn khi xử lý lỗi so với v2
     - Sử dụng cả TCP và UDP qua cổng 2049
     - Vẫn là phiên bản được sử dụng rộng rãi nhất  
- NFSv4: Tháng 4 năm 2003  
     -  Hoạt động thông qua tường lửa và trên internet  
     - Hỗ trợ ACL ( Danh sách các câu lệnh chỉ ra loại packet nào được chấp nhận, hủy bỏ dựa vào địa chỉ nguồn, đích hoặc số port)  
     - Sử dụng giao thức TCP là bắt buộc    
- NFSv4.1: Tháng 1 năm 2010 
   - khả năng cung cấp quyền truy cập song song có thể mở rộng vào các tệp được phân phối giữa nhiều máy chủ
- NFSv4.2: Tháng 11 năm 2016
    - Sao chép và sao chép phía máy chủ
     - Một lợi thế lớn của NFSv4 so với các phiên bản trước đó là chỉ có một cổng IP được sử dụng để chạy dịch vụ, giúp đơn giản hóa việc sử dụng giao thức trên tường lửa.
### 3. Ưu, nhược điểm
 **Ưu điểm** :
   - NFS là 1 giải pháp chi phí thấp để chia sẻ tệp mạng.
   - Dễ cài đặt vì nó sử dụng cơ sở hạ tầng IP hiện có
   - Cho phép quản lý trung tâm, giảm nhu cầu thêm phần mềm cũ và dụng lượng đĩa trên các hệ thống người dùng cá nhân    
   
**Nhược điểm** :  
   - NFS vốn không an toàn, chỉ nên sử dụng trên 1 mạng đáng tin cậy sau Firewall 
   - NFS bị chậm trong khi lưu lượng mạng lớn 
   - Client và server tin tưởng lần nhau vô điều kiện 
   - Tên máy chủ có thể là giả mạo (tự xưng là máy khác)
### 4. Các leyers NFS

![Imgur](https://i.imgur.com/YYGPHHP.png)

- RPC leyer: Chuyển giữ liệu giữa các máy chủ [RFC 3010]
- XDR layer: Cung cấp tính độc lập của dữ liệu cho máy [RFC 1832]
- Lớp trên cùng bao gồm giao thức mount và giao thức NFS

### 5. Architecture

![Imgur](https://i.imgur.com/Ag8fxF3.jpg)

**Phía client:** 
 - Client truy cập file system bằng các cuộc gọi hệ thống (system call)
 - Giao diện hệ thống UNIX được thay thế bằng giao diện cho hệ thống tệp ảo (VFS) (các hệ điều hành hiện đại đều cung cấp VFS) 
 - Các hoạt động trên giao diện VFS được chuyển đến hệ thống tệp cục bộ (Local file) hoặc được chuyển đến 1 thành phần riêng biệt gọi là NFS Client 
 - NFS client đảm nhieemh việc xử lý quyền truy cập vào các tệp được lưu trữ tại máy chủ từ xa 
 - Trong NFS, tất cả giao tiếp giữa máy khách và máy chủ được thực hiện thông qua RPC (cuộc gọi thủ tục)
 
 > RPC chịu trách nhiện dịch yêu cầu của client và gửi tới server, khi máy chủ nhận được yêu cầu, client sẽ đợi server hoàn tất các xử lý, gửi phản hồi lại cho client và ứng dụng phía client mới tiếp tục quá trình của nó.
 
 **Phía Server:**
 - NFS server xử lý các yêu cầu từ client 
 - Từ RPC stub unmarshals request (yêu cầu sơ khai), Server chuyển chúng thành các hoạt động tệp VFS
 - VFS chịu trách nhiệm triển khai 1 hệ thống tệp cục bộ.
 
 > Toàn bộ ý tưởng của VFS là che giấu sự khác biệt giữa các hệ thống tệp khác nhau.  
### 6. Lab


 




