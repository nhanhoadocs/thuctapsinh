# Kịch bản 

![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot_3.png)

Mô hình trên tôi có 
- một máy A có địa chỉ 192.168.122.134
- Một máy B có địa chỉ 192.168.122.228

kịch bản: 
- Đầu tiên tôi sẽ cài iptables lên máy A 
- Sau đó sẽ cấm không cho máy B ssh sang máy A

# Thực hành 
Đầu tiên ta kiểm tra máy B vẫn có thể ssh được sang Máy A

![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot10.png)

Ta vào kiểm tra bảng filter thấy rằng tất cả các máy đều có thể sử dụng giao thức ssh bằng tcp vào máy

![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot11.png)

Trước đó ta phải xóa cái rule mặc định với option `-D` đó đi và tạo ra một rule mới là cấm máy B có thể ssh tới máy A với dòng lệnh 

![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot_2.png)

Sau đó ta thử kiểm tra lại các rule tạo ra với option `-L` 

![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot_1.png)

Ở đây ta thấy rằng ta đã DROP máy B sử dụng port TCP 

Sau đó ta thử ssh lại và thấy được rằng Máy B đã không còn SSH trở lại được máy A nữa

![](https://github.com/duckmak14/linux/blob/master/iptables/images/screenshot.png)
