# Thu thập log về graylog server thông qua cài đặt sidecar hoặc syslog trên máy client  

## 1. Chuẩn bị  
- 01 máy CentOS7 để cài graylog server thu thập log
- 01 máy CentOS7 làm máy client sẽ cài đặt sidecar hoặc syslog để đẩy log về server.

## 2. Cài đặt 
Ta sẽ thực hiện cài đặt bằng script.

**2.1 Cài đặt graylog server**  
- Tải gói cài đặt graylog server.
```
yum install -y wget
```
```
wget -P /root/ https://gist.githubusercontent.com/ngahong/2c7f6a667f46391c1582225a39b201d8/raw/ffc517851242d984646e4d9ca4aaba67edfbb9a1/graylogsrv.sh
```
- Sau khi tải về gói cài sẽ nằm ở thư mục `/root` và có tên là `graylogsrv.sh` 

- Cấp quyền thực thi cho file script
```
chmod +x graylogsrv.sh
```
- Thực hiện chạy script để bắt đầu quá trình cài đặt  
```
bash /root/graylogsrv.sh
```
- Trong quá trình cài đặt, hệ thống sẽ yêu cầu bạn nhập địa chỉ IP của host cài graylog kèm port 9000. Bạn nhập như theo mẫu.
```
IP_address:9000
``` 
- Tiếp theo nhập mật khẩu để đăng nhập graylog server trên Web interface.  

Lưu ý: Sau khi có thông báo cài đặt thành công (**Install success**) bạn mở trình duyệt và gõ địa chỉ IP kèm port 9000 như lúc bạn khai báo ở phía trên  
Ví dụ:  
```
http://10.10.34.100:9000
```
Enter và đợi khoảng 3 phút để hệ thống load Elasticsearch. GIao diện Web interface của graylog server được trả về. Bạn đăng nhập bằng tải khoản với tên user  `admin` và mật khẩu bạn tạo.  

**2.2 Cài đặt syslog hoặc sidecar trên máy client**  
- Tải gói cài đặt 
```
yum install -y wget
```
```
wget -P /root/ https://gist.githubusercontent.com/ngahong/db743c77d0216eec2206893a2fe033a5/raw/8affe9bb1f2497dd430d435957f60b7429977641/sidecarsyslog.sh
```
- Sau khi tải về, gói cài sẽ nằm ở thư mục `/root/` và có tên là `sidecarsyslog.sh`  
- Cấp quyền thực thi cho file script
```
chmod +x sidecarsyslog.sh
```
- Thực hiện chạy script để bắt đầu quá trình cài đặt
```
bash /root/sidecarsyslog.sh
```
- Trong quá trình cài đặt, hệ thống sẽ hỏi bạn muốn đẩy log thông qua syslog hoặc sidecar. Nhập `1` nếu bạn chọn `syslog` hoặc nhập `2` nếu bạn chọn `sidecar`. Trong trường hợp bạn nhập không đúng 1 trong 2 giá trị trên thì hệ thống sẽ nhắc bạn nhập lại.  

**Trường hợp 1: Đẩy log thông qua syslog**  
- Tiếp theo bạn cần nhập địa chỉ IP của máy graylog server kèm port để đẩy log. Thông thường tôi sẽ đặt port `1514`. Lưu ý khi bạn cấu hình Input trên Web interface của graylog server, bạn cần điền đúng port đã khai báo ở máy client  
- Quá trình cài đặt kết thúc khi có thông báo `Install success`.  
> Tham khảo cách khai báo Input cho syslog tại mục 2.4 trong bài viết [Thu thập log của linux thông qua syslog](https://news.cloud365.vn/graylog-lab-phan-3-thu-thap-log-cua-linux-thong-qua-syslog/)

**Trường hợp 2: Đẩy log thông qua sidecar**  
- Hệ thống sẽ yêu cầu bạn nhập địa chỉ IP của graylog server và `server API token`. Giá trị của server API token bạn sẽ lấy theo cách sau:  
    - Vào System => Sidecar và click vào `Create or reuse a token for the graylog-sidecar user`  

<img src="https://i.imgur.com/fTbjUep.png">  

    - Nhập tên token và bấm Create token và copy giá trị token vừa tạo  

<img src="https://i.imgur.com/QIevK8F.png">  

- Quá trình cài đặt kết thúc khi hiển thị `Install success`.  
- Tiếp theo bạn tham khảo cấu hình Collector trên Web interface của graylog server ở mục 2.4 trong bài viết [Thu thập log của Linux thông qua graylog sidecar](https://news.cloud365.vn/graylog-lab-phan-2-thu-thap-log-cua-linux-thong-qua-graylog-sidecar/)

## 3. Test kết quả
Thử đăng nhập vào 1 tài khoản trên máy client. Vào mục `Search` thấy có log gửi về là đã cấu hình thành công.  



