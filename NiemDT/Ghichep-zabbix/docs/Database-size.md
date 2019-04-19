## Yêu cầu về dung lượng database trong zabbix

Database là một thành phần rất quan trọng trong hệ thống giám sát zabbix. Đây là nơi để lưu tất cả các dữ liệu mà mỗi item gửi về từ các thiết bị được giám sát. Zabbix server sẽ lấy dữ liệu từ đây để tính toán và hiển thị. 

Ta có thể thấy chỉ sau khoảng 1 phút sẽ có rất nhiều metric gửi về mà các thông tin này đều được lưu vào trong database.  Như vậy dữ liệu được lưu vào database sẽ là rất nhiều.

Như vậy cần cấu hình dung lượng disk cho database bao nhiêu là đủ.

Dưới đây tôi sẽ đưa ra một ví dụ để bạn có thể hình dung rõ hơn.

**Dung lượng cần cho bảng history**

Ví dụ tôi giám sát khoảng 3000 items với các thông báo gửi về sau mỗi 60s một lần. Như vậy trung bình mối giây sẽ có 3000/60 = 50 giá trị. Nghĩa là mỗi giây có 50 giá trị mới được ghi vào DB.

Các giá trị này sẽ được giữ trong khoảng thời gian nhất định do ta chỉ định. Thường sẽ được lưu trong khoảng từ vài tuần đến vài tháng. Nếu tôi lưu các giá trị này trong vòng 30 ngày và mỗi giây có khoảng 50 giá trị mới gửi về thì tổng số giá trị trong 30 ngày sẽ là: (30*24*3600)*50=129.600.000, gần 130 triệu giá trị.

Tùy thuộc vào định dạng của dữ liệu gửi về (floats, intergers, string, log files,..) mỗi giá trị này sẽ chiếm dung lượng từ 40 bytes đến hàng trăm bytes. Nhưng thông thường sẽ là 90 bytes. Như vậy với 130 triệu giá trị sẽ cần 130.000.000 * 90 bytes = 10.9 GB dung lượng.

**Dung lượng cần cho bảng trends**

Zabbix sẽ lưu lại các giá trị như max/min/avg/count trong khoảng thời gian 1 giờ cho mỗi item trong bảng `trend`. Dữ liệu này sẽ được lưu nhằm mục đích để đánh giá và phân tích.

Tùy vào loại dữ liệu nhưng trung bình sẽ cần 90 bytes cho mỗi item trong 1 giờ. Nếu tôi lưu nó trong vòng 1 năm thì dung lượng đĩa cần thiết là: 3000 * 24 * 365 * 90 = 2.2GB.

**Dung lượng cần cho events**

Mỗi event trung bình sẽ cần 170 bytes dung lượng disk. Rất khó để tính toán số event. Ở đây tôi giả sử trường hợp xấu nhất mỗi giây sẽ có 1 event. Nếu tôi giữ các event này trong khoảng thời gian 1 năm thì dung lượng disk cần là: 365 * 24* 3600 * 170 bytes = 5 GB.

Như vậy dung lượng disk cần thiết cho database trong trường hợp này sẽ là 10.9 + 2.2 + 5 = 18.1 GB

Như vậy công thức để tính dung lượng disk cần thiết cho DB sẽ là

| Thông số | Dung lượng cần thiết |
| -------- | -------------------- |
| Zabbix configuration | Fixed size. Normally 10MB or less. |
| History | days*(items/refresh rate)*24*3600*bytes;     items : number of items;     days : number of days to keep history; refresh rate : average    refresh rate of items;      bytes : number of bytes required to keep single value, depends on database engine, normally ~90 bytes.|
| Trends | days*(items/3600)*24*3600*bytes;  items : number of items; days :  number of days to keep history;  bytes : number of bytes required to keep single trend, depends on database engine, normally ~90 bytes. |
| Events | days*events*24*3600*bytes    events : number of event per second.    One (1) event per second in worst case scenario;    days : number of days to keep history;   bytes : number of bytes required to keep single trend, depends on database engine, normally ~170 bytes. |

Như vậy tổng dung lượng cần thiết là 

```
Configuration + History + Trends + Events
```

Dung lượng disk sẽ không cần hết số dung lượng đó ngay sau khi ta cài đặt nó tăng lên dần dần đến một thời điểm nhất định thì dừng lại. Diều này tùy thuộc vào thời gian ta lưu các dữ liệu đó.