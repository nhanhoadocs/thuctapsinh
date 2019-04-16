# Tài liệu hướng dẫn cài đặt và cấu hình grafana kết hợp zabbix

Grafana là một công cụ hiển thị các thông số dưới dạng biểu đồ. Như vậy grafana có thể lấy các dữ liệu tử một nơi bất kì nào đó để hiển thị lên. Trong bài viết này tôi sẽ kết hợp grafana và zabbix để lấy các metric từ zabbix và hiển thị nó dưới dạng biểu đồ một cách trực quan.

## Cài đặt grafana

Grafana có thể cài đặt ngay tại server cài zabbix server hoăc một server khác.

Trước tiên cài đặt grafana server. Có nhiều cách để cài. Dưới đây tôi đưa ra 2 cách

**Cách 1**

```
yum install https://dl.grafana.com/oss/release/grafana-5.4.2-1.x86_64.rpm
```

**Cách 2**

Thêm các dòng sau vào file `/etc/yum.repos.d/grafana.repo`

```
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
```

Dùng câu lệnh `yum` để install

```
yum install grafana
```

Ở bước trên bạn có thể lựa chọn một trong 2 cách để cài. Bây giờ tiến hành start grafana

```
systemctl daemon-reload

systemctl start grafana-server
```

Kiểm tra lại trạng thái của grafana

```
systemctl status grafana-server
```

Cho phép grafana khởi động cùng hệ thống

```
systemctl enable grafana-server
```

Grafana sử dụng port `3000` vì vậy nếu bạn không stop firewalld thì bạn phải mở port `3000`

## Sử dụng

Để sử dụng bạn mở trình duyệt web và truy cập `IP-grafana-server:3000`. Bạn sẽ thấy giao diện login như sau:

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/1.png)

Cả username và password mặc định lần đầu đăng nhập là `admin`. Khi đăng nhập lần đầu hệ thống sẽ yêu cầu bạn đổi pass.

Khi login vào bạn sẽ thấy giao diện như sau

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/2.png)

Bạn có thể add data source để hiển thị các biểu đồ thông qua data từ data source mà bạn add vào. Nếu muốn sử dụng grafana để hiển thị các metric từ zabbix server thì bạn cần chạy lệnh sau trên grafana server

```
grafana-cli plugins install alexanderzobnin-zabbix-app

systemctl restart grafana-server
```

Và bây giờ bạn có thể add data source là `zabbix` vào grafana.

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/3.1.png)

Cấu hình thông tin đến zabbix server

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/4.png)

Ta có thể thấy một số thông số cần thiết cần phải cấu hình

* `URL` chỉ ra đường dẫn đến zabbix server. 
* `username` username dùng để login zabbix server
* `Password` password dùng để login zabbix server

Sau đó click `Save & Test` ở bên dưới

Bây giờ ta có thể tạo Dashboard để tạo các biểu đồ để quan sát

Ban đầu bạn cần tạo một Dashboard sau đó tạo các biểu đồ trên đó. Để tạo Dashboard bạn click vào biểu tượng dấu cộng

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/8.png)

Sau đó chọn loại biểu đồ. Để thêm các thông số cho biểu đồ để hiển thị bạn click vào `edit`

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/6.png)

Bạn thêm các metric tương tự như trong zabbix để hiển thị 

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/7.png)

Bạn có thể thêm nhiều biểu đồ trong một màn hình Dashboard

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/grafana/9.png)