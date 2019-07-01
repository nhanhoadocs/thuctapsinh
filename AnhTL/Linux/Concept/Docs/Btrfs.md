# Btrfs (B-tree file system)
Btrfs là một hệ thống file hiện đại được phát triển bởi nhiều bên và từ bây giờ được hỗ trợ trên các NAS Synology. Btrfs được thiết kế để giải quyết những trở ngại thường gặp trong các hệ thống lưu trữ dữ liệu của doanh nghiệp như khả năng chịu lỗi, quản lý và bảo vệ dữ liệu.

- Btrfs được đưa vào sử dụng chính thức năm 2014. Mục tiêu của nó nhằm giải quyết các vấn đề pooling, snapshot, checksum và tích hợp thiết bị mở rộng trong Linux. Không giống như ext4, Btrfs dựa trên công nghệ hoàn toàn mới và cải tiến hơn: Copy-on-write (COW). Công nghệ này đã giúp Btrfs có những tính năng vượt trội sau:
  - Tự kiểm tra và sửa lỗi cấu trúc của file system.
  - Chống phân mảnh dữ liệu.
  - Kiểm tra và khôi phục lỗi của dữ liệu bằng các bản dự phòng.
  - Hỗ trợ cơ chế Cloning (kể cả tập tin).
  - Hỗ trợ subvolume và snapshot (writable hoặc readonly).
  - Hỗ trợ Incremental backup (toàn bộ dữ liệu lẫn thay đổi được backup đều lưu trong 1 task).
- So với ext4, Btrfs hoạt động ổn định, tin cậy và dễ quản lí hơn. Btrfs file system thích hợp cho các server doanh nghiệp, đặc biệt là NAS do hiệu suất cao, tạo snapshot nhanh chóng và nhiều tính năng khác.

#### Lợi ích Btrfs mang lại cho NAS Synology
##### Tính năng sao chép cấu trúc dữ liệu

- Btrfs lưu trữ hai bản sao của siêu dữ liệu trên một ổ đĩa, cho phép khôi phục dữ liệu nếu ổ cứng bị hỏng bởi nhiều lí do.

![](https://synologyvietnam.vn/wp-content/uploads/2018/03/btrfs-1.png)

##### Tính năng tự khôi phục tập tin

- Các hệ thống lưu trữ truyền thống có thể gặp các lỗi phát sinh tiềm ẩn, dẫn đến dữ liệu bị hỏng mà không có một thông báo lỗi hay cảnh báo nào. Để tránh các lỗi như thế này, Btrfs cung cấp các file checksum cho dữ liệu, sau đó tạo ra bản copy của dữ liệu đó và so sánh file checksum trong quá trình đọc. Khi phát hiện ra sự không phù hợp (sự hư hại dữ liệu ngầm), hệ thống Btrfs sẽ tự động so sánh các tệp hỏng với dữ liệu được sao chép lúc đầu, từ đó khôi phục dữ liệu theo cơ chế RAID (1, 5, 6, 10, F1) hoặc SHR đang hỗ trợ trên ổ đĩa.

![](https://synologyvietnam.vn/wp-content/uploads/2018/03/btrfs1-1.png)

##### Bảo vệ dữ liệu

- Btrfs file system giới thiệu một tính năng snapshot cho phép tạo ra một bản copy toàn bộ của một Shared folder tại thời điểm đó. Bằng cách này, nếu xảy ra mất dữ liệu do yếu tố con người, ta có thể khôi phục dữ liệu nhanh chóng từ bản snapshot trước đó. Điều đặc biệt, bản snapshot chỉ tiêu thụ một lượng bộ nhớ cực thấp nhưng lợi ích mang lại rất lớn.

![](https://synologyvietnam.vn/wp-content/uploads/2018/03/btrfs2-1.png)

##### Đảm bảo dữ liệu khi thực hiện backup
- Các phương pháp backup thông thường sẽ hoạt động theo cơ chế copy dữ liệu, do đó cần một khoảng thời gian để làm điều này. Tuy nhiên, nó dễ dẫn đến dữ liệu không được toàn vẹn do trong quá trình backup, dữ liệu có thể đang được chỉnh sửa. Btrfs sẽ giúp giải quyết vấn đề này bằng cách tạo bản snapshot trước khi tiến hành backup, sau đó dùng bản snapshot để copy. Điều này đảm bảo dữ liệu luôn được toàn vẹn dù bị tác động.

![](https://www.khuetu.vn/modules/jscomposer/uploads/additional_benefits_02.gif)

##### Hạn mức (quota) cho các thư mục chia sẻ
- Ta có thể chỉ định hạn mức cho các thư mục chia sẻ độc lập, do đó, không gian lưu trữ của ta sẽ không bị ảnh hưởng bởi những dữ liệu phình lên bởi 1 thư mục chia sẻ nào đó. Tính năng này hữu ích cho việc kiểm soát không gian lưu trữ khi nhiều phòng ban cùng lưu trữ dữ liệu trên một thiết bị NAS. 

![](https://www.khuetu.vn/modules/jscomposer/uploads/additional_benefits_03.png)

##### Nhân bản toàn bộ Share Folder

- Với tính năng của Btrfs, ta có thể dễ dàng chọn một Shared Folder trên NAS để nhân bản toàn bộ nội dung một cách nhanh chóng. Điều này rất cần thiết khi tiến hành thử nghiệm việc update phiên bản hay chỉnh sửa database…

![](https://synologyvietnam.vn/wp-content/uploads/2018/03/btrfs4-1.png)

## Tài liệu tham khảo:
https://www.khuetu.vn/noi-dung/giai-phap-nas/tim-hieu-ve-chuan-file-he-thong-btrfs-tren-nas-synology

https://synologyvietnam.vn/btrfs-dsm-filesystem/
