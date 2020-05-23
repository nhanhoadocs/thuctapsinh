# Sử dụng Pi-hole làm DNS server



### Mô hình
**1. Server Pi-hole DNS:** 
- IP: 10.10.34.161/24
- OS: CentOS-7
- Đã cài đặt Pi-hole
- Có thể kết nối ra Internet


**2. Máy Win10**
- Trỏ DNS tới server Pi-hole
- Có thể kết nối ra Internet


## Thực hiện

### Trên máy Win10
1. Trước tiên, ta sẽ cài đặt mạng cho máy cài Win10 trỏ DNS tới Server cài Pi-hole

- Nhấn tổ hợp **Window + R** và gõ `ncpa.cpl`

    <img src="..\images\Screenshot_18.png">

- Chuột phải chọn card mạng kết nối Internet -> Chọn Pro

    <img src="..\images\Screenshot_19.png">

- Click chuột chọn **Internet Protocol Version 4**

    <img src="..\images\Screenshot_20.png">

- Chọn phần DNS, điền IP của server Pi-hole -> OK

    <img src="..\images\Screenshot_21.png">

2. Bây giờ ta sẽ thử truy cập một trang `tinhte.vn`

Ta sẽ thấy quảng cáo trên trang này chỉ còn lại một phần do Pi-hole đã chặn

<img src="..\images\Screenshot_22.png">