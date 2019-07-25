1. Khái niệm 
- Iptable là một loại firewall software hay còn là một loại firewall mềm được sử dụng nhiều trong các phiên bản linux.
- Lịch sử : 
- Được sử dụng để tạo ra một firewall để có thể bảo mật thông tin cá nhân giúp phòng tránh việc mất mát thông tin. Nó có thể lọc các gói tin đi ra và đi vào theo cách mà người sử dụng cài đặt. 

2. so sánh giữa iptable và firewalld 

3. Các khái niệm trong IPTABLES 

a) TABLES :  Trong iptables có 3 tables chính 
- NAT : Được dùng để NAT địa chỉ nguồn và địa chỉ đích 
- FILTER : Bảng này quyết định xem gói tin có được đi tiếp hay không. iptables command lấy đây là table mặc định nếu không khai báo rõ table 
- MANGLE : Được sử dụng để thay đổi một số thông tin của gói tin 

b) HOOK 
- FORWARD : Nếu gói tin đến không có địa chỉ đích trong local thì nó sẽ được kích hoạt để chuyển đi 
- OUTPUT : Sẽ được sử dụng nếu địa chỉ nguồn là một máy trong local 
- INPUT : Sẽ được sử dụng nếu đích đến là một máy trong local 
- PREROUTING : Được sử dụng trong việc thay đổi địa chỉ đích 
- POSTROUTING : Được sử dụng trong việc thay đổi địa chỉ nguồn 

d) Rules
- iptables rule bao gồm một hoặc nhiều tiêu chuẩn để xác định packets nào sẽ phải chịu ảnh hưởng và target để xác định hành động nào sẽ được thực thi với packet ấy.
- Các loại target 

C) Chains
- Chains là 
- Mặc định trong table đều có sẵn các chain. 



