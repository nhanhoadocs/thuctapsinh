# Cấu hình Nginx loadbalancing

## Một số giải pháp loadbalancing

 * **Round robin**: là thuật toán điều phối vòng tròn. Các server được xem như ngang hàng và sắp xếp theo một vòng tròn. Các request lần lượt gửi đến từng server
 * **Weighted round robin**: tương tự như round robin nhưng nó còn có khả năng xử lý theo cấu hình của từng server. Mỗi server được đánh một trọng số (weight) mặc định sẽ là 1. Một server có khả năng xử lý cao hơn sẽ được đánh trọng số cao hơn. Ví dụ server 1 được đánh trọng số là 5 và server 2 được đánh trọng số là 3 thì cứ 8 request gửi đến thì 5 sẽ được chuyển cho server 1 và 3 sẽ chuyển cho server 2
 * **Least connections**: Các request sẽ được chuyển vào server có ít kết nối nhất. Đây được coi như 1 thuật toán động vì nó phải đém số kết nối của server đang xử lý.
 * **Last response time**: Thuật toán dựa trên thời gian phản hồi của mối server. Nó sẽ lựa chọn server có thời gian phản hồi nhanh nhất để chuyển request của client đến
 * **Health check**: Thuật toán xác định server sẵn sàng xử lý request để gửi request đến, điều này tránh đươc việc phải loại bỏ thủ công một máy chủ không sẵn sàng xử lý. Thuật toán kiểm tra bằng cách gửi kết nối TCP dến server nếu server này lắng nghe theo port đã cấu hình thì nó mới gửi request đến cho server này xử lý(ko dùng thuật toán này cho server chạy DB)
 * **IP Hash**: Thuật toán xác định kết nối chính xác từ một IP của client sẽ đươc kết nối trực tiếp đến server backend xác định

## Cấu hình

Ta khai báo các `upsteam` trong block `http`

```
upstream backends {
        server 10.10.35.121:80;
        server 10.10.35.123:80;
    }
```

Trong block `server` chỉ ra upstream thay vì host

```
location / {
            proxy_pass http://backends;
        }
```

Ví dụ

```
[root@nginx-lab conf.d]# cat test.niemdt.com.conf 
upstream backends {
        server 10.10.35.121:80;
        server 10.10.35.123:80;
    }
server {
    server_name test.niemdt.com;
    client_max_body_size 1024M;

        location / {
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass http://backends;
        }
}
```

## Cấu hình các thuật toán

**Round robin**

```
upstream backends {
        server 10.10.35.121:80;
        server 10.10.35.123:80;
    }
```

**Weighted round robin**

```
upstream backends {
        server 10.10.35.121:80 weight=5;
        server 10.10.35.123:80 weight=3;
    }
```

**Least connections**

```
upstream backends {
        least_conn;
        server 10.10.35.121:80;
        server 10.10.35.123:80;
    }
```

**Health check**

```
upstream backends {
        server 10.10.35.121:80;
        server 10.10.35.122:80 max_fails=3 fail_timeout=5s;
        server 10.10.35.123:80;
    }
```
