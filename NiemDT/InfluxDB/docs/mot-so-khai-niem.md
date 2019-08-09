# Một số khái niệm trong influxdb

Field value là giá trị của field keys.

Map các giá trị của field key và field value tạo thành field set.

Field là một phần bắt buộc của dữ liệu trong influxdb.

Tags được tạo thành từ tag key và tag value.

Cả tag key và tag value đêu được lưu trữ dạng string và record metadata. 

Mỗi tag key có các tag value. 

Tag set được tạo nên từ mỗi bộ tag key và tag value khác nhau.

Tags là không bắt buộc. Nhưng nên sử dụng nó bởi vì tags có chỉ mục nên các query trên tags 
sẽ nhanh hơn và nó hữu ích để lưu các dữ liệu được lưu trữ thường xuyên. 

Như vậy cả `Field` và `Tag` đêù có thể lưu trữ dữ liệu. Chính vì vậy khi ghi dữ liệu vào trong Influxdb ta nên xác định khi nào dùng `tag` và khi nào dùng `field`. Chúng ta nên sử dụng `tag` trong các trường hợp các `tag values` có thể lặp đi lặp lại.

`Measurement` giống như một container nó bao gồm cả `tags`, `fields` và có cả cột `time`. Có thể hiểu nó gần giống với table trong MySQL.

Một `measurement` có thể thuộc các `retention policies` khác nhau.

`Retention policy` sẽ mô tả thời gian Influxdb sẽ giữ data trong thời gian bao lâu và có 
bao nhiêu bản copy của dữ liệu này được lưu trữ trong cluster.

InfluxDB sẽ tự tạo ra một `retention policy` có tên là `autogen`. Retention policy này 
sẽ giữ dữ liệu không có thời hạn và chỉ có một bản copy cho dữ liệu đó.

Series là tập hợp các dữ liệu được gồm có retention policy, measurement, và tag set.

Point là tất cả thông tin mà chúng ta insert vào. Mỗi lần insert sẽ được tính là một point.