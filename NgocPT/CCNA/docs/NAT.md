# Giới thiệu về NAT
## 1. Khái niệm
- NAT chuyển các địa chỉ riêng thành các địa chỉ public , địa chỉ có khả năng định tuyến khi máy chủ mạng nội bộ cần phải kết nối tới được với máy chủ bên ngoài của mạng tư nhân. Thêm vào đó, nhiều tổ chức có thể khai triển cùng IP với nhau, NAT sẽ được sử dụng để giải quyết vấn đề khi các tổ chức này muốn giao tiếp trao đổi với nhau qua mạng.

## 2. Lợi ích của NAT
- Những lợi ích chính của NAT là việc thoải mái sử dụng số lượng địa chỉ ip private rộng lớn.
- Khi bạn sử dụng địa chỉ Ip private dù cho bạn có đổi nhà cung cấp dịch vụ, bạn sẽ không cần phải đánh lại địa chỉ cho các thiết bị trong mạng cục bộ mà bạn chỉ phải thay đổi cấu hình NAT trên firewall để trùng với địa chỉ IP public mới.
## 3. Kĩ thuật NAT
- NAT tĩnh : một địa chỉ IP nội miền chỉ định sẽ được ánh xạ sang một địa chỉ IP chỉ định khác ngoài miền.
- NAT động, Địa chỉ IP nội bộ sẽ tự động được khớp với một bộ các địa chỉ IP ngoài. Quá trình ánh xạ vẫn là giữa 1 địa chỉ nội bộ với một địa chỉ ngoài nhưng được diễn ra tự động.
- PAT (Port Address Translation)  một địa chỉ IP công cộng duy nhất được sử dụng cho tất cả các địa chỉ IP riêng bên trong, nhưng một cổng khác được gán cho mỗi địa chỉ IP riêng.