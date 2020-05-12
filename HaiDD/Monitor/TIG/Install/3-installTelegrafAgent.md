# Install Telegraf Agent

Telegraf là 1 Agent viết bằng Go dùng để thu thập số liệu hệ thống cũng như dịch vụ trên hệ thống mà nó chạy.

Các số liệu được thu thập và xuất ra InfluxDB hoặc các kho dữ liệu được hỗ trợ khác. 

Từ InfluxDB, ta có thể hiển thị các thông số lên Grafana.

## Luồng hoạt động của Telegraf
1. Telegraf agent có thể cài đặt lên tất cả các máy chủ (Ubuntu, CentOS, Window, ...). Cài đặt Telegraf lên máy chủ bạn muốn thu thập số liệu hệ thống

2. Số liệu thu thập được đẩy lên InfluxDB

3. Dữ liệu từ InfluxDB sẽ được thêm vào Grafana

4. Đồ thị Grafana được tạo và hiển thị

# 1. Install Telegraf on Ubuntu
1. Cài đặt Telegraf

    Xem câu lệnh cài đặt tại:
    
    https://portal.influxdata.com/downloads/

2. Khởi động dịch vụ và cấu hình khởi động cùng hệ thống :
    ```
    systemctl start telegraf
    systemctl enable telegraf
    ```

3. Kiểm tra trạng thái dịch vụ
    ```
    systemctl status telegraf
    ```

    <img src="https://i.imgur.com/nn4XFXn.png">

Tuy nhiên, ngay cả khi **Telegraf** đang chạy thì nó cũng không đảm bảo rằng nó gửi dữ liệu chính xác tới **InfluxDB**.

- Để xác minh điều đó, ta sử dụng lệnh
    ```
    journalctl -f -u telegraf.service
    ```

    <img src="https://i.imgur.com/ME3cIEp.png">

## 