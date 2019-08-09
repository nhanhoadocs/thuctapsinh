<a name ="Khởi động hệ thống">

# Khởi động hệ thống

## Nội dung
1. Quá trình khởi động
2. Tùy biến quá trình khởi dộng
3. Các mức thực hiện

- Quá trình khởi động hệ thống máy tính 

    - Mục tiêu của quá trình khởi động 
        - Khởi động các thành phần phần cứng 
        - Kiểm tra trạng thái thiết bị 
        - Khởi động các phần mềm cho NSD Cụ thể khi khởi động PC 
        - Khởi động các thành phần phần cứng cứng 
        - Khởi động MBR 
        - Thực hiện chương trình quản lý khởi động 
         - Khởi động nhân hệ điều hành 
        - Khởi động các chương trình phục vụ NSD -Phụ thuộc yêu cầu các giai đoạn khởi động này có thể sát nhập

<img src="https://imgur.com/slRqpoP.jpg"> 

- Quản lý khởi động Linux

    -  Bật nguồn điện 
        – Hệ thống tự kiểm tra và thực hiện cấu hình phần cứng 
    - Chương trình BIOS được thực hiện 
        – Cấu hình các thiết bị ngoại vi 
        – Truy cập vào các thiết bị lưu trữ chính chính 
    - Chương trình khởi động được thực hiện 
        – Tải nhân HĐH 
        – Khởi động các dịch vụ của HĐH 
    - HĐH thực hiện tiến trình init 
        – Khởi động các tiến trình và môi trường làm việc của hệ thống 
    - Theo cấu hình, init khởi động giao diện NSD

<img src="https://imgur.com/YH6Z6a3.jpg">

- Khởi động hệ thống vật lý

- Phụ thuộc vào hệ thống vật lý 
- Trên PC: BIOS – POST 
    - Xác định và đánh dấu các thiết bị ngoại vi 
    - Xác định và đánh dấu các thiết bị ngoại vi 
    - Xác định thiết bị khởi động – Thực hiện MBR 
    - MBR 
        - Chương trình khởi động 
        - Bảng các phân chương 
    - Thực hiện boot record


<img src="https://imgur.com/XwUtiIV.jpg">

- hương trình khởi động

    - Chương trình nhỏ dùng để tải nhân ĐH 
    - Nằm ở 
        - 1st cluster của HDD 
        - 1st cluster của phân vùng 
    - Đơn giản 
    - Đơn giản 
        - Không có xác thực 
        - Không có bảo vệ (Boot sector virus 
    - Giải pháp: hai mức 
        - lilo 
        - grub

- Lilo Boot Loader

    - LILO là viết tắt của Linux Loader được sử dụng để tải Linux vào bộ nhớ. Nó có thể khởi động hệ điều hành từ đĩa mềm, đĩa cứng và không phụ thuộc vào hệ thống tệp cụ thể. 
    - Lilo xử lý một số tác vụ như định vị kernel, xác định các chương trình hỗ trợ khác, tải bộ nhớ và khởi động kernel. Tập tin cấu hình của lilo được đặt tại ngay /etc / lilo.conf. Lilo đọc tệp cấu hình này và nó cho Lilo biết nơi cần đặt bộ nạp khởi động.

    - Đặt tại MBR  của HDD hoặc Sector đầu tiên của Partition 
    - Các dữ liệu Boot data 
    - Các dữ liệu Boot data ở trong thư mục/boot 
    - /boot không đảm bảo truy cập được từ lilo 
    - lilo.conf->lilo->MBR 
    - grub.conf-grub-boot process-grub shell

- LILO Boot step
- L- Loader 
- LI- Second stage Loader 
- LIL? 
- LIL
- LILO - Linux Loader

<img src="https://imgur.com/SsgRwFJ.jpg">

<img src="https://imgur.com/SsgRwFJ.jpg">


- Run level
|Mức thực hiện|Mô tả|
|---|---|
|0|Halt|
|1|Đơn NSD,không đồ họa,không mạng|
|2|Đa NSD,không đồ họa,không mạng|
|3|Đa NSD,đồ họa, mạng|
|4|Chưa dùng|
|5|Đa NSD,đồ họa, mạng|
|6|khởi động lại|

|Câu lệnh|Ý nghĩa|
|---|---|
|init lever|Chuyển mức thực hiện|
|runlevel|Hiện thị mức thực hiện tại và trước đó|

<img src="https://imgur.com/CF5mak0.jpg">

- Login

 - Để đăng nhập vào hệ thống, NSD cần có tài khoản 
 - Có thể đăng nhập vào terminal 
 - Mặc định, hệ thống linux có 6 terminal 
 - Mặc định, hệ thống linux có 6 terminal (tty1-tty6), tty; teletype writer 
 - tty 7 cho giao diện đồ họa • Chuyển đổi giữa các giao diện, dùng AltFx • Thay đổi số lượng tty trong inittab

 - Dịch vụ đơn lẻ

    - Chương trình được thực hiện bởi hệ thống 
    - Thực hiện bởi một script đặt trong thư mục /etc/rc.d/init.d/ hoặc /etc/init.d/ 
     - Các thư mục /etc/rx#.d/ chứa các liên kết 
    - Các thư mục /etc/rx#.d/ chứa các liên kết biểu tượng tới các script của dịch vụ 
    -  K-tắt, S-bật
- Script thực hiện dịch vụ
    -  Cung cấp các thao tác
         – Bật, tắt, khởi động lại, cấu hình lại, khởi động lại có điều kiện, trạng thái 
         – Tạo ra các tệp khóa để xác định trạng thái 
         – Tạo ra các tệp khóa để xác định trạng thái dịch vụ 
         – Kiểm tra các điều kiện cần thiết để thực hiện dịch vụ 
    - Ví dụ: pico /etc/init.d/crond

- Chức năng của TCP daemon

- Tiết kiệm tài nguyên hệ thống 
- Quản lý danh sách truy cập, logging, …. 
- Các dịch vụ thông dụng được khai báo trong /etc/services trong /etc/services 
- Có thể sử dụng các dịch vụ khác