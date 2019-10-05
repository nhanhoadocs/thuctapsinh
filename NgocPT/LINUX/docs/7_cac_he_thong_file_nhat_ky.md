# Các hệ thống file nhật ký 
# Mục lục
1.[XFS](#a)  
2.[EXT3 (Third extended file system – ext3fs)](#b)  
3.[EXT4 (Fourth extended file system – ext4fs)](#c)  

<a name="a">

## 1. XFS</a>
- XFS là một hệ thống tệp nhật ký tệp hiệu suất cao, có khả năng mở rộng cao. XFS dùng kiều ghi nhật ký writeback.  
- XFS hỗ trợ ghi nhật ký siêu dữ liệu,XFS sử dụng kỹ thuật ghi trễ (Allocate-on-flush) khi các block trên ổ cứng được bố trí để chuẩn bị ghi dữ liệu, dung lượng ổ tương ứng được trừ đi khỏi bộ đếm dung lượng còn trống nhưng chưa thực sự được đánh dấu đã dùng. Dữ liệu vẫn nằm chờ trong bộ nhớ cho đến khi nó được ghi vào ổ cứng vì các nguyên nhân khác nhau.
- Ưu điểm là đảm bảo tính nhất quán của hệ thống tệp và phục hồi nhanh trong trường hợp mất điện hoặc sự cố hệ thống.

<b name="b">

## 2.EXT3(Third extended file system – ext3fs)</b>
- Ext3 có thể dùng cả ba kiểu nhật ký (writeback, ordered và data) nhưng mặc định là ordered.
-Nhược điểm chính của ext3 là phát triển từ ext2 lên, không phải là hệ thống file nhật ký được thiết kế từ đầu. Do đó nó thiếu một số tính năng tiên tiến mới đây có trong một số hệ thống file nhật ký khác (ví dụ extent-based). Tốc độ cũng chậm hơn các hệ thống file khác như ReiserFS, JFS và XFS nhưng lại tốn ít CPU và bộ nhớ hơn.

<c name="c">

## 3. EXT4 (Fourth extended file system – ext4fs)</c>
- Hệ thống file nhật ký mở rộng thứ tư (ext4) là sự phát triển của ext3, ext4 là hệ thống file 64-bit được thiết kế để hỗ trợ các dung lượng rất lớn.
- Một nét khác biệt giữa ext3 và ext4 là độ chia thời gian. Trong ext3, mốc thời gian (timestamp) nhỏ nhất là 1 giây. Ext4 nhìn về tương lai: khi tốc độ xử lý và tốc độ giao diện tăng lên, cần chia thời gian nhỏ hơn. Mốc thời gian tối thiểu của ext4 là 1 nano giây.  
 
