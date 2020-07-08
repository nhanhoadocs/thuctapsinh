# Giám sát Windows Server bằng zabbix-agent

Thực hiện trên client (remote vào)

Lựa chọn agent cho windows tại đây: https://www.zabbix.com/download_agents

Tải với đường dẫn: https://www.zabbix.com/downloads/5.0.1/zabbix_agent-5.0.1-windows-amd64.zip

Tải được file như sau

![Imgur](https://i.imgur.com/RklDxn9.png)

Giải nén ra và đặt vào thư mục `C:\zabbix\`

Nếu thư mục chưa tồn tại thì tạo thư mục.

![Imgur](https://i.imgur.com/bmYVTcl.png)

Sửa file `C:\zabbix\conf\zabbix_agentd.conf`. Chuột phải, open with. Chọn notepad

![Imgur](https://i.imgur.com/8OWAYdS.png)

Sửa các dòng sau:

    Server=<IP_ZABBIX_SERVER>
    ServerActive=<IP_ZABBIX_SERVER>
    Hostname=<ZABBIX_SERVER_HOSTNAME>

Ví dụ sửa thành

    Server=172.16.4.252
    ServerActive=172.16.4.252
    Hostname=zabbixdbd

Bật cmd và gõ các lệnh:

    cd C:\zabbix\bin\
    .\zabbix_agentd.exe -c C:\zabbix\conf\zabbix_agentd.conf --install
    .\zabbix_agentd.exe --start

![Imgur](https://i.imgur.com/m4gv2vj.png)

Mở port 10050. Thực hiện theo hình

![Imgur](https://i.imgur.com/vauVmWK.png)

![Imgur](https://i.imgur.com/nk5Bq5M.png)

![Imgur](https://i.imgur.com/gOyUMkr.png)

![Imgur](https://i.imgur.com/dR7qavJ.png)

![Imgur](https://i.imgur.com/itBsr5M.png)

![Imgur](https://i.imgur.com/MMHTRxA.png)

![Imgur](https://i.imgur.com/mTNCh5q.png)

Tiếp theo add host trên web GUI

Configuration -> Host -> Create host

Điền đúng thông tin host 

![Imgur](https://i.imgur.com/MftQCPo.png)

Các thông tin bắt buộc gồm có:

- Hostname: Tên host hiển thị trên Zabbix Web
- Groups: Gán 1 hoặc nhiều nhóm cho host
- Agent interfaces: là địa chỉ IP để monitor của host

Phần template chọn như sau:

![Imgur](https://i.imgur.com/e9uBgRv.png)

Sau đó chọn add

![Imgur](https://i.imgur.com/a218wbH.png)

Đợi 1 phút. Sang Monitoring -> Host để xem host đã lên chưa. Nếu thành công thì kết quả sẽ giống như hình dưới

![Imgur](https://i.imgur.com/1NqtpBd.png)

Nếu cần thiết, có thể khởi động lại dịch vụ zabbix-agent bằng cách bật Task Manager -> Services -> Chuột phải Zabbix Agent -> Restart

![Imgur](https://i.imgur.com/XeIPjr1.png)