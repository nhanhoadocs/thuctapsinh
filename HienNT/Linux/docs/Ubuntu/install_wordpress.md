# Cài đặt Wordpress với cơ sở dữ liệu được quản lý trên Ubuntu 18.04 

## Giới thiệu  

 - ***Wordpress*** là CMS(Content Management System - hệ thống quản lý nội dung) phổ biến nhất trên Internet. Nếu bạn muốn nhanh chóng tạo ra được 1 trang web thì Wordpress là một lựa chọn tuyệt vời. Sau một vài bước cài đặt đơn giản, bạn có thể thực hiện hầu hết các thao tác quản trị trên giao diện web của Wordpress. 

 - ***Wordpress*** được thiết kế để lấy nội dung(content) - bao gồm các bài đăng, bình luận, hồ sơ người dùng và các dữ liệu khác từ một cơ sở dữ liệu phụ trợ. Khi một trang web phát triển nó phải đáp ứng lưu lượng truy cập ngày càng cao của người dùng, từ đó cơ sở dữ liệu sẽ vượt xa cơ sở dữ liệu ban đầu. Để giải quyết vấn đề này, người ta tìm cách mở rộng quy mô cơ sở dữ liệu bằng cách di chuyển dữ liệu tới thiết bị có RAM và CPU lớn hơn nhưng đây là một quá trình buồn chán và có thể dẫn tới các nguy cơ về mất hoặc hỏng dữ liệu. Chính vì lí do này, một số nhà phát triển WordPress chọn xây dựng trang web của họ trên cơ sở dữ liệu được quản lý , cho phép người dùng tự động mở rộng cơ sở dữ liệu của họ với rủi ro mất dữ liệu thấp hơn.  

 - Trong hướng dẫn này, chúng tôi sẽ tập trung vào việc thiết lập một phiên bản WordPress sử dụng cơ sở dữ liệu MySQL được quản lý bằng máy chủ Ubuntu 18.04. Điều này sẽ yêu cầu bạn phải cài đặt PHP và Apache để sử dụng nội dung trên web.    

## Điều kiện tiên quyết    

  Để hoàn thành hướng dẫn này bạn cần:  

- SSH vào Ubuntu 18.04 server bằng user có quyền sudo và tường lửa đã được cấu hình. Nếu không thể SSH vào, tham khảo thêm tại [hướng dẫn thiết lập cơ bản Ubuntu server 18.04](digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)  

- Cơ sở dữ liệu(CSDL) MySQL được quản lý: Để cung cấp một CSDL được quản lý từ DigitalOcean, xem [Managed Databases product documentation](https://www.digitalocean.com/docs/databases/mysql/quickstart/#create-mysql-database-clusters). Hướng dẫn này sẽ đề cập đến CSDL được quản lý của DigitalOcean trong các ví dụ nhưng các hướng dẫn ở đây cũng thường hoạt động với các CSDL được quản lý của các nhà cung cấp cloud khác.  

- Một LAMP Stack đã được cài đặt trên server của bạn:  Ngoài 1 CSDL, Wordpress đòi hỏi một Apache server và PHP để có thể hoạt động ổn định. Cài đặt một LAMP stack(Linux, Apache, MySQL/MariaDB,PHP) để có thể làm theo hướng dẫn. Thực hiện theo [hướng dẫn này](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04) để có thể cài đặt và cấu hình LAMP stack. Nếu như bạn làm theo hướng dẫn nãy hãy chắc chắn bạn thiết lập một virtual host để trỏ đến 1 tên miền mà bạn sở hữu. Thêm vào đó, bỏ qua bước 2 cũng như bước `install server` trên máy tính của bạn để CSDL được quản lý có thể hoạt động.  

- Triển khai bảo mật TLS/SSL trên website của bạn: Nếu bạn có một tên miền, cách dễ nhất để bảo vệ trang web của bạn là  Let's Encrypt, nơi cung cấp các chứng chỉ tin cậy, miễn phí. Làm theo [hướng dẫn mã hóa cho Apache](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04) để thiết lập điều này. Lưu ý rằng việc này cũng sẽ yêu cầu bạn có một tên miền và thiết lập các bản ghi DNS trên server của bạn. Thực hiện theo phần [giới thiệu về DigitalOcean DNS](https://www.digitalocean.com/docs/networking/dns/) để tìm hiểu về các cấu hình này. Nếu bạn không có tên miền bạn có thể sử dụng [ use a self-signed certificate](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-18-04) cho website của bạn

Khi đã thực hiện xong các bước chuẩn bị, đăng nhập vào server của bạn bằng một user có quyền sudo và thực hiện các bước bên dưới:  

## Step 1 – Adding the MySQL Software Repository and Installing mysql-client  

