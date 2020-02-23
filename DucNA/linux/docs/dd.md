# 1.Khái niệm 
- Lệnh dd dùng trong linux là một câu lệnh được dùng khá thường xuyên và được sử dụng trong các trường hợp sau
    - Sao lưu và hồi phục toàn bộ dữ liệu ổ cứng hoặc một partition 
    - Chuyển đổi định dạng dữ liệu từ ASCII sang EBCDIC hoặc ngược lại 
    - Sao lưu lại MBR tỏng máy
    - Chuyển đổi chữ thường sang chữ hoa 
    - Tạo một file ISO
    - Tạo một file với kích cỡ cố định 
# 2. Cấu trúc và các tùy chọn 
a) Cấu trúc 
```
#dd if=<địa chỉ đầu vào> of=<địa chỉ đầu ra> option
```
trong đó 
    - if= địa chỉ nguồn của dữ liệu nó sẽ bắt đầu đọc 
    - of= viết đầu ra của file 
    - option: các tùy chọn cho câu lệnh 
b) các option
- `bs=Bytes`: quá trình đọc và ghi bao nhiêu byte một lần đọc 
- `cbs=bytes`: Chuyển đổi bao nhiêu byte một lần 
- `count=blocks` : thực hiện bao nhiêu block trong quá trình thực thi câu lệnh 
- `if` chỉ đường dẫ n đọc đầu vào 
- `of` chỉ đường dẫn ghi đầu ra 
- `ibs=bytes` chỉ ra số byte một lần đọc 
- `obs=bytes` Chỉ ra số byte một lần ghi 
- `skip=blocks` Bỏ qua bao nhiêu block đầu vào 
- `conv=Convs` Chỉ ra tác vụ cụ thể của câu lệnh, Các tùy chọn được ghi dưới đây 
    - `ascii`: Chuyển đổi từ mã EBCDIC sang ASCII
    - `ebcdic`: chuyển đổi từ mã ASCII sang EBCDIC
    - `lcase` Chuyển đổi từ chữ thường lên hết thành chứ hoa
    - `ucase` Chuyển đổi từ chữ hoa sang chữ thường
    - `nocreat` Không tạo ra file đầu ra 
    - `noerror` tiếp tục sao chép dữ liệu khi đầu vào bị lỗi
    - `sync` Đồng bộ dữ liệu với ổ đang sau chép sang 
- Note: Một số trường biểu diễn cho số lượng byte
    - c = 1 byte
    - w = 2 byte
    - b = 512 byte
    - kB = 1000 byte
    - K = 1024 byte
    - MB = 1000000 byte
    - M = 1024*1024 byte
    - GB = (1000* 1000 *1000) byte
    - G = (1024 * 1024 * 1024) byte
# 3. Các ví dụ 
a) sao lưu - phục hồi toàn bộ ổ cứng hoặc phân vùng trong ổ cứng 
- Sao lưu toàn bộ dữ liệu ổ cứng sang ổ cứng khác 
```
#dd if=/dev/sda of=/dev/sdb conv=noerror, sync
dd: writing to ‘/dev/sdb’: No space left on device
10485761+0 records in
10485760+0 records out
5368709120 bytes (5,4 GB) copied, 84,5401 s, 63,5 MB/s

```
Câu lệnh trên dùng để sao lưu toàn bộ dữ liệu của ổ sda sang ổ sdb với tùy chọn trong trườn conv=noerrom.sync với ý nghĩa vẫn tiếp tục sao lưu nếu dữ liệu đầu vào bị lỗi và tự động đồng bộ ới dữ liệu sdb
- Tạo một file ảnh cho ổ sda1. phương pháp này nhanh hơn di  chuyển dữ liệu 
```
dd if=/dev/sda1 of=/root/sda1.anh
2097152+0 records in
2097152+0 records out
1073741824 bytes (1,1 GB) copied, 5,98179 s, 180 MB/s
```
- Nếu muốn nén ảnh file và bạn có thể sử dụng lệnh dưới 
```
dd if=/dev/sda1 | grip > /root/sda1.anh.gz
```
- Sao lưu dữ liệu từ môt phân vùng này đến một phân vùng khác 
```
dd if=/dev/sda2 of=/dev/sdb2 bs=512 conv=noerror, sync
4+0 records in
3+0 records out
1536 bytes (1,5 kB) copied, 0,00299414 s, 513 kB/s
```
Đối với câu lệnh trên thì bs=512 có ý nghĩa mỗi làn độc ghi nó sẽ đọc 512 byte
- Phục hồi dữ liệu 
```
dd if=/root/sda1.anh of=/dev/sda1
2097152+0 records in
2097152+0 records out
1073741824 bytes (1,1 GB) copied, 10,7888 s, 99,5 MB/s
```
b) sao lưu phục hồi MBR
- Việc sao lưu lại MBR là việc làm cần thiết đối với hệ điều hành linux. nó đề phòng cho việc virut có thể vào được vùng MBR.
    - Sao lưu MBR
    ```
    dd if=/dev/sda1 of=/root/mbr.txt bs=512 conunt=1 
    ```
    - Phục hồi lại MBR 
    ```
    dd if=/root/mbr.txt of=/dev/sda1
    ```
C) chuyển đổi chữ thường thành chữ in hoa 
- Chuyển đổi chữ thường thành chữ in hoa 
```
dd if =/root/test.doc of=/root/test1.doc conv=ucase
```
- Chuyển đổi chữ hoa thàn chữ thường 
```
dd if=/root/test.doc of=/root/test1.doc conv=scase,sycn
```
d) Tạo một file có dung lượng cố định 
- Ví dụ tạo một file có kích thước 100M
 ```
 dd if=/dev/zero of=/root/file1 bs=100M count=1 
 ```
