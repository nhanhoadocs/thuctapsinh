# Cài một máy centOS có swap khoảng 2G

<a name ="Cài đặt CentOS7"></a>

# Cài đặt CentOS7

- Trước tiên chúng ta download file centOS7 về máy 
- Có thể [Click vào đây](http://isoredirect.centos.org/centos/7/isos/x86_64) để chọn file cài đặt phù hợp.
- Mở VMware và chọn `Create new Virtual machine` để tiến hành cài đặt 
<img src="https://imgur.com/wbnvZYq.jpg">

- Chọn `typical` để tạo máy ảo dễ dàng hơn sau đó nhấn `next` để tiếp tục.
<img src ="https://imgur.com/uvCBpd4.jpg">
- Nhấn vào `Browser` để chọn file CentOS vừa tải về sau đó nhấn `next` để tiếp tục.
<img src ="https://imgur.com/yAF01F8.jpg">
- Đặt tên cho máy ảo vừa tạo và chọn vị trí lưu của nó trong PC. Sau đó nhấn `next` để tiếp tục.
- Đặt tên cho máy ảo vừa tạo và chọn vị trí lưu của nó trong PC. Sau đó nhấn next để tiếp tục.
<img src ="https://imgur.com/5LyWfrX.jpg">
- Chọn kích thước max mà ổ đĩa ảo có thể dùng.NHấn chọn `Split virtual disk into multiples file` Việc tách đĩa giúp cho việc di chuyển máy ảo sang một máy tính khác dễ dàng hơn nhưng có thể làm giảm độ hoàn hảo với các đĩa rất lớn
<img src ="https://imgur.com/YWC86aL.jpg">
- Chọn `Customize Hardware `để điều chỉnh phần cứng
<img src ="https://imgur.com/Rk1FJBH.jpg">
- Thay đổi 3 thông số chính cho phần cứng `memory`, `Processors` và `Network Adapter`
    - Memory :chỉ định dung lượng bộ nhớ được phân bổ cho máy ảo này. Kích thước bộ nhớ phải là bội số của 4MB
    <img src ="https://imgur.com/pAjaBfv.jpg">
    - Processor:
    <img src ="https://imgur.com/es3HJsF.jpg">
    - Network Adapter:
        - NAT : Được sử dụng để chia sẻ địa chỉ IP máy chủ.Thực hiện cơ chế NAT để chia sẻ IP ra bên ngoài.
        - Host-Only: chỉ dùng để chia sẻ mạng với máy chủ
        - Custom : Mạng ảo cụ thể
    <img src ="https://imgur.com/y1hHiQ6.jpg">
 - Sau khi đã cài đặt xong phần cứng nhấn Finish để tiến hành Installing
    <img src ="https://imgur.com/zgcWLm2.jpg">

<img src ="https://imgur.com/RwOjeRR.jpg">

<img src ="https://imgur.com/DzipciC.jpg">
- Chọn ngôn ngữ cho máy nhấn ``continue` tiếp tục
<img src ="https://imgur.com/AZYvDKL.jpg">
- Chọn thành phố và ngày giờ rồi nhấn `done` để tiếp tục.
- Chọn `Network-Hostname`để bật kết nối mạng cho máy rồi nhấn `Done `để tiếp tục.
<img src ="https://imgur.com/nvqtmmr.jpg">

- Chọn Root password để cài đặt mật khẩu cho máy chọn `Done` để tiếp tục.
<img src ="https://imgur.com/DYOT12T.jpg">
- Nhấn Reboot để khởi động máy ảo vừa tạo

- Máy đã được tạo thành công
- Chon `installation destination` để cấu hình Swap
<img src="https://imgur.com/v8AjkxQ.jpg">


<img src="https://imgur.com/2XIVCPh.jpg">

- chọn `i will configure partittioning` để cấu hình thủ công

<img src="https://imgur.com/1iJMIQ1.jpg">
- `/ boot`   , `/`  ,  ` swap`
