# Thiết lập theo dõi các process sử dụng RAM và CPU

## I. Trên máy cần theo dõi
### 1. Cài Agent Telegraf
Xem tại đây: [Hướng dẫn cài Agent](..\Install\3-installTelegrafAgent.md)
### 2. Cấu hình Telegraf
- Mở file `/etc/telegraf/telegraf.conf`
    ```
    vi /etc/telegraf/telegraf.conf
    ```

**Cấu hình Agent**
- Cấu hình mục `[[outputs.influxdb]]` : url của InfluxDB, database name, username, password
    ```conf
    urls = ["http://10.10.34.164:8086"]
    database = "telegraf"

    ## HTTP Basic Auth
    username = "telegraf"
    password = "telegraf"
    ```

**Ta sẽ tiến hành bật plugin `procstat`:**
- Tìm đến dòng `[[inputs.procstat]]`. Uncommetn và cấu hình như sau:
    ```conf
    [[inputs.procstat]]
        exe = "."
        pid_tag = true
    ```

- Lưu lại file và restart service
    ```
    systemctl restart telegraf
    ```

## II. Tạo dashboard theo dõi
- Truy cập trang giao diện Grafana, tạo một dashboard.

### 1. Thiết lập thông tin và đặt một số biến
- Sau khi tạo Dashboard, ta chọn Dashboard settings

    <img src="https://i.imgur.com/sRd3W90.png">

- Tại phần **General**, ta đặt tên cho Dashboard. Tại đây, ta đặt là `ProcstatDemo`

    <img src="https://i.imgur.com/eDz4Ing.png">

- Tại phần **Variables**, tạo tiến hành tạo một vài biến

    <img src="https://i.imgur.com/sBdShff.png">

    Danh sách các biến đặt trong bài viết này:

    <img src="https://i.imgur.com/KTJkNTo.png">

    Setting của từng biến :
    - Biến `host`

        <img src="https://i.imgur.com/8omVmZo.png">

    - Biến `database`

        <img src="https://i.imgur.com/8omVmZo.png">

    - Biến `process`

        <img src="https://i.imgur.com/mZk0goD.png">

    - Biến `user`

        <img src="https://i.imgur.com/4ArI0Hy.png">

    - Biến `interval`

        <img src="https://i.imgur.com/G05l3yF.png">

- Sau khi thêm các biến xong. Chọn **Save Dashboard**

    <img src="https://i.imgur.com/hTFTZIi.png">

### 2. Tạo Panel
- Tạo một Panel với dạng biểu đồ **Graph**

    <img src="https://i.imgur.com/to5uBNR.png">

- Chọn các giá trị cho tag phù hợp để khi ta thiết lập có thể nhìn một cách trực quan.

    <img src="https://i.imgur.com/nei7Dy8.png">

- Query để lấy dữ liệu từ InfluxDB như sau: Ở đây, ta sẽ thấy phần trăm sử dụng CPU của các tiến trình

    <img src="https://i.imgur.com/bJKwNtN.png">

    *Query Influx:* 
    ```sql
    SELECT "cpu_usage" FROM "procstat" WHERE ("host" =~ /^$host$/ AND "process_name" =~ /^$process$/ AND "user" =~ /^$user$/) AND $timeFilter GROUP BY *
    ```

    Nội dung *ALIAS BY:* 
    ```
    Process Name: $tag_process_name  ---  PID $tag_pid --- User: $tag_user
    ```

- Tùy chỉnh biểu đồ:
    - Chuyển sang tab **Visualization**. Thiết lập các thông số cho biểu đồ hiển thị rõ ràng hơn

        <img src="https://i.imgur.com/O4PZFMj.png">

    - Dữ liệu dạng phần trăm nên chọn Unit là `percent(0-100)`

        <img src="https://i.imgur.com/tQcictF.png">

    - Điểu chỉnh bảng thông tin chi tiết

        <img src="https://i.imgur.com/qg2mKHt.png">
    
    - Chuyển tab **General** để đặt tên cho biểu đồ

        <img src="https://i.imgur.com/OmD7chE.png">

- Sau khi tùy chỉnh xong, ta chọn lưu **Dashboard**

    <img src="https://i.imgur.com/ubU0G7W.png">

    Lưu thành công sẽ có thông báo như hình dưới:

    <img src="https://i.imgur.com/wgysliN.png">

## 3. Kết quả
Sau khi hoàn thành các bước trên, ta sẽ có Dashboard như sau:

<img src="https://i.imgur.com/MnYaeDp.png">

Tương tự với RAM và các thông số khác bạn muốn hiển thị.

<img src="https://i.imgur.com/sxI5j1T.png">

Ta hoàn toàn có thể xem từng process riêng biệt và theo user với các biến ta đã đặt lúc đầu. Ví dụ: ta xem `process`

<img src="https://i.imgur.com/BpSlF2O.png">

Biểu đồ sẽ chỉ hiển thị các process của `httpd`. Tương tự, ta có thể tùy chỉnh theo các biến đã đặt để thuận tiện cho việc theo dõi.