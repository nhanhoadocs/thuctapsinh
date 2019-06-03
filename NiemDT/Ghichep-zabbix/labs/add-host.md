## Hướng dẫn thêm 1 host để giám sát với zabbix server

**Add host**

Để giám sát 1 host trong hệ thống zabbix ta cần thêm nó vào zabbix server. Để thêm 1 host vào giao diện trên web

Click `Configuration` -> `Hosts` -> `Create host`

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/1.png)

Trong đó: 
 * Host name: đặt tên cho host để dễ dàng phân biệt giữa các host
 * Groups: chỉ ra ít nhất một group mà host này thuộc vào
 * Agent interfaces: nếu bạn dùng kiểu item là zabbix agent. Bạn chỉ ra địa chỉ IP hoặc domain name. 

**Chọn template**

Click `Templates` để thêm 1 templates cho host

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/2.png)

Bạn có thể tạo một templates của riêng mình hoặc sử dụng một templates có sẵn. Khi gắn cho host 1 template thì bạn có thể thấy 

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/3.png)

**Gắn thêm item**

Khi gắn template phù hợp cho host thông thường nó sẽ bao gồm đầy đủ các item để theo dõi các host một cách hợp lý nhất. Nhưng nếu bạn muốn có thêm một thông số nào đó của host mà trong trong template này không có bạn có thể tự tạo ra một item trong host này. Để tạo item bạn click vào item trên host mà bạn muốn tạo.

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/5.png)

Click `Create item`

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/6.png)

Bạn cần thêm các thống số vào đây

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/8.png)

Trong đó:

 * Name: Đặt tên cho item
 * Type: chọn kiểu item 
 * Key: Sử dụng key để lấy dữ liệu
 * Host interface: Địa chỉ host
 * Type of information: Kiểu dữ liệu item gửi về
 * Units: Đơn vị của item này (vd: MB, s, %. Mbps,...)
 * Update interval: khoảng thời gian giá trị mới của item được update
 * Custom interval: Chỉ ra khoảng thời gian có những tùy chỉnh khác trong việc update giá trị của item
 * History storage period: Thời gian lưu trữ giá trị của các item trong DB
 * Trend storage period: Thời gian lưu trữ trend trong DB
 * Application: Chỉ ra application cho item này
 * Description: Thêm thông tin mô tả về item

Để chọn `key` bạn click vào `Select` chọn kiểu item và chọn một key tương ứng bên dưới

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/16.png)

Sửa mode chp phù hợp sau đó điền các thông tin và click `add` để hoàn thành viêc thêm item.

Sau khi add thêm ta có thể thấy item này

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/9.png)

Để quan sát thông số của host ứng với item này bạn vào `Monitoring` -> `Latest data` bạn lọc ra host mà bạn vủa tạo item bạn có thể thấy dữ kiệu gửi về

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/10.png)

**Add trigger**

Để phát hiện kịp thời những điều bất thường trên hệ thống bạn cần cấu hình các trigger để nó kịp thời cảnh báo khi các thông số trên hệ thống của bạn vượt quá ngưỡng đặt cảnh báo. Thông thường khi gắn một template cho host thì các trigger đã được đặt. Nếu bạn muốn thêm một trigger mới bạn có thể làm như sau

Click vào `trigger` trên host mà bạn muốn tạo

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/11.png)

Click vào `Create trigger` 

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/12.png)

Trong đó: 
 * Name: Tên hiển thị của trigger
 * Severity: Mức độ thể hiện của trigger 
 * Expression: Được sử dụng để định nghĩa một vấn đề xảy ra. Một problem xảy ra khi điều kiện trong biểu thức được đáp ứng (giá trị TRUE). Và ngược lại vấn đề sẽ được giải quyết khi giá trị là FALSE.
 * OK event generation
    * Expression: Trạng thái event OK được tạo ra dựa trên cùng biểu thức với các sự kiện
    * Recovery expression: Trạng thái event OK được tạo ra nếu biểu thức problem trả về giá trị FALSE còn biểu thức recovery expression trả về giá trị là TRUE.
    * None: trong trường hợp này trigger sẽ không return lại trạng thái OK.
 * Recovery expression: Nếu chọn recovery expression bên trên bạn cần điền biểu thức và đây. Nếu biểu thức ở đây trả về giá trị là TRUE thì máy sẽ trả về trạng thái resolved.
 * PROBLEM event generation mode
   * Single: Một event duy nhất được tạo ra khi trigger ở trạng thái `Problems` lần đầu 
   * Multiple: một events được tạo ra dựa trên mỗi trạng thái `Problem` của trigger.
 * OK event closes: chọn những problem sẽ được đóng lại nếu chúng trở lại trạng thái resolved.
   * All problems: tất cả problems của trigger này
   * All problems if tag values match: chỉ những trigger problem được match với giá trị event tag.
 * Tags: đặt tags để đánh dấu sự kích hoạt của trigger events.
 * Allow manual close: Kiểm tra và cho phép đóng các problem events được tạo ra từ trigger này một cách thủ công. Manual closing cũng có thể được sử dụng khi một vấn đề đã được xác định.
 * URL: Nếu điền gía trị này thì URL ở đây sẽ là một đường link.
 * Description: phần mô tả trigger
 * Enable: cho phép trigger hoạt động.

Cách tạo `Expression`

Ckick `Add`

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/12.png)

Trong đó: 
 * Items: Chọn một item phù hợp để lấy giá trị cho việc tính toán.
 * Function: chọn một hàm để tính toán các giá trị
 * Result: giá trị dùng so sánh để đưa ra cảnh báo

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/13.png)

Cảnh báo của trigger vừa tạo

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/new-host/14.png)

