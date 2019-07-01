# CÁC HỆ THỐNG FILE CỦA LINUX

- Nói một cách đơn giản, một hệ thống tập tin là cách một ổ đĩa cứng có thể lưu trữ, truy cập và quản lý các tập tin.

**Hệ thống file nhật ký**
- Hệ thống file nhật ký tránh việc hỏng hệ thống file bằng cách ghi một nhật ký. Nhật ký là một file riêng ghi lại mọi thay đổi của hệ thống file vào một vùng đệm (thay vì ghi thẳng vào hệ thống file trên ổ cứng). Sau từng khoảng thời gian định trước, những thay đổi đó được thực hiện chính thức vào hệ thống file. Nếu giữa khoảng thời gian đó, hệ thống bị tắt đột ngột, file nhật ký sẽ được dùng để khôi phục lại các thông tin chưa lưu và tránh làm hỏng metadata của hệ thống file.

  - [Metadata của hệ thống gồm các thông tin về cấu trúc dữ liệu trên ổ cứng: ngày giờ tạo, xoá file và thư mục, tăng giảm dung lượng file, chủ nhân của file, …]

- Tóm lại, hệ thống file nhật ký là một hệ thống file tự chữa lỗi bằng cách dùng một file nhật ký lưu lại mọi thay đổi trước khi thay đổi đó được thực hiện vào hệ thống file.

    ![](https://www.gocit.vn/wp-content/uploads/2013/08/file-linux.gif)

**Các kiểu ghi nhật ký.**
- Hệ thống file nhật ký dùng một file nhật ký làm vùng đệm lưu mọi thay đổi của hệ thống file nhưng có nhiều kiểu ghi nhật ký khác nhau. Ba kiểu thường dùng nhất là **writeback**, **ordered** và **data**.

  - Khi dùng kiểu **writeback**, chỉ các metadata được lưu nhật ký còn các block dữ liệu được ghi thẳng vào vị trí của nó trên ổ cứng. Cách này bảo vệ được cấu trúc dữ liệu nhưng bản thân dữ liệu vẫn lỗi (ví dụ: hệ thống bị tắt sau khi metadata đã được ghi nhưng trước khi dữ liệu được ghi vào ổ cứng). 
  - Để tránh điều đó có thể dùng kiểu **ordered**: trước tiên dữ liệu phải được ghi xong vào ổ cứng rồi sau đó metadata mới được lưu vào nhật ký.
  - Kiểu **data** là an toàn nhất: cả metadata và dữ liệu đều được ghi trước vào file nhật ký rồi mới cập nhật vào ổ cứng. Tuy nhiên tốc độ chậm vì dữ liệu phải ghi hai lần (đầu tiên ghi vào nhật ký sau đó ghi vào ổ cứng).

- Kiểu ghi nhật ký cũng còn một số khía cạnh khác nhau nữa. Ví dụ nội dung nhật ký được ghi vào ổ cứng khi file nhật ký gần đầy hay là ghi sau từng khoảng thời gian nhất định?

## Các hệ thống file nhật ký hiện nay.
**Ext2**
- Ext2 là viết tắt của hệ thống tập tin mở rộng thứ hai.
- Nó được giới thiệu vào năm 1993. Được phát triển bởi Rémy Card.
- Điều này đã được phát triển để khắc phục giới hạn của hệ thống tệp ext gốc.
- Ext2 không có tính năng ghi nhật ký.
- Trên các ổ đĩa flash, ổ đĩa USB, ext2 được khuyến nghị, vì nó không cần phải làm quá trình ghi nhật ký.
- Kích thước tệp cá nhân tối đa có thể từ 16 GB đến 2 TB
- Tổng kích thước hệ thống tệp ext2 có thể từ 2 TB đến 32 TB 
- Ext2 là hệ thống tập tin được lựa chọn cho phương tiện lưu trữ dựa trên flash (như thẻ SD và ổ flash USB ) vì việc thiếu nhật ký của nó làm tăng hiệu suất và giảm thiểu số lần ghi và các thiết bị flash có số chu kỳ ghi hạn chế.

**Ext3 (hệ thống tệp mở rộng thứ ba)**
- Ext3 là viết tắt của hệ thống tập tin mở rộng thứ ba.
- Là hệ thống tệp được sử dụng phổ biến nhất trên Linux . Nó cơ bản là một phần mở rộng của ext2 mà một journaling khả năng đã được thêm vào.
- Nó được giới thiệu vào năm 2001. Được phát triển bởi Stephen Tweedie.
- Bắt đầu từ Linux Kernel 2.4.15 ext3 đã có sẵn.
- Lợi ích chính của ext3 là cho phép ghi nhật ký.
- Ext3 là hệ thống file nhật ký phổ biến nhất hiện nay và là cuộc cách mạng từ ext2. Ext3 tương thích với ext2 vì dùng cùng cấu trúc chỉ thêm vào phần nhật ký. Thậm chí có thể mount một partition ext3 như ext2 hoặc convert ext2 sang ext3 (dùng công cụ tune2fs).

- Ext3 có thể dùng cả ba kiểu nhật ký **(writeback, ordered và data)** nhưng mặc định là **ordered**. Chính sách ghi vào ổ cứng có thể cấu hình được, mặc định là khi đầy ¼ nhật ký hoặc timeout của một trong những bộ đếm thời gian.

- Một trong những nhược điểm chính của ext3 là phát triển từ ext2 lên, không phải là hệ thống file nhật ký được thiết kế từ đầu. Do đó nó thiếu một số tính năng tiên tiến mới đây có trong một số hệ thống file nhật ký khác (ví dụ extent-based). Tốc độ cũng chậm hơn các hệ thống file khác như ReiserFS, JFS và XFS nhưng lại tốn ít CPU và bộ nhớ hơn.

**Ext4**
- Ext4 là viết tắt của hệ thống tập tin mở rộng thứ tư.
- Hệ thống file nhật ký mở rộng thứ tư (ext4) là sự phát triển của ext3, tương thích với ext3 (do đó có thể mount một partition ext4 như ext3 và ngược lại) và có thêm nhiều tính năng tiên tiến.

- Thứ nhất, ext4 là hệ thống file 64-bit được thiết kế để hỗ trợ các dung lượng rất lớn (toàn hệ thống tới 1exabyte và một file tới 16 terabyte). Nó cũng có thể dùng cách lưu file theo nhóm block (extents), một extent tới 128 MB vùng ổ cứng liên tục với các block 4KB (nhưng nếu dùng thì sẽ không tương thích với ext3 nữa). Cũng như XFS và Reiser4, ext4fs dùng kỹ thuật ghi trễ dữ liệu lên ổ cứng. Nội dung file nhật ký được tính số kiểm tra (checksum) do đó file nhật ký có độ tin cậy cao. Thay cho các cấu trúc tiêu chuẩn B+ hoặc B*, ext4 dùng một biến thể của cấu trúc B tree gọi là H tree, có số thư mục con lớn hơn (64.000 thư mục trong khi ext3 giới hạn ở 32.000).

- Mặc dù kỹ thuật ghi trễ làm giảm độ phân mảnh nhưng sau một thời gian một hệ thống file lớn vẫn bị phân mảnh. Một công cụ xoá phân mảnh online (e4defrag) được xây dựng để xử lý việc đó. Có thể dùng công cụ này để xoá phân mảnh một file riêng rẽ hoặc cả hệ thống file.

- Một nét khác biệt giữa ext3 và ext4 là độ chia thời gian. Trong ext3, mốc thời gian (timestamp) nhỏ nhất là 1 giây. Ext4 nhìn về tương lai: khi tốc độ xử lý và tốc độ giao diện tăng lên, cần chia thời gian nhỏ hơn. Mốc thời gian tối thiểu của ext4 là 1 nano giây.

- Ngày 11/10/2008, bản vá đánh dấu mã ext4 như mã ổn định được tích hợp vào nhân Linux 2.6.28, kết thúc giai đoạn phát triển và khuyên dùng ext4. Nhân Linux phiên bản 2.6.28 chứa hệ thống file ext4 được chính thức phát hành ngày 25/12/2008.

**ReiserFS**
- ReiserFS là hệ thống file nhật ký được phát triển từ đầu nhằm vào nhật ký. Kiểu ghi nhật ký mặc định là **ordered** và cho phép ``resize online`` để tăng dung lượng partition. ReiserFS cũng hỗ trợ kiểu đặt nhiều file nhỏ trong một block để giảm phân mảnh và tăng tốc độ so với ext3.

- ReiserFS v3 có nhiều tính năng hiện đại như cây thư mục B+. Định dạng cơ bản của hệ thống file dựa trên một cây B+ duy nhất, do đó tìm kiếm nhanh hơn và mở rộng dễ. Chính sách ghi từ nhật ký vào ổ cứng tuỳ theo kích thước nhật ký nhưng dựa trên số block cần ghi.

**Reiser4**
- Sau khi ReiserFS được tích hợp thành công vào nhân Linux và được nhiều bản Linux chấp nhận, Namesys (công ty đứng đằng sau ReiserFS) tiếp tục xây dựng một hệ thống file nhật ký mới Reiser4. Reiser4 được thiết kế từ đầu như một hệ thống file nhật ký mới với nhiều tính năng tiên tiến.

## Tài liệu tham khảo:
https://www.thegeekstuff.com/2011/05/ext2-ext3-ext4/

https://en.wikipedia.org/wiki/Ext2

http://www.linfo.org/ext3fs.html

https://www.gocit.vn/bai-viet/cac-he-thong-file-cua-linux/
