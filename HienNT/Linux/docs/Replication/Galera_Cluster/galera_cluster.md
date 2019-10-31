# Tìm hiểu về MariaDB Galera Cluster 

## Giới thiệu và hoạt động

<p align="center"><img src="../../../images/sql/galera_small.png"></p>

- MariaDB Galera Cluster là một synchronous multi-master cluster - cụm đồng bộ đa chủ cho MariaDB. Nó chỉ có giá trị trên Linux và chỉ hỗ trợ các công cụ lưu trữ [XtraDB/InnoDB](https://mariadb.com/kb/en/library/innodb/) (có hỗ trợ thử nghiệm cho `MyISAM`)

- Sử dụng galera cluster, application có thể read/write trên bất cứ node nào. Một node có thể được thêm vào cluster cũng như gỡ ra khỏi cluster mà không có downtime dịch vụ, cách thức cũng đơn giản.

## Đặc điểm  

- Synchronous replication: Nhân bản đồng bộ
- Active-active multi-master topology: Cấu trúc liên kết đa chủ tích cực  
- Read and write to any cluster node: Đọc và ghi vào nút cluster bất kỳ
- Automatic membership control, failed nodes drop from the cluster: Kiểm soát thành viên tự động, các nốt bị fail sẽ xóa từ cluster  
- Automatic node joining: Tự động nút tham gia
- True parallel replication, on row level: Nhân bản song song được sử dụng trên cấp độ hàng
- Direct client connections, native MariaDB look & feel: Kết nối trực tiếp đến client, giao diện natice MariaDB.  

## Lợi ích  

- Không có độ trễ slave
- Không có transaction bị mất
- Khả năng đọc và ghi lớn hơn
- Độ trễ máy client nhỏ hơn  

## Phiên bản Galera

- Cụm MariaDB Galera được cung cấp bởi:

  - MariaDB Server.
  - Bản vá MySQL-wsrep cho MySQL Server và MariaDB Server được phát triển bởi `Codership`. Bản vá hiện tại chỉ hỗ trợ các hệ điều hành giống Unix.
  - Thư viện cung cấp Galera wsrep.

- Trong MariaDB 10.1 trở lên, bản vá MySQL-wsrep đã được sáp nhập vào MariaDB Server. Điều này có nghĩa là có thể có được chức năng của MariaDB Galera Cluster bằng cách cài đặt các gói MariaDB Server tiêu chuẩn và gói thư viện của nhà cung cấp Galera wsrep. Phiên bản Galera sau tương ứng với từng phiên bản MariaDB Server:

  - Trong MariaDB 10.4 trở lên, MariaDB Galera Cluster sử dụng Galera 4. Điều này có nghĩa là bản vá MySQL-wsrep là phiên bản 26 và thư viện nhà cung cấp Galera wsrep là phiên bản 4.
  - Trong MariaDB 10.3 trở về trước, MariaDB Galera Cluster sử dụng Galera 3. Điều này có nghĩa là bản vá MySQL-wsrep là phiên bản 25 và thư viện nhà cung cấp Galera wsrep là phiên bản 3.

- Xem thông tin về phiên bản Galera [***tại đây***](https://mariadb.com/kb/en/library/what-is-mariadb-galera-cluster/)

## TÀI LIỆU THAM KHẢO
- https://mariadb.com/kb/en/library/what-is-mariadb-galera-cluster/


