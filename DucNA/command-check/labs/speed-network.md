Để kiểm tra tốc độ băng thông network ta sử dụng lệnh `iperf` để. `Iperf` có thể kiểm tra thông lượng của kết nối TCP và UDP 

# Kịch Bản 
Mô hình gồm 2 máy OS một máy đóng vai trò client và một máy đóng vai trò server. Trong mô hình này thì máy client sẽ liên tục gửi gói tin đến server để test băng thông của nó. Gói tin là UDP hay là TCP thì đó là do ta cài đặt 

![](../images/labs/network/network.png)

Chuẩn bị :
- Server : OS centos7; gói iperf 
- Client : OS centos7; gói iperf 

# Thực hiện 