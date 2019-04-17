# Fping

`Fping` cũng giống như câu lệnh `ping` sử dụng ICMP echo request để xác định một máy đích có tồn tại hay không. `fping` bạn có thể chỉ ra nhiều địa chỉ cần `ping` trong dòng lệnh hoặc ban có thể đặt các địa chỉ đó trong 1 file và `fping` có thể đọc file đó để kiểm tra. Khi ta cho nó một danh sách địa chỉ để kiểm tra thì lệnh `fping` sẽ gửi gói tin kiểm tra tới máy đích và trong lúc chờ đợi máy đích trả lời nó sẽ gửi tiếp gói tin tới máy đích tiếp theo trong danh sách. Nếu máy nào trả lời lại thì máy đó sẽ báo lại tà tồn tại và sẽ được loại ra khỏi danh sách kiểm tra. Nếu quá thời gian hoặc máy dã gửi đi một số gói tin nhất định mà không thấy phản hồi lại thì hệ thống báo lại là máy đấy không thể tiếp cận.

## Cài đặt

Trước hết cần kiểm tra xem gói `fping` đã có sẵn trong máy chưa. Dùng lệnh `yum list | grep fping` đối với CentOS và lệnh `apt-cache dumpavail | grep fping` đối với Ubuntu để kiểm tra.

Nếu đã có thì thì ta cài bằng cách dùng lệnh
`yum install fping` đối với CentOS
`apt-get install fping`
Nếu chưa có thì ta download file `*.deb` hoặc `*.rpm` về và cài bình thường đối với file `deb` và `rpm`.
## Cú pháp

`fping [option] [địa_chỉ_1] [địa_chỉ_2]

Ở đây có thể gồm nhiều địa chỉ các địa chỉ ngăn cách nhau bởi dấu cách. Địa chỉ ở đây có thể là địa chỉ IP (8.8.8.8) hoặc domain name (facebook.com) hoặc cũng có thể là một file.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fping1.png)

## Option
### 1. Thiết lập địa chỉ nguồn
Nếu máy tính của ta có nhiều card mạng và nhiều địa chỉ IP. `fping` cho phép chúng ta chọn ra 1 card mạng và 1 địa chỉ IP để thực hiện ping.

VD máy có các card mạng và các địa chỉ IP. 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp1.png)

 * `-S IP` thiết lập địa chỉ ip nguồn để ping
Tôi muốn đặt địa chỉ `172.16.2.135` là địa chỉ ip nguồn để ping 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp2.png)

 * `-I interface` thiết lập một card mạng để ping
Tôi muốn đặt card `enp0s25` là card mạng mà gói tin oing sẽ đi ra từ card mạng này

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp3.png)

### 2. Cấu hình gói dữ liệu gửi 
`fping` cung cấp cho ta chức năng điều chỉnh dữ liệu sẽ được gửi trong quá trình ping. 

 * `fping -b n địa_chỉ`

Trong đó `n` là n là số byte dữ liệu ping sẽ gửi. Kích thước nhỏ nhất thường là 12 bytes. Kích thước tối thiểu của thông số này là 56 bytes.
### 3. Định dạng kết quả trả về
 * `-q` với tùy chọn này fping sẽ không xuất ra kết quả của quá trình ping. Nó thường được dùng kết hợp với các option khác. Và kết quả trả về sẽ là kết quả của tùy chọn đó.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fpd.png)

Ví dụ trên sẽ hiển thị ra địa chỉ kết nối thành công.

 * `-Q` nó giống với `-q` nhưng sẽ hiển thị ra kết quả tổng hợp cuối cùng mỗi `n` giây, sử dụng chế độ lặp hoặc đếm (-l, -c)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fpQ.png)

 * `-a` Chỉ hiển thị lên các địa chỉ `alive`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fping02.png)

 * `-u` để hiển thị ra các địa chỉ mất kết nối (unreachable)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp4.png)

 * `-A` nó sẽ trả về cho ta địa chỉ IP khi ta nhập địa chỉ là domain name

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fping3.png)

 * `-d` nó là ngược lại khi ta sử dụng option `-A` ta nhập vào địa chỉ Ip nó sẽ trả về cho ta tên miền

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp5.png)

 * `-e` để hiển thị Round Trip Time (RTT) của các gói tin.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp6.png)

### 4. Giới hạn số gói tin gửi đi
Để quy định số gói tin mà `fping` sẽ gửi đi
 * `fping -c n địa_chỉ` trong đó `n` là số gói tin được gửi đi.Thống kê cho mỗi mục tiêu được hiển thị khi tất cả các yêu cầu đã được gửi(hoặc bị gián đoạn)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp7.png)

### 5. Đọc danh sách địa chỉ từ file
 * `-f` đọc danh sách từ 1 file để kiểm tra.
`fping -f filename`
VD một file có tên `file1` dùng lệnh `fping -f file1`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fpingf.png)

### 6. Ping theo lớp mạng
* `fping -g địa_chỉ/mask`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp9.png)

Ta cũng có thể kiểm tra trong một khoảng địa chỉ nào đó bằng cách chỉ ra địa chỉ đầu và địa chỉ cuối.
 * `fping -g địa_chỉ_đầu địa_chỉ_cuối`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp10.png)

### 7. Thiết lập số lần thử lại.
 * `fping -r n địa_chỉ` Thiết lập số lần thử lại của fping.
Trong đó `n` là số  thử lại (mặc định là 3). Đây là số lần cố gắng để ping đến 1 địa chỉ, không bao gồm lần thử đầu tiên.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/fp11.png)

Ta có thẻ nhận thấy sự khác biệt so với ví dụ ở phần trên khi ta để mặc định.
