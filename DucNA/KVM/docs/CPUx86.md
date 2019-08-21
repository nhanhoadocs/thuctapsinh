# 1.Tìm hiểu cấu trúc
- x86 là thuật ngữ dùng để chỉ tới kiến trúc tập lệnh của dòng vi xử lý 8086 của Intel. x86 được lấy từ 2 số cuối của các thế hệ chip của Intel như 8086, 80386, 80486. Khi nói đến x86 thường là nhắc đến bộ nhớ 32bit. Nhưng thế hệ này chỉ hỗ trợ tối đa 2^32bit tương đương với khoảng 4G RAM. Vì vậy thế hệ sau này x86-64 thanh ghi đã được mở rộng lên đến 64 bit để đáp ứng nhu cầu của máy tính.
# 2.User space và kernel space
## a) User space
- là không gian người dùng. Mỗi một không gian người dùng là một tiến trình riêng biệt nên một chương trình không thể thay đổi được dữ liệu thuộc về một chương trình khác
- Chính vì như thế nên khi một tiến trình bị lỗi thì nó không ảnh hưởng gì đến chương trình của hệ điều hành 
## b) Kernel space
- là không gian hệ điều hành. nó sẽ không bị cô lập với những driver khác và bản thân hệ điều hành. Đây là nơi quản lý các ứng dụng người dùng. Đây là nơi người dùng không thể can thiệp vào 
- Hình ảnh về user space và kernel space 
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/x861.png)