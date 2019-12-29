#  [Graylog][Phần 4]Hướng dẫn cài đặt Graylog Sidecar trên Windows server 2016
Tiếp nối series các bài về graylog chúng ta cùng tìm hiểu cấu hình để graylog server có thể thu thập được log của windows thông qua `sidecar` & `winlogbeat`.

## 1. Cài đặt graylog sidecar trên windows server 2016

- Chỉnh timezone cho windows server nhận đúng giờ GMT +7  

<img src="https://i.imgur.com/hHeEnJS.png">  

- Tải graylog sidecar 1.x từ [link](https://github.com/Graylog2/collector-sidecar/releases)  

<img src="https://i.imgur.com/J3NmS9Q.png">  

- Click vào file cài đặt và chọn `Next`  

<img src="https://i.imgur.com/LCp92Uh.png">  

- Chọn `I Agree`  

<img src="https://i.imgur.com/Wg4gyHF.png">  

- Khai báo các tham số trong màn hình tiếp theo. Lưu ý chuỗi token cần được sao chép từ phía server đã được khai báo ở bài trước.  
- Sau khi khai báo chọn Install

<img src="https://i.imgur.com/poqr9Ne.png">  

- Chờ cài đặt xong và chọn `Finnish`  

<img src="https://i.imgur.com/3ho7Xeb.png">  

- Mở CMD và thực hiện các lệnh để khởi động graylog sidecar  
```
"C:\Program Files\graylog\sidecar\graylog-sidecar.exe" -service install
"C:\Program Files\graylog\sidecar\graylog-sidecar.exe" -service start
```

## 2. Cấu hình trên graylog server để nhận log từ windows.  

- Truy cập vào tab `System` ==> `Sidecar`. Tạo token bằng việc click vào `Create...`  

<img src="https://i.imgur.com/Q3RTtdi.png">  

- Tiếp theo cấu hình `Collector` ở các tab `Configuration` và ` Administration`  

<img src="https://i.imgur.com/1TweFRk.png">

- Quay lại đăng nhập vào Graylog và truy cập vào tab `Search`. Sau đó thử đăng nhập vào máy windows, ta sẽ thấy có log đăng nhập bên graylog là ok.  

