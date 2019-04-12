- Cũng giống như các công cụ ảo hóa khác thì KVM cũng cung cấp các mô hình mạng trong việc ảo hóa network. Các mô hình mạng bao gồm 
    - NAT
    - Bridge
    - Host-only
# 1. NAT
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/networknat.png)
- NAT networking thường được cung cấp và kích hoạt theo mặc định bởi hầu hết các bản phân phối linux chính hỗ trợ ảo hóa KVM
- Mặc định một router mạng ảo vận hành trong chế độ NAT mode sử dụng IP ảo. Điều này dẫn đến bất kì máy ảo nào được kết nối tới nó sử dụng địa chỉ IP của máy host để liên lạc ra bên ngoài và các máy bên ngoài không thể liên lạc được máy guest ở trong khi mà swtich họat động ở chế độ `NAT`
- Nó cho phép hệ điều hành khách có thể kết nối ra ngoài được mà không cần yêu cầu cấu hình cụ thể 
- Chế độ này coi Libvirt server như một router 
- Đây sẽ là chế độ mặc định khi mới cái libvirt mà không cần cấu hình gì 
## Cách cấu hình mạng NAT 
- Khi cài KVM thì ta sẽ được cung cấp một mạng ảo NAT là `default` 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2010-47-05.png)
- Mạng này thường mang dỉa địa chỉ IP 192.168.122.X Nếu không dùng mạng ảo `default thì ta có thể tạo ra một mô hình NAT khác có một vài cách để thực hiện nó. 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2010-48-04.png)
- Sử dung công cụ `Virtual Machine Manager`
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-06-04.png)
    - Vào edit chọn connection details
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-14-23.png)
    - Sau đó vào virtual networks rồi ấn dấu cộng ở cuối cùng 
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-14-57.png)
    - sau đó rồi chọn forward 
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-15-12.png)
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-15-23.png)
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-15-34.png)
    - Sau khi ấn finish thì ta sẽ có được một mạng mới với cái tên do ta đặt cho mạng 
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-15-45.png)
    - Rồi ta chọn áp dụng cho VM của ta vừa tạo
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-02-27%2011-16-34.png)
    - Sau đó ta áp dụng vào máy ảo rồi kiểm tra lại địa chỉ ip để xem có đúng như ta đã thay đổi không 
    - ![](https://github.com/duckmak14/linux/blob/master/KVM/Anh/Screenshot%20from%202019-02-28%2007-18-38.png)
- Cấu trúc của NAT 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/NAT.lab/screenshot_2.png)
# 2. Bridged 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/networkbridge.png)
- Mạng Bridged network chia sẻ một thiết bị Ethernet thật với các máy ảo VM. Mỗi VM có thể gán trực tiếp bất kì địa chỉ IP trên mạng LAN, như một máy tính vật lý. Bridging cho phép hiệu năng cao nhất và là kiểu mạng ít gây vấn đề nhất trong Libvirt
- Sử dụng mạng bridged thì host phải được kết nối trực tiếp với ethernet chứ không phải kết nối tới mạng không đây
- Phải đủ IPv4 để cho các máy ảo 
## Cách cấu hình tạo mạng bridged network 
- Cài bằng virt-manager 
- Ta chỉ cần vào và thay đổi card mạng như hình dưới đây 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-03-01%2008-19-30.png)
- Ta kiểm tra ip máy guest
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-03-01%2008-22-45.png)
- Sau đó ta kiểm tra lại card mạng ở máy ta có thêm 1 card mạng cũng địa chỉ 192.168.2.x
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-03-01%2008-23-38.png)
- Cấu trúc mạng bridge
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/2019-03-18_22-27.png)
- 
# 3. Host-only
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/networkisolated.png)
- Trong kiểu này thì sẽ cấp phát địa chỉ tùy ý giống với mô hình NAT. 
- Virtual swtich sẽ thấy được IP trong mỗi gói tin và sử dụng thông tin đó để quyết định sẽ làm gì với gói tin đó 
## cách cấu hình 
- Ta làm các bước giống như cấu hình kiểu mạng NAT nhưng đến bước cuối có khác 1 điểm là ta sẽ chọn `Isolated`
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-03-01%2009-12-02.png)
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-03-01%2009-12-13.png)
- Cấu trúc mạng 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/network/Screenshot%20from%202019-03-18%2022-14-27.png)
- Kiểu mạng này khác so với NAT là kiểu mạng này tạo ra một  mạng cô lập và không thể đi được ra ngoài internet

