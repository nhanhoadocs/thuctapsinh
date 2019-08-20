# DHCP ( Dynamic Host Configuration Protocol )
## 1. Khái niệm
- DHCP là giao thức cấu hình tự động địa chỉ IP
- Được xác định trên mô hình client-server  
+DHCP sever cấp địa chỉ mạng và phân phối thông số cấu hình trong client  
+Client” chỉ các host yêu cầu các địa chỉ IP từ DHCP Server
- DHCP hỗ trợ 3 cơ chế cấp địa chỉ IP:  
+Cấp tự động: DHCP gán 1 địa chỉ IP thường trực → 1 Client  
+Cấp động: DHCP gán địa chỉ IP cho 1 khoảng thời gian hữu hạn nào đó  
+Cấp thủ công: 1 địa chỉ IP được gán bời người quản trị. DHCP chỉ để đưa địa chỉ này đến Client  
## 2. Các thuật ngữ trong DHCP

- DHCP Server: máy quản lý việc cấu hình và cấp phát địa chỉ IP cho Client
- DHCP Client: máy trạm nhận thông tin cấu hình IP từ DHCP Server
- Scope: phạm vi liên tiếp của các địa chỉ IP có thể cho một mạng.
- Exclusion Scope: là dải địa chỉ nằm trong Scope không được cấp phát động cho Clients.
- Scope Options: các thông số được cấu hình thêm khi cấp phát IP động cho Clients như DNS Server(006), Router(003)

## 3. Cách hoạt động
 - Bước 1: DHCP Client gửi broadcast thông điệp discover message để tìm một DHCP Server nhằm xin IP
- Bước 2:  
+DHCP Server nhận được thông điệp này sẽ gửi lại thông điệp offer message cho Client  
+Thông điệp Offer ghi ra mọi thông số server cấp xuống cho client
- Bước 3: client gửi lại thông điệp request message, chỉ là những thông tin IP mà nó quan tâm
- Bước 4: server sẽ hoàn tất bằng cách gưir thông điệp ACK cho client
(Tất cả thông điệp đều là broadcast message)  

    ![hđ dhcp](https://camo.githubusercontent.com/7ae94636a15ffdc99200e2ace81b72f285ab16d6/687474703a2f2f74656361646d696e2e6e65742f77702d636f6e74656e742f75706c6f6164732f323031332f30332f646863702e706e67)  
