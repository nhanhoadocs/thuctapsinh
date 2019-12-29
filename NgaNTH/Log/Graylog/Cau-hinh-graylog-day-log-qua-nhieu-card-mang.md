# Cấu hình graylog để thu thập log từ nhiều card mạng

## Mô hình  

<img src="https://i.imgur.com/mNmN6AG.png">  

## Phân hoạch IP 
<img src="https://i.imgur.com/uCpJxhM.png">  

# 1. Cấu hình trên Graylog server  

## Bước 1: Chỉnh sửa file cấu hình 
 Sau khi cài đặt xong graylog server ta sẽ vào file cấu hình `/etc/graylog/server/server.conf` để chỉnh sửa địa chỉ `http_public_uri` cho graylog server nhận log từ nhiều địa chỉ IP. Ta sẽ để địa chỉ `0.0.0.0: 9000`.
 

<img src="https://i.imgur.com/S4EmBmy.png"> 

Mục `http_bind_address` để địa chỉ IP của card `eth0` và ta chỉ cho phép đăng nhập graylog server qua Web interface bằng địa chỉ này.   

<img src="https://i.imgur.com/pjUrmTd.png">

- Lưu thay đổi file và restart graylog-server
```
systemctl restart graylog-server
```
## Bước 2: Khai báo Input

Trên trình duyệt gõ địa chỉ IP của card `eth0` (vì card này đi ra ngoài Internet được) kèm port `9000`. Sau đó đăng nhập vào graylog server bằng tài khoản user `admin` và mật khẩu đã tạo trước đó.  

Tiếp tục vào mục System => Input để tạo một Input mới. 
Đối với đẩy log bằng Sidecar ta sẽ chọn Input là `Beats`. Sau đó click vào `Launch new input`

<img src="https://i.imgur.com/FNlo6Pu.png">  

Sau đó khai báo thông tin cần thiết vào các trường sau:  
- `Node`: chọn node hostname `graylogsrv`  
- `Titel`: Tên Input
- `Bind address`: 0.0.0.0
- `Port`: cổng giao tiếp để nhận log.

<img src="https://i.imgur.com/GxLfRIO.png">  

Sau đó ấn `Save` để lưu lại các cấu hình Input.  

# 2. Cấu hình trên các máy client  

## 2.1 Client01  
- Tải gói cài đặt sidecar 
```
wget https://github.com/Graylog2/collector-sidecar/releases/download/1.0.2/graylog-sidecar-1.0.2-1.x86_64.rpm
```
- Kiểm tra gói download về
```
[root@client1 ~]# ls
anaconda-ks.cfg graylog-sidecar-1.0.2-1.x86_64.rpm
```
- Chạy lệnh cài đặt graylog-sidecar
```
rpm -i graylog-sidecar-1.0.2-1.x86_64.rpm
```
- Chỉnh sửa trong file cấu hình `/etc/graylog/sidecar/sidecar.yml`
```
server_url: "http://10.10.34.101:9000/api/"
server_api_token: "d851apka1mknvltvflad8uj0gug13kjjtngqa1qcochumdhaki"
node_name: "client01"
update_interval: 10
list_log_files:
  - "/var/log/"
cache_path: "/var/cache/graylog-sidecar"
log_path: "/var/log/graylog-sidecar"

```
**Chú ý**:
-  ở mục `server_url: "http://10.10.34.101:9000/api/"` tức là ta khai báo địa chỉ IP card `eth0` của graylog server để nhận log từ máy `client01`.
- Giá trị của `server_api_token` được tạo bằng các bước sau:  
    - Vào `System/Sidecar` và chọn `Create or reuse a token for the graylog-sidecar user`.
` 
    <img src="https://i.imgur.com/9iXNNsz.png">

    - Điền tên token và copy hash token được tạo  

    <img src="https://i.imgur.com/G7xEzSF.png">

- Cài đặt sidecar và khởi động cùng hệ thống
```
graylog-sidecar -service install
systemctl start graylog-sidecar.service
systemctl enable graylog-sidecar.service
```


- Download filebeat
```
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.2-x86_64.rpm
```
- Cài đặt filebeat
```
rpm -i filebeat-7.4.2-x86_64.rpm
```
- Bật filebeat và kích hoạt khởi động cùng hệ thống
```
systemctl start filebeat
systemctl enable filebeat
```
- Khởi động lại dịch vụ graylog-sidecar
```
systemctl restart graylog-sidecar.service 
```
### Cấu hình Sidecar trên Web interface  

- Cấu hình Collector cho Sidecar của máy Client01. Chú ý khai báo địa chỉ IP ở mục host như hướng dẫn

<img src="https://i.imgur.com/oTTYWJo.png">

Sau đó kiểm tra trạng thái ở chế độ `Running`

<img src="https://i.imgur.com/nvPRQao.png">

# 2.2 Client02

- Tương tự cài đặt Sidecar trên Client02 theo hướng dẫn như cài đặt phần 2.1  
- Nội dung file cấu hình `/etc/graylog/sidecar/sidecar.yml` trên Client02 sẽ như sau:  
```
server_url: "http://10.10.35.101:9000/api/"
server_api_token: "1dakui9ahfp4nr4j0qk6n43u8va38sav5o29ar1nsqb2stt4ltmb"
node_name: "client02"
update_interval: 10
list_log_files:
  - "/var/log/"
cache_path: "/var/cache/graylog-sidecar"
log_path: "/var/log/graylog-sidecar"
```
**Chú ý**: server_url là địa chỉ IP của card `eth1` của máy graylog server.

- Tiếp theo cấu hình Collector của Client02 trên Web interface. Chú ý ở mục `host` trong file cấu hình  

<img src="https://i.imgur.com/cwxGZoO.png">  

- Kiểm tra trạng thái filebeat đã ở chế độ Running chưa  

<img src="https://i.imgur.com/98kVUCw.png">  

# 3. Test kết quả  
Đăng nhập đúng hoặc tài khoản bất kỳ trên máy Client01 và Client02 rồi kiểm tra log đã được đẩy về Graylog server chưa. Nếu kết quả hiển thị như bên dưới là ta đã thành công 
 
<img src="https://i.imgur.com/pr33Aqb.png">
