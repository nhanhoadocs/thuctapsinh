# Lệnh `top`

Lệnh TOP là một trong những lệnh cực kì quan trong cho admin quản trị hệ thống linux. Quản trị được các thông số, CPU, RAM, I/O , các tiến trình đang hoạt động trên hệ thống.

Lệnh trên giúp cho admin có thể giám sát hệ thống của mình một cách chuyên nghiệp và nắm rõ từng thông tin của hệ thống. Lệnh TOP tương tự Task manager trên windows. 

## Câu lệnh
```
top
```

<img src="https://i.imgur.com/ZLnfh7N.png">

### Ý nghĩa các thông số
1. **Dòng 1:** Thời gian của server

    <img src="https://i.imgur.com/WzcoouZ.png">

    - 1 : Thời gian hiện tại của hệ thống
    - 2 : Thời gian uptime
    - 3 : Số lượng user đang login
    - 4 : Thời gian CPU load trung bình trong 1 phút, 5 phút, 15 phút

2. **Dòng 2:** Thông tin các tiến trình

    <img src="https://i.imgur.com/4T2qJht.png">

    - 1 : Tổng số tiến trình đang ở trạng thái Active
    - 2 : Số tiến trình đang chạy
    - 3 : Số tiến trình đang ở chế độ Sleep
    - 4 : Số tiền trình đang ở trạng thái Stopped
    - 5 : Số tiến trình chờ stop từ tiến trình khác

3. **Dòng 3:** Thông tin CPU

    <img src="https://i.imgur.com/mm6iSAn.png">

    - 1 : % CPU dùng cho từng tiến trình của user
    - 2 : % CPU dùng cho tiến trình hệ thống
    - 3 : % CPU dùng cho cấu hình các giá trị
    - 4 : % CPU ở trạng thái nghỉ
    - 5 : % CPU đang ở trong thời gian chờ I/O
    - 6 : % CPU được phục vụ cho phần cứng khi bị gián đoạn
    - 7 : % CPU được phục vụ cho phần mềm khi bị gián đoạn 
    - 8 : % CPU ảo chờ CPU thực xử lý các tiến trình

4. **Dòng 4:** Liên quan đến thông tin RAM

    <img src ="https://i.imgur.com/flsOUSr.png">

    - 1 : Tổng dung lượng RAM
    - 2 : Dung lượng RAM free
    - 3 : Dung lượng RAM đang được sử dụng
    - 4 : Dung lượng vào buffers

5. **Dòng 5:** 

    <img src="https://i.imgur.com/6jYFyyW.png">

    - 1 : Dung lượng SWAP RAM
    - 2 : Dung lượng Swap RAM free
    - 3 : Dung lượng Swap RAM đã sử dụng
    - 4 : Bộ nhớ khả dụng

6. Bảng các tiến trình đang chạy
    <img src="https://i.imgur.com/tRVpRPO.png">

    - PID : ID Process
    - USER : User thực hiện tiến trình
    - PR : Độ ưu tiên của tiến trình
    - NI : Giá trị Nice Value (gọi một tập lệnh shell với mức độ ưu tiên cụ thể)
    - VIRT : Dung lượng RAM ảo thực hiện tiến trình
    - RES : Dung lượng RAM thực sử dụng cho tiến trình
    - SHR : Bộ nhớ có thể chia sẻ
    - S : (Status) trạng thái
    - %CPU : %CPU được sử dụng cho tiến trình
    - %MEM : %RAM được sử dụng cho tiến trình
    - TIME+ : Thời gian tiến trình đã chạy
    - COMMAND : Tên hay lệnh thực hiện tiến trình