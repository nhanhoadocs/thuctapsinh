## Tìm hiểu file cấu hình Graylog  
`server.conf` là file cấu hình graylog, mặc định khi cài lên nó sẽ nằm ở `etc/graylog/server/server.conf`.  
> Để kiểm tra vị trí mặc định của config file, log file... bạn có thể tham khảo tại [đây](http://docs.graylog.org/en/3.1/pages/configuration/file_location.html#default-file-location)   

## Properties  

### General  
- `is_master = true`  
Nếu bạn chạy nhiều hơn 1 instance Graylog server bạn cần phải thiết kế duy nhất một node graylog-server làm master. Node này sẽ thực hiện các hoạt động định kỳ và bảo trì mà các node slave không thực hiện được.  
- `password_secret = <secret>`  
Bạn PHẢI thiết lập một bí mật được sử dụng để mã hóa mật khẩu và tạo salting. Máy chủ sẽ từ chối start nếu giá trị này không được đặt. Sử dụng nhiều hơn 64 kí tự. Nếu bạn chạy nhiều graylog-server, bạn cũng phải thiết lập `password secret` tương tự cho tất cả các node.  
Ví dụ chung tạo một password secret là:  
> pwgen -N 1 -s 96  

- `root_username = admin`  
Mặc định tài khoản root có tên là `admin`  

- `root_password_sha2 = <SHA2>`  
`SHA2` là password mà bạn sẽ dùng để đăng nhập. Chèn hash `SHA2` với câu lệnh `echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1` và bạn sẽ cho phép đăng nhập vào Web interface với tên tài khoản `admin` và password bạn vừa gõ lúc trước.  

> **Lưu ý**:  Bạn cần phải xác định 1 hash password cho tài khoản root (mật khẩu này không thể bị thay đổi bởi API hoặc qua Web interface).  

## Web Properties  

- `http_bind_address = 127.0.0.1:9000`   
-> Network interface sử dụng bởi Graylog HTTP interface.  
-> Địa chỉ và port này được sử dụng bởi mặc định trong `http_publish_uri`.  

- `http_publish_uri = http://127.0.0.1:9000/` 

-> Web interface lắng nghe URI.  
-> URI HTTP của node Graylog này được sử dụng bởi tất cả các client sử dụng giao diện web Graylog.  

## Elasticsearch Properties  
