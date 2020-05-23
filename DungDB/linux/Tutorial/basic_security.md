# Linux basic security

Mặc định, Linux có vài loại tài khoản để cô lập các quy trình và lượng công việc.
- root
- system
- normal
- network

Vì môt trường an toàn, nên cấp các đặc quyền tối thiểu có thể và cần thiết cho các tài khoản, và xóa bỏ các tài khoản không hoạt động. Lệnh `last` hiển thị lần cuối cùng các người dùng đăng nhập vào hệ thống, có thể sử dụng để xác định các tài khoản không hoạt động tiềm năng để gỡ bỏ khỏi hệ thống.

![Imgur](https://i.imgur.com/F76dykB.png)

Tài khoản root là tài khoản có quyền cao nhất trong hệ thống Linux/Unix. Tài hoản này có thể thực hiện tất cả các khía cạnh của quản trị hệ thống, bao gồm cả thêm tài khoản, đổi mật khẩu người dùng, giám sát file log, cài đặt phần mềm. vân vân

Một tài khoản thông thường có thể thực hiện một vài hoạt động cần có đặc quyền đặc biệt. Tuy nhiên, cấu hình hệ thống vẫn phải cho phép các khả năng đó được thực hiện. Chạy một network client hoặc chia sẻ file là hoạt động không cần quyền root.

Trong Linux, ta có thể dùng lệnh `su` hoặc `sudo` để tạm thời gán quyền truy cập root cho một người dùng bình thường, các phương pháp này thực tế khá khác biệt. Khi sử dụng lệnh `su`:
- Để nâng đặc quyền, ta cần nhập mật khẩu root. Đưa mật khẩu root cho một tài khoản thường là một hành động không bao giờ nên làm.
- Khi một người dùng được nâng quyền lên root, người dùng đó có thể làm tất cả mọi thứ người dùng root có thể làm, không bị hỏi lại mật khẩu.
- Có tính năng đăng nhập hạn chế.

Khi sử dụng lệnh `sudo`:
- Cần phải nhập mật khẩu của người đùng, không phải mật khẩu root.
- Thứ người dùng được làm có thể được kiểm soát và giới hạn chính xác. Mặc định, người dùng sẽ luôn luôn giữ mật khẩu để thực hiện các hành động xa hơn với lệnh `sudo` hoặc có thể tránh làm thể trong khoản thời gian cấu hình.
- Có tính năng đăng nhập chi tiết.

## Lệnh sudo
Phân quyền dùng lệnh `sudo` ít nguy hiểm hơn lệnh `su`. Mặc định, `sudo` phải được bật trên cơ sở mỗi người dùng. Tuy nhiên, một vài bản phân phối (vd như Ubuntu) bật nó mặc định cho ít nhất một một tài khoản chính, hoặc cho điều này thành một tùy chọn trong cài đặt. Để thực hiện một lệnh với quyền root, gõ `#sudo <lệnh>`. Khi lệnh được thực thi xong, ta sẽ trở về đặc quyền người dùng bình thường. Các file cấu hình `sudo` được đặt ở `/etc/sudoers` và thư mục `/etc/sudoers.d/`. Mặc định thì thư mục đó trống.

Lệnh `sudo` có thể theo dõi các lần cố lấy quyền root không thành công. Một thông điệp xác nhận thất bại sẽ được gửi đến file log `/var/log/secure`.

    #tail /var/log/secure

![Imgur](https://i.imgur.com/DDdTMyl.png)

Bất cứ khi nào lệnh sudo được gọi, một trình kích hoạt sẽ xem xét `/etc/sudoers` và các tệp trong `/etc/sudoers.d` để xác định xem người dùng có quyền sử dụng sudo hay không và phạm vi đặc quyền của họ là gì. Các yêu cầu của người dùng không xác định và các yêu cầu thực hiện các hành động không được phép đến người dùng sẽ bị báo cáo, kể cả với `sudo`. Ta có thể chỉnh sửa sudoers file bằng lệnh `visudo`, chỉ có một người có thể chỉnh sửa file trong một lúc, có đặc quyền thích hợp và từ chối ghi ra file rồi thoát nếu có lỗi trong khi chỉnh sửa.

iến trúc cơ bản của một entry là 

    who where = (as_whom) what

Để tạo một tài khoản người dùng cho nó truy cập sudo, đăng nhập vào user root và sử file `/etc/sudoers/` với lệnh `visudo` Tìm các dòng gán quyền `sudo` tới user trong group `wheel` khi được bật.

![Imgur](https://i.imgur.com/AYIQydw.png)

Uncomment bằng cách xóa ký tự `#` ở đầu dòng thứ 2. Điều này cho phép tùy chỉnh cấu hình. Lưu lại và thêm user ta đã tạo tới group `wheel`.

![Imgur](https://i.imgur.com/2WuKdL0.png)

Nếu cấu hình đúng, dòng cuối cùng sẽ hiển thị `root`.

Một vài bản phân phối Linux khuyến cáo ta thêm một file vào thư mục `/etc/sudoers.d` với tên trùng với tên user. File này chứa cấu hình sudo của từng người dùng và người dùng không được chạm vào file cấu hình chính trừ các thay đổi ảnh hưởng đến tất cả người dùng.
## Cô lập quá trình (process isolation)
Linux được coi là an toàn hơn so với nhiều hệ điều hành khác vì các quá trình được cô lập tự nhiên với nhau. Một quá trình thường không thể truy cập tài nguyên của quá trình khác, ngay cả khi quá trình đó đang chạy với cùng đặc quyền người dùng. Các cơ chế bảo mật bổ sung đã được giới thiệu gần đây để tạo ra rủi ro nhỏ hơn nữa là:
- Control group: Cho phép người quản lý hệ thống nhóm các quá trình và liên kết các tài nguyên cho mỗi nhóm (cgroup)
- Linux containers: làm cho nó có thể chạy nhiều container hệ thống linux bị cô lập trên một hệ thống.
- Virtualization (ảo hóa): phần cứng được mô phỏng theo cách không chỉ có thể tách rời các quy trình mà toàn bộ hệ thống được chạy đồng thời dưới dạng khách cô lập và tách riêng (máy ảo) trên một máy chủ vật lý.
## Mã hóa mật khẩu
Bảo vệ mật khẩu đã trở thành một yếu tố quan trọng của bảo mật. Hầu hết các bản phân phối Linux đều dựa trên thuật toán mã hóa mật khẩu hiện đại có tên SHA-512 (Secure Hashing Algorithm 512 bits) được phát triền bởi NSA để mã hóa mật khẩu. Thuật toán SHA-512 được dùng nhiều cho các ứng dụng và giao thức bảo mật. Các ứng dụng và giao thức bảo mật này bao gồm  TLS, SSL, PHP, SSH, S/MIME và IPSec. SHA-512 là 1 trong các thuật toán hàm băm được thử nghiệm nhiều nhất.
## Password aging
Password aging là một phương pháp để đảm bảo các user được nhận lời nhắc tạo mật khẩu mới sau một khoảng thời gian nhất định. Điều này đảm bảo các mật khẩu nếu đã bị crack, sẽ chỉ có thể được dùng trong thời gian giới hạn. Tính năng này được thực hiện bằng cách dùng lênh `chage`, lệnh này cấu hình thông tin hết hạn mật khẩu cho người dùng.

![Imgur](https://i.imgur.com/ZzJzDon.png)

## Public/Private Keys để xác thực
Sử dụng các key được mã hóa để xác thực có hai lợi ích chính. Không cần phải nhập mật khẩu nếu ta dùng Public/Private Keys và khi Public/Private Key pair đã được cài đặt, ta có thể tắt xác thực mật khẩu hoàn toàn, nghĩa là nếu không có key sẽ không vào được hệ thống.

Tạo private key cho client và public key cho server 

![Imgur](https://i.imgur.com/bipx9dM.png)

Điều này sẽ tạo hai file trong thư mục ssh ẩn của bạn được gọi là: `id_rsa` và `id_rsa.pub`. Đầu tiên là private key và file kia là public key. Cài đặt public key vào danh sách khóa được ủy quyền và sau đó xóa nó khỏi server.

    # cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    # rm -rf ~/.ssh/id_rsa.pub

**Lưu ý** rằng cùng một public key có thể được cài đặt cho nhiều máy chủ, chỉ cần sao chép nó trên máy chủ đó và cài đặt vào danh sách khóa được ủy quyền.

Sao chép private key trên client mà bạn sẽ sử dụng để kết nối với máy chủ và sau đó xóa nó khỏi server.

    # scp ~/.ssh/id_rsa root@clientmachine:root/.ssh/
    # rm -rf ~/.ssh/id_rsa

Trên máy client, dùng private key để đăng nhập vào máy server

    # ssh -i ~/.ssh/id_rsa root@servermachine

![Imgur](https://i.imgur.com/vQNhfyh.png)

Trên Client Windows, sử dụng công cụ puttygen hoặc Mobakeygen để tạo khóa theo định dạng phù hợp và sử dụng ứng dụng Putty hoặc MobaXterm để đăng nhập vào Server. Lưu ý rằng mỗi người dùng muốn đăng nhập phải có cặp khóa riêng.

Sử dụng Mobakeygen:

![Imgur](https://i.imgur.com/w0QkJzR.png)

Copy file private key sang máy client windows và dùng Mobakeygen để Load private key.

![Imgur](https://i.imgur.com/iqR3OyA.png)

Nhập passphrase

![Imgur](https://i.imgur.com/Xflc5O2.png)

Lưu lại dưới dạng .ppk

![Imgur](https://i.imgur.com/08rxTw5.png)

Tiến hành SSH vào Server 

![Imgur](https://i.imgur.com/onslD8O.png)

Nếu có mật khẩu bạn phải nhập mật khẩu

![Imgur](https://i.imgur.com/jWidVh4.png)

Như vậy là đã hoàn thành SSH đến Server.