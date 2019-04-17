`iSCSI`- Internet Small Computer System Interface được xem là một giao thức để truyền tải các SCSI qua mạng IP bằng giao thức TCP/IP. Từ đó `iSCSI` cho phép truy cập các khối dữ liệu (phân vùng, disk, hoặc thiết bị lưu trữ) trên server qua các lệnh SCSI và truyền tải dữ liệu trên hệ thống mạng(LAN/WAN).

Nó hoạt động trên mô hình Client-Server. Ta có thể tưởng tượng thay vì ta đem 1 disk cắm trực tiếp vào 1 máy để chạy và khi cần di chuyển thì ta tháo ra và mang đến máy khác cắm vào. Làm như thế rất bất tiện. Với `iSCSI` thì ta không cần mất công như vậy mà vẫn có thể đáp ứng được điều đó. Ta vẫn có thể làm việc với disk trên server như các disk đó đang thực sự đang nằm trên máy của mình.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi1.png)

## Một số thuật ngữ
* `Initiator`: Là máy client. Nó gửi yêu cầu truy cập đến server để truy cập vào khối dữ liệu.
* `Target`: đóng vai trò server, nơi lưu trữ dữ liệu. Mỗi máy target phải có một tên duy nhất để các `initiator` truy cập vào. Một `target` có một hoặc nhiều hơn 1 khối các thiết bị lưu trữ.
* `ALC` (Access Control List) danh sách điều khiển truy nhập là một hạn chế truy nhập bằng cách sử dụng nút IQN để xác thực quyền truy nhập cho Client.
* `Discovery` nó liên quan đến việc truy vấn server để tìm kiếm mục tiêu được cấu hình.
* `iqn`: là một quy định trong cách đăt tên cho cả `target` và `initiator`. Định dạng đặt tên như sau:
`iqn.năm-tháng.tên_miền:tên_phân_biệt`
Trong đó:
 * `iqn` biểu thị rằng tên này sẽ sử dụng tên miền làm mã định danh cho nó.
 * `năm-tháng` là tháng đầu tiên mà tên miền được tạo.
 * `tên miền` là tên của server. 
 * `tên phân biệt` tên này được thêm vào để ta phân biệt với target khác trên máy này.
* `Login` điều này xác thực target hoặc LUN dể bắt đầu sử dụng để login vào từ máy client.
* `LUN`- Logical Unit Number. Gồm các thiết bị (disk, partition hoặc logical volume) được gắn kết với nhau và thông qua target. Một target có thể gồm nhiều LUN nhưng thông thường một target cung cấp một LUN.
* `node` là một iSCSI initiator hoặc iSCSI target được xác định bởi IQN của nó.
* `portal` là địa chỉ IP và port trên target và initiator để thiết lập kết nối.
### Một số loại bộ nhớ sao lưu (backstores).
* `Block` một khối thiết bị lưu trữ được xác định trên server. Nó có thể là disk, partition, logical volume, hoặc bất kỳ files thiết bị nào được chỉ ra trên server.
* `fileio` nó tạo ra một file có kích thước xác định trong hệ thống file của server.
## Cài đặt
* Chuẩn bị
 * Ít nhất 2 máy trong đó có 1 máy đóng vai trò server và các máy còn lại đóng vai trò Client.
 * Trên máy server add thêm một vài ổ cứng.
### Trên server (Target)
Cài đặt target trên server bằng lệnh:
`yum install targetcli`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi2.png)

Sau đó dùng lệnh `targetcli` để hiện dấu nhắc tương tác với iSCSI

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi3.png)

Tiếp theo tiến hành cd vào thư mục bên `backstores/block` hoặc `backsstores/fileio` tùy theo bạn muốn tạo backstores theo kiểu nào.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi4.png)

Tiếp theo tạo một block(có thể là file nếu sử dụng kiểu `fileio`) và chỉ định cho nó dùng thiết bị lưu trữ nào (có thể là disk, partition hoặc là logical volume). 
Cú pháp `create tên_block thiêt_bị`
Ở đây tôi để tên block là `scsi_server1` còn thiết bị tôi gán cho nó là ổ `/dev/sdb`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi5.png)

Tiếp theo tạo target
Ở đây chúng ta phải sử dụng tên theo tiêu chuẩn (đã mô tả ở trên). Tên miền ở đây là `test.vn` nhưng trong quy định về đặt tên thì tên miền phải được viết đảo ngược lại.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi6.png)

Tạo `LUN` dưới target. LUN nên sử dụng đối tượng lưu trữ sao lưu được đề cập trước đây `scsi_server1` hoặc ta cũng có thể chỉ ra các đường dẫn tới các thiết bị khác.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi7.png)

Tạo `ACL` để khi client trình bày đúng cái tên này thì nó mới được target chấp nhận kết nối. Khi tạo `ACL` này thì có 1 phần ko đổi là phần trước dấu hai chấm đây là phần tên máy nó cố định như ta đặt từ trước. Phần sau dấu 2 chấm là một mật khẩu riêng những client nào ta muốn cho truy cập vào thì ta mới cho biết.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi8.png)

`LUN 0` ta vừa tạo bên trên đã được map vào ACL ta vừa tạo.

Bây giờ ta có thể cd ra thư mục `/` và kiểm tra bằng lệnh `ls`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi9.png)

Ta lưu nó lại và thế là ta đã cấu hình xong iSCSI trên server

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi10.png)

Tiếp theo ta phải bật và khỏi động lại dịch vụ target
Lệnh: 
`systemctl restart target.service`

`systemctl enable target.service`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi13.png)

Tắt firewall để client có thể truy cập vào.
`firewall-cmd --permanent --add-port=3260/tcp`

`firewall-cmd --reload`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi14.png)


### Trên Client(Initiator)
Cài `iscsi initiator` trên máy client bằng lệnh
`yum install iscsi-initiator-utils`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi11.png)

Tiến hành sửa file `/etc/iscsi/initiatorname.iscsi` để giống với ACL ta tạo trên server để có thể kết nối đến server.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi12.png)

Sử dụng tiện ích `iscsiadm` để tìm kiếm, đăng nhập, đăng xuất các targets iSCSI.
Để có được danh sách các target trên server ta thực hiện cú pháp sau:
`iscsiadm -m discovery -t st -p IP_server`
Trong ví dụ này server của tôi có địa chỉ IP: 192.168.169.129

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi15.png)

Đăng nhập vào target được tìm thấy. Ta có 2 cách để đăng nhập vào 
`iscsiadm -m node -l` cho phép ta đăng nhập vào tất cả target tìm thấy ở trên.
hoặc `iscsisdm -m node -T tên_target -p IP` để đăng nhập vào target của IP ta chỉ định.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi16.png)

Bây giờ ta kiểm tra đã có 1 disk mới được thêm vào

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi17.png)

Để sử dụng nó ta tiến hành phân vùng format và mount nó vaò thư mục và sử dụng bình thường như khi ta gán trực tiếp vào máy của ta.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi18.png)

Để logout khỏi iSCSI targets ta cũng có 2 cách để đăng xuất như khi ta đăng nhập vào. 
`iscsiadm -m node -u` để đăng xuất ra khỏi tất cả các target ta đang đăng nhập.
`iscsiadm -m node -u -T tên_target -p IP` để đăng xuất khỏi một target mà ta chỉ ra.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/scsi19.png)