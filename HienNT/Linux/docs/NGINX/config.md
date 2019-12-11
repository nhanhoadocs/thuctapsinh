# Tìm hiểu về file cấu hình của Nginx

- Trước khi thay đổi cấu hình, sao lưu lại file cấu hình:  

  ```sh
    cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
  ```  

- Định kì sao lưu tập tin cấu hình nginx

  ```sh
    cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.$(date "+%b_%d_%Y_%H.%M.%S")
  ```  

- Sau khi thực hiện thay đổi cấu hình trong file cấu hình, restart lại service  

  ```sh
    systemctl restart nginx
  ```

## File cấu hình mặc định `/etc/nginx/nginx.cnf`  

### Nội dung:

```sh
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

- Thông thường, chúng ta sẽ không cần phải thay đổi nhiều đoạn mã ở đầu:  

  ```sh
    user  nginx;
    worker_processes  1;

    error_log  /var/log/nginx/error.log warn;
    pid        /var/run/nginx.pid;


    events {
        worker_connections  1024;
    }
  ```  

  - Tất cả những dòng có dấu **#** phía trước được gọi những dòng chú thích (comment). Các lập trình viên sử dụng comment để giải thích những khối lệnh dùng để làm, hoặc để lại ý kiến làm thế nào chỉnh sửa giá trị.
  - Ngoài ra, bạn cũng có thể thêm riêng những comment theo ý của mình. Bạn có thể cho đoạn mã đó được kích hoạt bằng cách loại bỏ các #.
  - Cài đặt bắt đầu với những tên biến và sau đó một đối số hay một loạt các đối số cách nhau bởi dấu cách. Tất cả các đoạn mã đều kết thúc với một dấu chấm phẩy ( ; ).
  - Một số thiết lập, giống như biến events ở trên, được bao trong một cặp dấu ngoặc ngọn ({}). Các dấu ngoặc nhọn có thể được lồng vào nhau cho nhiều khối lệnh, cần nhớ là khi đã mở ngoặc nhọn thì phải nhớ đóng lại nếu không sẽ dẫn tới nginx không chạy được.
  - Sử dụng tab hay space để phân cấp đoạn mã sẽ giúp dễ dàng chỉnh sửa hay tìm ra lỗi.

- Giải thích cụ thể:  

  - `user`: Định nghĩa cho biết người dùng hệ thống Linux nào sẽ có quyền chạy các máy chủ Nginx.Có những trường hợp sử dụng nhất định mà được hưởng lợi từ việc thay đổi người dùng,. Ví dụ, bạn chạy hai máy chủ web cùng một lúc, hoặc cần người sử dụng của một chương trình khác để có thể kiểm soát Nginx.

  - `worker_process`: Xác định có bao nhiêu cores của CPU làm việc với Nginx. Nginx sẽ sử dụng một CPU để xử lý các tác vụ của mình. Tùy theo mức độ hoạt động của web server mà chúng ta có thể thay đổi lại thiết lập này.  
  Ví dụ với các web server hay sử dụng về SSL, gzip thì ta nên đặt chỉ số của worker_processes này lên cao hơn. Nếu website của bạn có số lượng các tệp tin tĩnh nhiều, và dung lượng của chúng lớn hơn bộ nhớ RAM thì việc tăng worker_processes sẽ tối ưu băng thông đĩa của hệ thống.

  Để xác định số cores của CPU của hệ thống ta có thể thực hiện lệnh
  ```sh
    cat /proc/cpuinfo | grep processor
  ```  

  - `pid`: Xác định nơi Nginx sẽ ghi lại master process ID, hoặc PID. PID được sử dụng bởi hệ điều hành để theo dõi và gửi tín hiệu đến quá trình Nginx.

  - `worker_connections`: cho biết số lượng connection mà CPU sẽ xử lý. Mặc định, số lượng connection này được thiết lập là 1024. Để xem về mức giới hạn sử dụng của hệ thống bạn có thể dụng lệnh ulimit

    ```sh
      ulimit –n
    ```

    Con số thiết lập của worker_connections nên nhỏ hơn hoặc bằng giới hạn này!

  - `http (Universal Configuration)`: Phần tiếp theo của tập tin nginx.conf bao gồm các đoạn mã chung giúp Nginx xử lý lưu lượng web HTTP. Phần đầu tiên của khối HTTP được hiển thị dưới đây:

    ```sh
      http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
    }
    ```

    - `include`: Chỉ thị include (include /etc/nginx/mime.types) của nginx có vai trò trong việc thêm nội dung từ một file khác vào trong cấu hình nginx. Điều này có nghĩa là bất cứ điều gì được viết trong tập tin mime.types sẽ được hiểu là nó được viết bên trong khối http {}.
    Điều này cho phép bạn bao gồm một số lượng dài của các chỉ thị trong khối http {} mà không gây lộn xộn lên các tập tin cấu hình chính. Và nó giúp tránh quá nhiều dòng mã cho mục đích dễ đọc.
    Bạn luôn có thể bao gồm (include) tất cả các tập tin trong một thư mục nhất định với các chỉ thị:

      ```sh
        include /etc/nginx/conf.d/*;
      ```

      Bạn cũng có thể bao gồm tất cả file theo một định dạng nào đó, như ví dụ sau:

      ```sh
       include /etc/nginx/conf.d/*.conf; --> Nó sẽ bao gồm các tập tin có đuôi .conf
      ```

    - `gzip`: Chỉ thị gzip sẽ giúp nén các dữ liệu trước khi chuyển chúng tới Client, hạn chế số lượng băng thông sử dụng và tăng tốc độ dịch chuyển dữ liệu. Điều này tương đương với mod_deflate của Apache. Một số chỉ thị sau đây bạn có thể thêm vào để tăng hiệu quả của gzip, nhớ phải uncommnet mới có hiệu quả.

      ```sh
        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
      ```  


  
