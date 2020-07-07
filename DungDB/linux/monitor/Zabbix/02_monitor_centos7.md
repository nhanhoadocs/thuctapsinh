# Giám sát server CentOS 7 bằng zabbix-agent

Hướng dẫn: https://news.cloud365.vn/zabbix-giam-sat-server-centos-7-bang-zabbix-agent/

Tìm agent để cài đặt và lấy link tùy theo hệ điều hành của máy cần giám sát tại đây: https://repo.zabbix.com/zabbix/5.0/

![Imgur](https://i.imgur.com/6PRkQ95.png)

Thực hiện trên client (máy cần được giám sát)

Cài agent

    rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-agent-5.0.1-1.el7.x86_64.rpm

    yum install zabbix-agent -y

Vào file `/etc/zabbix/zabbix_agentd.conf` cấu hình

    vi /etc/zabbix/zabbix_agentd.conf

Sửa các dòng sau:

    Server=<IP_ZABBIX_SERVER>
    ServerActive=<IP_ZABBIX_SERVER>
    Hostname=<ZABBIX_SERVER_HOSTNAME>

Ví dụ sửa thành

    Server=172.16.4.252
    ServerActive=172.16.4.252
    Hostname=zabbixdbd

Cấu hình FW

    firewall-cmd --zone=public --add-port=10050/tcp --permanent
    firewall-cmd --reload

Khởi động dịch vụ

    systemctl enable zabbix-agent
    systemctl restart zabbix-agent

Kiểm tra việc cài đặt. Sang máy zabbix server thực hiện lệnh

    zabbix_get -s <ZABBIX_AGENT_IP> -k agent.version

Kết quả như hình dưới là thành công

![Imgur](https://i.imgur.com/5LxVsL7.png)

Tiếp theo, thêm host:

Configuration -> Host -> Create host

![Imgur](https://i.imgur.com/JLzNRWF.png)

Các thông tin bắt buộc gồm có:

- Hostname: Tên host hiển thị trên Zabbix Web
- Groups: Gán 1 hoặc nhiều nhóm cho host
- Agent interfaces: là địa chỉ IP để monitor của host

![Imgur](https://i.imgur.com/Cpw0Wr2.png)

![Imgur](https://i.imgur.com/9QyNEP4.png)

Sau đó nhấn Add và đợi khoảng 1 phút.

Thành công, host centos 7 đã được thêm vào để giám sát.

![Imgur](https://i.imgur.com/VlKjYq1.png)

Tham khảo: https://news.cloud365.vn/zabbix-giam-sat-server-ubuntu-16-04-bang-zabbix-agent/