## 1. CPU

Có rất nhiều câu lệnh có thể kiểm tra được trạng thái của CPU. Có một câu lệnh quen thuộc là là `top` 

![](/Monitoring/images/1.png)

Câu lệnh này trả về các thông tin của CPU sau

```
%Cpu(s):  0,2 us,  0,2 sy,  0,0 ni, 99,5 id,  0,0 wa,  0,0 hi,  0,2 si,  0,0 st
```

`%CPU` thể hiện % thời gian CPU:

* `us` xử lý các process của user
* `sy` xử lý các process của kernel
* `ni` xử lý các process ưu tiên của user
* `id` CPU không hoạt động
* `wa` đợi cho I/O hoàn thành
* `hi` xử lý các kết nối phần cứng
* `si` xử lý các kết nối phần mềm
* `st` khoảng thời gian CPU có việc phải làm mà không thể đáp ứng

![](/Monitoring/images/2.png)

* `PID` là ID của tiến trình
* `USER` tên user sử dụng tiến trình
* `PR` hiển thị mức độ ưu tiên của tiến trình
* `NI` cũng thể hiện mức độ ưu tiên của tiến trình nhưng nó được ưu tiên hơn cột `PR` ở trước đó
* `VIRT` tổng số RAM được sử dụng cho tiến trình (bao gồm tất cả những gì liên quan đến tiến trình đó vd như đọc ghi ...)
* `RES` số RAM tiến trình này sử dụng
* `SHR` lượng RAM dùng để share cho các tiến trình khác
* `S` trạng thái của tiến trình. Gồm các trạng thái sau:
 * `R`: tiến trình đang chạy
 * `D`: đang tạm nghỉ, có thể không bị gián đoạn
 * `S`: đang tạm nghỉ nhưng có thể bị gián đoạn
 * `T`: đã tạm dừng
 * `Z`: tiến trình chưa dừng hẳn
* `%CPU` là %CPU mà nó chiếm trên tổng số CPU
* `%MEM` số RAM sử dụng cho tiến trình trên tổng số RAM available

**Giá trị load average**

![](/Monitoring/images/3.png)

Ở đây ta thấy có 3 giá trị đây là các giá trị thể hiện số tiến trình trung bình được xử lý trung bình trong các khoảng thời gian lần lượt là 1 phút, 5 phút, 15 phút.
Để có thể chạy ổn thì giá trị này nên nhỏ hơn hoặc bằng số core của CPU.

## 2. RAM

Kiểm tra thông số RAM ở đây tôi dùng câu lệnh `free`

![](/Monitoring/images/4.png)

Câu lệnh `free -m` hiển thị đơn vị là MB. Câu lệnh này hiển thị cả RAM thực và Swap.

* `total` là tổng dung lượng RAM
* `used` dung lượng RAM đã sử dụng
* `free` dung lượng RAM còn trống
* `share` dung lượng RAM dùng để chia sẻ
* `buff/cache` được sử dụng làm cache cho disk để tăng tốc độ đọc ghi
* `available` dung lượng RAM được có thể sử dụng mà không gây ảnh hưởng đến các tiến trình khác.

Bạn cần phân biệt dung lượng `free` và dung lượng `available`. Số RAM bạn có thể sử dụng là dung lượng `available` vì `available`=`free` + `cache`. Khi cần thiết hệ thống sẽ lấy bộ nhớ cache này ra để sử dụng.

## 3. Network

Sử dụng câu lệnh `nload`

Ta cần cài `nload` trước khi sử dụng nó

```
yum install nload
```

![](/Monitoring/images/5.png)

Kiểm tra được tốc độ vào và ra trên các card của máy.

* `curr` tốc độ tại thời điểm hiện tại
* `avg` tốc độ trung bình
* `min` tốc độ nhỏ nhất
* `max` tốc độ max
* `Ttl` tổng dung lượng đã vào và ra

## 4. Disk

Ta có thể sử dụng câu lệnh `dd` để kiểm tra tốc độ nó sẽ đọc ghi trực tiếp lên disk để kiểm tra. Hoặc cũng có thể sử dụng câu lệnh `iostat`
Trước khi sử dụng được lệnh này ta cần cài đặt gói `sysstat`

```
yum install sysstat
```

![](/Monitoring/images/6.png)

* `device` tên thiết bị
* `tps` số transfers mỗi giây được cấp cho thiết bị. Số này càng cao tức là bộ xử lý càng sử dụng
* `kB_read/s` tốc độ đọc trên thiết bị
* `kB_wrtn/s` tốc độ ghi lên thiết bị
* `kB_read` tổng dung lượng đã đọc từ thiết bị
* `kB_wrtn` tổng dung lượng đã viết vào thiết bị

