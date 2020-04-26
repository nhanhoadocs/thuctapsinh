# Setup TIG (Telegraf InfluxDB and Grafana) on Ubuntu 20.04 LTS

## Giới thiệu
Trong tất cả các công cụ giám sát hiện đại hiện có thì có lẽ **TIG(Telegraf, InfluxDB and Grafana)** stack là một trong nhưng công cụ được sử dụng phổ biến nhất.

TIG có thể được sử dụng để theo dõi một bảng rộng các nguồn dữ liệu khác nhau: từ các hệ điều hành (thông số về hiệu suất của Linux hay Window), đến database (như MongoDB hay MySQL. Khả năng của nó là vô tận)

## Nguyên tắc hoạt động
- Telegraf là agent chịu trách nhiệm thu tập thập và tổng hợp dữ liệu, như việc sử dụng CPU hiện tại, ....

- InfluxDB là nơi chứa dữ liệu và hiển thị nó cho Grafana. Đây là giải pháp điều khiển hiện đại.

# Thực hiện cài đặt
## I. Cài đặt InfluxDB
