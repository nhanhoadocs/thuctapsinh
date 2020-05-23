# Bật plugin inputs.procstat. Đẩy tải bằng siege và xem kết quả

Đầu tiên, sửa file cấu hình telegraf trên agent

    nano /etc/telegraf/telegraf.conf

Sửa mục `[[inputs.procstat]]` thành như sau:

    [[inputs.procstat]]
            exe = "."
            pid_tag = true

Có thể sửa thành trong các trường hợp cần lấy pattern

    [[inputs.procstat]]
    pattern = ".*"

Thêm các biến trong dashboard như sau:

![Imgur](https://i.imgur.com/EADYo9d.png)

Query như sau với %CPU để xem mức sử dụng CPU của các process.

    SELECT last("cpu_usage") FROM "procstat" WHERE ("host" =~ /^$host$/) AND $timeFilter GROUP BY time($__interval), "pid", "process_name", "user" fill(none)

![Imgur](https://i.imgur.com/RXZez5m.png)

![Imgur](https://i.imgur.com/OEk5gxk.png)

![Imgur](https://i.imgur.com/gAE52DO.png)

(Chọn host cụ thể, ở đây là host WP)

hoặc

![Imgur](https://i.imgur.com/Rl7AZu8.png)

(Chọn host theo biến, chọn theo biến thì không thể cấu hình cảnh báo)

Tương tự query như sau với %RAM để xem mức sử dụng RAM của các process. Nếu muốn hiển thị theo đơn vị byte thì chọn field `memory_rss` thay cho `memory_usage`

![Imgur](https://i.imgur.com/fza7nll.png)

Đứng trên 1 máy khác, sử dụng `siege` để đẩy tải trên trang wordpress 10.10.34.174

    siege 10.10.34.174

Hướng dẫn sử dụng `siege`:

https://news.cloud365.vn/huong-dan-cai-dat-va-su-dung-siege-de-load-testing-va-benchmark-http/

Trang wordpress:

![Imgur](https://i.imgur.com/rBnMxxI.png)

Kết quả:

![Imgur](https://i.imgur.com/M8JMwCx.png)

Có thể thấy rất nhiều tiến trình httpd sử dụng CPU, tiến trình mysqld sử dụng CPU nhiều.

Đối với RAM cũng tương tự

![Imgur](https://i.imgur.com/pqWqC8c.png)

CPU đã bị sử dụng hết (từ 2% lên 100%)

![Imgur](https://i.imgur.com/L3qehLh.png)

RAM sử dụng tăng từ 26% lên 33% (không đáng kể)

![Imgur](https://i.imgur.com/uZdzpEE.png)

