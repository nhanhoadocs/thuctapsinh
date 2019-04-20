# Kịch bản 
Ta sẽ tạo ra một VM và cài đặt `iptables service`  và sẽ làm theo 2 trường hợp 
- Trường hợp 1: Xóa hết tất cả các rule trong Chain và sử chính sách mặc định thành `ACCEPT`.  Sau đó sử dụng SSH để kiểm tra kết quả 
- Trường hợp 2: Xóa hết tất cả rule trong chain và sử dụng chính sách mặc định là `DROP`. Sau đó sử dụng SSH để kiểm tra kết quả

VM cần được cài đặt IPTABLES SERVICE

![](/images/iptables.png)

# Thực hiện 
### Trường hợp 1
Đầu tiên ta sẽ kiểm tra ssh vào máy khi chưa có tác động gì 

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/lab/screenshot_2.png)

Sau đó ta kiểm tra danh sách các rule trong chain INPUT để xem chính sách mặc định của nó là gì 

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/lab/screenshot.png)

Như ta đã thấy thì ở đây có một vài rule mặc định được cài đặt và policy mặc định là `accept`. Ta cần để nguyên chính sách đó và xóa tất cả các rule của chain INPUT. Tôi sử dụng lệnh `iptables -D INPUT (rule)`

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/lab/screenshot_1.png)

Sau khi xóa xong rồi thì ta sẽ kiểm tra thử xem có thể ssh vào được VM nữa hay không 

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/lab/screenshot_6.png)

Như ta thấy thì ta vẫn có thể  ssh vào được máy ảo bình thường bởi vì khi không có rule nào thì tất cả INPUT đều sẽ theo chính sách mặc định là ACCEPT. Để làm rõ điều đó tôi sẽ chỉnh sửa chính sách mặc định thành DROP để kiểm tra chúng. Tôi sử dụng lệnh `iptables -P INPUT DROP` 

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/lab/screenshot_4.png)

Sau khi DROP xong thì tôi sẽ sử dụng lại SSH để kiểm tra xem còn ssh được không và dưới đây sẽ là kết quả 

![](https://github.com/duckmak14/thuctapsinh/blob/master/Anhduc/iptables/images/lab/screenshot_5.png)

Kết luận: Khi không có rule nào trong chain thì tất cả gói tin sẽ đều được xét theo policy của nó. Các bảng và các chain đều giống nhau về điều này.