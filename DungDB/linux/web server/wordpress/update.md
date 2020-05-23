# Update wordpress lên version mới nhất

## Xem phiên bản wordpress hiện tại:

Vào file `/var/www/html/wp-includes/version.php`

Phiên bản wordpress hiện tại thể hiện ở dòng `$wp_version = 'phiên bản';`

![Imgur](https://i.imgur.com/3t5wWPC.png)

Ở đây phiên bản hiện tại là 5.3.2

Trước khi update ta cần backup trang wordpress hiện tại. Đơn giản copy tất cả mọi thứ trong thư mục `/var/www/html/` sang một thư mục khác.

 Có thể xem thêm các hướng dẫn khác của phần backup [tại đây](https://wordpress.org/support/article/wordpress-backups/).

## Update tự động

Để xem có bản update nào mới hay không. Ta truy cập vào trang wp-admin. Tại mục `Updates` ở `Dashboard`. 

![Imgur](https://i.imgur.com/y48EBzL.png)

Có thể thấy trong hình, ở đây ta có một bản update. Chỉ cần click vào `Update now` để hệ thống tự động cập nhật phiên bản mới nhất. 

## Update thủ công

Ví dụ ở đây. Tôi đứng ở một máy Windows. Thực hiện update thủ công cho server wordpress.

Đầu tiên tải phiên bản wordpress mới nhất ở https://wordpress.org/download/ sau đó giải nén bằng Winrar hoặc 7zip.

![Imgur](https://i.imgur.com/VDOhzf4.png)

Có thể dùng nhều phần mềm để để kết nối đến server cài đặt wordpress để update thủ công. Ở đây tôi dùng [WinSCP](https://winscp.net/eng/download.php)

Chọn New session.

![Imgur](https://i.imgur.com/NbGkvu7.png)

Điền các thông tin của server wordpress và login. Lưu ý chọn giao thức SFTP và port 22 (SSH).

![Imgur](https://i.imgur.com/aJuoKnX.png)

Bên phải hiển thị danh sách thư mục máy windows. Bên tay trái hiện thị danh sách thư mục server wordpress. 

Tại đây bạn có thể backup server wordpress bằng cách copy tất cả mị thứ trong thư mục `/var/www/html/` sang máy windows. Chú ý chọn nơi đủ dung lượng để backup.

![Imgur](https://i.imgur.com/hzG79al.png)

Tìm đến thư mục bạn đã tải phiên bản mới nhất về. Chọn tất cả các tệp tin và thư mục trong thư mục `wordpress` tại máy windows và copy sang thư mục `/var/www/html`/ tại server wordpress và chọn ghi đè tất cả (Yes to all). Việc ghi đè chỉ ảnh hưởng đến các file core của wordpress, không ảnh hưởng đến các plugin, theme, file... hiện có của bạn.

Truy cập vào trang wp-admin để kiểm tra lại.

![Imgur](https://i.imgur.com/xGpcDwx.png)

Đã cập nhật thành công phiên bản wordpress mới nhất. Bạn có thể thực hiện update thủ công trên trực tiếp từ server wordpress, thực hiện tương tự như các bước trên.

Nếu gặp các lỗi khi dùng wordpress. Có thể xem thêm [cách sửa các lỗi thông dụng của wordpress](https://www.wpbeginner.com/common-wordpress-errors-and-how-to-fix-them/) và [Troubleshoot wordpress](https://www.wpbeginner.com/beginners-guide/beginners-guide-to-troubleshooting-wordpress-errors-step-by-step/).