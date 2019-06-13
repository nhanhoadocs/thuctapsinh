# Linux Directory Structure

## Mục Lục

##### [1. So sánh cấu trúc thư mục trong Linux và Windows](#1)

##### [2. Cấu trúc thư mục trong Linux](#2)

##### - [2.1 Cấu trúc hệ thống file](#2.1)

##### - [2.2 Các thư mục thông dụng trong Linux](#2.2)

##### [3. Tài liệu tham khảo](#tk)
### <a name="1"> 1. So sánh cấu trúc thư mục trong Linux và Windows </a>
- Linux phân chia thành các thư mục từ thư mục gốc (/) (gọi là thư mục root)
- Windows phân chia thành các ổ đĩa logic như C: ,D: ,E: ...

![img](https://github.com/doxuanson/thuctap012017/raw/master/XuanSon/Pictures/Overview%20Linux/Linux%20Directory%20Structure/1.jpg)

### <a name="2"> 2. Cấu trúc thư mục trong Linux </a>

##### <a name ="2.1"> 2.1 Cấu trúc hệ thống file </a>
- Cấu trúc thư mục có thể nói là 1 hoặc nhiều cây thư mục.
  - Một thư mục dùng để tạo nhóm các file dữ liệu và các thư mục . - Thư mục gốc (/) là điểm đầu tiên cho cây thư mục .
  - Các file hoặc thư mục là các cành, lá của gốc (/).

##### <a name ="2.2"> 2.2 Các thư mục thông dụng trong Linux </a>

![img](https://github.com/doxuanson/thuctap012017/raw/master/XuanSon/Pictures/Overview%20Linux/Linux%20Directory%20Structure/2.png)

- **/(root drectory):** 
  - Tất cả mọi file và thư mục bắt đầu từ thư mục root .
  - Chỉ root user có chỉnh sửa trong thư mục này .
    - Note: /root là thư mục của root user , không giống /.
- **/Bin**
  - Chứa các files thực thi nhị phân .
  - Linux command sử dụng bởi tất cả users của hệ thống được đặt ở đây .
    - Ví dụ : ps ,ls ,ping ,grep ,cp ,...
- **/ boot:**
  - Giữ các tệp quan trọng trong quá trình khởi động.
  - Các tập tin kernel, vmlinux, grub được đặt trong /boot
- **/dev:**
  - Chứa các tệp thiết bị cho tất cả các thiết bị phần cứng trên máy.
  - Chúng bao gồm các thiết bị đầu cuối, usb hoặc bất kỳ thiết bị nào được gắn vào hệ thống.
    - Ví dụ: cdrom, cpu...
- **/etc:**
  - Chứa files cấu hình yêu cầu bởi tất cả các programs.
  - /etc kiểm soát cách hệ điều hành hoặc các ứng dụng hoạt động.
    - Ví dụ, có một tệp trong /etc đó cho hệ điều hành biết nên khởi động vào chế độ văn bản hay chế độ đồ họa.
- **/home:**
  - Thư mục chính của người dùng. Mỗi khi người dùng mới được tạo, một thư mục có tên người dùng sẽ được tạo trong thư mục chính có chứa các thư mục khác như Desktop , Tải xuống , Tài liệu...
    - Ví dụ: /home/tuananh, /home/le...
- **/lib:**
  - Thư mục /lib chứa các thư viện cần thiết cho các nhị phân cần thiết trong thư mục /bin và /sbin. Các thư viện cần thiết trong thư mục /usr/bin được đặt trong /usr/lib.
  - /lib Chứa các tệp thư viện hỗ trợ các tệp nhị phân nằm dưới /bin và /sbin.
  - /lib chứa thư viện dùng chung cần thiết để khởi động hệ thống và chạy các lệnh trong hệ thống tệp gốc.
- **/media:**
  - Thư mục /media chứa các thư mục con nơi các thiết bị phương tiện di động được lắp vào máy tính được gắn kết lại. 
    - Ví dụ: khi ta đưa đĩa CD vào hệ thống Linux, một thư mục sẽ tự động được tạo bên trong thư mục /media. ta có thể truy cập nội dung của đĩa CD trong thư mục này.
- **/mnt:**
  - Thư mục /mnt là nơi các system admin gắn các hệ thống tệp tạm thời trong khi sử dụng chúng. 
    - Ví dụ: nếu ta đang gắn phân vùng Windows để thực hiện một số thao tác khôi phục tệp, ta có thể gắn kết nó tại /mnt/windows. Tuy nhiên, ta có thể gắn các hệ thống tệp khác ở bất cứ đâu trên hệ thống.
- **/opt:**
  - Thư mục /opt chứa phần mềm tùy chọn hoặc bên thứ ba. Phần mềm không đi kèm với hệ điều hành thường sẽ được cài đặt /opt.
    - Ví dụ: ứng dụng Google Earth không phải là một phần của hệ điều hành Linux tiêu chuẩn và được cài đặt trong thư mục /opt/google/earth.
- **/proc:**
  - Chứa thông tin về process hệ thống.
  - Đây là filesystem chứa thông tin về các process đang chạy.
    - Ví dụ: thư mục /proc/pid chứa thông tin về process với pid .
  - Đây là một virtual filesystem với thông tin bằng văn bản về tài nguyên của hệ thống.
    - Ví dụ: /proc/cpuinfo , ...
    
![img](https://www.howtogeek.com/wp-content/uploads/2012/06/image356.png.pagespeed.ce.xs33Jv7Trq.png)

- **/root:**
  - Thư mục /root là thư mục chính của người dùng root. 
  - Thay vì nằm ở /home/root, nó nằm ở /root. Điều này khác với (/) là thư mục gốc của hệ thống.
- **/sbin:**
  - Thư mục /sbin tương tự như thư mục /bin.
  - Nó chứa các tệp nhị phân thiết yếu thường được chạy bởi người dùng root để quản trị hệ thống.

![img](https://www.howtogeek.com/wp-content/uploads/2012/06/image357.png.pagespeed.ce.QJqMGSxhKD.png)

- **/srv:**
  - srv là viết tắt của service (dịch vụ).
  - Chứa các dịch vụ cụ thể liên quan đến máy chủ.
  - Thư mục /srv chứa dữ liệu của các dịch vụ do hệ thống cung cấp.
  - Nếu ta đang sử dụng máy chủ HTTP Apache để phục vụ trang web, ta có thể lưu trữ các tệp của trang web trong một thư mục bên trong thư mục /srv.
- **/tmp:**
  - Các ứng dụng lưu trữ các tệp tạm thời trong thư mục /tmp. Các tệp này thường bị xóa bất cứ khi nào hệ thống được khởi động lại và có thể bị xóa bất cứ lúc nào bởi các tiện ích như tmpwatch.
  - Hầu hết các bản phân phối Linux xóa nội dung /tmp lúc khởi động.
    - Ví dụ: Nếu ta đặt các tệp vào /tmp và hệ thống Linux khởi động lại, các tệp của ta sẽ không còn nữa (giống ổ C: trên windows).
  - Thư mục /tmp là nơi để lưu trữ các tệp tạm thời, nhưng ta không nên đặt bất cứ thứ gì vào /tmp nếu muốn giữ lâu dài.
  - các thư mục tạm thời là /tmp và /var/tmp. Trình duyệt web định kỳ ghi dữ liệu vào thư mục /tmp trong khi xem và tải xuống trang. Thông thường, /var/tmp dành cho các tệp liên tục (vì nó có thể được bảo toàn trong quá trình khởi động lại) và /tmp dành cho các tệp tạm thời hơn. 
  - Việc làm sạch /tmp được thực hiện bởi tập lệnh khởi động /etc/init/mounted-tmp.conf
  - Nếu một tệp trong /tmp cũ hơn $TMPTIME ngày thì nó sẽ bị xóa.
  - Giá trị mặc định của $TMPTIME là 0, có nghĩa là mọi tệp và thư mục trong /tmp sẽ bị xóa. $TMPTIME là một biến môi trường được xác định trong /etc/default/rcS.
  - Tại đây bạn có thể thay đổi thời gian trong tệp sau:
      - / etc / default / RCS
      - TMPTIME cho biết tần suất xóa thư mục tmp trong vài ngày
- **/usr:**
  - Thư mục /usr được gọi là folder của người dùng. Ta sẽ tìm thấy các chương trình nhị phân và  chương trình thực thi liên quan đến người dùng trong thư mục /usr/bin.
    - Ví dụ: các ứng dụng không thiết yếu được đặt trong thư mục /usr/bin thay vì thư mục /bin.
  - Mỗi thư viện được đặt bên trong thư mục /usr/lib. Thư mục /usr cũng chứa các thư mục khác
  - /usr/lib chứa thư viện cho /usr/bin và /usr/sbin .
    - Ví dụ: Các thư mục kiến trúc như đồ họa được đặt trong /usr/share.

![img](https://www.howtogeek.com/wp-content/uploads/2012/06/image358.png.pagespeed.ce.mxfCG5qmHF.png)

- **/var:**
  -  /var. Cụ thể /var/log là thư mục chứa các bản ghi được tạo bởi hệ điều hành và các ứng dụng khác.
  - Thư mục này chứa các tệp log , lock , spool , mail và temp.

### <a name="tk"> 3. Tài liệu tham khảo </a>
https://www.tecmint.com/linux-directory-structure-and-important-files-paths-explained/
https://www.howtogeek.com/117435/htg-explains-the-linux-directory-structure-explained/
https://www.linuxtrainingacademy.com/linux-directory-structure-and-file-system-hierarchy/
https://www.thegeekstuff.com/2010/09/linux-file-system-structure/?utm_source=tuicool

# END








