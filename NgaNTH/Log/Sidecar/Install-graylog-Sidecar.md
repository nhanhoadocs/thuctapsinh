# Các bước cài đặt và cấu hình Graylog Sidecar  

## 1. Mô hình triển khai  

<img src="https://i.imgur.com/Tiih04m.png">  

## 2. IP Planning  
Các IP được sử dụng trong mô hình LAB như sau:  

<img src="https://i.imgur.com/iopXY0l.png">  

## 3. Cài đặt  

### 3.1 Install Graylog Sidecar on Ubuntu 18.4  

Lưu ý: Tất cả các lệnh sau đều thực hiện ở máy client  
- Tải gói cài `graylog-sidecar_1.0.0-1amd64.deb`
```
wget https://github.com/Graylog2/collector-sidecar/releases/download/1.0.0/graylog-sidecar_1.0.0-1_amd64.deb
```
- Chạy lệnh cài đặt  
```
dpkg -i graylog-sidecar_1.0.0-1_amd64.deb
```
- Khi chạy lệnh cài đặt xong trên máy của bạn sẽ tạo một file mặc định ở `/etc/graylog/sidecar/sidecar.yml`. Ta sẽ sử dụng lệnh vi để chỉnh sửa một vài thông số trong `sidecar.yml`

<img src="https://i.imgur.com/GMm4dED.png"> 

Trong đó:  
    - server_url: "http://192.168.152.134:9000/api" là địa chỉ url của máy graylog-server.  
    - server_api_token: chuỗi hash được tạo tự động trên Graylog Web interface bằng cách ta vào `System/Input/Create or reuse a token for the graylog-sidecar user` và điền một vài thông tin cần thiết như hướng dẫn trong ảnh dưới. 

<img src="https://i.imgur.com/zx7QN8u.png">  

Copy hash này và paste vào file cấu hình `sidecar.yml`  

- Tiếp theo cài đặt sidecar với tùy chọn `-service`  
```
graylog-sidecar -service install
```  
- Khởi động sidecar và thiết lập enable cùng hệ thống   
```
systemctl start graylog-sidecar
```

<Còn tiếp>