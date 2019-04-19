## Giới thiệu chung

Zabbix được tạo ra bởi Alexei Vladishev và đang được phát triển bởi zabbix SIA. Đây là giải pháp giám sát mã nguồn mở. Có khả năng giám sát hệ các thông số trong hệ thống mạng. Nó có thể cài đặt để gửi các thông báo qua nhiều kênh để đến với người quản trị nhằm khắc phục nhanh nhất các sự cố. 

Zabbix cũng support web-based để ta có thể theo dõi trạng thái của các thiết bị. Điều này tạo điều kiện dễ dàng cho việc giám sát khi bạn ở bất kỳ đâu.

Kiến trúc của Zabbix gồm các thành phần chính sau:

**Server**

Nơi xử lý tất cả các thông tin mà các thiết bị gửi về.

**Database storage**

Tất cả các thông tin từ các thiết bị được thu thập sẽ được lưu trữ trong một database.

**Web interface**

Web interface giúp ta có thể truy cập để theo dõi các thiết bị ở bất kỳ đâu. Nó là một phần của zabbix server.

**Proxy**

Zabbix proxy có nhiệm vụ thu thập và phân tích dữ liệu thay cho zabbix server. Đây là một tùy chọn nên bạn có thể cài nó hoặc không nhưng nó sẽ rất hữu ích với hột hệ thống lớn. Nó sẽ giúp giảm tải cho zabbix server.

**Agent**

Zabbix agent được cài đặt trên các thiết bị mà ta cần giám sát. Nó sẽ có nhiệm vụ thu thập thông tin và gửi nó về zabbix server.

## Một số thuật ngữ

Dưới đây là một số thuật ngữ mà ta hay gặp khi làm việc với zabbix.

**host**

là một thiết bị mạng mà ta muốn giám sát sử dụng địa chỉ IP/DNS

**host group**

là một nhóm các host, nó có thể bao gồm các host và các template. Host group được sử dụng khi ta gán quyên truy cập host cho các nhóm người dùng khác nhau.

**item**

các thông số mà bạn muốn thu thập từ các host để giám sát

**value preprocessing**

các dữ liệu được các host gửi về zabbix server sẽ được xử lý trước khi lưu và database

**trigger**

là ngưỡng mà ta đặt ra để xuất hiện cảnh báo. VD như ta đặt một trigger là số RAM free < 200M sẽ xuất hiện cảnh báo.

**event**

là sự thay đổi của một cái gì đó đáng chú ý ví dụ như trạng thái của trigger có sự thay đổi.

**event tag**

**event corelation**

**problem**

một trạng thái của trigger

**problem update**

các tùy chọn quản lý sự cố do zabbix cung cấp như thêm comment,...

**action**

một phương tiện xác định trước để phản ứng với một event. 

VD như một hành động gửi thông báo và các điều kiện của nó khi một event xảy ra.

**escalation**

một kịch bản các hoạt động bên trong một hành động.

**media**

cách thức gửi thông báo vd như qua mail hoặc telegram

**notification**

một thông báo về một số event gửi tới người quản trị thông qua các kênh thông báo

**remote command**

các lệnh được xác định trước và được thực hiện trên các host mà ta giám sát

**template**

những items, trigger, graphs, screens, application,... được tạo trong 1 template là có thể áp dụng nó với các host khác mà ko cần tạo lại

**application**

một nhóm các items trong một logical group

**web scenario**

một hoặc một số requests HTTP dùng để check hoạt động của môt web site

**frontend**

giao diện web được cung cấp bởi zabbix

**dashboard**

một mục trên giao diện web hiển thị tóm tắt và trực quan một số thông tin quan trọng

**zabbix API**

**Zabbix server**

một quy trình trung tâm của phần mềm zabbix, tương tác với zabbix proxy và zabbix agent, tính toán các trigger và gửi đi thông báo. Là nơi xử ly trung tâm

**Zabbix agent**

là một process được cài đặt trên host có nhiệm vụ thu thập dữ liệu.

**Zabbix proxy**

một process thay mặt cho zabbix server thu thập dữ liệu và xử lý nó. Nó giúp giảm tải cho zabbix server

**netwwork discovery**

**item prototype**

**trigger prototype**

