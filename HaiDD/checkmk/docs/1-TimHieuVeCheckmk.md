# Tìm hiểu về checkmk

Các sự cố gián đoạn hệ thống mạng, máy chủ không hoạt động, các dịch vụ và ứng dụng gặp vấn đề… đều gây ảnh hưởng nghiêm trọng đến hoạt động doanh nghiệp. Tổn thất có thể lên đến hàng ngàn, thậm chí hàng triệu USD tùy theo doanh thu và lĩnh vực hoạt động. Để giảm thiểu thiệt hại đến mức tối thiểu hoặc ngăn chặn những sự cố đáng tiếc xả ra thì sẽ cần sự giúp đỡ rất nhiều từ các hệ thống giám sát

Bộ giải pháp OMD - Checkmk một giải pháp giám sát mã nguồn mở có khả năng giám sát, cảnh báo và hiển thị các biểu đồ khá tốt đối với những hệ thống tầm trung không sẵn sàng chi nhiều kinh phí cho việc giám sát hệ thống, mạng.

- OMD - Open Monitoring Distribution là một dự án được phát triển từ năm 2010 bới Mathias Kettner. OMD sử dụng nhân là Nagios Core, kết hợp với các phần mềm mã nguồn mở khác để đóng gói thành một sản phẩm phục vụ cho nhu cầu giám sát, cảnh báo và hiển thị.

## 1. Checkmk là gì?
- Checkmk là phần mềm giám sát được phát triển bằng Python và C++. Nó được sử dụng để giám sát các máy chủ, ứng dụng, mạng, hạ tầng cloud, containers, storage, databases và cảm biến môi trường.

- Dự án Checkmk được phát triển từ năm 2008 như là một plugin của Nagios Core.

- Năm 2010 dự án OMD (Open Monitoring Distribution) được khởi động bởi Mathias Kettner, là sự kết hợp của Nagios, Checkmk, NagVis, PNP4Nagios, DocuWiki, …tạo nên sự linh hoạt trong giám sát

- Checkmk đang có sẵn 3 phiên bản là :
    - **Checkmk Raw Edition – CRE** : Phiên bản nguồn mở
    - **Checkmk Enterprise Edition – CEE** : Phiên bản thương mại cho doanh nghiệp
    - **Checkmk Managed Services Edition – CME** : Phiên bản thương mại cho các nhà cung cấp quản lí dịch vụ

## 2. Ưu điểm trong thiết kế kiến trúc của OMD
OMD được xây dựng từ những đóng góp của cộng đồng về những khó khăn hay khuyết điểm mà Nagios gặp phải, từ đó đưa ra quyết định cần tích hợp thêm những sản phẩm gì để cải thiện.

Việc cài đặt trở nên vô cùng đơng giản. OMD được đóng gói hoàn chỉnh trong một package, việc cài đặt và cấu hình chỉ mất khoảng 10 phút với chỉ một câu lệnh

<img src="https://i.imgur.com/uzCKqqD.png">

Checkmk ra đời để giải quyết bài toán về hiệu năng mà Nagios gặp phải trong quá khứ. Cơ chế mới của Checkmk cho phép việc mở rộng hệ thống trở nên dễ dàng hơn, có thể giám sát nhiều hệ thống chỉ từ một máy chủ Nagios server.

Có 2 mô đun mà Checkmk sử dụng để cải thiện đáng kể hiệu năng là Livestatus và Livecheck.
- **Livestatus** có những thay đổi để cải thiện hiệu năng đó là:
    - Livestatus cũng sử dụng Nagios Event Broker API như NDO, nhưng nó sẽ không chủ động ghi dữ liệu ra. Thay vào đó, nó sẽ mở ra một socket để dữ liệu có thể được lấy ra theo yêu cầu.
    - Livestatus tiêu tốn ít CPU.
    - Livestatus không làm cho Disk I/O thay đổi khi truy vấn trạng thái dữ liệu.
    - Không cần cấu hình. Không cần cơ sở dữ liệu. Không cần quản lý.

- **Livecheck** hoạt động như thế nào để cải thiện được hiệu năng :
    - Livecheck sử dụng các helper process, các core giao tiếp với helper thông qua Unix socket (điều này không xảy ra trên file system).
    - Chỉ có một một helper program được fork thay vì toàn bộ Nagios Core.
    - Các tiến trình fork được phân tán trên tất cả các CPU thay vì chỉ một như trước.
    - Process VM size tổng chỉ khoảng 100KB.