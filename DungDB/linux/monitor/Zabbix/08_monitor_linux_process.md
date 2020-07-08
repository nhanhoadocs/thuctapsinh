# Giám sát process trong hệ điều hành Linux

Thực hiện theo hướng dẫn: https://news.cloud365.vn/zabbix-giam-sat-process-trong-he-dieu-hanh-linux/

Kết quả: 

Có 3 tiến trình SSH đang hoạt động

![Imgur](https://i.imgur.com/plrBV1M.png)

Chú ý phần key của tiến trình

![Imgur](https://i.imgur.com/hJ1BoQO.png)

Có thể dùng các loại key sau để giám sát tiến trình:

- proc.num - Giám sát số lượng tiến trình
- proc.mem - Giám sát lượng RAM tiến trình tiêu thụ
- proc.cpu.util - Giám sát lượng CPU mà tiến trình sử dụng

Xem thêm cú pháp key ở đây https://www.zabbix.com/documentation/2.4/manual/config/items/itemtypes/zabbix_agent#zabbix_agent