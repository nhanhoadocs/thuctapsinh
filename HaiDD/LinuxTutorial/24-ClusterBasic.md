# Cluster Basic

Một cluster (Cụm) là hai hay nhiều máy tính làm việc cùng nhau để thực hiện một tác vụ. Ví dụ như là: cung cấp tính sẵn sàng cao của một dịch vụ nhất định. Các cụm khả dụng cao cung cấp các dịch vụ khả dụng cao bằng cách loại bỏ những điểm bị lỗi và lỗi dịch vụ từ một thành viên của cụm đến những trường hợp khác không hoạt động.

Thông thường, các dịch vụ trong cụm khả dụng cao duy trì tính toàn vẹn của dữ liệu như là một thành viên cụm chiếm quyền kiểm soát dịch vụ của 1 thành viên khác. Những lỗi trong các cụm khả dụng cao không thể nhìn thấy từ các máy bên ngoài cụm.

Trong thế giới Linux, có nhiều công cụ cụm để đạt được tính sẵn sàng cao của tài nguyên. Công cụ được sử dụng nhiều nhất là Pacemaker. Một cụm được định cấu hình với Pacemaker bao gồm các trình nền thành phần riêng biệt theo dõi các thành viên của cụm, tập lệnh quản lí dịch vụ và các hệ thống con quản lí tài nguyên theo dõi tài nguyên.

Kiến trúc Pacemaker gồm các thành phần sau:
1. Cluster Infomation Base(Cụm thông tin cơ sở): trình thông tin Pacemaker phân phối và đồng bộ cấu hình cụm và trạng thái thông tin từ điều phối viên được chỉ định (DC) của cụm tới tất cả các thành viên khác của cụm. DC là một thành viên cụm được chỉ định để lưu trữ trạng thái cụm.
2. Cluster Resource Management Daemon(Quản lí tài nguyên cụm): tài nguyên cụm được quản lí bởi thành phần này có thể được truy vấn bởi hệ thống máy khách, di chuyển(moved), khởi tạo(instantiated) và thay đổi khi cần thiết. Mỗi nút cụm bao gồm một trình nền quản lí tài nguyên cục bộ hoạt động như một giao diện giữa trình nền quản lí tài nguyên cụm và chính tài nguyên đó.