# LAB - Bắt và phân tích gói tin HTTP

## Kịch bản
1. Sử dụng lệnh `curl` để lấy dữ liệu từ 1 trang web
2. Sử dụng lệnh `tcpdump` để bắt gói tin HTTP Request và HTTP Response
3. Phân tích 2 gói tin bắt được

## Thực hiện
Mở 1 lúc 2 terminal và thực hiện các lệnh sau:

**Terminal 1**: Bắt gói tin HTTP là lưu thành file `http.pcap` thông qua cổng 80
```
# tcpdump -i ens33 -w http.pcap port 80 
```

**Terminal 2**: Sử dụng `curl` để lấy thông tin Header của trang `http://kenh14.vn/`

<img src = "..\images\Screenshot_12.png">

**Sử dụng WireShark để đọc các gói tin HTTP:**

<img src ="..\images\Screenshot_13.png">


### Gói tin HTTP Request
<img src = "..\images\Screenshot_14.png">

- Request Method: `HEAD`
- Phiên bản HTTP: `HTTP/1.1`
- User-Agent: `curl/7.29.0\r\n` (Thông tin của Agent được sử dụng để lấy thông tin)
- Host: `kenh14.vn`

### Gói tin HTTP Reponse
<img src = "..\images\Screenshot_15.png">

- Phiên bản HTTP: `HTTP/1.1`
- Severity level (Mức độ nghiêm trọng) : Chat (Blue).
Xem thêm tại [đây](https://www.wireshark.org/docs/wsug_html_chunked/ChAdvExpert.html).
- Status code : Trạng thái gói tin: `200 (OK)`
- Servername : `155\r\n`
- Date : Ngày tháng trên server: `Thu, 26 Dec 2019 03:51:49 GMT`
- Connection (Loại kết nối) : `close`