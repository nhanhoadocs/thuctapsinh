# Backup data
Lệnh `rsync` được sử dụng để đồng bộ hóa toàn bộ cây thư mục. Về cơ bản, nó sao chép tập tin như lệnh `cp`. Ngoài ra, `rsync` kiểm tra xem tệp đã được sao chép chưa. Nếu tệp tồn tại và không có thay đổi về kích thước hoặc thời gian sửa đổi, `rsync` sẽ tránh một bản sao không cần thiết và tiết kiệm thời gian. Hơn nữa, vì `rsync` chỉ sao chép các phần của tệp đã thực sự thay đổi, nên nó có thể rất nhanh.

Rsync là rất hiệu quả khi đệ quy sao chép một cây thư mục qua mạng, bởi vì chỉ có sự khác biệt được truyền đi

Người ta thường đồng bộ hóa cây thư mục đích với gốc, sử dụng tùy chọn `rsync -r` để đệ quy xuống cây thư mục sao chép tất cả các tệp và thư mục bên dưới tệp được liệt kê dưới dạng nguồn.

## Cài đặt `rsync`:
### Trên Red Hat/CentOS: 

`yum install rsync`

### Trên Debian/Ubuntu:
`apt-get install rsysnc`

```
Ví dụ:
# rsync -ravzh project_ABC /data/backups
sending incremental file list
project_ABC/
project_ABC/file1.txt
project_ABC/file2.txt
project_ABC/file3.txt
project_ABC/file4.txt

sent 636 bytes  received 92 bytes  1.46K bytes/sec
total size is 452  speedup is 0.62
```