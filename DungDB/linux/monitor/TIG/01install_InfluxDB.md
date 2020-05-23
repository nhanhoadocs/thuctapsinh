# Cài TIG stack

https://devconnected.com/how-to-setup-telegraf-influxdb-and-grafana-on-linux/#I_Installing_InfluxDB

## Cài influxDB

```
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -

source /etc/lsb-release

echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

apt-get update -y

apt-get install -y influxdb

systemctl start influxdb.service

systemctl status influxdb.service

systemctl enable influxdb.service
```

Kiểm tra port đang mở :

    netstat -plntu

Kiểm tra version hiện tại của Influx :

    influx -version

Để lưu trữ dữ liệu cho Telegraf agents, ta sẽ setup trước database và user trên Influxdb:

    influx

Tạo database và user cho Telegraf:

    > create database telegraf
    > create user telegraf with password 'P@ssw0rd'

Kiểm tra lại database và user vừa tạo:

    > show databases
    > show users

## Cài Telegraf agent

```
apt install telegraf -y

systemctl start telegraf

systemctl enable telegraf

systemctl status telegraf

telegraf --version
```

Backup file cấu hình mặc định của Telegraf :

    cd /etc/telegraf/

    cp telegraf.conf telegraf.conf.bak

## Configure InfluxDB Authentication

Enable HTTP authentication on your InfluxDB server

Sửa file `/etc/influxdb/influxdb.conf`
```
[http]
  # Determines whether HTTP endpoint is enabled.
  enabled = true
  
  # The bind address used by the HTTP service.
  bind-address = ":8086"

  # Determines whether user authentication is enabled over HTTP/HTTPS.
  auth-enabled = true
```

    nano /etc/telegraf/telegraf.conf

Sửa các dòng:

```
hostname = "tig"

urls = ["http://127.0.0.1:8086"]

database = "telegraf"

username = "telegraf"

password = "P@ssw0rd"

[[inputs.cpu]]

percpu = true

totalcpu = true

collect_cpu_time = false

report_active = false

[[inputs.disk]]

ignore_fs = ["tmpfs", "devtmpfs", "devfs", "iso9660", "overlay", "aufs", "squashfs"]

[[inputs.diskio]]

[[inputs.kernel]]

[[inputs.mem]]

[[inputs.processes]]

[[inputs.swap]]

[[inputs.system]]

[[inputs.net]]

[[inputs.netstat]]
```

    systemctl restart telegraf

Kiểm tra trạng thái của các input :

Kiểm tra cpu input:

    telegraf -test -config /etc/telegraf/telegraf.conf --input-filter cpu

Kiểm tra net input:

    telegraf -test -config /etc/telegraf/telegraf.conf --input-filter net

Kiểm tra mem input:

    telegraf -test -config /etc/telegraf/telegraf.conf --input-filter mem

## Cài đặt Grafana

```
# apt-get install -y adduser libfontconfig1
# wget https://dl.grafana.com/oss/release/grafana_6.7.3_amd64.deb
# dpkg -i grafana_6.7.3_amd64.deb
# systemctl start grafana-server
# systemctl enable grafana-server
# systemctl status grafana-server
# netstat -plntu
# grafana-server -v
```

Truy cập `http://<ip-grafana-server>:3000`

Tài khoản mặc định admin / admin

Đổi mật khẩu

Add data source: Thêm influxDB vào.

Import dashboard, tìm trên trang này các dashboard có sẵn để thêm: https://grafana.com/grafana/dashboards

Hoặc tự thêm bằng tay.

Đọc thêm: https://kb.nhanhoa.com/pages/viewpage.action?pageId=33818099

https://community.jitsi.org/t/how-to-to-setup-grafana-dashboards-to-monitor-jitsi-my-comprehensive-tutorial-for-the-beginner/38696

https://vuvangiap.com/huong-dan-cai-dat-thong-monitor-voi-grafana-influxdb-va-telegraf-tren-centos-7.html

Cài trên centos: https://namlee.net/huong-dan-cai-dat-thong-monitor-voi-grafana-influxdb-va-telegraf-tren-centos-7/

