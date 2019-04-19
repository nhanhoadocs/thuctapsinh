Khi gán một thiết bị lưu trữ nào hệ thống linux để có thể sử dụng được nó điều đầu tiên ta phải làm là phân vùng và định dạng cho disk đó. Để làm được điều này thì ta phải dùng đến lệnh `fdisk`.
## Xem tất cả các phân vùng của tất cả các đĩa trong linux

Để xem được có bao nhiêu disk trong máy linux và các disk đó chia ra các phân vùng như thế nào ta sử dụng lệnh `fdisk -l`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f1.png)

Hoặc có thể sử dụng lệnh `lsblk`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f2.png)

## Xem tất cả các phân vùng của một thiết bị xác định
Ta sử dụng lệnh `fdisk -l tên_thiết_bị`
Vd tôi muốn xem các phân vùng của thiết bị `/dev/sda`
`fdisk -l /dev/sda`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f3.png)

## Làm việc với phân vùng
Để tạo một phân vùng mới trước hết ta cần xác định trước tên thiết bị đó là gì và dung lượng của phân vùng muốn tạo. Có chú ý rằng dung lượng của phân vùng muốn tạo phải nhỏ hơn hoặc bằng với dung lượng còn trống của đĩa mà chưa cấp cho phân vùng nào khác.
Ở đây tôi sẽ tạo một phân vùng cho ổ `/dev/sdb` là ổ tôi vùa add thêm vào.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f4.png)

Ở đây ổ mới của tôi có dung lượng 5G và tôi muốn tạo một phân vùng mới có dung lượng 3G. Sử dụng lệnh `fdisk /dev/sdb`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f5.png)

Nhập `m` để in ra một các tùy chọn

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f6.png)

Nhấn `n` để tiến hành tạo một phân vùng mới.
Bây giờ ta chỉ cần làm tuần tự theo hướng dẫn 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f7.png)

Khi tạo nó sẽ hỏi bạn lựa chọn `extended` hoặc `primary` nếu bạn chọn `extended` thì bạn nhập vào `e` còn chọn `primary` thì bạn nhập `p` hoặc không cần nhập. Với mỗi ổ đĩa chỉ cho tạo tối đa là 4 phân vùng `primary`. Sau đó sẽ hỏi bạn là phân vùng số mấy nếu bạn không chọn thì nó mặc định là phân vùng tiếp theo của phân vùng trước đó (cái này thường để mặc định). Tiếp theo nó sẽ hỏi `first sector` cái này thường để mặc định. Và `last sector` đây là điều cần chú ý. Bạn muốn dung lượng của phân vùng này là bao nhiêu thì bạn nhập vào `+sizeG`. Ví dụ ở đây tôi tạo phân vùng 3G tôi nhập vào là `+3G`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f8.png)

Khi tạo xong thì kiểu của phân vùng sẽ mặc định là kiểu `linux` nếu muốn thay đổi thì nhập lại `m` sau đó nhập `t` và làm tiếp theo hướng dẫn.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f9.png)

Khi đã thực hiện xong thì nhấn `w` để lưu lại những thay đổi và sẽ thoát ra. 
Sau khi tạo phân vùng xong để muốn sử dụng ta cần format và mount nó vào một thư mục để sử dụng. Để format ta sử dụng lệnh `mkfs .tên_định_dạng tên_phân_vùng`. Tôi muốn định dang `ext4` cho phân vùng vủa tạo là `/dev/sdb1` ta dùng lệnh `mkfs .ext4 /dev/sdb1`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f10.png)

Ta có thể thấy được phân vùng vừa tạo.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f11.png)

Còn lệnh `mount` ta sẽ tìm hiểu trong phần sau.
Để xóa một phân vùng của một thiết bị nào nào đó ta dùng lệnh `fdisk tên_thiết_bị` sau đó chọn `d` và cuối cùng là chọn tên của phân vùng muốn xóa.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/f12.png)