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