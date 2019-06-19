# Check trạng thái của CPU và RAM trong Linux

CPU ( Central Processing Unit ) hay còn gọi là bộ xử lý trung tâm. CPU đóng vai trò như não bộ của một chiếc máy tính, tại đó mọi thông tin, thao tác, dữ liệu sẽ được tính toán kỹ lưỡng và đưa ra lệnh điều khiển mọi hoạt động của Laptop.

RAM (Random Access Memory) là bộ nhớ truy xuất ngẫu nhiên. Khi mở một phần mềm trên Laptop thì dữ liệu sẽ được truyền tải từ ổ đĩa cứng lên RAM và truyền tải vào CPU để xử lý, sau đó lưu ngược lại vào ổ cứng vì RAM có tốc độ rất nhanh hơn rất nhiều lần so với ổ cứng

- Ta sử dụng lệnh `` Top `` để hiển thị các quy trình Linux. Lệnh này sẽ cập nhật liên tục các tiến trình trong hệ thống đang chạy.

    ![img](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/62650132_2503503726383777_4089198445095550976_n.png?_nc_cat=106&_nc_oc=AQlAj9ShauE0hwxd5te1ki1fCXK8YQHgPvmG_Pbbb6hjoLH0Rr1e6mKVEpvjA5Qqg9I&_nc_ht=scontent.fhan5-3.fna&oh=c490931883a29eb398a91671057ba323&oe=5D9ABB0F)

**Ta có các thông số sau:**

    - PID: mã tiến trình mỗi tiến trình có một mã riêng để phân biệt với các mã khác.

    - User: là user đang thực hiện tiến trình đó.

    - PR: Mức độ ưu tiên của tiến trình được nhìn thấy bởi kernel.

    - NI: Mức độ ưu tiên của tiến trình là một khái niệm ở không gian người dùng.
    Giá trị nice -20 thể hiện mức độ ưu tiên cao nhất và giá trị nice là 19 thể hiện mức độ ưu tiên thấp nhất cho một quy trình.
    renice 17 -p 1134 ( Điều này thay đổi giá trị nice của công việc với process id 1134 thành 17. )
    - VIRT: Lượng RAM ảo mà tiến trình chiếm.

    - RES: lượng RAM dùng cho tiến trình.

    - SHR: Thể hiện dung lượng bộ nhớ dùng chung được sử dụng bởi một tác vụ.

    - s: cho biết trạng thái của quá trình.

    - %CPU: Phần trăm CPU dùng cho tiến trình.

    - %MEM: phần trăm RAM dùng cho tiến trình.

    - TIME+: Thời gian CPU hoàn thành tiến trình.

    - COMMAND: Dòng lệnh để thực hiện tiến trình.

**Hàng đầu tiên:**

    - top - 15:14:45 : Thời gian hiện tại.

    - up 14:21 : Thời gian hệ thống chạy.

    - 5 user : số lượng user đăng nhập.

    - load average: 0.00, 0.01, 0.05 : trong 1,5,15 phút của CPU.

**Hàng thứ 2:**

    - Task: 229 total, : Tổng số tiến trình.

    - 1 running, : Số tiền trình chạy.

    - 228 sleeping, : Số tiến trình không chạy.

    - 0 stopped, : Số tiến trình bị dừng lại.
    
    - 0 zombie : Là một quá trình mà việc thực hiện được hoàn thành nhưng nó vẫn có một mục trong bảng quy trình. Các quy trình zombie thường xảy ra đối với các quy trình con, vì quy trình cha mẹ vẫn cần đọc trạng thái thoát của con. Một khi điều này được thực hiện bằng cách sử dụng lệnh gọi hệ thống chờ, quy trình zombie sẽ bị loại  

**Hàng thứ 3%(Cpu(s)):**

    - 0.2 us, : %CPU sử dụng bởi tiến trình user.

    - 0.0 sy, : %CPU sử dụng bởi tiến trình hệ thống.

    - 0.0 ni, : %CPU tiến trình sử dụng bởi cài đặt nice giá trị.

    - 99.8 id, : %CPU trong trạng thái rảnh.

    - 0.0 wa, : %CPU Sử dụng để chờ hoạt động I/O hoàn thành.

    - 0.0 hi, : %CPU Sử dụng tắt phần cứng.

    - 0.0 si, : %CPU Sử dụng tắt phần mềm.

    - 0.0 st : %CPU Sử dụng Trong môi trường ảo hóa. Lượng CPU được lấy để dùng để chạy máy ảo khác.

**Hàng thứ 4:(memory)**

Tính bằng KiB.
    
    - 995924 total, : lượng RAM Tổng.

    - 89864 free, : lượng RAM Trống.

    - 663560 used, : lượng RAM Được sử dụng.

    - 242500 buff/cache : lượng RAM Đã được cache. Khi một tiến trình chạy thì sẽ được cấp phát một. lượng RAM. Khi mà ta chạy và dừng một tiến trình thì lượng RAM cấp phát đó sẽ được chuyển thành Inactive memory và được cache lại. Khi tiến trình này lặp lại một lần nữa thì Inactive memory sẽ được cung cấp ngay lập tức mà không phải cấp phát lại.

**Hàng thứ 5 (Swap)**

    - 0 total, : Lượng Swap Tổng.

    - 0 free, : Lượng Swap Trống.

    - 0 used. : Lượng Swap Sử dụng.

    - 102032 avail Mem : Dung lượng có sẵn.

## Option top.

- Lệnh top sẽ cập nhật liên tục các tiến trình cho tới khi ta nhấn ``q``.  

  - Với lệnh dưới đây, lệnh top sẽ tự động thoát sau 10 lần lặp lại. (bao nhiêu tùy chọn)
  
`` top -n 10 ``

- Hiển thị người dùng cụ thể:

    ``top -u paras``

- Sau khi chạy lệnh `` top `` ta có thể nhấn phím ``z`` để đổi màu các tiến trình.

![](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/64253507_468288323982591_6462169564057698304_n.png?_nc_cat=111&_nc_oc=AQn5JCyAhiQhsZGs1UF-2CeNuxCG0HiV9FgT5i0QZCVho7EilZ7qJOA6bf890yEl_oM&_nc_ht=scontent.fhan5-3.fna&oh=df95be92f8c68f0eddfc4d21a04c401d&oe=5D9953B1)

- Hiển thị đường dẫn tuyệt đối, nhấn phím ``c``.

![](https://scontent.fhan5-5.fna.fbcdn.net/v/t1.15752-9/64381204_376882299625962_2772756583363379200_n.png?_nc_cat=101&_nc_oc=AQknAtb9TL_MDoP3GlWdF_-FTF7BKF2gA__xvKi3uWrLJ8Ty5ZRbf1fIb7xXfAWo_QQ&_nc_ht=scontent.fhan5-5.fna&oh=69be1e38230ce52985b0f38373193d63&oe=5D935F5D)

- Dừng tiến trình sau khi tìm được tiến trình PID, ta nhấn phím ``k``.

![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/64301673_2312636575672296_5228793164399116288_n.png?_nc_cat=100&_nc_oc=AQmePUqK_e8HXJZ4DQJjGzBxNQ1hIiVh26lr90OsdAjh83p7qRG6D_kmzTefd2Pnqbc&_nc_ht=scontent.fhan5-7.fna&oh=c009615aaceb6541bbb96909c3f4ba03&oe=5D7BEB77)

- Nhấn ``Shift + P`` để sắp xếp các quy trình theo mức độ sử dụng CPU.

![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/62390514_771198873274543_7907367218109743104_n.png?_nc_cat=103&_nc_oc=AQnIeVW6hBUDtzTHoS_w8fcdukWKmJFtOqPutzG6Ilz1a_9Pcgc-W4unIVG7onMJ-G0&_nc_ht=scontent.fhan5-7.fna&oh=ef5b55b23ac784b20b0fbb9c98d328c2&oe=5D9EC358)

- Dùng chế độ bảo mật:

`` top -s ``


### Tài Liệu Tham Khảo:
https://www.geeksforgeeks.org/top-command-in-linux-with-examples/

https://github.com/nhanhoadocs/thuctapsinh/blob/master/DucNA/command-check/docs/cpu.md


