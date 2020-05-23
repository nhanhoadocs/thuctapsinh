# [SSH] [Mobaxterm] Hướng dẫn sử dụng MobaXterm để SSH vào server linux

Đối với các hệ điều hành của họ Linux như CentOS, Ubuntu, Fedora, Debian … thì việc điều khiển thông thường thực hiện qua thao tác dòng lệnh CLI. Để thực hiện việc này, người dùng sẽ sử dụng các phần mềm như Putty, MobaXterm, XShell để thực hiện SSH tới port mặc định 22 của máy chủ. Trong bài viết này, Team Nhân Hòa sẽ hướng dẫn với các bạn sử dụng MobaXtem.

## 1. Các tình năng hay của MobaXtem

MobaXterm có những tính năng hay ho hơn so với việc sử dụng Putty, nó giúp người dùng thao tác tốt hơn khi điều khiển các máy chủ linux, bao gồm:

Hỗ trợ mở nhiều cửa sổ để làm việc.
Hỗ trợ tích hợp việc FTP hoặc SFTP để truyền file từ máy người dùng lên máy chủ.
Hỗ trợ các thao tác zoom màn hình CLI hoặc thay đổi màu sắc bắt mắt hơn.
Hỗ trợ các phương thức kết nối như FTP, Telnet, RDP (remote desktop với các máy là windows)
Hỗ trợ các công cụ dùng để scan port, scan network.
Lưu phiên đăng nhập sau lần đầu truy cập vào SSH hoặc các giao thức khác.
## 2. Cách sử dụng MobaXterm

### 2.1. Tải MobaXterm

MobaXtem cung cấp 2 phiên bản, phiên bản free – Home Edition và phiên bản mất phí – `Professional Edition`. Đối với người dùng thông thường, chỉ cần tải bản free là đủ (bản free) cho phép lưu 10 section SSH đầu tiên (có thể hiểu là 10 máy chủ).

Khi tải bản free, bạn có thể chọn dạng portable (giải nén và dùng ngay) hoặc dạng install (tải và cài đặt). Thực hiện tải bản free – Home Edition ở link dưới

    https://mobaxterm.mobatek.net/download-home-edition.html

Trong hướng dẫn này sẽ chọn dạng file cài đặt đối với bản Home Edition

![Imgur](https://i.imgur.com/xYWMnf4.png)

Sau khi tải về, tiếp tục thực hiện các thao tác cài đặt. Trong quá trình cài đặt thực hiện các tùy chọn mặc định là đủ để sử dụng.

### 2.2. Sử dụng MobaXterm để truy cập SSH

Sau khi cài đặt xong, tiến hành mở MobaXterm, ta sẽ có giao diện dưới.

![Imgur](https://i.imgur.com/ITbf1AW.png)

Thưc hiện thao tác để mở cửa sổ kết nối SSH tới server của bạn. Ta chọn tab `Section`=> `New section`. Ngoài ra, có thể thực hiện tổ hợp phím `Ctl + Shif + N`, ta cũng có kết quả tương tự.

![Imgur](https://i.imgur.com/WPEs1tF.png)

Cửa sổ mới hiện ra sau thao tác trên sẽ có dạng như bên dưới. Chọn tab `SSH`

![Imgur](https://i.imgur.com/v3IVctr.png)

Tại cửa sổ trên, tiến hành nhập địa chỉ IP và port của máy chủ. Thường thì mặc định giá trị port SSH sẽ là 22 nếu như bạn không có thay đổi gì. Trong hướng dẫn này chúng tôi sẽ kết nối tới IP có địa chỉ là `192.168.10.31` với các thông tin như sau:

- Remote host: điền địa chỉ IP, trong hướng dẫn này là `192.168.10.31`
- Port: Điền port SSH của máy chủ, mặc định là: `22`
- Trường còn lại bỏ trống.

Sau khi nhập xong, chọn OK.

![Imgur](https://i.imgur.com/sXQt61y.png)

Sau khi chọn OK, ta sẽ có giao diện để nhập user và mật khẩu của máy chủ. Thường sẽ sử dụng user có tên là `root` và mật khẩu được cung cấp trước đó.

![Imgur](https://i.imgur.com/etOpuVb.png)

**Lưu ý:** Khi nhập mật khẩu sẽ không hiển thị dấu * như các ứng dụng khác, bạn có thể chép mật khẩu ra notepad và paste lại ở màn hình trên.

Sau khi nhập đúng mật khẩu sẽ xuất hiện màn hình

![Imgur](https://i.imgur.com/VNXlOdJ.png)

Ta chọn Yes để mỗi lần đăng nhập lại ta không cần khai báo lại mật khẩu. Cũng lưu ý việc này nên cân nhắc vì mật khẩu sẽ được lưu trên máy của bạn. Trong hướng dẫn của cửa sổ trên cho phép xóa các mật khẩu được lưu này nếu bạn muốn.

Sau khi chọn YES ta sẽ có màn hình dưới.

![Imgur](https://i.imgur.com/GZtAjUI.png)

Ta có thể kiểm tra phiên bản hệ điều hành bằng lệnh `cat /etc/*-release`. Kết quả sẽ hiển thị dạng như bên dưới.

![Imgur](https://i.imgur.com/hJp6lQM.png)

Hoặc có thể kiểm tra bằng các lệnh khác như: ip address, ping cloud365.vn

Tới đây bạn đã truy cập SSH thành công và có thể bắt đầu thao tác.

### 2.3. Các thao tác khác với MobaXterm

Ngoài sử dụng SSH, MobaXterm còn có có thế sử dụng để thực hiện truyền file thông qua sftp. Phần này sẽ hướng dẫn bạn up file từ máy tính cá nhân lên máy chủ thông qua MobaXterm.

Chọn tab `sftp` theo hình dưới.

![Imgur](https://i.imgur.com/j7rA4Jm.png)

Chọn biểu tượng `upload`

![Imgur](https://i.imgur.com/6Qynkz2.png)

Chọn file cần upload từ máy tính và chọn `Open`

![Imgur](https://i.imgur.com/xHrtuVY.png)

Sau khi chọn file, tùy thuộc vào dung lượng mà thời gian up sẽ là nhanh hay chậm. Ta có thể quan sát ở màn hình giống như bên dưới.

![Imgur](https://i.imgur.com/3lvrCaM.png)

Sau khi thực hiện upload xong, ta có thể kiểm tra tại thư mục `/root/` của máy chủ xem file đã có hay chưa bằng lệnh `ls -alh` tại thư mục `/root/`.

![Imgur](https://i.imgur.com/rn0RRIE.png)

Kết quả file đã được đưa lên máy chủ.

## 3. Kết luận

Trong hướng dẫn này, Team Nhân Hòa đã hướng dẫn bạn sử dụng cơ bản về MobaXteam. Bạn có thể trải nghiệm thêm các tính năng khác của nó ở trên các tab, hãy tự trải nghiệm và chia sẻ cùng chúng tôi nếu bạn muốn nhé.