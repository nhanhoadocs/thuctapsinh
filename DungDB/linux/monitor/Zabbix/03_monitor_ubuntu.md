# Giám sát server Ubuntu 18.04 bằng zabbix-agent

Tìm agent để cài đặt và lấy link tùy theo hệ điều hành của máy cần giám sát tại đây: https://repo.zabbix.com/zabbix/5.0/

Thực hiện cài đặt agent trên host cần giám sát

    wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1%2Bbionic_all.deb

    sudo dpkg -i zabbix-release_5.0-1+bionic_all.deb

    sudo apt-get update
    sudo apt-get install zabbix-agent -y

Cấu hình

    vi /etc/zabbix/zabbix_agentd.conf 

Sửa các dòng

    Server=<IP_ZABBIX_SERVER>
    ServerActive=<IP_ZABBIX_SERVER>
    Hostname=<ZABBIX_SERVER_HOSTNAME>

Ví dụ sửa thành

    Server=172.16.4.252
    ServerActive=172.16.4.252
    Hostname=zabbixdbd

Khởi động dịch vụ

    systemctl restart zabbix-agent
    systemctl enable zabbix-agent

Kiểm tra trên Zabbix-Server

    zabbix_get -s <ZABBIX_AGENT_IP> -k agent.version

Kết quả như hình là thành công

![Imgur](https://i.imgur.com/WyE00Sv.png)

Add host trên web GUI. 

Configuration -> Host -> Create host

Điền đúng thông tin host và template

![Imgur](https://i.imgur.com/ckEweDc.png)

![Imgur](https://i.imgur.com/HOSkMWD.png)

Sau đó nhấn Add

Đợi khoảng 1 phút sẽ thấy host đã được thêm thành công

![Imgur](https://i.imgur.com/mP9lM66.png)