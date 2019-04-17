# Cấu trúc thư mục linux

* /: Thư mục root
 
  - Trong linux đây là thư gốc. Tất cả các thư mục khác đều nằm dưới thư mục này.
  
  - Chỉ có user root mới có quyền với thư mục này.
  
* /bin: User Binaries 
  
  - Chứa các tập tin thực thi nhị phân.
  
  - Lệnh Linux phổ biến sử dụng ở chế độ người dùng đơn nằm ở thư mục này.
  
  - Tất cả user trên hệ thống nằm tại thư mục này đề có thể sử dụng lệnh.
  
  - VD: ping, ls, cp...
  
* /sbin: System Binaries
  
  - Nó giống như /bin cũng chứa tập tin thực thi nhị phân.
  
  - Lệnh trong thư mục này được sử dụng bởi admin nhằm mục đích duy trì hệ thống.
  
  - VD: reboot, fdisk, ifconfig,...
  
* /etc: Configuration Files
 
  - Chứa cấu hình các tập tin cấu hình của hệ thống, các tập tin lệnh để 
  khởi động các dịch vụ của hệ thống.
  
  - Nó còn chứa lệnh sử dụng để chạy/ngừng các chương trình cá nhân.
  
* /dev: Files device
 
  - Chứa các tập tin để để nhận biết thiết bị của hệ thống.
  
  - Bao gồm thiết bị đầu cuối, USB hoặc các thiết bị được gắn kết trên hệ thống.
  
  - VD: /dev/sda, /dev/sdb
  
* /proc: Process Information
  
  - Chứa các thông tin về tiến trình hệ thống
  
  - Đây là hệ thống tập tin giả có chứa thông tin về các tiến trình đang chạy.
  
  - Là hệ thống tập tin ảo có chứa thông tin về tài nguyên hệ thống.
  
* /var: Variable Files
 
  - Lưu lại tập tin ghi các số liệu biến đổi.
  
  - Nội dung tập tin được dự kiến tăng lên tại thư mục này.
  
  - Bao gồm: hệ thống tập tin log(/var/log), lock files(/var/lock), các file tạm thời khi cần reboot(/var/tmp)
  
* /tmp: Temporary Files
 
  - Thư mục chứa các tập tin tạm thời được tạo bởi hệ thống và user.
  
  - Các tập tin tạo thư mục này bị xóa khi hệ thống reboot.
  
* /usr: User Programs
 
  - Chứa các ứng dụng, thư viện, tài liệu và mã nguồn các chương trình thứ cấp.
  
  - VD: /usr/bin, /usr/sbin, /usr/lib chứa thư viện /usr/bin và /usr/sbin, /usr/local chứa các chương trình user 
  mà được cài đặt từ nguồn.
  
* /home: Thư mục home
 
  - Thư mục lưu trữ tất các tập tin cá nhân của tất cả user.
  
* /boot: Boot loader files
 
  - Chứa các tập tin cấu hình cho quá trình khởi động hệ thống.
  
* /lib: System Libraries
 
  - Chứa các file thư viện hỗ trợ nằm dưới /bin và /sbin.
  
* /opt: Optional add-on application
 
  - Chứa các ứng dụng được thêm vào từ các nhà cung cấp.
  
* /mnt: Mount Directory
 
  - Gắn kết các thư mục hệ thống tạm thời nơi sysadmin có thể gắn kết các file hệ thống.
  
* /media: Removable Media Devices
 
  - Gắn kết các thư mục Temporary được hệ thống tạo ra khi mọt thiết bị lưu động được cắm vào 
  như đĩa CDs, máy ảnh kỹ thuật số...
  
* /srv: Service Data
 
  - Chứa các service của các máy chủ cụ thể liên quan đến dữ liệu.