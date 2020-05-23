# Package Management Systems (Hệ Thống quản lí package)

Các phần cốt lõi của các bản phân phối Linux và hầu hết các phần mềm của nó được cài đặt thông qua `Package Management System`. Mỗi gói chứa các tệp và các hướng dẫn khác cần thiết để làm cho một thành phần phần mềm hoạt động trên hệ thống. Các gói có thể phụ thuộc lẫn nhau. Có hai lựa chọn quản lý gói: **dpkg** và **rpm**, hai hệ thống không tương thích, nhưng cung cấp các tính năng giống nhau ở mức độ rộng rãi.

|High Level Tool|Low Level Tool|Family|
|---------------|--------------|------|
|zypper|rpm|SUSE|
|yum|rpm|Red Hat|

Cả hai hệ thống quản lý gói cung cấp hai mức công cụ: 
- Một công cụ cấp thấp (ví dụ như `dpkghay` `rpm`), sẽ chăm sóc của các chi tiết của giải nén gói cá nhân, chạy các kịch bản, nhận được các phần mềm được cài đặt một cách chính xác.
- Một công cụ cấp cao (ví dụ như `apt-get`, `yum`, hoặc `zypper`) hoạt động với các nhóm gói, tải gói từ nhà cung cấp và tìm ra các phụ thuộc

Hầu hết thời gian người dùng chỉ cần làm việc với công cụ cấp cao, công việc này sẽ đảm nhiệm việc gọi công cụ cấp thấp khi cần thiết. Theo dõi phụ thuộc là một tính năng đặc biệt quan trọng của công cụ cấp cao, vì nó xử lý các chi tiết tìm kiếm và cài đặt từng phụ thuộc cho bạn. Tuy nhiên, hãy cẩn thận, vì cài đặt một gói duy nhất có thể dẫn đến hàng chục hoặc thậm chí hàng trăm gói phụ thuộc được cài đặt.

|Operation|RPM|Debian|
|---------|-----------|-----------|
|Cài đặt 1 package|rpm –i foo.rpm|dpkg --install foo.deb|
|Cài đặt 1 package từ repository|yum install foo|apt-get install foo|
|Xóa một package|rpm –e foo.rpm|dpkg --remove foo.deb|
|Xóa một package lấy từ repository|yum remove foo|apt-get remove foo|
|Update một package tới phiên bản mới hơn|rpm –U foo.rpm|dpkg --install foo.deb|
|Update 1 package sử dụng repository và resolving dependencies|yum update foo|apt-get upgrade foo|
|Update toàn bộ hệ thống|yum update|apt-get dist-upgrade|
|Hiển thị tất cả các package đã cài đặt|yum list installed|dpkg --list|
|Nhận thông tin về các package được cài đặt bao gồm các file|rpm –qil foo|dpkg --listfiles foo|
|Hiển thị các package có sẵn với "foo" trong tên|yum list foo|apt-cache search foo|
|Hiển thị tất cả các package có sẵn|yum list|apt-cache dumpavail|
|Hiển thị package có chứa "file"|rpm –qf file|dpkg --search file|