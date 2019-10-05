# Cách sử dụng lệnh curl cơ bản

Lệnh curl được sử dụng để chuyển dữ liệu lên server hoặc load dữ liệu từ server về client. Sử dụng cho các giao thức sau: (HTTP, HTTPS, FTP, FTPS. TFTP, TELNET,...).

## Một số option

* `-d <data>` Gửi kèm dữ liệu trong method POST
* `-f` Không trả về HTML lõi
* `-H <header>` Thiết lập header cho request
* `-i` Bao gồm header trong output
* `-I` Chỉ lấy thông tin header
* `-o <file>` Ghi kết quả output ra file
* `-X <mothod>` Được sử dụng để gửi kem theo method
* `-c <file name>` Dùng để lưu trữ cookie trả về
* `--cookie <file name>` Sử dụng để gửi cookies
* `-C` Tiếp tục download các file đang bị gián đoạn

## Ví dụ

1. Curl lấy thông tin header

```
curl -I https://www.google.com/
```

2. Curl lây thông tin đầy đủ

```
curl -v https://www.google.com/
```

3. Sử dụng method

Sử dụng `-d` để xác định dữ liệu

```
curl -d "param1=value1&param2=value2" -X POST http://localhost:3000/data
```

Sử dụng `-H` để truyền vào header(ví dụ bên dưới xác định kiểu dữ liệu trong header)

```
curl -d "param1=value1&param2=value2" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:3000/data
```

Ví dụ dữ liệu là một file

```
curl -d "@data.json" -X POST http://localhost:3000/data
```