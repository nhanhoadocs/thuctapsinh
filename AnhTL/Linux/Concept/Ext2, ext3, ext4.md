# ext2, ext3, ext4

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
- ``Hệ thống tập tin nhật ký`` là một hệ thống tập tin duy trì một tập tin đặc biệt gọi là`` tạp chí`` được sử dụng để sửa chữa bất kỳ sự không nhất quán nào trong hệ thống tập tin xảy ra do việc tắt máy tính đột ngột và do đó luôn duy trì tính nhất quán bên trong. Việc tắt máy như vậy thường là do sự gián đoạn của nguồn điện hoặc do sự cố phần mềm không thể giải quyết được nếu không khởi động lại.
- Sau khi khởi động lại từ việc tắt máy đột ngột. Với một hệ thống tập tin ext2 nó sẽ chạy một kiểm tra tính nhất quán và sửa chữa bất kỳ mâu thuẫn nào trước khi hệ thống tập tin có thể được gắn kết (ví dụ, một cách logic gắn vào hệ thống) và khởi động có thể được hoàn thành. Thời gian chờ có thể rất lâu, có thể là vài giờ trong trường hợp hệ thống tập tin có hàng trăm gigabyte . Ngược lại, Ext3 thường không yêu cầu kiểm tra hệ thống tập tin trong quá trình khởi động lại sau khi tắt máy không đúng vì tính nhất quán bên trong được đảm bảo của nó.
- Ext3 cũng có thể thực hiện công việc bảo vệ tính toàn vẹn dữ liệu tốt hơn đáng kể so với ext2 trong trường hợp tắt hệ thống không đúng cách. 
  - Trên thực tế việc đảm bảo dữ liệu phù hợp với trạng thái của hệ thống tệp rất quan trọng (loại bỏ dữ liệu bị hỏng xuất hiện trong các tệp được viết lại sau khi tắt máy không đúng cách)
- Ngoài ra, ext3 thường nhanh hơn ext2, mặc dù thực tế là nó ghi một số dữ liệu nhiều lần. Điều này là do nhật ký của nó tối ưu hóa chuyển động đầu ổ đĩa cứng (HDD) . 
- Kích thước tệp cá nhân tối đa có thể từ 16 GB đến 2 TB.
- Tổng kích thước hệ thống tệp ext3 có thể từ 2 TB đến 32 TB.
- Thư mục có thể chứa tối đa 32.000 thư mục con.
- Ta có thể chuyển đổi trực tiếp hệ thống tệp ext2 sang hệ thống tệp ext3 (không cần sao lưu / khôi phục).

**Ext4**
- Ext4 là viết tắt của hệ thống tập tin mở rộng thứ tư.
- Nó được giới thiệu vào năm 2008.
- Bắt đầu từ Linux Kernel 2.6.19 ext4 đã có sẵn.
- Hỗ trợ kích thước tệp cá nhân lớn và kích thước hệ thống tệp tổng thể.
- Kích thước tệp cá nhân tối đa có thể từ 16 GB đến 16 TB
- Hỗ trợ volume có dung lượng tối đa lên đến 1 exbibyte (1 EiB = 10­30 TB) và file có kích thước 16 tebibyte (1 TiB = 1024 TB)
- Ta cũng có thể gắn một ext3 fs hiện có dưới dạng ext4 fs (mà không phải nâng cấp nó).
- Cải thiện hiệu suất tập tin lớn và chống phân mảnh.
- Không giới hạn thư mục con.
- Kiểm tra toàn vẹn dữ liệu (checksum).
- Tính toán thời gian chuẩn đến nano giây (1 nano giây = 10-9 giây).
- Trong ext4, ta cũng có tùy chọn chuyển tính năng ghi nhật ký ra khỏi chế độ Tắt.

## Tài liệu tham khảo:
https://www.thegeekstuff.com/2011/05/ext2-ext3-ext4/

https://en.wikipedia.org/wiki/Ext2
