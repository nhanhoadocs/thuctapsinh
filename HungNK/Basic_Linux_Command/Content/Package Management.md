# Quản lý các package trong Linux 

## Các cách cài đặt phần mềm
- Tải theo cả một package từ trên mạng
- Tải file với đuôi .deb hoặc đuôi .rpm rồi cài đặt
- Tải gói được nén với đuôi .zip hoặc tarz

với ba cách cài đặt trên thì cũng có những ưu điểm riêng, cácn cài cả một package được đóng gói sẵn trên mạng là dễ nhất, chỉ cần gõ vài dòng lệnh là nó sẽ tự động cài đặt. Sau đó tải một file .deb, mình phải dùng các công cụ như dpkg để cài đặt, và khó nhất là giải nén một gói .zip, nhưng đổi lại mình sẽ được mã nguồn mới nhất, mình có thể cấu hình và chỉnh sửa nó.

## Các câu lệnh

việc dùng Linux là phải dùng các dòng lệnh, nên sau đây là các lệnh cài đặt package cơ bản và hữu hiệu


1. Tìm package
```
apt-cache search tu_khoa
```
nó sẽ ra nhiều kết quả, để thu hẹp phạm vi tìm kiếm, ví dụ
```
apt-cache search mysql | grep server
```


2. Hiện thông tin về 1 package

Dùng lệnh
```
apt-cache show ten_package
```

Khi tìm hiểu về 1 phần mềm / package, các thông tin hiện ở đây rất hữu ích, nó cho biết version của package, các package mà nó phụ thuộc. Ví dụ ở đây:
```
$ apt-cache show rabbitmq-server | grep Version
```
Version: 2.7.1-0ubuntu4

```
$ apt-cache show rabbitmq-server | grep Depend
```

Depends: erlang-nox (>= 1:12.b.3), adduser, logrotate


3. Cài đặt phần mềm trên Ubuntu

Dùng cặp lệnh :
```
$ sudo apt-get update
$ sudo apt-get install TÊN_PACKAGE # ví dụ sudo apt-get install git
```

4. Danh sách các package đã cài.

Dùng lệnh:

```
dpkg -l
```

Ví dụ, muốn tìm xem trên máy có package nào có chữ vim trong tên hoặc phần mô tả:

```
dpkg -l '*vim*'
```
hoặc
```
dpkg -l | grep vim
```
 Câu lệnh này ***cực kỳ*** hữu ích khi bạn muốn chắc chắn mình đã gỡ sạch gói nào đó chưa hay tìm version của package đã cài trên máy.


4. Các file thuộc về package.

Dùng lệnh:
```
dpkg -L ten_package
```

ví dụ
```
dpkg -L vim-runtime | head          // chỉ hiển thị 10 dòng đầu tiên
```


```
/.
/usr
/usr/bin
/usr/bin/vimtutor
/usr/share
/usr/share/vim
/usr/share/vim/vim73
/usr/share/vim/vim73/optwin.vim
/usr/share/vim/vim73/ftoff.vim
/usr/share/vim/vim73/colors
...
```
Với câu lệnh này, bạn hoàn toàn nắm được một package sau khi được cài thì bao gồm những file nào. Điều này cũng giúp bạn hiểu thêm về hệ thống và cách bố trí các file (cái gì nằm ở đâu).



## Package Management Systems

|High Level Tool|Low Level Tool|Family|
|---------------|--------------|------|
|apt-get|dpkg|Debian|
|zypper|rpm|SUSE|
|yum|rpm|Red Hat|

    Ở đây chia ra hai công cụ cài đặt gói, đó là công cụ cấp cao ( apt, yum ) và công cụ cấp thấp ( dpkg, rpm ) dành cho hai nền tảng Linux chủ yếu ( Ubuntu và CenOS )

## Quản lý gói Debian và Ubuntu
    Hệ thống quản lý gói Debian, dựa trên một công cụ gọi là dpkg với hệ thống apt là một biện pháp hiệu quả, phổ biến và hữu ích của quản lý gói. Ngoài Debian, một số bản phân phối nổi bật khác của GNU/Linux có nguồn gốc từ hệ thống Debian, đáng chú ý là bản phân phối Ubuntu.
    Những hướng dẫn sau áp dụng cho các hệ thống Debian và Ubuntu.


### Công cụ nâng cao gói (APT)
    Bạn có thể đã quen với apt-get, một lệnh trong đó sử dụng các công cụ đóng gói tiên tiến để tương tác với hệ thống gói của hệ điều hành. Các lệnh có liên quan và hữu ích nhất là (được chạy với quyền root):

- apt-get install package-name(s) - Cài đặt gói phần mền quy định, cùng với bất kỳ phụ thuộc
- apt-get remove package-name(s)- Loại bỏ gói phần mềm quy định, nhưng không loại bỏ sự phụ thuộc
- apt-get autoremove - Loại bỏ bất kỳ phụ thuộc.
- apt-get clean - Loại bỏ các tập tin gói đã tải về (.deb) cho các phần mềm đã được cài đặt
- apt-get purge package-name(s) - Kết hợp các chức năng của loại bỏ và làm sạch cho một gói cụ thể, cũng như các file cấu hình
- apt-get update - Đọc tập tin /etc/apt/sources.list và cập nhật dữ liệu của hệ thống về gói sẵn để cài đặt. Chạy lệnh này sau khi thay đổi tập sources.list.
- apt-get upgrade - nâng cấp tất cả các gói có bản cập nhật có sẵn. Chạy lệnh này sau khi chạy apt-get update.


Trong khi apt-get cung cấp các chức năng thường dùng, lệnh apt-cache cung cấp thêm thông tin:

- apt-cache search package-name(s) - Nếu bạn biết tên của một phần mềm nhưng apt-get install không thành công hoặc điểm trỏ đến phần mềm sai, điều này có vẻ tên đã bị thay đổi.
- apt-cache show package-name(s) - Hiển thị thông tin phụ thuộc, số phiên bản và mô tả cơ bản của gói.
- apt-cache depends package-name(s) - Liệt kê những gói cụ thể mà phụ thuộc vào gói chính. Đây là những gói sẽ được cài đặt với apt-get install.
- apt-cache rdepends package-name(s) - kết quả đầu ra là một danh sách các gói mà phụ thuộc vào một gói cụ thể. Danh sách này thường xuyên có thể khá dài, vì vậy tốt nhất nên kết hợp thêm lệnh less.
- apt-cache pkgnames - Tạo ra một danh sách các gói cài trên hệ thống của bạn. Danh sách này thường là khá dài, vì vậy tốt nhất nên kết hợp thêm lệnh less, hoặc đưa output vào một tập tin văn bản.
Kết hợp hầu hết các lệnh này với chương trình apt-cache có thể cung cấp cho bạn rất nhiều thông tin hữu ích về hệ thống của bạn, phần mềm bạn có thể muốn cài đặt, và các phần mềm mà bạn đã cài đặt.


### Sử dụng dpkg
    apt-get và apt-cache cung cấp một giao diện dễ dùng hơn, và kết nối đến các kho cho các công cụ quản lý gói cơ bản có tên dpkg và debconf. Những công cụ này khá mạnh mẽ, và giải thích chức năng đầy đủ của chúng là vượt ra ngoài phạm vi của tài liệu này. Tuy nhiên, một sự hiểu biết cơ bản về cách sử dụng những công cụ này rất hữu ích. Một số lệnh quan trọng là:
- dpkg -i package-file-name.deb - Cài đặt một file .deb
- dpkg --list search-pattern – Liệt kê danh sách gói hiện được cài đặt trên hệ thống
- dpkg --configure package-name(s) - Chạy một giao diện cấu hình để thiết lập một gói.
- dpkg-reconfigure package-name(s) - Chạy một giao diện cấu hình trên một gói đã được cài đặt

## Quản lý Package Fedora và CentOS
Fedora và CentOS là các bản phân phối liên quan chặt chẽ, là upstream và downstream (tương ứng) của Red Hat Enterprise Linux. Sự khác biệt của chúng xuất phát từ cách gói được chọn để đưa vào kho.

Cả hai hệ thống sử dụng yum để tương tác với kho hệ thống và cài đặt phụ thuộc, và cũng bao gồm một công cụ cấp thấp hơn được gọi là rpm, cho phép bạn tương tác với từng gói.

### Yellow Dog Updater, Modified (YUM)
    Công cụ YUM được phát triển cho hệ thống Yellow Dog Linux như là một thay thế cho Yellow Dog Updater (yup). RedHat tìm thấy công cụ YUM là một bổ sung có giá trị cho hệ thống của họ. Ngày nay, YUM là gói mặc định và kho lưu trữ công cụ quản lý cho một số hệ điều hành.

Bạn có thể sử dụng các lệnh sau để tương tác với YUM:
- yum install package-name(s) - Cài đặt các gói cùng với bất kỳ phụ thuộc yêu cầu
- yum remove package-name(s) - Loại bỏ các gói cụ thể từ hệ thống của bạn
- yum search search-pattern - Tìm kiếm danh sách các tên gói và mô tả cho các gói phù hợp với mô hình tìm kiếm và cung cấp một danh sách các tên gói, với kiến trúc và mô tả ngắn gọn về các nội dung gói.
- yum deplist package-name(s) - Danh sách tất cả các thư viện và các module mà gói có tên phụ thuộc vào, cùng với tên của các gói (bao gồm cả các phiên bản) cung cấp phụ thuộc.
- yum check-update - làm mới bộ nhớ cache cục bộ của cơ sở dữ liệu yum vì vậy thông tin phụ thuộc và các gói mới nhất luôn được cập nhật.
- yum info package-name(s) - Kết quả của lệnh info cung cấp tên, mô tả của gói, cũng như liên kết tới trang chủ cho phần mềm, phiên bản phát hành và kích thước cài đặt của phần mềm.
- yum reinstall package-name(s) - Xóa và sau đó tải về một bản sao mới của tập tin gói và cài lại đặt các phần mềm trên hệ thống của bạn
- yum localinstall local-rpm-file - Kiểm tra sự phụ thuộc của một file .rpm địa phương và sau đó cài đặt nó
- yum update optional-package-name(s) - Tải xuống và cài đặt tất cả các bản cập nhật bao gồm các bản vá lỗi, phiên bản bảo mật và nâng cấp, được cung cấp bởi các nhà phân phối của hệ thống điều hành của bạn.
- yum upgrade - Nâng cấp tất cả các gói được cài đặt trong hệ thống của bạn lên phiên bản mới nhất.


### RPM Package Manager (RPM)
    Các lệnh sau đây nên được chạy dưới quyền user root. Một số lệnh phổ biến:


- rpm --install --verbose --hash local-rpm-file-name.rpm or rpm -ivh filename.rpm -Cài đặt gói rpm từ tập tin .rpm cũng có khả năng cài đặt các file RPM từ nguồn http và ftp.
- rpm --erase package-name(s) hoặc rpm -e - Loại bỏ các gói. Thông thường sẽ không hoàn thành nếu package-name phù hợp với nhiều hơn một gói.
- rpm --query --all hoặc rpm -qa - liệt kê tên của tất cả các gói cài đặt hiện tại.
- rpm --query package-name(s) hoặc rpm -q - cho phép bạn để xác nhận liệu một gói đã được cài đặt trong hệ thống của bạn chứa.
- rpm --query --info package-name(s) hoặc rpm -qi - hiển thị các thông tin về một gói cài đặt
- rpm --query --list package-name(s) hoặc rpm -ql - tạo ra một danh sách các tập tin cài đặt của một gói phần mềm chỉ định. Điều này được bổ sung bởi:
- rpm --query --file hoặc rpm -q qf filename - kiểm tra để xem gói được cài đặt sở hữu các tập tin nào.



### Ngoài ra còn có nén và giải nén file, tôi để link ở đây

https://hocvps.com/nen-va-giai-nen-file-tar-gzip-va-zip/


Nguồn: 

https://mangmaytinh.net/threads/linux-package-management.136/

https://www.familug.org/2013/09/cli-cac-lenh-quan-ly-package-tren.html

https://viblo.asia/p/quan-ly-cac-package-trong-ubuntu-jvElaPqoZkw