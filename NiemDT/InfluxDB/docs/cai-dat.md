# Cài đặt influxdb trên Centos7

Để cài Influxdb trên Centos7 ta thực hiện như sau:

Add thêm repository

```
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
```

Sau sử dụng `yum` để cài đặt

```
yum install influxdb
``` 

Start và enable service `influxdb`

```
systemctl start influxdb
systemctl enable influxdb
```

Đến đây việc cài đặt influxdb đã thành công!!!