# Cấu hình cache cho nginx

Caching là một kỹ thuật đơn giản tăng tốc độ tải của website. Sử dụng cache sẽ giúp giảm đáng kể tài nguyên tiêu thụ của hệ thống.

Khi cho phép sử dụng cache trên Nginx. Khi một request đến 1 web server kết qủa trả về từ web server sẽ được lưu lại Server Nginx (trên disk hoặc RAM) trong một thời gian xác định để khi có một request tương tự nó sẽ không phải chuyển request đến web server mà Nginx sẽ lấy kết quả trước đó nó lưu lại để trả lời Client. Một số lợi ích mà caching mang lại:
 * Tăng hiêu năng của trang web
 * Tăng khả năng chịu tải
 * Tính sẵn sàng cho dịch vụ

## Tạo folder chứa cache

```
mkdir -p /var/lib/nginx/cache
chown nginx /var/lib/nginx/cache/
chmod 700 /var/lib/nginx/cache/
```

## Chỉnh sửa file config của site

Thêm những dòng sau vào block `http`

```
cat > /etc/nginx/conf.d/cache.conf << EOF
proxy_cache_path /var/lib/nginx/cache levels=1:2 keys_zone=backcache:8m max_size=50m;
proxy_cache_key "$scheme$request_method$host$request_uri$is_args$args";
proxy_cache_valid 200 302 10m;
proxy_cache_valid 404 1m;
EOF
```

Trong đó:
 * `proxy_cache_path`: đường dẫn của thư mục lưu cache
 * `levels`: xác định cách tổ chức cache. Nginx sẽ tạo ra một cache key bằng cách băm giá trị key. "levels" tạo ra một thư mục ký tự đơn (gía trị cuối cùng của mã băm) với 1 thư mục con 2 ký tự (2 ký tự tiếp theo từ cuôi cuối của mã băm). Những thư mục này giúp Nginx nhanh chóng tìm ra thư mục chứa key.
 * `keys_zone`: tên của vùng cache, ta đặt là backcache. Đây ta đặt dung lượng cho vùng lưu metadata,ở đây dung lương đặt là 8MB để lưu key, với mỗi MB Nginx có thể lưu được khoảng 8000 entry.
 * `max_size`: giá trị lớn nhất của tổng vùng cache
 * `proxy_cache_key`: dùng để đặt key được dùng để lưu cache, key được sử dụng để kiêm tra xem yêu cầu có thể được phục hồi từ cache để trả lời client hay không.
 * `proxy_cache_valid`: lệnh có thể nhận nhiều giá trị khác nhau. Nó cho phép ta cấu hình để xác định cache sẽ được lưu bao lâu dựa vào status code. Như bên trên với những truy cập thành công (status code 200 và 302) sẽ được lưu trong cache trong 10 phút. Với những truy cập thất bại (status code 404) sẽ được lưu trong 1 phút.

Sau khi cấu hình cache ta chỉ cần chỉ cho Nginx nơi sử dụng cache:

Ta thêm 2 dòng 

```
proxy_cache backcache;
add_header X-Proxy-Cache $upstream_cache_status;
```

Ví dụ

```
[root@nginx-lab conf.d]# cat test.niemdt.com.conf 
server {
    server_name test.niemdt.com;
    client_max_body_size 1024M;

        location / {
            proxy_cache backcache;
            add_header X-Proxy-Cache $upstream_cache_status;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://10.10.35.123:80;
        }
}
```

 * `proxy_cache`: chỉ định vùng cache `backcache`. Nginx sẽ kiểm tra entry hợp lệ trước khi chuyển tới backend
 * `add_header`: thêm vào header `X-Proxy-Cache` Giá trị của header này là `$upstream_cache_status`. Header sẽ cho cho ta biết response sẽ được lấy từ cache hay yêu cầu trực tiếp từ web server
