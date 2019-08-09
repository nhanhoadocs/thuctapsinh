Lệnh `Stress` là lệnh để  hỗ trỡ kiểm tra các phần cứng của máy tính. Nó sẽ tạo ra một khối lượng công việc cho phần cứng để xem tốc độ làm việc của máy tính sẽ như thế nào 

Cách cài đặt 
```
yum install http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el7/en/x86_64/rpmforge/RPMS/stress-1.0.2-1.el7.rf.x86_64.rpm

yum install stress 
```
Các Option trong stress

| Option |  DESCRIPTION |
|---|---|
| -? | Hiển thị hỗ trợ | 
| --version | Hiển thị phiên bản của lệnh | 
| -v | Hiển thị đầy đủ sau khi thực thi lệnh |
| -t | Kết thúc lệnh sau khoảng thời gian | 
| -m | Tạo công việc cho memory | 
| -c | Tạo khối lượng công việc cho cpu | 
| -d | Tạo khối lượng công việc cho disk |

