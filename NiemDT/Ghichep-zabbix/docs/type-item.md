## Một số loại item

Item là các thông số của hệ thống được giám sát. Các kiểu item sẽ có các cách khác nhau để lấy dữ liệu từ các thiết bị được giám sát.

Dưới đây là một số loại item 

**Zabbix agent**

Với cách này sẽ kết nối đến host đã cài đặt agent để lấy thông tin. Với zabbix agent có 2 kiểu để lấy thông tin từ agent

 * Passive checks: với cách này thì zabbix agent sẽ tự động gửi thông tin về zabbix server sau một khoảng thời gian xác định mà ta đã đặt trước.

 * Active checks: cách này khi cần thông tin thì zabbix server sẽ gửi yêu cầu đến zabbix agent để yêu cầu agent gửi thông tin cần thiết về

**SNMP agent**

SNMP - Simple Network Managerment Protocol

Đây là loại item được sử dụng để monitor các thiết bị mạng như máy in, switch, router. 

SNMP checks hiệu năng thông qua giao thức UDP.

**IPMI checks**

IPMI- Interlligent Platform Management Interface 

Bạn có thể monitor sức khỏe của các thiết bị IPMI trong zabbix. Để thực hiện IPMI checks zabbix server phải được cấu hình ban đầu với sự hỗ trợ của IPMI

Dùng để giám sát trạng thái phần cứng. Quản lý không thông qua HĐH hay cho dù máy có được bật hay không. Nhưng những thiết bị này phải được support từ phần cứng.

**Simple checks**

Simple checks được sử dụng để check các service như TCP, UDP, ICMP.... Simple check sẽ check được cả trên những thiết bị không cài cả agent.

**Log file monitoring**

Được sử dụng để theo dõi file log của thiết bị. Có thể cảnh báo khi file log chứa một chuỗi nhất định.

Để monitor file log thì zabbix agent phải đang chạy trên host và phải cấu hình log monitoring item.

**Internal checks**

Internal checks cho phép ta giám sát các tiến trình ngay tại zabbix server hoặc zabbix proxy.

**External checks**

Thực hiện check tại các host bằng cách chạy các đoạn script trên zabbix server để lấy thông tin

**Trapper items**

Với kiểu item này nó sẽ chấp nhận dữ liệu gửi đến thay vì truy vấn nó. 

Để sử dụng một trapper item ta cần set up item kiểu trapper và dữ liệu được gửi đến từ host.

Để nhận dữ liệu của kiểu item này ta dùng lệnh zabbix_sender từ host.

**SSH checks**

Với kiểu item này sẽ sử dụng check thông qua giao thức SSH. Zabbix server sẽ truy cập vào host thông qua giao thức SSH chạy những đoạn script trên host để lấy các thông số gửi về. 

Với loại item này thì ta không cần cài zabbix-agent trên host mà ta chỉ cần ssh được lên host này.

**Calculated items**

Với kiểu check này cho phép ta sử dụng các item đã có để tính toán ra một thông số cần thiết để tiện cho việc giám sát.

Ở đây sử dụng một số hàm và biểu thức để tính toán các giá trị.