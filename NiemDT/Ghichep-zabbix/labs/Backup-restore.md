# Hướng dẫn Backup và restore zabbix server

## Backup full 

Với cơ chế này ta backup lại toàn bộ DB của zabbix server. Trong trường hợp này khi zabbix server bị lỗi ta sẽ tiến hành restore lại toàn bộ DB và cấu hình của zabbix server như tại thời điểm ta tiến hành backup. Với cách này sẽ lấy lại được đầy đủ cả những thông số giám sát trên host trước đây. 

Với cách backup có nhược điểm là sẽ tốn nhiều tài nguyên cho việc backup. Nếu bạn giám sát với hệ thống lớn DB của nó sẽ là rất lớn nên việc dump DB và restore DB sẽ mất rất nhiều thời gian. Trong khi thực hiện việc dump và restore DB thì ta không thể thực hiện việc ghi dữ liệu vào DB. Như vậy đồng nghĩa với việc hệ thống giám sát của ta sẽ mất dữ liệu trong khoảng thời gian này.

**Thực hiện**

Backup DB. Sử dụng `mysqldump` để tiến hành backup DB

```
mysqldump -u root -p zabbix > zabbix-1.sql
```

Trong đó:
 * `root`: là tên user. Ở đây tôi sử dụng user root. Cũng có thể dụng user khác có quyền với DB muốn backup.
 * `zabbix`: là tên database sử dụng cho zabbix.
 * `zabbix-1.sql`: là đường dẫn tới file để lưu bản backup này.

Bây giờ giả sử trong trường hợp zabbix server của tôi bị lỗi và không thể khôi phục. Và yêu cầu lúc này là cần dựng lại zabbix server giữ nguyên những cấu hình như trên zabbix server cũ. Và không phải thao tác lại bất kỳ điều gì trên các host.

Lúc này chúng ta phải tiến hành cài đặt một zabbix server mới. Để biết cách cài đặt xem [tại đây](https://github.com/niemdinhtrong/ghichep-zabbix/blob/master/labs/cai-dat-zabbix-centos7.md).

Lưu ý: Ở bước import DB ta không thực hiện câu lệnh này

![](/images/Backup-restore/1.png)

mà ta sử dụng file đã backup gần nhất để import dữ liệu vào

```
mysql -u root -p zabbix < zabbix-1.sql
```

Trong đó: 
 * `root` là user thực hiện truy cập mysql để import. Có thể sử dụng user khác có quyền với DB muốn import.
 * `zabbix` tên của database sử dụng cho zabbix.
 * `zabbix-1.sql` là file backup đã dump ra trên zabbix server cũ và đã được chuyển sang zabbix server mới tạo này.

Khi tạo xong và truy cập vào ta sẽ thấy được nó có cấu hình giống với zabbix server cũ. Nhưng lúc này nó không thể nhận được các metric từ các host gửi về. Để nhận được metric ta cần cấu hình lại IP cho máy này theo IP của zabbix server cũ đã bị lỗi. 

Khi cấu hình xong ta có thể thấy nó nhận được các metric đẩy về. Ta sẽ thấy nó giống với cấu hình của trên máy cũ và sẽ có đầy các dữ liệu trước đó. Nó sẽ chỉ bị mất dữ liệu trong khoảng thời gian từ lúc zabbix server bị lỗi đến lúc ta triển khai xong hệ thống mới.

## Chỉ backup cấu hình

Với cách backup này ta sẽ chỉ backup cấu hình trên zabbix server chứ không backup dữ liệu là các metric được gửi về được lưu trữ trong DB.

Theo cách này thì ta sẽ giữ được cấu hình và giao diện trên zabbix server. Và sẽ tốn ít tài nguyên cũng như thời gian backup và restore nhanh hơn rất nhiều so với kiểu backup full như bên trên (nếu thực hiện với DB lớn thì bạn sẽ thấy rõ sự khác biệt này. Còn với hệ thống nhỏ thì thời gian chên lệch sẽ không nhiều)

### Để backup cấu hình thực hiện như sau

**Cài đặt lần đầu**

```
wget https://raw.githubusercontent.com/niemdinhtrong/ghichep-zabbix/master/scripts/zabbix-backup-main
```

```
chmod +x zabbix-backup-main

./zabbix-backup-main
```

**Backup**

Để tiến hành backup thực hiện như sau

Truy cập vào thư mục chứa script

```
cd zabbix
```

Chạy script để backup

```
./zabbix-backup
```

Để mở các file backup ta vào thư mục `zabbix-backup-file`

Các file backup này có tên định dạng `zabbix-năm-tháng-ngày-giờ-phút-giây.sql`

Thời gian bên trên tương ứng với thời gian chạy script. Bạn nên lưu các file này sang nơi khác đề phòng rủi ro.

Khi hệ thống bị lỗi cần cài lại zabbix server. Để cài zabbix server tham khảo [tại đây](https://github.com/niemdinhtrong/ghichep-zabbix/blob/master/labs/cai-dat-zabbix-centos7.md)

Chú ý đến bước 

![](/images/Backup-restore/2.png)

Sau khi chạy lệnh bên trên ta chạy thêm lệnh sau

```
mysql -u zabbix -p zabbix < file-backup.sql
```

`file-backup.sql` là file backup đã backup ở trên zabbix server cũ và đã chuyển sang server này. Chú ý cần chỉ ra đường dẫn đến file này.

Tiếp tục thực hiện các thao tác tiếp theo để cài đặt zabbix server. Chú ý đổi lại địa chỉ IP theo IP của zabbix server cũ.

Với cách này sẽ lấy lại được toàn bộ cấu hình của zabbix server nhưng ko có bất kỳ dữ liệu metric trước đây.