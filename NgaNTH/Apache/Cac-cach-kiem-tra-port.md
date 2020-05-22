### Các cách kiểm tra port trong Linux  

**1. Sử dụng lệnh netstat**  
Cú pháp:   
```
netstat [option]   
```
Lưu ý: cài đặt `net-tools` để sử dụng lệnh `netstat`.  
Ví dụ để check thông tin port `80` tôi sẽ gõ lệnh:  
```
netstat -tuan | grep 80
```
Trong đó ý nghĩa của các tùy chọn: 
- `-t`: hiển thị thông tin kết nối TCP
- `-u`: hiển thị thông tin kết nối UDP 
- `-a`: hiển thị tất cả socket (all)  
- `-n`: hiển thị địa chỉ số thay vì cố gắng xác định tên máy chủ, cổng hoặc tên người dùng tượng trưng.

<img src="https://i.imgur.com/4QB8BqO.png"> 

**2. Sử dụng lệnh telnet**  
Từ máy client ta sẽ sử dụng lệnh telnet để kiểm tra kết nối đến máy chủ thông qua một port cụ thể.  
Cú pháp:  
```
telnet dia_chi_ip ten_port
```  
Ví dụ tôi muốn check port `8000` ở máy CentOS có địa chỉ IP là `192.168.152.134` có đang được mở hay không thì từ máy ubuntu tôi sẽ dùng lệnh `telnet` để kiểm tra  
```
telnet 192.168.152.134 8000
```  
<img src="https://i.imgur.com/fgldqcG.png">   

Nếu trên máy CentOS đang bật tường lửa thì từ máy ubuntu sẽ không thể telnet được.  

**3. Sử dụng lệnh curl**  
Cũng từ máy Ubuntu ta dùng lệnh curl để check trạng thái một port cụ thể trên CentOS.   
Cú pháp:   
```
curl dia_chi_ip:ten_port 
```  
Ví dụ tôi muốn check port `8000` ở máy CentOS có địa chỉ IP là `192.168.152.134` có đang được mở hay không thì từ máy ubuntu tôi sẽ dùng lệnh `curl` để kiểm tra. 

<img src="https://i.imgur.com/wKPoDId.png">  

Nếu cổng 8000 mở, kết nối thiết lập thì sau khi gõ lệnh `curl` nó sẽ trả về nội dung của một tệp html (source code của website).  

**4. Sử dụng lệnh ss**  
Bạn cũng có thể sử dụng lệnh `ss` để check thông tin port  
Ví dụ tôi check port 8000 thì sẽ gõ lệnh:  
```
ss -lan | grep 8000
```  
Ý nghĩa tùy chọn:  
- `-l`: listenning  
- `-a`: all  
- `-n`: numberic  

<img src="https://i.imgur.com/SDSR0hU.png">  

Trên đây là tổng hợp các cách để check thông tin port khi bạn muốn khắc phục sự cố về mạng hoặc tìm cách cải thiện bảo mật cho hệ thống của mình. 