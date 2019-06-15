Iperf là lệnh dùng để kiểm tra băng thông của port mạng 

Cú pháp 
```
iperf -s hoặc -c IP  Option
```
Cách cài đặt 
```
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

yum -y install iperf

```

| Option | DESCRIPTION |
|----|----|
| -h | Hiển thị trợ giúp |
| -u | Sử dụng udp thay vì tcp |
| -s | Chạy ở chế độ server | 
| -c | Chạy ở chế độ client | 
| -t | Dùng lệnh trong khoảng thời gian chỉ định | 
| -i | Test bằng thông trong số giây chỉ định | 
| -p | Chỉ ra port kết nối | 
| -v | Hiển thị phiên bản |
| -d | Sử dụng lệnh theo 2 chiều | 
| -b | Đặt băng thông max cho port | 
