## Tìm hiểu cơ bản về PHP  

- `PHP` là viết tắt của `Hypertext Pre-processor`(trước đó là `Personal Home Pages`) là ngôn ngữ server mã nguồn mở và là một công cụ mạnh để tạo ra các trang web động.  

- `PHP` xuất hiện lần đầu tiên vào năm 1995, đến nay đã trở thành một trong những ngôn ngữ lập trình phổ biến nhất thế giới(8/25 ngôn ngữ được [Stackoverflow](https://insights.stackoverflow.com/survey/2019) thống kê năm 2019).  

- Phiên bản đầu tiên của `PHP` là PHP3, đến nay đã phát triển lên 7.3.8(bản ổn định) và 7.4.0(bản dùng thử).  

- Configuration file mặc định cho việc dịch mã và xử lý code PHP: `/etc/php.ini`  
  Có thể xác định vị trí Configuration file bằng lệnh: 

   ```sh
   php -i | grep "Loaded Configuration File"
   ```  
  
  Xem thêm [tại đây](https://xuanthulab.net/tim-vi-tri-file-php-ini-de-cau-hinh-php.html)

- Cấu trúc tập tin `php.ini`  

  - **Phần ghi chú:** Từ dòng 1 đến dòng 195 cho biết trong file có những thiết lập gì và ý nghĩa, giá trị của nó.  

  - **Phần thiết lập:** Từ dòng 196 trở xuống sẽ là các thiết lập. Các thiết lập có ký tự ; (còn gọi là ký tự comment) nghĩa là thiết lập đó đang sử dụng giá trị mặc định. Nếu bạn muốn đổi thiết lập thì hãy xoá dấu ; trước nó và sửa giá trị theo ý muốn.  

    - Các thiết lập trong php.ini sẽ có dạng:

      ```sh
      tên_thiết_lập = giá trị
      ```  

      **Giá trị có 3 kiểu:**  

      - `Kiểu số kèm đơn vị` : 500M, 100K, 1G (500MB, 100KB, 1GB). Hoặc cũng có vài thiết lập chỉ sử dụng số.  
      - `Kiểu boolean` : On hoặc Off, hoặc có thể là 0 và 1.  
      - `Kiểu tên giá trị` : Một vài thiết lập có hỗ trợ giá trị là các tên thiết lập.  

    - Các thiết lập thông dụng:  

      **disable_functions**  
      Thiết lập này sẽ có chức năng vô hiệu hoá một số hàm có sẵn trong PHP vì lý do bảo mật.  
      *Ví dụ:* Vô hiệu hoá các hàm nguy hiểm như exec(), system(), passthru(), symlink() bằng cách khai báo giá trị cho disable_functions như sau:  

      ```sh
      disable_functions=exec,system,passthru,syslink
      ```  

      **expose_php**  

        Tuỳ chọn này giúp ẩn thông tin về PHP trên HTTP Header của website nếu bạn không muốn cho ai đó biết rằng bạn đang sử dụng PHP. Nếu muốn ẩn đi, chỉ cần sửa giá trị thành Off.  

      **max_execution_time**  

        Tùy chọn giúp gia hạn thời gian thực thi một kịch bản PHP nào đó nếu nó cần nhiều thời gian hơn 30 giây. Nếu thời gian thực hiện script quá giá trị trong này nó sẽ báo lỗi “Fatal error: Maximum execution time of {giây} seconds”. Hiện tại bạn có thể nâng lên thành 600, tức 600 giây.

      **memory_limit**  

        Mặc định PHP sẽ được chỉ định sử dụng 128MB bộ nhớ của hệ thống cho việc xử lý kịch bản trong PHP. Tuy nhiên với các mã nguồn lớn, có thể nó sẽ cần thêm bộ nhớ nên bạn sẽ chỉnh ở đây.

      **error_reporting**  

        Mặc định PHP sẽ hiển thị tất cả các lỗi bao gồm lỗi nghiêm trọng (Fatal Error), cảnh báo (Warning), ghi chú (Notice),…nhưng nếu bạn muốn tuỳ chọn hiển thị các lỗi nhất định thì sẽ điều chỉnh giá trị ở đây. Ý nghĩa các giá trị lỗi bạn có thể xem [tại đây](https://www.php.net/manual/en/errorfunc.constants.php).

      **display_errors**  

        Tuỳ chọn hiển thị lỗi ra ngoài website. Khi học lập trình hoặc khi đang viết code cho dự án, bạn nên bật bằng cách sửa giá trị thành On để thấy ngay lỗi thay vì trang trắng.

      **log_errors**  

        Tuỳ chọn này sẽ lưu lỗi vào các tập tin log, hay còn gọi là error_log.

      **file_uploads**  

        Tuỳ chỉnh cho phép upload tập tin thông qua PHP.

      **upload_max_filesize**  

        Dung lượng tối đa mỗi tập tin khi upload. Ngoài ra, bạn cũng phải nâng dung lượng của tuỳ chọn `post_max_size` lên nhé.


    Để kiểm tra lại giá trị thiết lập, bạn có thể tạo ra một tập tin mới ở thư mục /var/www/html/ tên là `info.php`, sau đó copy đoạn này vào.

      ```sh
      &lt;?php phpinfo(); ?&gt;
      ```  

    Sau đó bạn truy cập vào đường dẫn `http://[your_domain_or_IP]/info.php` để xem thông tin thiết lập PHP  



- `PHP` chạy port mặc định là 9000 với tên dịch vụ là `php-fpm`


  







## Tài liệu tham khảo  

- [Thiết lập PHP riêng cho từng tên miền](https://wpcanban.com/hosting-domain/nhieu-phien-ban-php-tren-cung-mot-host.html)


