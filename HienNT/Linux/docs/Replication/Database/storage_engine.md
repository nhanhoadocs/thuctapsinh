# Tìm hiểu về các công cụ lưu trữ Database  

## I - Các công cụ lưu trữ trong MySQL

### 1. MyISAM 

- Để chuyển đổi một Storage Engine sang MyISAM ta sử dụng câu truy vấn:

  ```sh
    ALTER TABLE table_name ENGINE = MyISAM;
  ```

- Đây là kiểu Storage Engine mặc định khi tạo một bảng với phiên bản Mysql nhỏ hơn 5.5 và được dùng phổ biến nhất. Một bảng kiểu MyISAM có kích thước lên đến 256TB, nó cho phép lập chỉ mục toàn cột (Full Text Index). Do đó, Storage Engine này cho tốc độ truy suất (Đọc và tìm kiếm) nhanh nhất trong các Storage Engine.

- Tuy nhiên, nhược điểm là hoạt động theo kiểu `Table Level locking` nên khi cập nhật (Thêm, sửa, xóa) 1 bản ghi nào đó trong cùng một bảng thì bảng đó sẽ bị khóa, không cho cập nhật cho đến khi thao tác cập nhật trước đó thực hiện xong. Ngoài ra, do thiết kế đơn giản và không kiểm tra ràng buộc dữ liệu nên loại Storage Engine này dễ bị hỏng chỉ mục và dễ bị Crash.

- Được sử dụng trong việc read-only hoặc read-mostly trong cấu hình web và lưu trữ dữ liệu.

### 2. InnoDB

- Đây là kiểu Storage Engine mới hơn MyISAM được mặc định với các phiên bản Mysql lớn hơn 5.5, không hỗ trợ Full Text Index, nhưng bù lại có hỗ trợ quan hệ giữa các bảng (Khóa ngoại). Vì vậy, kiểu Storage này có tính toàn vẹn dữ liệu và ràng buộc cao do đó khắc phục được tình trạng mà MyISAM gặp phải là hỏng chỉ mục và Crash. InnoDB hoạt động theo cơ chế `Row Level Locking` nên khi cập nhật (Thêm, sửa, xóa) 1 bảng thì chỉ có bản ghi đang bị thao tác bị khóa mà thôi, các thao tác khác trên bảng này vẫn bình thường. Một bảng kiểu này có kích thước lên đến 64TB.

- Vì những lý do trên, kiểu InnoDB này thích hợp sử dụng cho các trang web có tần suất cập nhật dữ liệu lớn như Mạng xã hội, diễn đàn, các trang hotdeal (cập nhật giá)….

- Nhược điểm của kiểu này là tốn rất nhiều Ram so với MyISAM.

- Để chuyển đổi một Storage Engine sang InnoDB ta sử dụng câu truy vấn: (nếu trước đó table này dùng MyISAM và có cột nào đặt Full Text Index thì bạn phải xóa Full Text Index trên cột đó đi mới có thể chuyển được).

  ```sh
    ALTER TABLE table_name ENGINE = InnoDB;
  ```

### 3. Memory

- Được lưu trữ dữ liệu trực tiếp lên RAM nên tốc độ truy xuất và cập nhật rất nhanh. Vì thế, nó được dùng làm các bảng chứa dữ liệu tạm, chứa các phiên làm việc của người dùng, đã là dữ liệu tạm nên khi chúng ta khởi động lại server MySQL thì dữ liệu sẽ mất hết.

## II - Các công cụ lưu trữ trong MariaDB  

- Các công cụ lưu trữ được sử dụng trong MariaDB là: NoSQL, XtraDB(thay thế của InnoDB), Aria(cập nhật của MyISAM).  


## III - Mở rộng

Nếu có nhu cầu hay vì một lý do nào đó bạn cần chuyển đổi kiểu Storage Engine từ MyISAM sang InnoDB hay MyISAM sang MEMORY hay bất cứ Storage Engine nào thì đoạn code dưới đây sẽ giúp được cho bạn.(Lưu ý là nếu dữ liệu lớn có thể sẽ rất lâu nên cần kiên nhẫn).

```sh
<?php
// Kết nối database
$dbhost = 'localhost';//host
$dbuser = 'root';//username
$dbpass = '';//password
$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die ('Error connecting to mysql');
$dbname = 'databasename';//tên cơ sở dữ liệu
mysql_select_db($dbname);
 
$sql = "SHOW tables";
$rs = mysql_query($sql);
while($row = mysql_fetch_array($rs)) {
 $tbl = $row[0];
 $sql = "ALTER TABLE $tbl ENGINE=INNODB";
 mysql_query($sql);
}
?>
```

Thay đổi các thông số `$dbhost`, `$dbuser`, $`dbpass`, `$dbname` theo host của bạn.

Kết luận
Với một website có lượng truy cập trung bình, tần suất đọc cao như các trang tin tức,blog… thì nên dùng MyISAM…
Với một website có nhiều truy vấn insert và update như: Diễn đàn, mạng xã hội… thì bạn nên dùng InnoDB.
Nên dùng MEMORY cho các bảng chứa dữ liệu tạm và thông tin phiên làm việc của người dùng Session chẳng hạn.



##  TÀI LIỆU THAM KHẢO

- https://viblo.asia/p/gioi-thieu-cac-storage-engine-trong-mysql-Eb85oEb8Z2G

- http://nongdanit.info/php-mysql/storage-engine-innodb-myisam-va-memory-trong-mysql.html

- http://namluu.com/backend/co-du-lieu-mysql-va-cac-bien-percona-mariadb/

- https://db-engines.com/en/ranking_trend/system/MariaDB%3BMySQL%3BPercona+Server+for+MySQL

- https://db-engines.com/en/ranking