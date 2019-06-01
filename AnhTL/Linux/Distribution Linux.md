# Distribution Linux

### Mục lục
[1. Khái niệm distro](#kn)
- [1.1 Khái niệm distro](#knd)
- [1.2 Loại hình và xu hướng phát triển](#lh)

[2. Các nhánh distro phổ biến](#cacnhanh)
- [2.1 Debian](#debian)
- [2.2 Fedora](#fedora)

[3. Các nhóm distro phổ biến](#cacnhom)

----------
## <a name="kn"> 1. Khái niệm distro </a>
#### <a name="knd"> 1.1 Khái niệm distro </a>
- **Distro** là từ viết tắt thay thế cho Linux Distrobution, bản phân phối của Linux - là 1 **hệ điều hành** được tập hợp từ nhiều phần mềm dựa trên nhân Linux (Linux Kernel).

#### <a name="lh"> 1.2 Loại hình và xu hướng phát triển </a>
- Các thể loại distro linux là:
  - Thương mại hoặc phi thương mại
  - Thiết kế cho doanh nghiệp, người dùng cá nhân, gia đình.
  - Thiết kế cho máy chủ, máy tính cá nhân.
  - Dùng cho mục đích chung hoặc có chuyên môn cao về phía các device cụ thể:
    - VD: Firewall, router.
  - Xây dựng chủ yếu cho bảo mật, tính linh hoạt, toàn diện.

## <a name="cacnhanh"> 2. Các nhanh distro phổ biến </a>

![img](https://tinhte.vn/store/2017/04/4017202_1.jpg)

- Có rất nhiều bản distro nhưng về cơ bản đều dựa trên 3 nhanh lớn chính đó là: **Debian**, **Red Hat**, **Slackware**. 
- Lý do là do Linux "mở" nên bất cứ ai thích đều có thể tạo 1 distro cho riêng mình.
- Sau 1 thời gian dài phát triển thì hiện nay, 2 nhánh distro phổ biến nhất trong cộng đồng phần mềm mã nguồn mở là **Debian** và **Fedora**

#### <a name="debian"> 2.1 Debian </a>

![img](https://mspoweruser.com/wp-content/uploads/2018/03/Debian-Linux.jpg)

- Đây là 1 bản distro phi thương mãi (miễn phí) và là 1 trong những bản distro ra đời sớm nhất, duy trì bởi một cộng đồng phát triển.
- Có 3 dạng khác nhau:
  - Phiên bản ổn định mà người dùng được khuyến khích sử dụng.
  - Phiến bản không ổn định.
  - Phiên bản thử nghiệm cho những ai mong muốn có được tool mới nhất của distro.
- Hệ thống gói quản lý phần mềm:
  - **dpkg (debian package)**  là phần mềm làm nền tảng cho các hệ thống quản lý gói tin trên hệ điều hành mã nguồn mở Debian và các phát sinh từ nó. **dpkg** được sử dụng để cài đặt, gỡ bỏ, và cung cấp thông tin về các gói **.deb**. dpkg là một công cụ cấp thấp.
  -  **APT (Advanced Packaging Tool)** một công cụ cấp cao hơn, được sử dụng nhiều hơn dpkg vì nó có thể tim các gói tin từ xa và giải quyết các gói tin phức tạp hơn.
- Debian có chính sách nghiêm ngặt đối với chất lượng các pakage và bản phát hành cũng như tiến trình phát triển. Cách này giúp cho việc nâng các bản phát hành cũng như việc cài đặt hay gỡ bỏ dễ dàng hơn.
- Có rất nhiều bản distro được phát triển dựa trên distro Debian như: Raspbian, Ubuntu, Mepis... nhưng được sử dụng phổ biến nhất là Ubuntu.

***Ubuntu**

![img](https://www.brianchristner.io/content/images/size/w2000/2015/06/ubuntu-penguin.jpg)

- Do công ty Canoninal phân phối, mới xuất hiện vào năm 2004 nhưng đã trở nên rất phổ biến, uy tín và dễ dàng sử dụng.
- Dựa trên hệ thống quản lý gói mạnh mẽ **APT** của Debian, nhắm đến đối tượng end user, nhỏ gọn, dễ cài đặt.
- Cứ 6 tháng, Ubuntu sẽ ra bản phát hành mới.
- Ubuntu sử dụng giao diện đồ họa thân thiện GNOME, hướng đến sự đơn giản hóa trong quá trình sử dụng.
- Ubuntu có bộ ứng dụng văn phòng, openoffice, trình duyệt firefox, trình gửi tin nhẵn tức thời Pidgin...
  - Ngoài Ubuntu, các nhà phát triển còn cho ra các distro khác hướng tương tự Ubuntu như **Kubuntu**, **Xubuntu** và **Lunbuntu**, **Linux Mint**. Các distro này chủ yếu khác với Ubuntu ở giao diện màn hình.

#### <a name="fedora"> 2.2 Fedora </a>

![img](https://news-cdn.softpedia.com/images/news2/fedora-26-linux-distro-delayed-again-looks-like-it-launches-on-june-27-2017-514319-2.jpg)

- Là 1 bản distro được giúp đỡ bởi công ty **Red Hat**. Được tạo ra nhằm kiểm thử các công nghệ cho một bản distro thương mại khác của **Red Hat** - Nơi mà các phần mềm mới được tạo lập, phát triển và kiểm thử trong môi trường cộng đồng trước khi đưa vào **Red Hat Enterprise Linux**.
- Fedora cứ 6 tháng là ra phiên bản mới 1 lần. Với tính bảo mật cao.
- Có thể nâng cấp lên phiên bản mới mà không cần cài đặt lại.
- Dùng **yum** để quản lý các gói phần mềm định dạng **.rpm**
  - **YUM ( Yellowdog Updater Modified )** là một dòng lệnh mã nguồn mở cũng như công cụ quản lý gói dựa trên đồ họa cho các hệ thống Linux dựa trên RPM ( RedHat Gói Manager ). Nó cho phép người dùng và quản trị viên hệ thống dễ dàng cài đặt, cập nhật, gỡ bỏ hoặc tìm kiếm các gói phần mềm trên hệ thống.
- Fedora có thể dùng cho máy để bản, laptop, máy trạm hay máy chủ.
- 2 distro phổ biến được phát triển dựa trên **Fedora** là **Red Hat Enterprise Linux** - với đối tượng hướng tới là các doanh nghiệp và công ty ( đây là distro thương mại ). Và CentOS (phi thương mại), CentOS hướng tới đối tượng là người sử dụng cá nhân.

## <a name="cacnhom"> 3. Các nhóm distro phổ biến. </a>
- Linux có rất nhiểu bản distro khác nhau, phù hợp với nhu cầu sử dụng của nhiều đối tượng sử dụng.
  - Với người dùng cá nhân thì các distro phổ biến là: Ubuntu, Linux Mint, Arch Linux, Centos, Fedora, OpenSUSE...
  - Với đối tượng là doanh nghiệp thì có: Red Hat Enterprise Linux, Ubuntu Server, CentOS, SUSE Enterprise Linux...

- **Tổng quan lại các distro của Linux:**
![img](https://camo.githubusercontent.com/edb45c342c24dcbb88d74831e60b56f468745b53/687474703a2f2f696d6775722e636f6d2f675870414d67592e706e67)

# END

