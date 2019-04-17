# Linux  process

Trong Linux Hệ điều hành xem mỗi đơn thể mã lệnh mà nó điều khiển là một tiến trình(process). Một chương trình có thể bao gồm nhiều tiến trình kết hợp với nhau.Các tiến trình hoạt động chia sẻ tốc độ xử lý của CPU,cùngdùng chung vùng nhớ và các tài nguyên hệ thông khác. Các tiến trình được điều phối xoay vòng bởi hệ điều hành. Một chương trình nếu mở rộng dần ra, sẽ có lúc cần phải tách ra thành nhiều tiến trình để xủa lý những công việc độc lập với nhau. Thực tế trong Linux các lệnh là độc lập với nhau có khả năng kết hợp và truyền dự liệu cho nhau.
Tiến trình của chúng ta hoạt động phải luôn ở trạng thái tôn trọng và sẵn sàng nhường quyền xử lý CPU cho các tiến trình khác khi hệ thống có yêu cầu. Nếu một tiến trình xây dựng không tốt sẽ gây ra lỗi sẽ làm treo các tiến trình khác hay thậm chí là phá vỡ hệ thống.
Tiến trình là một thực thể điều khiển đoạn mã lệnh có riêng một không gian địa chỉ, có ngăn xếp stack riêng rẽ, có bảng chứa thông số mô tả file được mở cùng tiến trình và đặc biệt có một định danh `PID` duy nhất trên hệ thống vào thời điểm tiến trình đang chạy.
Trong Linux, tiến trình được cấp không gian địa chỉ bộ nhớ phẳng là 4GB. Dữ liệu cảu tiến trình này không thể đọc và truy xuất được bởi các tiến trình khác. Hai tiến trình khác nhau không thể xâm phạm biến của nhau. Tuy nhiên nếu chúng ta muốn chia sẻ dữ liệu giữa 2 tiến trình, Linux cung cấp cho ta một vùng không gian địa chỉ chung để làm điều này.

## Cách hoạt động của tiến trình
Khi một tiến trình đang chạy từ dòng lệnh, chúng ta có thể nhấn phím `Ctrl+z` để đưa nó vào hoạt động phía hậu trường. Tiến trình cảu Linux có các trạng thái:
 * Đang chạy(running): đây là lúc tiến trình chiếm quyền xử  lý CPU dùng tính toán hay thực hiện các công việc của mình.
 * Chờ(waiting): tiến trình bị Hệ Điều Hành tước quyền xử lý CPU, và chờ đến lượt cấp phát khác.
 * Tạm dừng(suspend): Hệ điều hành tạm dừng tiến trình. Tiến trình được đưa vào trạng thái sleep. Khi cần thiết và có nhu cầu hệ điều hành sẽ đánh thức hay nạp lại mã lệnh của tiến trình vào bộ nhớ. Cấp phát tài nguyên CPU để tiến trình tiếp tục hoạt động.
Thực tế khi chúng ta đăng nhập vào hệ thống và tương tác trên dòng lệnh cùng là lúc chúng ta đang ở trong tiến trình shell của bash. Khi gọi một lệnh có nghĩa là chúng ta yêu cầu bash tạo thêm một tiến trình con thực thi khác.
Lệnh `ps` và các option hệ thống sẽ liệt kê cho chúng ta thông tin về các tiến trình mà hệ điều hành đang kiểm soát.
## Bảng thông tin tiến trình
Hệ điều hành lưu giữ một cấu trúc danh sách bên trong hệ thống gọi là bảng tiến trình. Bảng tiến trình quản lý tất cả PID của hệ thống cùng với thông tin chi tiết về các tiến trình đang chạy. Ví dụ khi ta gọi lệnh `ps`, Linux thường đọc thông tin trong bảng tiến trình này và hiển thị những lệnh hay tên tiến trình được gọi: thời gian chiếm giữ CPU của tiến trình, tên người sử dụng tiến trình.
Tùy theo tham số , `ps` sẽ cho biết thông tin về tiến trình người dùng, tiến trình của hệ thống hoặc tất cả các tiến trình đang chạy. Lệnh `ps -af` sẽ trả về kết quả chi tiết.
Trong thông tin do `ps` trả về, 
 * `UID` là tên của người dùng đã goi tiến trình
 * `PID` là định danh mà hệ thống cấp cho tiến trình
 * `PPID` là định danh của tiến trình cha
 * `C` là số tiến trình con của một tiến trình
 * `STIME` là thời gian tiến trình cha được sử dụng
 * `TIME` là thời gian chiếm CPU của tiến trình
 * `CMD` toàn bộ dòng lệnh khi tiến trình được triệu gọi
 * `TTY` là màn hình terminal ảo nơi thực hiện tiến trình (Như chúng ta đã biết người dùng có thể đăng nhập vào hệ thống Linux từ rất nhiều terminal khác nhau để gọi tiến trình). 
### Các options thông dụng với câu lệnh `ps`
Với options `-A` và `-e` sẽ trả về cho ta kết quả giồng nhau

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps1.png)

Để xem được nhiều hơn thông tin về tiến trình ta có thể sử dụng thêm options `-f`(full format) hoặc `-F`(extra full format)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps2.png)

Hiển thị tiến trình của một người dùng. Ta có thể lọc ra các tiến trình mà user nào đó đang sở hữu. Ta sử dụng option `-u` và sau đó là tên user muốn hiển thị. Ta cũng có thể liệt kê ra cùng lúc nhiều user bằng cách sử dụng dấu `,` để ngăn cách giữa các user.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps3.png)

Hiển thị process theo PID và PPID. Ta có thể sử dụng option `-p` để hiển thị prosess theo `PID` mà ta cần tìm kiếm. Dùng lệnh `ps -fp PID_của_process` ta có thể tìm kiếm một lúc nhiều PID bằng các nhập vào một lúc nhiều PID và ngăn các nhau bởi dấu cách.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps4.png)

Ta cũng có thể để hiển thị các process có một `PPID` nào đó ta dùng tùy chọn `--ppid`. Câu lệnh 
`ps -f --ppid PPID_cần_hiển_thị`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps5.png)

Lệnh `ps` cũng cho phép ta hiển thị ra các tiến trình có câu lệnh được chỉ ra. Ta sử dụng option `-C`. Dùng lệnh `ps -fC tên_lệnh`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps6.png)

Lệnh `ps` này cũng cho phép ta chỉ định những kết quả trả về màn hình với option `-o`
 * VD ở đây ta chỉ muốn kết quả hiển thị `UID` `PID` `TTY` và `TIME` ta dử dụng lệnh sau

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps7.png)

Ta cũng có thể dùng thêm các tùy chọn khác 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps9.png)

Option `--forest` trả về kết quả theo dạng cây sẽ dễ dàng cho ta xác định mối quan hệ(tiến trình mẹ) giữa chúng

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps10.png)

Ta có thể xem thời gian tiến trình đã chạy bằng cách ở phần định dạng kết quả trả về ta truyền thêm vào đối số `etime`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps11.png)

## Tắt tiến trình đang chạy với lệnh `kill`
Trong bất kỳ hệ điều hành nào có đôi lúc chúng ta gặp phải tình trạng một ứng dụng không hoạt đọng và chúng ta ko thể đóng nó lại bằng cách bình thường. Trong Linux có lệnh cho phép ta chấm dứt hoạt động của chương trình một cách mạnh mẽ.
Để đóng một chương trình ta cần phải kiểm tra xem `PID` của nó là gì. Để kiểm tra `PID` của một câu lệnh đang chạy ta sử dụng lệnh `ps` và các options phù hợp như đã tìm hiểu ở phần trên
Cú pháp `kill PID`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/ps1.1.png)
