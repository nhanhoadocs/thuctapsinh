# 1. Khái niệm
- dhclient cung cấp một phương tiện để cấu hình một hoặc nhiều giao diện mạng bằng cách sử dụng giao thức DHCP 
# 2. Các option của dhclient
- `-4` : sử dụng giao thức DHCP để lấy IPv4 và các tham số  cấu hình 
- `-6` : sử dụng giao thức DHCP để lấy IPv6 và các tham số  cấu hình 
- `-p` : Số cổng UDP mà client sẽ nhận thông tin. Nếu không chỉ định thì sẽ mặc định là 68
- `-q` : Bỏ qua tất cả thiết bị đầu cuối và nhật ký ngoại trừ thông báo lỗi 
- `-r` : giải phóng hợp đồng thuê hiện tại có từ máy chủ 
- `-s` : chỉ định máy chủ để nhận IP 
- `-g` : chỉ để gỡ lỗi 
- `-n` : Không cấu hình bất kỳ giao diện nào
- `-w` : Tiếp tục chạy ngay cả khi không tìm thấy giao diện mạng
- `-H` : Chỉ định tùy chọn hostname server 
- `-timeout` : chỉ định thời gian sau đó dhclient quyết định không có server nào reply