<a name ="Backup"></a>



## Tại sao phải backup 
- Khi hệ thống bị lỗi 
- Dữ liệu bị hủy 
- Phục hồi hệ thống sau sự cố 
## Các loại backup 
- Sao lưu thư mục và tệp dùng lệnh `tar`
- Sao lưu phân vùng và ổ đĩa : `dump` và `restore`
## Dự trữ 
- Ổ đĩa 
- Dịch vụ dự trữ 
- Các dạng 
    - cold backup : sẵn sàng phục hồi khi có dữ liệu 
    - warm : có sẵn dữ liệu để phục hồi 
    - hot : ở trạng thái vận hành

## Thao tác với command *tar*
```
tar option(s)  archive_name file_name(s)
```
- Tạo file .tar
```
tar -cvf filename.tar 
```
- Trong đó : 
    - c: create tạo tệp mới 
    - v: view hiển thị rõ ràng tập tin
    - f: tên tệp của tệp lưu trữ
- Giải nén file tar
```
tar -xvf filename.tar
```
- x : extract bung tập tin 

- Tạo file nén .tar.gz 

```
tar - zcvf filename.tar.gz file1 file2 file3 
```
- Giải nén file .tar.gz
```
tar - xzvf filename.tar.gz
```
- Hiển thị nội dung trong file nén 
```
tar -tvf filename.tar.gz
```
## Dump
- Dump kiểm tra các tệp trên hệ thống tệp ext2 và xác định tệp nào cần được sao lưu.



