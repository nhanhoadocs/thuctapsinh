Câu lệnh `mtr` được kết hợp giữa lệnh `traceroute` và lệnh `ping`. `mtr` sẽ gửi liên tục các gói  đi qua các nút mạng để đến đích và  hiển thị thời gian ping cho mỗi nút mạng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mtr1.png)

## Cài đặt
Trên Ubuntu
`apt-get install mtr`
Trên CentOS
`yum install mtr`
## Đọc báo thông báo trả về

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mtr2.png)

* Cột thứ nhất thể hiện số thứ tự của các nút mạng mà gói tin đi qua để đến đích.
* Cột thứ 2 là địa chỉ của nút mạng mà gói tin đi qua. Địa chỉ ở đây có thể là địa chỉ IP hoặc là hostname của máy chủ mà gói tin đi qua.
* Cột `Loss%` thể hiện tỷ lệ % gói tin bị mất tại mỗi nút mạng. Cột `Snt` đếm số gói tin gửi đi. Khi sử dụng option `-r` hoặc `--report` thì số gói tin mặc định được gửỉ ra là 10 (ta cũng có thể thay đổi được nó). Nếu ta không sử dụng option `-r` thì cột này sẽ thay đổi liên tục (tăng dần từ 1 đến khi ta cho nó dừng).
* `Last` là độ trễ của gói tin cuối cùng được gửi được đo bằng (ms).
* `Avg` là độ trễ trung bình của tất cả các gói tin đã được gửi.
* `Best` là độ trễ ngắn nhất trong các gói tin đã gửi ra.
* `Wrst` là độ trễ dài nhất trong các gói tin đã gửi ra.
* `StDev` 
## Các Option
* `-r` (report) option này cho phép in ra một bảng báo cáo cuối cùng khi nó gửi đủ số gói tin yêu cầu. (mặc định là 10 gói tin ta có thể thay đổ được số này).

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mtr3.png)

* `-c` để chỉ ra số gói tin gửi đi. Lệnh `mtr -c n địa_chỉ` trong đó `n` là số gói tin gửi đi.
VD muốn mtr gửi đi `5` gói tin để kiểm tra đường truyền tới trang `dantri.com`
`mtr -c 5 dantri.com`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mtr4.png)

* `-p` hoặc `--psize` để chỉ định kích thước gói tin được gửi đi
Lệnh `mtr -p n địa_chỉ` trong đó `n` là kích thước gói tin được tính bằng bytes.
* `-n` hoặc `--no-dns` để cột địa chỉ các nút mạng trả về sẽ là địa chỉ Ip chứ ko phải host name.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mtr5.png)

* `-i` hoặc `--interval` để cài đặt thời gian lần lượt mỗi gói tin ICMP echo requests được gửi đi.
Lệnh `mtr -i n địa_chỉ` trong đó `n` là thời gian mỗi gói tin gửi đi cách nhau `n` giây.
Ngoài ra còn các option khác ta có thể tham khảo trong tùy chọn `-h` 
`mtr -h`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/mtr6.png)