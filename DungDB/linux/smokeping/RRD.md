# RRD (Round Robin Database) và RRDtool

RRD (Round Robin Database)

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