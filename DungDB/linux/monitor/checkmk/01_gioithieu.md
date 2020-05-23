# Tìm hiểu về check_mk

## Checklist

https://github.com/meditechopen/meditech-ghichep-omd#1

https://github.com/duckmak14/thuctapsinh/tree/master/DucNA/check_mk/docs

## Tài liệu

https://checkmk.com/cms.html

https://check-mk-documentation.readthedocs.io/en/latest/index.html



## Lịch sử

Năm 2008 check_mk được ra mắt như là một plugins hỗ trợ và bổ sung thêm cho lõi nagios. Để có thể giúp cho giải pháp nagios hoàn thiện hơn các nhược điểm mà nagios còn mắc phải

Năm 2010 dự án OMD (Open Monitoring Distribution - Giám sát phân phối mở) được khởi động bởi Mathias Kettner. Đã kết hợp nhiều sản phẩm để có thể tạo ra sự linh hoạt trong giám sát hơn. Lúc đó có 2 phiên bản distro của OMD là OMD-LABS và CHECK_MK RAW ( OMD thường). OMD sử dụng nhân là nagios kết hợp thêm nhiều sản phẩm mã nguồn mở để tạo ra một sản phẩm tối ưu cho nhu cầu giám sát, cảnh báo và hiển thị

Năm 2015 phiên bản đơn giản của OMD đã được ra mắt gọi là CHECK_MK vào lúc đó có 2 phiên bản của là: CHECK_MK RAW EDITION(CRE) và CHECK_MK ENTERPRISE EDITION(CEE). Hiện nay có thêm một phiên bản mới phiên bản này dựa trên phiên bản CEE được gọi là Checkmk Managed Services Edition.

## Phân biệt OMD-LABS và OMD(check_mk)

- OMD là một phiên bản nhỏ của OMD-LABS nó tập chung chủ yếu vào việc phát triển check_mk.
- OMD-LABS là phiên bản nâng cấp của OMD nên nó có thêm một số sản phẩm mã nguồn mở khác được tích hợp ví dụ như : Naemon; Icinga2; Grafana/Influxdb …
- Trang web mặc định của OMD-LABS là Thruk
- Từ phiên bản OMD-LABS 3.0 trở đi đã remove một số phần mềm là: Nagios3; Icinga 2, Check_mk, Nagvis

## Checkmk là gì?

Là một giải pháp giám sát dựa trên mã nguồn mở. Có lõi là nagios core. 

Check_mk được tạo ra với mục đích giải bài toán hiệu năng cho nagios. Giúp cho việc mở rộng hệ thống giám sát dễ dàng hơn.

Với tính năng được tích hợp với nhiều sản phẩm thì check_mk được cấu hình đơn giản hơn nhiều so với lõi nagios trước kia. Check_mk bổ sung thêm một số chức năng:

- Thời gian check tiêu chuẩn được giảm từ 5 phút xuống 1 phút
- Có thể cấu hình bằng giao diện WEB
- Có chức năng giám sát phân tán
- Có bảng điều khiển
- Có bảng thống kê số liệu
- Có biểu đồ hiển thị
- v.v…

## Các phiên bản và tính năng

Đến thời điểm hiện tại thì nagios có 3 phiên bản chính và có sẵn

- Check_MK Raw Edition (CRE)
- Check_MK Enterprise Edition, gồm:
    - Checkmk Enterprise - Free Edition (CFE)
    - Checkmk Enterprise - Standard Edition (CEE)
    - Checkmk Enterprise - Managed Services Edition (CME)


![Imgur](https://i.imgur.com/xVDEiCl.png)

[So sánh cụ thể các tính năng của các phiên bản](https://checkmk.com/editions.html)


Phiên bản Check_MK Raw Edition (CRE) là phiên bản mã nguồn mở và hoàn toàn miễn phí, có nhân giám sát là Nagios. Phiên bản Checkmk Enterprise - Free Edition giới hạn chỉ giám sát 2 site, 10 host mỗi site. 2 phiên bản còn lại chúng ta sẽ phải trả tiền nếu muốn sử dụng nó, nhân giám sát là Checkmk Microcore.

Chúng ta sẽ đi tìm hiểu và làm việc với phiên bản miễn phí là CRE. Và phiên bản stable hiện tại là phiên bản 1.6 phát hành ngày 24/09/2019. Chu kỳ phát triển của check_mk là 6 tháng sẽ có một bản stable.

## Tính năng

Giám sát toàn diện :
- Máy chủ, thiết bị mạng, tường lửa, SAN…
- Các nền tảng ảo hóa : VMWare, HyperV, OpenStack, XEN.
- Ứng dụng : Web, Database, Mail…

Giao diện trực quan :
- Overview host và service, event và cảnh báo trên 1 dashboard.
- Cung cấp network topology tự động.

Giám sát phân tán Multi-site :
- Tạo site giám sát theo vùng địa lý
- Quản lý tập trung các site trên Web

Mutitenancy :
- Tạo nhiều tenant độc lập trên một hạ tầng
- Quản lý tenant theo multi-user

**Chú ý**: Multitenacy cho phép nhiều người dùng trong cùng 1 hạ tầng. Mỗi người dùng sẽ hoạt động cô lập (isolate) với các người dùng khác. Tức là không ảnh hưởng tới người dùng khác. Mỗi người dùng có 1 DB riêng. Cloud đi theo 2 khái niệm này (Multitenacy và isolate).

GUI cấu hình giám sát client
- Giao diện web WATO : khai báo và cấu hình cho host giám sát
- Quản trị và điều khiển việc giám sát trên Web. Không phải vào file để cấu hình.

Cảnh báo linh hoạt :
- Gửi cảnh báo bằng nhiều hình thức : SMS, Email, Slack
- Cảnh báo phân cấp theo mức độ người dùng.

## Kiến trúc tổng quan

![Imgur](https://i.imgur.com/3LKRMri.png)

OMD được xây dựng từ những đóng góp của cộng đồng về những khó khăn hay khuyết điểm mà Nagios gặp phải, từ đó đưa ra quyết định cần tích hợp thêm những sản phẩm gì để cải thiện.

Checkmk ra đời để giải quyết bài toán về hiệu năng mà Nagios gặp phải trong quá khứ . Cơ chế mới của Checkmk cho phép việc mở rộng hệ thống trở nên dễ dàng hơn, có thể giám sát nhiều hệ thống chỉ từ một máy chủ Nagios server.

Có 2 mô đun mà Checkmk sử dụng để cải thiện đáng kể hiệu năng là **Livestatus** và **Livecheck**:

Livestatus có những thay đổi để cải thiện hiệu năng đó là:

- Livestatus cũng sử dụng Nagios Event Broker API như NDO, nhưng nó sẽ không chủ động ghi dữ liệu ra. Thay vào đó, nó sẽ mở ra một socket để dữ liệu có thể được lấy ra theo yêu cầu.
- Livestatus tiêu tốn ít CPU.
- Livestatus không làm cho Disk I/O thay đổi khi truy vấn trạng thái dữ liệu.
- Không cần cấu hình. Không cần cơ sở dữ liệu. Không cần quản lý.

Livecheck hoạt động như thế nào để cải thiện được hiệu năng:

- Livecheck sử dụng các helper process, các core giao tiếp với helper thông qua Unix socket (điều này không xảy ra trên file system).
- Chỉ có một một helper program được fork thay vì toàn bộ Nagios Core.
- Các tiến trình fork được phân tán trên tất cả các CPU thay vì chỉ một như trước.
- Process VM size tổng chỉ khoảng 100KB

## Các phương thức được checkmk sử dụng

![Imgur](https://i.imgur.com/Erafg5u.png)