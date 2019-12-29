## Graylog Sidecar  

## 1.Giới thiệu
`Graylog Sidecar` là hệ thống quản lý cấu hình cho các log collector khác nhau, cũng được gọi là *Backends*.  Graylog node hoạt động như một trung tâm tập trung (hub) chứa các cấu hình của các trình thu thập log. Trên các thiết bị/máy chủ tạo messages được hỗ trợ, Sidecar có thể chạy dưới dạng dịch vụ (máy chủ Windows) hoặc daemon (máy chủ Linux). 

<img src="https://i.imgur.com/7iqyfve.png">  

Các cấu hình trình thu thập log được quản lý tập trung thông qua giao diện web Graylog. Theo định kỳ, tiến trình Sidecar sẽ thu thập tất cả các cấu hình thích hợp cho target, dùng REST API. Những cấu hình được thu thập dựa vào các "tag" trong file cấu hình. Ví dụ, một Web server host bao gồm các tag "linux" và tag "nginx" Trong lần đầu tiên chạy, hoặc khi có một sự thay đổi về cấu hình được phát hiện, Sidecar sẽ tạo (hoặc hoàn trả) các file cấu hình backend thích hợp. Sau đó nó sẽ start hoặc restart, các log collector sẽ được reconfigured.  

> Graylog 3.0 đi kèm với việc triển khai Sidecar mới tuy nhiên vẫn hỗ trợ Sidecar Collector cũ (có thể được tìm thấy trong mục menu System / Collector (legacy)). Khuyến khích người dùng chuyển sang Sidecar mới.  

## 2.Installation  

Các phiên bản Graylog Sidecar tương ứng với các phiên bản Graylog-server như liệt kê trong bảng. Bạn có thể tải gói cài tại [đây](https://github.com/Graylog2/collector-sidecar/releases)  

<img src="https://i.imgur.com/8jCyoSa.png">

### Install the Sidecar
### 2.1 Ubuntu  
```
$ sudo dpkg -i graylog-sidecar_1.0.0-1_amd64.deb
```
Thiết lập cấu hình (xem thêm tại [đây](http://docs.graylog.org/en/3.1/pages/sidecar.html#sidecar-configuration)) và active Sidecar như một dịch vụ  
```
$ vi /etc/graylog/sidecar/sidecar.yml

$ sudo graylog-sidecar -service install

[Ubuntu 14.04 with Upstart]
$ sudo start graylog-sidecar

[Ubuntu 16.04 and later with Systemd]
$ sudo systemctl start graylog-sidecar
```  
### 2.2 CentOS  
Cài đặt gói RPM 
```
$ sudo rpm -i graylog-sidecar-1.0.0-1.x86_64.rpm  
``` 
Chỉnh sửa file cấu hình (xem thêm tại [đây](http://docs.graylog.org/en/3.1/pages/sidecar.html#sidecar-configuration)) và active Sidecar như một dịch vụ  
```
$ vi /etc/graylog/sidecar/sidecar.yml

$ sudo graylog-sidecar -service install
$ sudo systemctl start graylog-sidecar  
``` 
### 2.3 Windows  
Sử dụng trình cài đặt trên Windows để cài đặt 
```
$ graylog_sidecar_installer_1.0.0-1.exe  
```
Hoặc trong silent mode:  
```
$ graylog_sidecar_installer_1.0.0-1.exe /S -SERVERURL=http://10.0.2.2:9000/api -APITOKEN=yourapitoken
```  
Tùy chọn chỉnh sửa cấu hình (xem thêm tại [đây](http://docs.graylog.org/en/3.1/pages/sidecar.html#sidecar-configuration)) và đăng ký dịch vụ hệ thống  
```
notepad.exe C:\Program Files\Graylog\sidecar\sidecar.yml

& "C:\Program Files\graylog\sidecar\graylog-sidecar.exe" -service install
& "C:\Program Files\graylog\sidecar\graylog-sidecar.exe" -service start
```

## 3. Sidecar.yml  
Khi cài đặt xong Sidecar trong máy sẽ sinh ra file cấu hình mặc định ở `/etc/graylog/sidecar/sidecar.yml`. Chúng ta sẽ cùng tìm hiểu ý nghĩa của các tùy chọn cấu hình trong `sidecar.yml`.  
File cấu hình được chia thành global option và backend option. Các global option:  

- `server_url`: URL của Graylog API, Mặc định: `http://127.0.0.1:9000/api/`  
- `server_api_token`: Mã thông báo API được sử dụng để xác thực với API máy chủ Graylog. Token này là bắt buộc và cần thiết để cấu hình.   
- `node_id`: ID của node Sidecar. Nó có thể là 1 đường dẫn file hoặc một chuỗi ID.  
    - Example file path: file:/etc/graylog/sidecar/node-id.  
    - Example ID string: 6033137e-d56b-47fc-9762-cd699c11a5a9  
- `node_name`: Tên của Sidecar instance sẽ được hiển thị trên Web interface. Nếu nó không được thiết lập thì sẽ được hiển thị bằng hostname.
- `update_interval`: Khoảng thời gian theo giây, sidecar sẽ thu thập các cấu hình mới từ Graylog server. (Mặc định là 10)  
- `tls_skip_verify`: Từ chối xác thực kết nối TLS. (Mặc định là false)
- `send_status`: Gửi trả status với mỗi backend tới Graylog và hiển thị nó trên status page cho host.  
- `list_log_files`: Gửi 1 danh sách thư mục tới Graylog và hiển thị nó trên host status page. Ví dụ `/var/log`. Mặc định là []   
- `cache_path`: Thư mục nơi sidecar lưu trữ dữ liệu nội bộ. Mặc định `/var/cache/graylog-sidecar`.    
- `log_rotate_max_file_size`: Kích thước lớn nhất của log file trước khi nó được xoay vòng.   
- `log_rotate_keep_files`: Số lượng lớn nhất mà các file log được giữ lại.  
- `collector_binaries_whitelist`: Một danh sách các nhị phân được Sidecar cho phép thực thi. Mặc định: `/usr/bin/filebeat`, `/usr/bin/packetbeat`, `/usr/bin/metricbeat`, `/usr/bin/heartbeat`,
`/usr/bin/auditbeat`, `/usr/bin/journalbeat`, `/usr/share/filebeat/bin/filebeat`,...  

## 4. Beats  
Để cài đặt Filebeat hoặc các Beats package bạn có thể truy cập vào trang sau đây để tải về:  
- [Filebeat for Linux](https://www.elastic.co/fr/downloads/beats/filebeat) 
- [Filebeat for Windows](https://www.elastic.co/downloads/beats) 




