# Tìm hiểu về SSL Certificates

## 1. SSL là gì? 
SSL là viết tắt của từ Secure Sockets Layer, là tiêu chuẩn của công nghệ bảo mật, truyền thông mã hoá giữa máy chủ Web server và trình duyệt (browser). Tiêu chuẩn này hoạt động và đảm bảo rằng các dữ liệu truyền tải giữa máy chủ và trình duyệt của người dùng đều riêng tư và toàn vẹn. SSL hiện tại cũng là tiêu chuẩn bảo mật cho hàng triệu website trên toàn thế giới, nó bảo vệ dữ liệu truyền đi trên môi trường internet được an toàn.

## 2. Tại sao nên sử dụng SSL?
- Bảo mật dữ liệu: dữ liệu được mã hóa và chỉ người nhận đích thực mới có thể giải mã.

- Toàn vẹn dữ liệu: dữ liệu không bị thay đổi bởi tin tặc.

- Chống chối bỏ: đối tượng thực hiện gửi dữ liệu không thể phủ nhận dữ liệu của mình.

## 3. Lợi ích khi sử dụng SSL
- Xác thực website, giao dịch.

- Bảo mật các giao dịch giữa khách hàng và doanh nghiệp, các dịch vụ truy nhập hệ thống.

- Bảo mật webmail và các ứng dụng như Outlook Web Access, Exchange, và Office Communication Server.

- Bảo mật các ứng dụng ảo hó như Citrix Delivery Platform hoặc các ứng dụng điện toán đám mây.

- Bảo mật dịch vụ FTP.

- Bảo mật truy cập control panel.

- Bảo mật các dịch vụ truyền dữ liệu trong mạng nội bộ, file sharing, extranet.

- Bảo mật VPN Access Servers, Citrix Access Gateway …

## 4. CA
Certificate Authority (CA): là tổ chức phát hành các chứng thực các loại chứng thư số cho người dùng, doanh nghiệp, máy chủ (server), mã nguồn, phần mềm. 

Nhà cung cấp chứng thực số đóng vai trò là bên thứ ba (được cả hai bên tin tưởng) để hỗ trợ cho quá trình trao đổi thông tin an toàn.

## 5. Phân loại chứng chỉ SSL
### DV-SSL
Chứng chỉ xác thực tên miền (Domain Validated SSL): DV-SSL dành cho các khách hàng cá nhân với khả năng mã hóa cơ bản với giá rẻ. DV-SSL chỉ yêu cầu xác minh quyền sở hữu tên miền. Thời gian đăng ký và xác minh rất nhanh.

### OV-SSL
Chứng chỉ xác thực tổ chức (Organization Validation SSL): OV SSL dành cho các tổ chức và doanh nghiệp có độ tin cậy cao. Ngoài việc xác minh quyền sở hữu tên miền còn phải xác minh doanh nghiệp đăng ký đang tồn tại và hoạt động bình thường. Tên doanh nghiệp cũng sẽ được hiển thị chi tiết trên chứng chỉ OV được cấp.

### EV-SSL
Chứng chỉ xác thực mở rộng (Exented Validation SSL): EV SSL có độ tin cậy cao nhất chỉ dành cho các tổ chức và doanh nghiệp đang hoạt động. Tuân thủ nghiêm ngặt các quy định của tổ chức CA-Browser Forum trong quá trình xác minh doanh nghiệp. Khi người dùng Internet truy cập vào các website được trang bị chứng chỉ số EV, thanh địa chỉ của trình duyệt sẽ chuyển sang màu xanh lá cây, đồng thời hiển thị tên doanh nghiệp sở hữu website đó. Điều này gia tăng độ tin cậy của website đó đối với người dùng.

### Wildcard SSL
Wildcard SSL dành cho các website có nhu cầu sử dụng SSL cho nhiều subdomain khác nhau. Wildcard SSL khác với các loại SSL bình thường là có thể chạy cho không giới hạn tên miền phụ với một chứng chỉ ssl duy nhất.

### UC/SAN SSL
Chứng chỉ UC/SAN SSL được thiết kế cho các ứng dụng Communication của Microsoft như Microsoft Exchange Server,Microsoft Office Communications,Lync và cũng là giải pháp tiết kiệm cho các môi trường khác như Share Hosting & QA Testing.