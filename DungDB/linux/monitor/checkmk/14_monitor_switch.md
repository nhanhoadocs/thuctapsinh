# Giám sát switch qua giao thức SNMP

Cấu hình SNMP trên switch theo hướng dẫn tại đây: https://news.cloud365.vn/zabbix-giam-sat-cisco-switch-snmp/

Thêm host như sau:

![Imgur](https://i.imgur.com/o5JfAbg.png)

- Đặt tên SW tùy ý
- Khai báo IP SW
- Phần check_MK agent chọn `no agent`
- Phần SNMP chọn `SNMP v2 or v3`.
- Phần SNMP credential nhập vào `public`. Giống như đã cấu hình ở SW

Test:

![Imgur](https://i.imgur.com/kEvjH5X.png)

![Imgur](https://i.imgur.com/FGNg5yI.png)

Bật hết các service của SW để giám sát

![Imgur](https://i.imgur.com/hxVAVwI.png)

![Imgur](https://i.imgur.com/ySN2xpa.png)

Click monitor sẽ xuất hiện giao diện như sau

![Imgur](https://i.imgur.com/GRHqHMq.png)

Kết quả: 

![Imgur](https://i.imgur.com/GZCJEvF.png)

Tham khảo: https://checkmk.com/monitoring-network-devices.html