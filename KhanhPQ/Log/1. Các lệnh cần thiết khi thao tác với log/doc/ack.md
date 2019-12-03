

Để tìm chuỗi ký tự trong các file trên linux, theo thói quen cũ ta hay dùng lệnh find grep, egrep hoặc pgrep để thao tác trong CLI của Linux khi cần tìm kiếm các parten (các chuỗi ký tự) tại file nào, dòng nào=> Có thể dùng lệnh ack
# Cài đặt
## Cài đặt trên CentOS 7
yum install -y epel-release 
yum install ack
## Cài đặt trên CentOS 8
dnf install -y epel-release
dnf install -y ack 
## Cài đặt trên Ubuntu 18.04
apt-get install -y
apt-get install -y ack-grep

# Cách sử dụng
cú pháp:	 ack “chuoi_can_tim” thu_muc_can_tim

ack -c	:  đếm số lần xuất hiện

ack -w		: khớp string 100%( không tính string có thêm phần dư)

ack -i 		: tìm kiếm không phân biệt hoa thường

ack -R		: tìm kiếm trong cả subfolder	
 
![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/ack/1.png)

