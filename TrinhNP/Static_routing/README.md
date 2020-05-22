### STATIC ROUTING ( ĐỊNH TUYẾN TĨNH )

**Static Routing** là phương thức định tuyến mà người quản trị sẽ nhập thông tin về đường đi cho router. Khi có thay đổi nào trong mạng thì người quản trị sẽ thay đổi  bằng cách sửa đổi thông tin về đường đi đó. Đường đi này là cố định.

**Nguyên lý hoạt động** 

+ Người quản trị sẽ cấu hình đường đi cố định cho router. 
+ Router sẽ cài đặt các đường đi này vào bảng định tuyến.
+ Gói dữ liệu truyền theo đường đi đã cài đặt.

**Ưu điểm** 

- Sử dụng ít băng thông hơn định tuyến động 
- Không tiêu tốn tài nguyên để tính toán và phân tích gói tin định tuyến

**Nhược điểm**

+ Không tự cập nhật đường đi 
+ Cấu hình thủ công khi mạng thay đổi 
+ Chỉ phù hợp với mạng nhỏ 


**Static Routes** thường được sử dụng khi cần định tuyến từ một Netwwork đến một Stub Network, (stub Network là một mạng con chỉ có một tuyến đường duy nhất để đi ra bên ngoài).

Static routes cũng được dùng để xác định một phương án cuối cùng để gửi một gói tin không rõ địa chỉ đích.

**Cú pháp**

``` R(config)# ip route [network] [mask] [Address|interface] ```

- network : địa chỉ mạng đích đến
- mask : subnetmask 
- address/interface : địa chỉ của router kế tiếp trong interface sử dụng 

### CẤU HÌNH STATIC ROUTING 

![Imgur](https://i.imgur.com/9ZYeJu7.png)

Đặt địa chỉ ip theo như hình.

Thiết bị trong mạng 1 muốn kết nối tới mạng 2 thì phải đi qua cổng f0/0 của R2

Ta thực hiện config trên R1:
``` ip route 192.168.2.0 255.255.255.0 192.168.3.2```

Thực hiện tương tự trên R2:

Sử dụng ```show ip route``` để kiểm tra:

![Imgur](https://i.imgur.com/gp2pok8.png)

Thực hiện ping từ PC của mạng 2 sang bên mạng 1:

![Imgur](https://i.imgur.com/VLIJmXx.png)

