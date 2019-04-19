# Tìm hiểu kiến trúc CPU x86
`x86` là thuật ngữ dùng để chỉ tới kiến trúc tập lệnh của dòng vi xử lý 8086 của Intel. `x86` được lấy từ 2 số cuối của các thế hệ chip của Intel như 8086, 80386, 80486. Khi nói đến `x86` thường là nhắc đến bộ nhớ 32bit. Nhưng thế hệ này chỉ hỗ trợ tối đa 2^32bit tương đương với khoảng 4G RAM. Vì vậy thế hệ sau này `x86-64` thanh ghi đã được mở rộng lên đến 64 bit để đáp ứng nhu cầu của máy tính.
### User space
`user space` là không gian bộ nhớ dùng để chạy các ứng dụng người dùng. Nó không thể truy cập vào kernel space điều này để đảm bảo an toàn cho kernel. Muốn truy cập vào kernel space nó phải thông qua system calls. System calls hoạt động như một phần mềm bên trong kernel space

`kernel space` là không gian bộ nhớ dùng để chạy các chương trình hệ thống. Nó có đặc quyền cao nhất mà người dùng không thể can thiệp vào. Nó quản lý các ứng dụng người dùng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/x861.png)
