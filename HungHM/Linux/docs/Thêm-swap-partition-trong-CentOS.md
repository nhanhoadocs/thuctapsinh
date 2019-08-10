## Swap

### Swap là gì?

- Swap trong Linux được sử dụng khi dung lượng bộ nhớ vật lý (RAM) đầy. Nếu hệ thống cần nhiều tài nguyên bộ nhớ hơn và RAM đầy, hệ thống sẽ sử dụng Swap làm bộ nhớ thay thế. Thông thường Swap sử dụng ổ đĩa cứng làm bộ nhớ, tuy nhiên nó chỉ là giải pháp thay thế tạm thời vì tốc độ chậm hơn rất nhiều so với RAM. Tuy nhiên việc sử dụng bộ nhớ swap sẽ giúp hệ thống hoạt động ổn định hơn.

### Tại sao cần sử dụng Swap?
- Một số phần mềm khi cài đăt, ví dụ như cài đặt Oracle, đều yêu cầu hệ thống có bố nhớ swap.
- Hệ thống sẽ hoạt động ổn định hơn, nhất là khi hệ thống ko có nhiều bộ nhớ vật lý (RAM)
- Trong Ubuntu cần swap để sử dụng chế độ ngủ đông
### Thêm swap partition trong CentOS.
- Bước 1: Kiểm tra dung lượng swap hiện tại của hệ thống
    - Có thể sử dụng 2 lệnh `swapon -s` hoặc `free -m` để kiểm tra dung lượng swap hiện tại

    <img src="https://imgur.com/sCqsBeN.jpg">

    Như ảnh trên thì dung lượng swap hiện tại trên Linux Server của mình là 1.5 Gb

- Bước 2: Kiểm tra phân vùng ổ cứng sử dụng làm thêm swap cho hệ thống.

Ở đây hệ thống có gán thêm 1 phân vùng ổ cứng với dung lượng là 21.5 Gb là /dev/sdb. Chúng ta sử dụng lệnh fdisk "fdisk -l"để kiểm tra thông tin của phân vùng ổ cứng này.

<img src="https://imgur.com/ChxeeOg.jpg">

- Bước 3: Sử dụng commad partprobe để đọc lại phân vùng ổ cứng để kernel nhìn nhận swap parttion tạo mới gần nhất

<img src="https://imgur.com/XC0hUxx.jpg">

-  Bước 4: Tạo phân vùng swap bằng command sau

`mkswap /dev/sdb`

<img src="https://imgur.com/DW4TZsC.jpg">

Địa chỉ UUID của phân vùng swap là: UUID=80da317f-0cf9-4860-b35e-5b7e4183b0f5

- Bước 5: Sửa file /etc/fstab và thêm dòng sau vào để khi hệ thống mỗi lần khởi động sẽ kích hoạt swap

<img src="https://imgur.com/OhXXQRS.jpg">

- Bước 6: Kích hoạt swap bằng command sau:

`swapon -a`