# Một số khái niệm trong giám sát và trong checkmk

## Giới thiệu các khái niệm cơ bản về giám sát với checkmk

### States, events, host, services.

State (Trạng thái): là trạng thái của 1 host. Có thể là Up, down, unreache, pending

Event (Sự kiện): là một điều xảy ra độc nhất tại một thời điểm cụ thể. Các sự kiện xảy ra tự phát. Ví dụ như một lỗi phát sinh.

Host: có thể là một server, một thiết bị mạng, một thiết bị có địa chỉ IP, v.v

Service: một dịch vụ có thể là bất cứ thứ gì. Dịch vụ là một phần ảnh hưởng đến việc host có OK hay không. State của dịch vụ thường được xác định chỉ khi host trong điều kiện UP. 

### Group

Group: Các host và sevice có thể được gom vào group thể xem tổng quan. Group không phụ thuộc vào cấu hình và hoàn toàn là tùy chỉnh.

Contact và contact group: phân quyền user đến các host và service. Ví dụ: Ai được quyền xem gì? Ai có quyền cấu hình host nào, service nào?  Ai nhận thông báo về các vấn đề gì?

### Users và roles

3 loại user: 

- Admin: Có tất cả các quyền
- User: Xem những thứ trong phạm vi quyền. Quản lý các host trong thư mục đã được giao cho. Không được phép sửa global settings.
- Guest: Có thể xem được tất cả. Nhưng không được cấu hình và ảnh hưởng đến việc giám sát.

Xem thêm: https://checkmk.com/cms_wato_user.html#files

### Các vấn đề (problem) các sự kiện (event) và thông báo

Tất cả các host và service  không ở trong trạng thái UP được checkmk xem là một vấn đề. Một vấn đề có 2 trạng thái là đã xử lý và chưa xử lý. Nếu vấn đề được một người nào đó acknowledge, nó sẽ được gắn cờ là đã xử lý. 

Khi trạng thái điều kiện của host thay đổi, ví dụ từ OK sang CRIT. Checkmk sẽ đăng ký một event. Một event có thể gửi thông báo hoặc không. Thông báo gửi qua email. Điều này có thể được tùy chỉnh một cách linh hoạt. 

Xem thêm: https://checkmk.com/cms_monitoring_basics.html

### Agent

Agent là một phần mềm nhỏ được cài lên host để Kiểm tra để có thể truy vấn dữ liệu từ host. Các host Windows, Linux hoặc Unix chỉ có thể được giám sát bởi Checkmk nếu bạn cài đặt một trong các CMK agent. 

Các thiết bị như routers, switches, firewalls, printers, appliances, UPSs, hardware sensors... không cho phép cài checkmk agent. Tuy nhiên, chúng đã có sẵn một interface tích hợp để giám sát được cung cấp bởi nhà sản xuất là **SNMP agent**. Agent này có thể được truy cập thông qua giao thức **Simple Network Management Protocol (SNMP)**. Checkmk sử dụng SNMP để giám sát các thiết bị này. Việc đặt rất dễ dàng. 

Các dịch vụ cloud như AWS hoặc Azure cũng có các tính năng tương tự như các agent, nhưng chúng được gọi là APIs và được Checkmk truy vấn thông qua HTTP.

## Các khái niệm trong check_mk

1. Livestatus

- Là một phần quan trọng của check_mk. Nó giúp check_mk truy xuất dữ liệu một cách nhanh nhất.
- Không truy xuất dữ liệu được đọc theo tốc độ I/O của disk bởi vì nó sẽ không lưu trữ thông tin trạng thái ở file.
- Khi truy xuất nó phân biệt chữ hoa và chữ thường. Cú pháp của livestatus dựa trên giao thức HTTP
- Livestatus sẽ sử dụng một socket để lấy dữ liệu từ phía host và service

2. Livecheck

- Trước khi có livecheck thì mỗi khi kiểm tra dịch vụ sẽ chỉ thực hiện trên một core của CPU.
- Sau khi có livecheck thì mỗi khi kiểm tra dịch vụ sẽ không chỉ một CPU làm việc mà được phân tán trên tất cả các core của CPU.

3. Multisite

- Là GUI web được check_mk áp dụng để hiển thị thông tin trạng thái giám sát. Nó dựa trên livestatus nên hoạt động rất nhanh. Một số tính năng:

    - Lượt view xác định của người dùng
    - Hỗ trợ giám sát phân tán qua Livestatus
    - Tùy chỉnh sidebar với nội dung động
    - Tự động hóa và dịch vụ web (API)
    - Dashboard
    - Localization (bản địa hóa)

4. WATO (Web admininstration tools)

Sử dụng để cấu hình check_mk. 

WATO bao gồm nhiều modules. Mỗi modules có một chức năng khác nhau. Một số module phổ biến:
- Main menu : chứa danh sách tất cả các loại modules cùng với một miêu tả ngắn cách dùng
- Monitoring Agents: Tại đây sẽ tìm thấy các agent cho Linux, Windows và các hệ điều hành khác
- Host : Quản lý các host được theo dõi
- Global Settings: Những cài đặt không áp dụng cho host, service và users.
- Host & Service Parameters: danh sách tất cả các cài đặt giám sát về host và service

Khi thay đổi bằng WATO thì giám sát sẽ chưa thực hiện vai trò của mình ngay lập tức. Mà sau khi nhấn nút Activate changes mới thực hiện thay đổi và mới bắt đầu thực hiện giám sát.

5. Event console

- Ngoài việc check trạng thái theo lịch trình thì cũng có một kiểu check trạng thái theo sự việc xảy ra (ví dụ như là việc có một host bị down)
- Đối với event console thì check_mk có một hệ thống tích hợp để theo dõi sự kiện từ các nguồn như là syslog, SNMP traps, log file.
- Những event xảy ra không được xử lý bởi core giám sát mà sẽ được sử dụng bởi dịch vụ riêng

6. Site (hay Instance)

- Trên một server có thể tạo ra nhiều site để có thể phân chia các khu vực giám sát dành cho một hệ thống lớn.
- Muốn có một WATO để có thể quan sát thì ta phải tạo ra một site để có thể sử dụng WATO
- Mỗi user có quyền khác nhau đối với 1 Site giám sát. Quyền cao nhất là user omdadmin có quyền quản lý

7. RRD (Round Robin Database)

- Đây là dạng DB mặc định mà khi check_mk lưu dữ liệu vào.
- Dung lượng của DB này đã được định sẵn từ trước Khi mà nó đầy dữ liệu thì nó sẽ ghi đè lên dữ liệu được ghi đầu tiên
- Có thể tích hợp dung lượng trong một khoảng thời gian nào đó vào làm một.
- Có thể truy vấn được dữ liệu trong RRD bằng live status language.
- Dữ liệu trong Round Robin được lưu thành các bảng và các cột
- Dữ liệu có thể hợp nhất lại thành một để có thể giải quyết được vấn đề là muốn quan sát dữ liệu trong một khoảng thời gian dài như là một năm

RRDTool là một hệ thống ghi và vẽ dữ liệu hiệu năng cao, được thiết kế để xử lý dữ liệu theo chuỗi thời gian như là băng thông, nhiệt độ phòng, CPU load, server load và để giám sát các thiết bị như router, UPS,... Nó cho phép người quản trị ghi và phân tích dữ liệu thu thập được từ tất cả các nguồn dữ liệu. Việc phân tích dữ liệu của RRDTool phụ thuộc vào khả năng tạo ra các đồ thị hiển thị các giá trị thu thập được trong một khoảng thời gian định kỳ. RRDTool được viết bởi ngôn ngữ C và lưu trữ dữ liệu của nó trong file .rrd . Số lượng bản ghi trong một file .rrd đơn không bao giờ tăng vì các bản ghi cũ sẽ thường xuyên được loại bỏ. Các bước trong quá trình hoạt động của RRDTool:

- Thu thập dữ liệu: Dữ liệu được thu thập trong khoảng thời gian cố định sẽ được lưu trong một cơ sở dữ liệu vòng
- Hợp nhất dữ liệu: Việc quản lý dữ liệu của nhiều thiết bị trong một khoảng thời gian lớn sẽ gây khó khăn cho người quản trị. RRDTool cung cấp cho người quản trị một số hàm chức năng: max, min, average của dữ liệu và lưu trữ vòng dữ liệu hợp nhất
- Dữ liệu chưa biết: khi dữ liệu không tồn tại do thiết bị bị hỏng hoặc nguyên nhân khác RRDTool sẽ lưu trữ file rrd với giá trị dữ liệu UNKNOWN
- Vẽ đồ thị: Cho phép người quản trị tạo ra các báo cáo ở dạng đồ thị dựa trên dữ liệu được lưu trữ trong cơ sở dữ liệu

![Imgur](https://i.imgur.com/4hTcTSF.png)

8. Live status language

- Là ngôn ngữ để truy vấn trong RRD.
- Ngôn ngữ truy vấn này được chia ra thành các tables và trong các tables có các columns để lưu trữ các thông tin và dữ liệu của hệ thống check_mk
- Có thể sử dụng ngôn ngữ này để truy vấn dữ liệu. Lưu ý ngôn ngữ truy vấn này phân biệt chữ hoa và chữ thường.
- Có thể sử dụng các headers để lọc thông tin hiển thị từ các truy vấn được sử dụng
Khi muốn truy vấn thống kê thì có các giá trị và các toán tử được định nghĩa sẵn để sử dụng