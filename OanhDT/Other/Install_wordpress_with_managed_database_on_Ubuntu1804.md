# Cách cài đặt WordPress với cơ sở dữ liệu được quản lý trên Ubuntu 18.04.

## Mục lục

- [Giới thiệu](#introduction)

- [Prerequisites](#Prerequisites)


<a name="introduction"></a>

## Giới thiệu 

WordPress là CMS (content management system) hệ thống quản lý nội dung phổ biến nhất trên internet. Nó là một lựa chọn tuyệt vời để có được một trang web và chạy nhanh chóng, và sau khi thiết lập ban đầu, gần như tất cả quản trị có thể được thực hiện thông qua giao diện web.

WordPress được thiết kế để lấy nội dung - bao gồm bài đăng, nhận xét, hồ sơ người dùng và dữ liệu khác - từ phụ trợ cơ sở dữ liệu. Khi một trang web phát triển và phải đáp ứng ngày càng nhiều lưu lượng truy cập, cuối cùng nó có thể vượt xa cơ sở dữ liệu ban đầu của nó.Để giải quyết vấn đề này, người ta có thể mở rộng quy mô cơ sở dữ liệu của họ bằng cách di chuyển dữ liệu của họ sang một máy có nhiều RAM hoặc CPU, nhưng đây là một quá trình tẻ nhạt có nguy cơ mất dữ liệu hoặc hỏng.Đây là lý do tại sao một số nhà phát triển WordPress chọn xây dựng trang web của họ trên cơ sở dữ liệu được quản lý, cho phép người dùng tự động mở rộng cơ sở dữ liệu của họ với rủi ro mất dữ liệu thấp hơn nhiều.

Trong hướng dẫn này, chúng tôi sẽ tập trung vào việc thiết lập một phiên bản WordPress với cơ sở dữ liệu MySQL được quản lý và máy chủ Ubuntu 18.04. Điều này sẽ yêu cầu bạn cài đặt PHP và Apache để phục vụ nội dung trên web.


<a name="Prerequisites"></a>

## Prerequisites

Để hoàn thành hướng dẫn này bạn sẽ cần :

- **Truy cập vào máy chủ Ubuntu 18.04:** Máy chủ này cần có người dùng kích hoạt sudo không root và tường lửa được cấu hình. Bạn có thể thiết lập điều này bằng cách làm theo hướng dẫn thiết lập máy chủ ban đầu Ubuntu 18.04 của chúng tôi.

- **Cơ sở dữ liệu MySQL được quản lý:** Để cung cấp Cơ sở dữ liệu MySQL được quản lý từ DigitalOcean, hãy xem tài liệu sản phẩm Cơ sở dữ liệu được quản lý của chúng tôi.*Lưu ý* hướng dẫn này sẽ đề cập đến Cơ sở dữ liệu được quản lý DigitalOcean trong các ví dụ, nhưng các hướng dẫn được cung cấp ở đây cũng thường hoạt động đối với cơ sở dữ liệu MySQL được quản lý từ các cloud providers.

- **Một ngăn xếp LAMP được cài đặt trên máy chủ của bạn:** Ngoài cơ sở dữ liệu, WordPress yêu cầu máy chủ web và PHP để hoạt động chính xác. Thiết lập một ngăn xếp LAMP hoàn chỉnh (Linux, Apache, MySQL và PHP) đáp ứng tất cả các yêu cầu này.Thực hiện theo hướng dẫn này để cài đặt và cấu hình phần mềm này. Khi bạn làm theo hướng dẫn này, hãy đảm bảo rằng bạn đã thiết lập máy chủ ảo để trỏ đến một tên miền mà bạn sở hữu.Ngoài ra, hãy chắc chắn bỏ qua **bước 2**, vì cài đặt `mysql server`
trên máy của bạn sẽ làm cho cá thể cơ sở dữ liệu được quản lý của bạn trở nên dư thừa.

- **Bảo mật TLS / SSL được triển khai cho trang web của bạn:** Nếu bạn có một tên miền, cách dễ nhất để bảo mật trang web của bạn là Let Let Encrypt, cung cấp các chứng chỉ tin cậy, miễn phí.Làm theo hướng dẫn Let Enc Encrypt của chúng tôi cho Apache để thiết lập điều này. Lưu ý rằng điều này cũng sẽ yêu cầu bạn có được một tên miền và thiết lập các bản ghi DNS trên máy chủ của bạn. Thực hiện theo phần giới thiệu này về DigitalOcean DNS để biết chi tiết về cách định cấu hình này.Nhìn chung, nếu bạn không có tên miền, bạn sử dụng chứng chỉ tự ký cho trang web của mình.

Khi bạn hoàn thành các bước thiết lập, đăng nhập vào máy chủ của bạn với tư cách là người dùng không phải `root` và tiếp tục bên dưới.

**Bước 1 - Thêm kho lưu trữ phần mềm MySQL và cài đặt** `mysql-client`

Để định cấu hình phiên bản MySQL được quản lý của bạn, bạn sẽ cần cài đặt một máy khách cho phép bạn truy cập cơ sở dữ liệu từ máy chủ của mình. Bước này sẽ hướng dẫn bạn qua quy trình cài đặt gói `mysql-client`.Để định cấu hình phiên bản MySQL được quản lý của bạn, bạn sẽ cần cài đặt một máy khách cho phép bạn truy cập cơ sở dữ liệu từ máy chủ của mình. Bước này sẽ hướng dẫn bạn qua quy trình cài đặt gói `mysql-client`.

Trong nhiều trường hợp, bạn chỉ có thể cài đặt `mysql-client `bằng lệnh `apt`, nhưng nếu bạn sử dụng kho lưu trữ Ubuntu mặc định, điều này sẽ cài đặt phiên bản 5.7 của chương trình.Để truy cập cơ sở dữ liệu MySQL được quản lý DigitalOcean, bạn sẽ cần cài đặt phiên bản 8.0 trở lên.Để làm như vậy, trước tiên bạn phải thêm kho phần mềm MySQL trước khi cài đặt gói.

Bắt đầu bằng cách điều hướng đến trang [MySQL APT Repository](https://dev.mysql.com/downloads/repo/apt/) trong trình duyệt web của bạn. Tìm nút `Download `ở góc dưới bên phải và nhấp qua trang tiếp theo.Trang này sẽ nhắc bạn đăng nhập hoặc đăng ký tài khoản web Oracle. Bạn có thể bỏ qua điều đó và thay vào đó hãy tìm liên kết có nội dung `No thanks, just start my download` .Nhấp chuột phải vào liên kết và chọn Copy Link Address (tùy chọn này có thể được diễn đạt khác nhau, tùy thuộc vào trình duyệt của bạn).

Bây giờ bạn đã sẵn sàng để tải tập tin. Trên máy chủ của bạn, di chuyển đến một thư mục bạn có thể viết vào:

```
$ cd /tmp
```
Tải xuống tệp bằng cách sử dụng `curl`, nhớ dán địa chỉ bạn vừa sao chép vào phần được tô sáng của lệnh sau.
Bạn cũng cần phải vượt qua hai cờ dòng lệnh để `curl`. `-O` hướng dẫn cuộn tròn để xuất ra một tệp thay vì đầu ra tiêu chuẩn. Cờ L làm cho curl theo chuyển hướng HTTP



