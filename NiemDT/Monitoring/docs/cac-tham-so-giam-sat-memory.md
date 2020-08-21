# Một số khái niệm và thông số của RAM

## Phân biệt virtual memory và swap

**Virtual memory** là sự trừu tượng của RAM vật lý. Nó mở rộng khả năng sử dụng của RAM bằng cách lưu trữ những dữ liệu chưa cần dùng đến trên RAM lên disk. Bất cứ khi nào chương trình chạy mà cần không gian thì dữ liệu này sẽ được lấy lại lên RAM để xử lý. Ta có thể nói rằng **virtual memory** là sự kết hợp giữa RAM và disk có thể sử dụng theo quy trình đang chạy.

**Swap memory** là một phần dung lượng của disk khi RAM đầy. Vì vậy Swap memory là một phần của bộ nhớ ảo được dành riêng cho bộ nhớ tạm thời. Bộ nhớ này chỉ được sử dụng khi RAM đã đầy.

 * **Virtual memory** là bộ nhớ chính của hệ thống và có thể truy xuất file từ hệ thống bất cứ khi nào cần. Nhưng **Swap memory** là bộ nhớ tạm thời và chỉ được sử dụng khi RAM đầy hoặc lỗi.
 * **Virtual memory** có khả năng mở rộng dung lượng memory vật lý. Trong khi **Swap memory** chỉ đơn giản là mộ không gian lưu trữ tạm thời thay thế RAM khi RAM đã đầy.
 * **Virtual memory** là kỹ thuật quản lý bộ nhớ của máy tính còn **Swap** chỉ là khu vực lưu trữ trên disk.

## Một số tham số giám sát RAM

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Monitoring/images/4.png)

**Mem** thể hiện cho RAM vật lý
**Swap** thể hiện cho dung lượng swap memory

 * `total` là tổng dung lượng được cấp
 * `used` là dung lượng đã sử dụng
 * `free` là dung lượng còn trống chưa được sử dụng vào việc gì
 * `share` là dung lượng được sử dụng để chia sẻ giữa các tiến trình
 * `buff/cache` được sử dụng làm cache cho disk để tăng tốc độ đọc ghi
 * `available` dung lượng RAM còn có thể cấp được cho các tiến trình khác.

Ta cần phân biệt giữa dung lượng `free` và `available`. Ta thấy dung `free` có thể là rất ít nhưng đây ko phải là điều đáng quan tâm. Vì dung lượng `free` là dung lượng hoàn toàn rảnh rỗi. Có thể một phần của RAM khi không được sử dụng thì sẽ được sử dụng một phần làm cache để tăng tốc độ cho hệ thống. Khi có chương trình cần dùng đến RAM thì phần dung lượng này có thể được thu hồi lại để cấp cho các chương trình cần thiết. Còn với dung lượng `available` thì đây là dung lượng còn có thể được cấp để sử dụng để cấp cho các tiến trình khác mà không làm ảnh hướng đến các tiến trình khác.

Ngoài monitor bằng lệnh `free` bạn cũng có thể đọc thông tin chi tiết hơn trong file `/proc/meminfo`