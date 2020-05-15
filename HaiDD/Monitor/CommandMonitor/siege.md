# Lệnh `siege`

Lệnh này sử dụng để test tải HTTP một hay nhiều trang web

## Cài đặt
### CentOS-7
```
yum -y install siege
```

### Ubuntu
```
apt-get install siege -y
```

### Cài đặt Open SSL
Siege yêu cầu cài đặt openssl để kiểm tra các trang web https. Chạy các lệnh sau để cài đặt và cấu hình openssl.

**Cài đặt OpenSSL**
```
wget https://www.openssl.org/source/openssl-1.1.0e.tar.gz

tar -xvzf openssl-1.1.0e.tar.gz

cd openssl-1.1.0e

./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl

yum -y install gcc gcc-c++

make

make install

export PATH="/usr/local/bin/openssl/bin:$PATH"

ln -s /usr/local/openssl /usr/local/bin/openssl
```

**Cài đặt Siege với SSL**
```
cd

wget http://download.joedog.org/siege/siege-latest.tar.gz

tar -zxvf siege-latest.tar.gz

cd siege-*/

./configure --prefix=/usr/local --with-ssl=/usr/bin/openssl

make && make install
```

## Cú pháp
```
siege [options] <URL>
```

## Kịch bản mặc định
Ta có thể xem trong file: `/etc/siege/siegerc`

Để sử dụng, bạn chạy lệnh:
```
siege.config
```
Sau khi thực hiện lệnh, hệ thống sẽ tạo ra tập tin `siege.conf` tại thư mục home của user bạn đang sử dụng với đường dẫn: `~/.siege/siege.conf`.

Bạn có thể chỉnh sửa file này cho kịch bản mà bạn sẽ sử dụng
```
cat siegerc | egrep -v "^$|#"
```
OUPUT
```
verbose = false
color = on
quiet = false
show-logfile = true
logging = false
gmethod = HEAD
parser = true
nofollow = ad.doubleclick.net
nofollow = pagead2.googlesyndication.com
nofollow = ads.pubsqrd.com
nofollow = ib.adnxs.com
limit = 255
protocol = HTTP/1.1
chunked = true
cache = false
connection = close
concurrent = 25
delay = 0.0
internet = false
benchmark = false
accept-encoding = gzip, deflate
url-escaping = true
unique = true
```

## Cách sử dụng
### 1. `siege <URL>`
Nếu không chỉ định option, nó sẽ mặc định để là 25 khách truy cập cùng lúc vào trang web của bạn. Thời gian chạy sẽ là đến khi bạn kết thúc nó
```
siege 10.10.34.163
```
**Sau khi dừng:**
```
New configuration template added to /root/.siege
Run siege -C to view the current settings in that file
** SIEGE 4.0.4
** Preparing 25 concurrent users for battle.
The server is now under siege...^C      # Sau một khoảng thời gian, dừng lệnh

Lifting the server siege...
Transactions:                  53736 hits
Availability:                 100.00 %
Elapsed time:                 153.92 secs
Data transferred:            1958.48 MB
Response time:                  0.07 secs
Transaction rate:             349.12 trans/sec
Throughput:                    12.72 MB/sec
Concurrency:                   24.93
Successful transactions:       53736
Failed transactions:               0
Longest transaction:            0.88
Shortest transaction:           0.00
```

### Các thông số kết quả
- `Transactions`: Số lần trao đổi
- `Availability`: Tỉ lệ thành công
- `Elapsed time`: Tổng thời gian test
- `Data transferred`: Dung lượng dữ liệu trao đổi
- `Response time`: Thời gian phản hồi của trang web
- `Transaction rate`: Tốc độ trao đổi thông tin
- `Throughput`: Thông lượng (Tốc độ truyền tải thực tế. Luông nhỏ hơn Bandwidth)
- `Concurrency`: Số lượng khách truy cập đồng thời
- `Successful transactions`: Số lần trao đổi thành công (Mã code trả về < 400)
- `Failed transactions`: Số lần trao đổi thất bại
- `Longest transaction`: Thời gian trao đổi dài nhất
- `Shortest transaction`: Thời gian trao đổi ngắn nhất

### 2. Xác định thời gian test
Sử dụng option `-t<khoảng_thời_gian>`

**Ví dụ:** 
- 2 phút: ta sẽ sử dụng `-t2M` hoặc `-t2`
- 20 giây : `t20S`
- 2 giờ : `t2H`

Test trong 1 phút:
```
siege -t1 10.10.34.163
```

### 3. Giới hạn số lượng khách truy cập đồng thời
Sử dụng `-c<số lượng khách>`

Mặc định, số lượng người tối đa truy cập sẽ là 255. Nhưng bạn hoàn toàn có thể chỉnh sửa số này tại mục `limit` trong file cấu hình.

**Ví dụ:** Giới hạn số người là 15 người truy cập cùng lúc
```
siege -c15 10.10.34.163
```

### 4. Để test ngẫu nhiên nhiều trang 
Để cùng một lúc, test nhiều trang, ta làm như sau:
- Tạo 1 file `urls.txt` với mỗi URL trên 1 dòng
    ```
    https://example.com/url1
    https://example.com/about
    https://example.com/contact
    https://example.com/something-else
    ```

- Chạy lệnh
    ```
    siege <option> <đường_dẫn_file>
    ```