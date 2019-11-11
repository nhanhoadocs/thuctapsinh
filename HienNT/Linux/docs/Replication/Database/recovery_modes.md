# XtraDB/InnoDB Recovery Modes

## Giới thiệu

- Chế độ khôi phục XtraDB/InnoDB là chế độ được sử dụng để khôi phục dữ liệu sau các tình huống khẩn cấp. 

- Sử dụng biến hệ thống máy chủ `innodb_force_recovery` để đặt chế độ khôi phục. Có 7 mode(0-6) recovery. Mặc định `innodb_force_recovery = 0`. Khi mode càng cao thì các hạn chế càng nghiêm ngặt. Các mode cao hơn kết hợp tất cả các giới hạn của các mode thấp hơn.

> Không nên thay đổi giá trị mặc định của innodb_force_recovery, trừ khi có trường hợp khẩn cấp.

- Cấu hình: Chỉnh sửa trong file config `my.cnf`

  ```sh
  [mysqld]
  innodb_force_recovery = 1
  ```

- Cách sử dụng tốt nhất là nên bắt đầu với recovery mode bằng 1 và tăng dần nếu cần. Với các recovery mode < 4 thì chỉ các trang corrupted bị mất. Với recovery mode = thì chỉ số phụ(secondary indexes) có thể bị hỏng. Với 5, kết quả trả về có thể không nhất quán và các chỉ số phụ có thể bị hỏng(ngay cả khi không có giá trị 4). Giá trị 6 sẽ dời các trang trong trạng thái obsolete, việc này có thể gây ra nhiều corruption hơn.

- Để recovery 1 table, bạn có thể excute SELECTs để dump data, và `DROP TABLE` để xóa các bảng bị hỏng.

  Ví dụ:  

  ```sh
  mysql -h120.26.133.63 -umiyadb -proot123 miya -e "select * from user where id=1" > mydumpfile.txt
  ```

## Recovery Modes  

- **Mode 0** - mode mặc định khi XtraDB/InnoDB đang chạy bình thường. Trước MariaDB 10.2.7, đây là chế độ duy nhất cho phép thay đổi dữ liệu. Từ MariaDB 10.2.7, các giao dịch ghi được cho phép với `innodb_force_recovery <= 3`.

- **Mode 1** - `SRV_FORCE_IGNORE_CORRUPT` (bỏ qua các lỗi) – Cho phép server tiếp tục chạy ngay cả khi trang bị hỏng được phát hiện.  Nó làm như vậy bằng cách làm lại phục hồi dựa trên nhật ký bỏ qua một số lỗi nhất định, chẳng hạn như các tệp dữ liệu bị thiếu hoặc các trang dữ liệu bị hỏng. Bất kỳ nhật ký làm lại nào cho các tập tin hoặc trang bị ảnh hưởng sẽ bị bỏ qua. Có thể tạo điều kiện cho các bảng kết xuất bằng cách sử dụng câu lệnh `SELECT * FROM table_name` để nhảy qua các chỉ mục và trang bị hỏng.

- **Mode 2** - `SRV_FORCE_NO_BACKGROUND` - Ngăn chặn các luồng chính đang vận hành. Nếu có lỗi xảy ra khi tiến trình lọc đang hoạt động. Giá trị recovery này sẽ ngăn chặn lại.

- **Mode 3** - `SRV_FORCE_NO_TRX_UNDO` - Không chạy `transaction rollbacks` sau khi recovery. 

    `Rollbacks` là thao tác khôi phục cơ sở dữ liệu về một trạng thái cũ. Các thao tác rollback có tầm quan trọng đối với tính toàn vẹn dữ liệu của cơ sở dữ liệu. Từ MariaDB 10.2.7, cũng sẽ ngăn một số tác vụ nền hoàn tác không chạy. Các tác vụ này có thể bị khóa chờ do các giao dịch chưa hoàn thành được khôi phục mà việc khôi phục lại đang bị ngăn chặn.

- **Mode 4** - `SRV_FORCE_NO_IBUF_MERGE` - Hoạt động ngăn chặn việc `insert buffer merge`. Nếu có lỗi xảy ra thì sẽ không thực hiện, không thống kê tính toán các table.

- **Mode 5** - `SRV_FORCE_NO_UNDO_LOG_SCAN` - Bỏ qua undo logs khi đang bắt đầu start database, InnoDB xử lý ngay khi chưa hoàn thành transactions as committed. 
    
    Transaction (giao dịch) là một nhóm, có thứ tự, các hoạt động thao tác trên cơ sở dữ liệu, nhưng được xem như một đơn vị thao tác duy nhất. Khi một transaction bao gồm nhiều lệnh cập nhật, nó đảm bảo tất cả các cập nhật đều được thực hiện thành công, hoặc trong trường hợp một lệnh gặp sự cố toàn bộ transaction bị hủy bỏ. Khi đó dữ liệu trở về trạng thái như trước khi xảy ra transaction. Nói cách khác transaction ngăn chặn tình huống dữ liệu được cập nhật nửa chừng, trong đó một phần được cập nhật còn một phần bị bỏ qua.

- **Mode 6** - `SRV_FORCE_NO_LOG_REDO` - Không thực hiện redo log roll-forward trong kết nối với việc recovery.

    Roll forward là khôi phục tất cả giao dịch đã hoàn thành khi hệ thống xảy ra sự cố.

    Các truy vấn yêu cầu index có khả năng không hoạt động ở mode này. Nếu 1 table dump vẫn xảy ra sự cố, bạn có thể sử dụng `SELECT * FROM tab ORDER BY primary_key DESC` để dump tất cả data portion sau phần bị hỏng.  

> Note: Lưu ý rằng XtraDB theo mặc định sẽ crash server khi phát hiện dữ liệu bị hỏng trong một single-table tablespace. Có thể thay đổi hoạt động này bằng biến hệ thống `innodb_corrupt_table_action`


## TÀI LIỆU THAM KHẢO

- https://mariadb.com/kb/en/library/innodb-recovery-modes/

- http://web.faq.edu.vn/tim-hieu-ve-chi-so-innodb_force_recovery-trong-cau-hinh-mysql/

- https://dev.mysql.com/doc/refman/8.0/en/forcing-innodb-recovery.html

