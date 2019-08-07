# Cách cài CentOS7 trên VMware

- Đầu tiên ta cần download file CentOS7
- Tiếp theo mở VMware :

![](../images/a1.png)

![](../images/2019-05-15_15-29_1.png)

![](../images/a2.png)

![](../images/2019-05-15_15-31.png)

![](../images/2019-05-15_15-35.png)

![](../images/2019-05-15_15-36.png)

![](../images/2019-05-15_15-39.png)

![](../images/2019-05-15_15-40.png)

![](../images/2019-05-15_15-41.png)

Ở đây có 3 cách chọn kiểu kết nối card mạng cho máy ảo là:
- Bridged : card trên máy ảo kết nối internet thông qua card mạng vật lí có chung lớp mạng với card.
- NAT (Network address translation) chỉ có thể giao tieeos với card NAT trên máy ảo khác, card NAT không thể giao tiếp với mạng vật lí. Nó thực hiện kĩ thuật NAT để kết nối ra ngoài.
- Host-only: máy ảo chỉ có thể giao tiếp với máy thật mà nó đang chạy chứ không truy cập ra ngoài mạng.

Khi đã thiết lập xong phàn cứng ta chọn Close để tiếp tục rồi Chọn Finish để bắt đầu cài đặt:

![](../images/2019-05-15_15-42.png)

Đợi cài đặt rồi ,Chọn ngôn ngữ cho máy:

![](../images/2019-05-16_17-09.png)

Chọn thành phố và cài ngày giờ. Chọn xong nhấn Done để qua bước tiếp theo


![](../images/2019-05-15_16-27.png)

![](../images/2019-05-15_16-29.png)

Đợi đến khi hiện lên Begin Install:

![](../images/2019-05-15_16-39.png)

Chọn ROOT PASSWORD để đặt mật khẩu:

![](../images/2019-05-15_16-40.png)

![](../images/2019-05-15_16-41.png)

Nhấn Reboot để khởi động máy ảo,ta đã tạo thành công.
 
Chúc mọi người thành công!!

