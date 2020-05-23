# Cài đặt Ubuntu Server 16, Ubuntu Server 18, Ubuntu Server 20.04 (bản develop)

## Giới thiệu Ubuntu

Ubuntu là một hệ điều hành máy tính dựa trên Debian GNU/Linux, một bản phân phối Linux thông dụng, là bản phân phối Linux thông dụng nhất cho máy tính để bàn (chiếm khoảng 30% số bản Linux được cài đặt trên máy tính để bàn năm 2007).

Ubuntu là phần mềm mã nguồn mở tự do, có nghĩa là người dùng được tự do chạy, sao chép, phân phối, nghiên cứu, thay đổi và cải tiến phần mềm theo điều khoản của giấy phép GNU GPL. Ubuntu được tài trợ bởi Canonical Ltd (chủ sở hữu là một người Nam Phi Mark Shuttleworth). Thay vì bán Ubuntu, Canonical tạo ra doanh thu bằng cách bán hỗ trợ kĩ thuật. Bằng việc để cho Ubuntu tự do và mở mã nguồn, Canonical có thể tận dụng tài năng của những nhà phát triển ở bên ngoài trong các thành phần cấu tạo của Ubuntu mà không cần phải tự mình phát triển.

Các phiên bản Ubuntu được đặt tên theo dạng YY.MM (tên), trong đó Y tương ứng với năm phát hành, và MM tương ứng với tháng phát hành.

Ubuntu cũng có những phiên bản hỗ trợ dài hạn "Long Term Support", hỗ trợ ít nhất 3 năm và phiên bản 18.04 LTS hỗ trợ 10 năm đối với cả máy để bàn và máy chủ. Phiên bản 20.04 dự kiến sẽ ra mắt ngày 23/04/2020. 

Xem thêm: https://vi.wikipedia.org/wiki/Ubuntu

## Cài đặt Ubuntu Server 16

### Chuẩn bị

Đầu tiên tải file iso minimal của Ubuntu Server 16
    https://help.ubuntu.com/community/Installation/MinimalCD

Ở đây tôi tải bản Ubuntu 16.04 LTS "Xenial Xerus" 64-bit PC (amd64, x86_64) (Recommended) 

Ở đây tôi cài đặt trên môi trường vmware. Cấp cho máy ảo 1 Gb RAM, 1 vcpu và 20 Gb disk. Card mạng ở đây dùng card NAT. Gắn file .iso đã tải ở trên vào và tiến hành bật máy ảo để cài đặt.

### Cài đặt

Đầu tiên, chọn install để bắt đầu cài đặt

![Imgur](https://i.imgur.com/7DTv2Rb.png)

Chọn ngôn ngữ sử dụng, ở đây tôi chọn English

![Imgur](https://i.imgur.com/jVpmZhz.png)

Tiếp theo, chọn location 

![Imgur](https://i.imgur.com/xJVECkY.png)

Detect hoặc cấu hình bàn phím nếu cần, ở đây chọn No

![Imgur](https://i.imgur.com/YmmjTFi.png)

Đặt tên hostname cho máy

![Imgur](https://i.imgur.com/42v4HqV.png)

Chọn mirror để có thể tải các update, dịch vụ mới cho server. Ở đây tôi chọn Vietnam.

![Imgur](https://i.imgur.com/HEzxiIK.png)

![Imgur](https://i.imgur.com/yXEKNHg.png)

Cấu hình proxy, bỏ trống phần này và continue

![Imgur](https://i.imgur.com/K9m74Yz.png)

Set up tên người dùng và mật khẩu. Gõ tên, tên người dùng, mật khẩu và xác nhận mật khẩu.

![Imgur](https://i.imgur.com/D8Oo3pS.png)

![Imgur](https://i.imgur.com/QsaVea6.png)

![Imgur](https://i.imgur.com/dBi2ncB.png)

![Imgur](https://i.imgur.com/eJ5LlfM.png)

Khi máy hỏi có muốn mã hóa thư mục /home để bảo mật không. Chọn No.

![Imgur](https://i.imgur.com/TA6W20l.png)

Chọn timezone, máy sẽ hỏi múi giờ của bạn hiện tại có đúng không. Nếu đúng, chọn Yes và tiếp tục. Nếu sai, chọn No và chọn lại timezone khác.

![Imgur](https://i.imgur.com/4o132FM.png)

Chọn hình thức cấu hình và chia các partition ổ cứng. Có thẻ chọn Guided - use entire disk để máy tự chia ổ cứng hoặc có thể chọn Manual để tự cài. 2 option còn lại để set up LVM và LVM được mã hóa. Ở đây tôi chọn cài tự động. 

![Imgur](https://i.imgur.com/KLHHSIA.png)

Chọn ổ cứng để chia partition 

![Imgur](https://i.imgur.com/384YynH.png)

Xác nhận, chọn Yes

![Imgur](https://i.imgur.com/tqdl9up.png)

Hệ thống sẽ bắt đầu cài đặt HĐH

![Imgur](https://i.imgur.com/fHLnlas.png)

Nếu muốn tự động cập nhật phần mềm, chọn các option ở dưới. Ở đây tôi chọn No automatic updates

![Imgur](https://i.imgur.com/X2a8VOh.png)

Tiếp theo cài đặt các chương trình được chuẩn bị sẵn nếu bạn cần. Ở đây tôi chọn standard system utilities. Có thể chọn thêm Open SSH Server để dễ dàng SSH được vào Server. Ở đây tôi không chọn và sẽ cài thủ công.

![Imgur](https://i.imgur.com/EHSlIDc.png)

Cài Grub boot loader, chọn Yes

![Imgur](https://i.imgur.com/OifvB7K.png)

Set up local time, chọn Yes

![Imgur](https://i.imgur.com/aJK86uk.png)

Hoàn thành cài đặt

![Imgur](https://i.imgur.com/1mcVCY9.png)

Khởi động lại và đăng nhập bằng user/password vừa tạo ở trên.

![Imgur](https://i.imgur.com/JL37C27.png)

## Cài đặt Ubuntu Server 18

### Chuẩn bị

Tải phiên bản Ubuntu Server 18.04.4 LTS tại 
    https://ubuntu.com/download/server

Cấp cho máy ảo 1 Gb RAM, 1 vcpu và 20 Gb disk. Card mạng ở đây dùng card NAT. Gắn file .iso đã tải ở trên vào và tiến hành bật máy ảo để cài đặt.

### Cài đặt

Đầu tiên, chọn ngôn ngữ sử dụng. Chọn English

![Imgur](https://i.imgur.com/Cu3YJys.png)

Chọn kiểu bàn phím

![Imgur](https://i.imgur.com/v6n46Dn.png)

Mặc định cấu hình mạng NAT trên Vmware là DHCP, đối với các máy chủ chúng ta cần cấu hình một địa chỉ mạng cố định. Bấm Shift + TAB để di chuyển con trỏ lên cổng mạng cần cấu hình. Ở hình trên là cổng ens33.

![Imgur](https://i.imgur.com/0hstgL3.png)

Chọn Edit IPv4

![Imgur](https://i.imgur.com/zRPDZF8.png)

Chọn manual để cấu hình thủ công

![Imgur](https://i.imgur.com/YGQaeLc.png)

Điền các thông tin địa chỉ mạng. Ở đây tôi cấu hình như sau

![Imgur](https://i.imgur.com/vojHUV4.png)

Bỏ qua phần cấu hình proxy

![Imgur](https://i.imgur.com/hPoNLt3.png)

Chọn mirror, nhấn done.

![Imgur](https://i.imgur.com/1X2qz7T.png)

Chia ổ cứng. Chọn manual để chia theo ý chúng ta

![Imgur](https://i.imgur.com/IF1if7Y.png)

Chọn ổ cứng đã cấp. Add partition

![Imgur](https://i.imgur.com/LThZrZ6.png)

Tạo phân vùng Swap dung lượng 2Gb

![Imgur](https://i.imgur.com/dBIBgaQ.png)

Tương tự, tạo thêm phân vùng với dung lượng còn lại để cài HĐH và lưu dữ liệu. Sau khi tạo sẽ thấy màn hình hiển thị như sau. Chọn Done

![Imgur](https://i.imgur.com/RHbf8gU.png)

Xác nhận thực hiện thay đổi trên ổ cứng. Chọn continue

![Imgur](https://i.imgur.com/1XLzD2z.png)

Nhập thông tin tài khoản để quản trị Ubuntu Server

![Imgur](https://i.imgur.com/qZuRMwD.png)

Có thể chọn cài đặt OpenSSH hoặc không

![Imgur](https://i.imgur.com/GdNROmj.png)

Chọn các chương trình cài sẵn nếu cần thiết và nhấn Done

![Imgur](https://i.imgur.com/cSq9apk.png)

Hệ thống sẽ cài đặt

![Imgur](https://i.imgur.com/5xNlAqq.png)

Sau khi hoàn tất cài đặt. Nhấn Reboot. 

![Imgur](https://i.imgur.com/a8GewY2.png)

Vậy là đã thành công cài đặt Ubuntu server 18.04.

## Cài đặt Ubuntu Server 20.04

Link tải:

http://cdimage.ubuntu.com/ubuntu-server/daily-live/current/

Nếu gặp lỗi sau trong quá trình cài

![Imgur](https://i.imgur.com/WiCJf8q.png)

Vào mục help ở góp phải bên trên, chọn Toggle color on/off

![Imgur](https://i.imgur.com/eJ5fnrl.png)

![Imgur](https://i.imgur.com/sye2dpS.png)

Thực hiện các bước tương tự như cài đặt Ubuntu 18.