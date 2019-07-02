# Sự khác biệt giữa Linux EXT, XFS, BTRFS và ZFS là gì?
**Journaling (nhật ký) là gì?**
- **Journaling** chỉ được sử dụng khi ghi dữ liệu lên ổ cứng và đóng vai trò như những chiếc đục lỗ để ghi thông tin vào phân vùng. Đồng thời, nó cũng khắc phục vấn đề xảy ra khi ổ cứng gặp lỗi trong quá trình này, nếu không có journal thì hệ điều hành sẽ không thể biết được file dữ liệu có được ghi đầy đủ tới ổ cứng hay chưa.

- Chúng ta có thể hiểu nôm na như sau: trước tiên file sẽ được ghi vào journal, đẩy vào bên trong lớp quản lý dữ liệu, sau đó journal sẽ ghi file đó vào phân vùng ổ cứng khi đã sẵn sàng. Và khi thành công, file sẽ được xóa bỏ khỏi journal, đẩy ngược ra bên ngoài và quá trình hoàn tất. Nếu xảy ra lỗi trong khi thực hiện thì file hệ thống có thể kiểm tra lại journal và tất cả các thao tác chưa được hoàn tất, đồng thời ghi nhớ lại đúng vị trí xảy ra lỗi đó.
- Tuy nhiên, nhược điểm của việc sử dụng journaling là phải “đánh đổi” hiệu suất trong việc ghi dữ liệu với tính ổn định. Bên cạnh đó, còn có nhiều công đoạn khác để ghi dữ liệu vào ổ cứng nhưng với journal thì quá trình không thực sự là như vậy. Thay vào đó thì chỉ có file metadata, inode hoặc vị trí của file được ghi lại trước khi được ghi vào ổ cứng.

    ![](https://www.ibm.com/developerworks/library/l-journaling-filesystems/figure1.gif)

**Các tùy chọn file system:**
- Như đã đề cập tới ở bên trên, có khá nhiều dạng file hệ thống trong Linux, và mỗi loại sẽ được áp dụng với từng mục đích riêng biệt. Điều này không có nghĩa rằng những file hệ thống này không thể được áp dụng trong trường hợp khác, mà tùy theo nhu cầu và mục đích của người sử dụng, chúng ta sẽ đưa ra phương án phù hợp.

  - **Ext – Extended file system**: là định dạng file hệ thống đầu tiên được thiết kế dành riêng cho Linux. Có tổng cộng 4 phiên bản và mỗi phiên bản lại có 1 tính năng nổi bật. Phiên bản đầu tiên của Ext là phần nâng cấp từ file hệ thống Minix được sử dụng tại thời điểm đó, nhưng lại không đáp ứng được nhiều tính năng phổ biến ngày nay. Và tại thời điểm này, chúng ta không nên sử dụng Ext vì có nhiều hạn chế, không còn được hỗ trợ trên nhiều distribution.
  
  - **Ext2** thực chất không phải là file hệ thống journaling, được phát triển để kế thừa các thuộc tính của file hệ thống cũ, đồng thời hỗ trợ dung lượng ổ cứng lên tới 2 TB. Ext2 không sử dụng journal cho nên sẽ có ít dữ liệu được ghi vào ổ đĩa hơn. Do lượng yêu cầu viết và xóa dữ liệu khá thấp, cho nên rất phù hợp với những thiết bị lưu trữ bên ngoài như thẻ nhớ, ổ USB... Còn đối với những ổ SSD ngày nay đã được tăng tuổi thọ vòng đời cũng như khả năng hỗ trợ đa dạng hơn, và chúng hoàn toàn có thể không sử dụng file hệ thống không theo chuẩn journaling.
  
  - **Ext3** về căn bản chỉ là Ext2 đi kèm với journaling. Mục đích chính của Ext3 là tương thích ngược với Ext2, và do vậy những ổ đĩa, phân vùng có thể dễ dàng được chuyển đổi giữa 2 chế độ mà không cần phải format như trước kia. Tuy nhiên, vấn đề vẫn còn tồn tại ở đây là những giới hạn của Ext2 vẫn còn nguyên trong Ext3, và ưu điểm của Ext3 là hoạt động nhanh, ổn định hơn rất nhiều. Không thực sự phù hợp để làm file hệ thống dành cho máy chủ bởi vì không hỗ trợ tính năng tạo disk snapshot và file được khôi phục sẽ rất khó để xóa bỏ sau này.

![](https://www.w3resource.com/w3r_images/ext2.png)

  - **Ext4**: cũng giống như Ext3, lưu giữ được những ưu điểm và tính tương thích ngược với phiên bản trước đó. Như vậy, chúng ta có thể dễ dàng kết hợp các phân vùng định dạng Ext2, Ext3 và Ext4 trong cùng 1 ổ đĩa trong Ubuntu để tăng hiệu suất hoạt động. Trên thực tế, Ext4 có thể giảm bớt hiện tượng phân mảnh dữ liệu trong ổ cứng, hỗ trợ các file và phân vùng có dung lượng lớn... Thích hợp với ổ SSD so với Ext3, tốc độ hoạt động nhanh hơn so với 2 phiên bản Ext trước đó, cũng khá phù hợp để hoạt động trên server, nhưng lại không bằng Ext3.

![](https://i.warosu.org/data/g/img/0568/98/1475484669779.jpg)

  - **BtrFS** – thường phát âm là Butter hoặc Better FS, hiện tại vẫn đang trong giai đoạn phát triển bởi Oracle và có nhiều tính năng giống với ReiserFS. Đại diện cho **B-Tree File System**, hỗ trợ tính năng pool trên ổ cứng, tạo và lưu trữ snapshot, nén dữ liệu ở mức độ cao, chống phân mảnh dữ liệu nhanh chóng... được thiết kế riêng biệt dành cho các doanh nghiệp có quy mô lớn.
    - Mặc dù BtrFS không hoạt động ổn định trên 1 số nền tảng distro nhất định, nhưng cuối cùng thì nó vẫn là sự thay thế mặc định của Ext4 và cung cấp chế độ chuyển đổi định dạng nhanh chóng từ Ext3/4. Do vậy, BtrFS rất phù hợp để hoạt động với server dựa vào hiệu suất làm việc cao, khả năng tạo snapshot nhanh chóng cũng như hỗ trợ nhiều tính năng đa dạng khác.
    - Bên cạnh đó, Oracle cũng đang cố gắng phát triển 1 nền tảng công nghệ nhằm thay thế cho NFS và CIFS gọi là CRFS với nhiều cải tiến đáng kể về mặt hiệu suất và tính năng hỗ trợ. Những cuộc kiểm tra trên thực tế đã chỉ ra BtrFS đứng sau Ext4 khi áp dụng với các thiết bị sử dụng bộ nhớ Flash như SSD, server database...

  - **XFS** được phát triển bởi Silicon Graphics từ năm 1994 để hoạt động với hệ điều hành riêng biệt của họ, và sau đó chuyển sang Linux trong năm 2001. Khá tương đồng với Ext4 về một số mặt nào đó, chẳng hạn như hạn chế được tình trạng phân mảnh dữ liệu, không cho phép các snapshot tự động kết hợp với nhau, hỗ trợ nhiều file dung lượng lớn, có thể thay đổi kích thước file dữ liệu... nhưng không thể shrink – chia nhỏ phân vùng XFS. Với những đặc điểm như vậy thì XFS khá phù hợp với việc áp dụng vào mô hình server media vì khả năng truyền tải file video rất tốt. Tuy nhiên, nhiều phiên bản distributor yêu cầu phân vùng /boot riêng biệt, hiệu suất hoạt động với các file dung lượng nhỏ không bằng được khi so với các định dạng file hệ thống khác, do vậy sẽ không thể áp dụng với mô hình database, email và một vài loại server có nhiều file log. Nếu dùng với máy tính cá nhân, thì đây cũng không phải là sự lựa chọn tốt nên so sánh với Ext, vì hiệu suất hoạt động không khả thi, ngoài ra cũng không có gì nổi trội về hiệu năng, quản lý so với Ext3/4.

  - **ZFS (Zettabyte File System)** hiện tại vẫn đang trong giai đoạn phát triển bởi Oracle với nhiều tính năng tương tự như Btrfs và ReiserFS.
    - **ZFS** có một số tính năng như:
```
- Khả năng mở rộng dễ dàng với dung lượng lưu trữ cực kì lớn.
- Toàn vẹn dữ liệu và sửa chữa tự động.
- Snapshots.
- RaidZ.
- Nén dữ liệu hiệu quả.
...
```

![](https://tailieu.123host.vn/wp-content/uploads/2019/04/Screenshot_1-1.png)

  - **Swap**: Thực sự không phải là 1 dạng file hệ thống, bởi vì cơ chế hoạt động khá khác biệt, được sử dụng dưới 1 dạng bộ nhớ ảo và không có cấu trúc file hệ thống cụ thể. Không thể kết hợp và đọc dữ liệu được, nhưng lại chỉ có thể được dùng bởi kernel để ghi thay đổi vào ổ cứng. Thông thường, nó chỉ được sử dụng khi hệ thống thiếu hụt bộ nhớ RAM hoặc chuyển trạng thái của máy tính về chế độ Hibernate.

Dưới đây là hình ảnh so sánh giữa EXT4, XFS và BTRFS:

![](http://www.electronicdesign.com/sites/electronicdesign.com/files/WTD_Linux_TableNew.gif)