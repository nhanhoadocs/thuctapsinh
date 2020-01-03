# Tìm hiểu về file cấu hình của Nginx trên CentOS 8

## I - Cấu trúc và cách sử dụng tập tin cấu hình 

### 1.1. Cấu trúc
- Tất cả file cấu hình của nginx nằm trong thư mục - `/etc/nginx`  
- File cấu hình chính của nginx là - `/etc/nginx/nginx.conf`  
- Document root directory – `/usr/share/nginx/html`
- Nginx bao gồm các module được điều khiển bởi các directive trong file cấu hình. “Directive” được định nghĩa như 1 `instruction` hay `direct`. Directives được chia thành các directive đơn giản và các block directive. 
  
  - Cấu trúc của 1 directive đơn giản gồm tên và tham số được phân tách bởi dấu cách và kết thúc bằng dấu chấm phẩy(;). Ví dụ về 1 directive đơn giản:

    ```nginx
      worker_processes 1; 
    ```

  - Một block directive có cấu trúc tương tự như một directice đơn giản nhưng thay vì sử dụng dấu `;` nó sẽ sử dụng cặp dấu `{}` để bắt đầu và kết thúc 1 block directive.  

  Một config file điển hình của nginx có thể được minh họa như hình dưới. Một main context sẽ bao gồm nhiều directive đơn giản, nhiều contexxt(ví dụ: context A, context B) chứa các block directive.

  <img src="../images/structure_nginx_config_file.png">

### 1.2. Cách sử dụng config file hợp lý và hiệu quả

- Tạo 1 file cấu hình riêng cho mỗi tên miền sẽ giúp server dễ quản lý và hiệu quả hơn.

- NGINX không có Virtual host, thay vào đó là [`Server Blocks`](https://www.nginx.com/resources/wiki/start/topics/examples/server_blocks/) sử dụng `server_name` và nghe các chỉ thị để liên kết với các tcp sockets. Tất cả các file server block phải có định dạng là `.conf` và được lưu trong thư mục `/etc/nginx/conf.d` hoặc `/etx/nginx/conf`

- Nếu bạn có 1 domain là `mydomain.com` thì bạn nên đặt tên file cấu hình là `mydomain.com.cnf`. 

- Nếu bạn sử dụng các phân đoạn cấu hình có thể lặp lại trong các khối máy chủ tên miền của mình, bạn nên cấu trúc lại các phân đoạn đó thành các đoạn.

- Các file nhật ký Nginx (`access.log` và `error.log`) được đặt trong thư mục `/var/log/nginx/`. Nên có một tệp nhật ký `access` và `error` khác nhau cho mỗi server block.

- Bạn có thể đặt document root directory của tên miền của bạn đến bất kỳ vị trí nào bạn muốn. Một số vị trí thường được dùng cho webroot bao gồm:
    - /home/<user_name>/<site_name>
    - /var/www/<site_name>
    - /var/www/html/<site_name>
    - /opt/<site_name>
    - /usr/share/nginx/html

### 1.3. Các thao tác cần thực hiện trước và sau khi chỉnh sửa config file

- Trước khi thay đổi cấu hình, sao lưu lại file cấu hình:  

  ```sh
    cp /etc/nginx/conf/nginx.conf /etc/nginx/conf/nginx.conf.backup
  ```  

- Định kì sao lưu tập tin cấu hình nginx

  ```sh
    cp /etc/nginx/conf/nginx.conf /etc/nginx/conf/nginx.conf.$(date "+%b_%d_%Y_%H.%M.%S")
  ```  

- Sau khi thực hiện thay đổi cấu hình trong file cấu hình, restart lại service  

  ```sh
    systemctl restart nginx
  ```


***Chú ý:***   
  - Tất cả những dòng có dấu **#** phía trước là những dòng chú thích (comment) được sử dụng để giải thích những khối lệnh dùng làm gì hoặc để lại ý kiến làm thế nào chỉnh sửa giá trị.

  - Ngoài ra, bạn cũng có thể thêm riêng những comment theo ý của mình. Bạn có thể cho đoạn mã đó được kích hoạt bằng cách loại bỏ các #.

  - Cài đặt bắt đầu với những tên biến và sau đó một đối số hay một loạt các đối số cách nhau bởi dấu cách. 

  - Một số thiết lập được đặt trong một cặp dấu ngoặc ngọn ({}). Các dấu ngoặc nhọn có thể được lồng vào nhau cho nhiều khối lệnh, cần nhớ là khi đã mở ngoặc nhọn thì phải nhớ đóng lại nếu không sẽ dẫn tới nginx không chạy được.

  - Sử dụng tab hay space để phân cấp đoạn mã sẽ giúp dễ dàng chỉnh sửa hay tìm ra lỗi.

## II - Tìm hiểu chi tiết về config file

### Core Contexts  

  Đây là nhóm đầu tiên của contexts, được nginx sử dụng để tạo ra 1 cây phân cấp và tách biệt các cấu hình giữa các block. Trong đây cũng bao gồm các cấu hình chính của nginx.

#### Main Context

  Cũng có thể coi là `global` context. Đây là context chung nhất bao gồm tất cả các directive đơn giản, block directive và các context khác.  

- Xem ví dụ về nội dung config file của nginx [tại đây](https://gist.github.com/thuyhiend/ae22194bedbacf39653b887d1bdeb603
)

- File bắt đầu cùng với 4 directives: `user`, `worker_processes`, `error_log`, và `pid`. Chúng nằm ngoài bất kỳ block hay context cụ thể nào do đó chúng nằm trong main context(bối cảnh chính). Các `event` và `http` block là khu vực cho các directives bổ sung do đó chúng cũng nằm trong main context. Xem [NGINX docs](nginx.org/en/docs/ngx_core_module.html) để xem giải thích cụ thể về những directive này và các giá trị directive khác trong main context.  

- Giải thích cụ thể:  

  - `user`: Định nghĩa cho biết người dùng hệ thống Linux nào sẽ có quyền chạy các máy chủ Nginx. Có những trường hợp sử dụng nhất định mà được hưởng lợi từ việc thay đổi người dùng,. Ví dụ, bạn chạy hai máy chủ web cùng một lúc, hoặc cần người sử dụng của một chương trình khác để có thể kiểm soát Nginx.

  - `worker_process`: có giá trị mặc định là 1. Nó định nghĩa số lượng worker process Nginx sử dụng. Số lượng worker process nên được set bằng giá trị với số core của CPU.  

    Ví dụ với các web server hay sử dụng về SSL, gzip thì ta nên đặt chỉ số của worker_processes này lên cao hơn. Nếu website của bạn có số lượng các tệp tin tĩnh nhiều, và dung lượng của chúng lớn hơn bộ nhớ RAM thì việc tăng worker_processes sẽ tối ưu băng thông đĩa của hệ thống.

    Để xác định số cores của CPU của hệ thống ta có thể thực hiện lệnh
    ```sh
      cat /proc/cpuinfo | grep processor
    ```  

  - `access_log` & `error_log`: những file mà Nginx sẽ sử dụng để log lại toàn bộ error và access request. Phần log này thường được sử dụng để debug.

  - `pid`: Xác định nơi Nginx sẽ ghi lại master process ID, hoặc PID. PID được sử dụng bởi hệ điều hành để theo dõi và gửi tín hiệu đến quá trình Nginx.

    Bạn có thể xác định thông tin về PID(master process và worker process) của nginx bằng câu lệnh

    ```bash
       ps -ax | grep nginx
    ```

  - `worker_connections`: cho biết số lượng connection mà mỗi worker_process có thể xử lý. Mặc định, số lượng connection này được thiết lập là 1024. Để xem về mức giới hạn sử dụng của hệ thống bạn có thể dụng lệnh ulimit

    ```bash
      ulimit –n
    ```

    Con số thiết lập của worker_connections nên nhỏ hơn hoặc bằng giới hạn này!

          # max clients = worker_connections * worker_processes


#### Events Context  

  ```nginx
    events {
    worker_connections  1024;
    }
  ```

- NGINX sử dụng mô hình xử lý kết nối dựa trên sự kiện(event) nên các directive được định nghĩa trong context này ssex ảnh hướng đến connection processing được chỉ định.  

  Ví dụ ở trên là cấu hình số worker connection mà mỗi worker process có thể xử lý được.  

#### HTTP Context  
- Khi cấu hình Nginx như một web server hoặc reverse proxy, http context sẽ giữ phần lớn cấu hình. Context này sẽ chứa tất cả các directive và những context(block directive) cần thiết khác để xác định cách chương trình sẽ xử lý các kết nối HTTP và HTTPS.  

- Có thể xem chi tiết httpd contexxt trong config file [tại đây](ae22194bedbacf39653b887d1bdeb603)

- Giải thích một số directive:  

    - `include`: Chỉ thị include (include /etc/nginx/mime.types) của nginx có vai trò trong việc thêm nội dung từ một file khác vào trong cấu hình nginx. Điều này có nghĩa là bất cứ điều gì được viết trong tập tin mime.types sẽ được hiểu là nó được viết bên trong khối http {}.
    Điều này cho phép bạn bao gồm một số lượng dài của các chỉ thị trong khối http {} mà không gây lộn xộn lên các tập tin cấu hình chính. Và nó giúp tránh quá nhiều dòng mã cho mục đích dễ đọc.
    Bạn luôn có thể bao gồm (include) tất cả các tập tin trong một thư mục nhất định với các chỉ thị:

      ```sh
        include /etc/nginx/conf/*;
      ```

      Bạn cũng có thể bao gồm tất cả file theo một định dạng nào đó, như ví dụ sau:

      ```sh
       include /etc/nginx/conf/*.conf; --> Nó sẽ bao gồm các tập tin có đuôi .conf
      ```

    - `gzip`: Chỉ thị gzip sẽ giúp nén các dữ liệu trước khi chuyển chúng tới Client, hạn chế số lượng băng thông sử dụng và tăng tốc độ dịch chuyển dữ liệu. Điều này tương đương với mod_deflate của Apache. Một số chỉ thị sau đây bạn có thể thêm vào để tăng hiệu quả của gzip, nhớ phải uncommnet mới có hiệu quả.

      ```bash
        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
      ```
      
#### Server Context

- Được khai báo trong `http context`. Đây cũng là một ví dụ về context lồng nhau được đặt trong ngoặc. Đây cũng là context đầu tiên cho phép khai báo nhiều lần.  

- Định dạng chung của server context có thể trông như này:

  ```nginx
  # main context

  http {

    # http context

    server {

        # first server context

    }

    server {

        # second server context

    }

  }
  ```

- Dựa vào yêu cầu từ phía client, Nginx sẽ sử dụng thuật toán lựa chọn để quyết định server context nào được sử dụng. Các directive được sử dụng để quyết định server context nào được sử dụng là:
  
  - `listen`: sự kết hợp của IP/port mà server block này được thiết kế để đáp ứng. Nếu một yêu cầu từ phía client phù hợp với giá trị này, block này có thể được lựa chọn để xử lý kết nối.

  - `server_name`: Nếu có nhiều server block đáp ứng được yêu cầu của listen directive, nginx sau đó sẽ tiến hành phân tích cú pháp tiêu đề "Host" của yêu cầu và lựa chọn block phù hợp.  

#### Location Context

- Được đặt trong server context.

- Sau khi đã chọn được server context nào sẽ tiếp nhận request này thì nginx sẽ tiếp tục phân tích URI của request để tìm ra hướng xử lí của request dựa vào các location context có syntax như sau:

  ```nginx
    location optional_modifier location_match {

    . . .

    }
  ```  

  - `optional_modifier`: bạn có thể tạm hiểu nó là kiểu so sánh để tìm ra để đối chiếu với `location_match`. Có mấy loại option như sau:

    - `(none)`: Nếu không khai báo gì thì NGINX sẽ hiểu là tất cả các request có URI bắt đầu bằng phần location_match sẽ được chuyển cho location block này xử lí.

    - `=` : Khai báo này chỉ ra rằng URI phải có chính xác giống như location_match (giống như so sánh string bình thường).

    - `~` : Sử dụng regular expression cho các URI.

    - `~*` : Sử dụng regular expression cho các URI cho phép pass cả chữ hoa và chữ thường  

- **Một số ví dụ**  

  ```nginx
  location /site {

    . . .

  }
  ```

  Các request có URI có dạng như sau: */site*, */site/page/1*, *site/index.html* sẽ được xử lí thông qua location này.

  ```nginx
  location = /site {

    . . .

  }
  ```

  Với khai báo như bên trên thì chỉ có */site* sẽ có thể được xử lí, còn */site/page/1* hay */site/index.html* thì không.

  ```nginx
  location ~ \.(jpe?g|png|gif|ico)$ {

    . . .

  }
  ```

  Các request có đuôi *.jpg*,*.jpeg*, *.png*, *.gif*, *.ico* có thể pass qua location này nhưng *.PNG* thì không

  ```nginx
  location ~* \.(jpe?g|png|gif|ico)$ {

    . . .

  }
  ```

  Giống như trên nhưng đuôi `.PNG` cũng có thể pass.

> Khi nào thì location block sẽ nhảy vào khối block khác?

  Thông thường khi mà location block được dùng để phục vụ một request nào đó thì action sẽ hoàn toàn nằm trong context của nó ( bên trong dấu {}). Và nó sẽ chỉ nhảy sang các block khác hay chuyển hươngs xử lí request khi có yêu cầu từ chính bên trong context của nó. Một vài directive có thể redirective request. Ví dụ:

    - index
    - try_files
    - rewrite
    - error_page

***index directive***  

index direct nằm bên trong location luôn được nginx trỏ tới đầu tiên khi xử lí điều hướng request. Định nghĩa trang mặc định mà Nginx sẽ phục vụ nếu không có tên tập tin được chỉ rõ trong yêu cầu (nói cách khác, trang chỉ mục). Chúng ta có thể chỉ rõ nhiều tên tập tin và tập tin đầu tiên được tìm thấy sẽ được sử dụng. Nếu không có tập tin cụ thể nào được tìm thấy, Nginx sẽ hoặc là cố gắng phát sinh 1 chỉ mục tự động của các tập tin

```nginx
location = / {
    index index.html;
}
```

***try_files directive***  

Cố gắng phục vụ các tập tin được chỉ rõ (các tham số từ 1 đến N-1 trong chỉ thị), nếu không có tập tin nào tồn tại, nhảy đến khối location được khai báo (tham số cuối cùng trong chỉ thị) hoặc phục vụ 1 URI được chỉ định.

```nginx

location / {
    try_files $uri $uri.html $uri/ /fallback/index.html;
}
```

***rewrite directive***

Khác với Apache, Nginx không sử dụng file .htaccess nên khi bạn cần rewrite url sẽ phải convert qua rule của Nginx. Trong bài viết này, mình sẽ đưa ra một số ví dụ các rule của Nginx sử dụng để rewrite url, redirect và một số cấu hình cần thiết khác.

```nginx
location /download/ {
    rewrite ^(/download/.*)/media/(.*)\..*$ $1/mp3/$2.mp3 break;
    rewrite ^(/download/.*)/audio/(.*)\..*$ $1/mp3/$2.ra  break;
    return  403;
}
```


***error_page directive***

Chỉ thị khi không tìm thấy file tham chiếu.

```nginx
location / {
    error_page 404 = @fallback;
}

location @fallback {
    proxy_pass http://backend;
}
```

- Xử lý trong `location context`  

  - Nginx sẽ đọc `root` directive để xác định thư mục chứa trang client yêu cầu. Thứ tự các trang được ưu tiên sẽ được khai báo trong `index` directive.
  - Nếu không tìm được nội dung mà client yêu cầu, nginx sẽ điều hướng sang location context khác và thông báo lỗi cho người dùng.  

  Ví dụ minh họa:  

  - ***Ví dụ 1:***

    ```nginx
      location / {
        root html;
        index index.html index.htm;
      }
    ```

    Trong ví dụ này, document root là thư mục `hmtl/`. Trong cài đặt mặc định của Nginx, đường dẫn đầy đủ đến thư mục này là `/etc/nginx/html/`

    **Request**: http://example.com/blog/includes/style.css

      **Returns**: NGINX sẽ tìm yêu cầu của client theo đường dẫn `/etc/nginx/html/blog/includes/style.css`  

  - ***Ví dụ 2:***

    ```nginx
      location / {
        root   /srv/www/example.com/public_html;
        index  index.html index.htm;
      }

      location ~ \.pl$ {
        gzip off;
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/fcgiwrap.socket;
        fastcgi_index index.pl;
        fastcgi_param SCRIPT_FILENAME /srv/www/example.com/public_html$fastcgi_script_name;
      }
    ```  

    Trong ví dụ này, tất cả các yêu cầu tài nguyên kết thúc bằng phần mở rộng `.pl` được xử lý bởi location context thứ hai, chỉ định trình xử lý fastcgi cho các yêu cầu này. Mặt khác, NGINX sử dụng chỉ thị vị trí đầu tiên. Tài nguyên được đặt trên hệ thống tệp tại thư mục `/srv/www/example.com/public_html/`. Nếu không có tên tệp nào được chỉ định trong yêu cầu, NGINX sẽ tìm và cung cấp tệp *index.html* hoặc *index.htm*. Nếu không tìm thấy tệp chỉ mục, máy chủ sẽ trả về lỗi 404. Cụ thể:

    **Request**: http://example.com/  
    **Returns**: `/srv/www/example.com/public_html/index.html` nếu nó tồn tại. Nếu file `.hmtl` không tồn tại, file `/srv/www/example.com/public_html/index.htm` sẽ được sử dụng. Nếu cả 2 file không tồn tại ==> 404 error.

    **Request**: http://example.com/blog/  
    **Returns**: `/srv/www/example.com/public_html/blog/index.html` nếu nó tồn tại. Nếu file `.html` không tồn tại, nó sẽ sử dụng `/srv/www/example.com/public_html/blog/index.htm`. Nếu cả 2 file không tồn tại ==> 404 error.

    **Request**: http://example.com/tasks.pl  
    **Returns**: NGINX sẽ dử dụng FastCGI handler để thực thi file có tại `/srv/www/example.com/public_html/tasks.pl` và trả về kết quả.

    **Request**: http://example.com/username/roster.pl  
    **Returns**: NGINX sẽ sử dụng FastCGI handler để thực thi file có tại `/srv/www/example.com/public_html/username/roster.pl` và trả về kết quả.


## TÀI LIỆU THAM KHẢO  

- http://nginx.org/en/docs/beginners_guide.html#conf_structure

- https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/#location-blocks

- https://nginx.org/en/docs/ngx_core_module.html#use

- https://www.digitalocean.com/community/tutorials/understanding-the-nginx-configuration-file-structure-and-configuration-contexts#the-core-contexts

- https://www.linode.com/docs/web-servers/nginx/nginx-installation-and-basic-setup/

- https://gist.github.com/denji/8359866

- https://viblo.asia/p/nginx-server-va-location-block-cach-lam-viec-va-phuong-thuc-dieu-huong-request-3Q75wy3DZWb

- https://pdfs.semanticscholar.org/7241/af41c2fb9de5f2ee53b66d061043b219ed81.pdf
  
