# Sao lưu, đồng bộ dữ liệu trên Linux

    Rsync (Remote Sync) là một công cụ dùng để sao chép và đồng bộ file/thư mục được dùng rất phổ biến. Với sự trợ giúp của rsync, bạn có thể đồng bộ dữ liệu trên local hoặc giữa các server với nhau một cách dễ dàng.

    Lệnh rsync được sử dụng để đồng bộ hóa toàn bộ cây thư mục. Về cơ bản, nó sao chép tập tin như lệnh cp (Copy). Nhưng hơn thế, rsync kiểm tra xem tệp đã được sao chép đã tồn tại chưa. Nếu tệp tồn tại và không có thay đổi về kích thước hoặc thời gian sửa đổi, rsync sẽ tránh một bản sao không cần thiết và tiết kiệm thời gian. Hơn nữa, vì rsync chỉ sao chép các phần của tệp đã thực sự thay đổi, nên nó có thể nhanh hơn. Rsync rất hiệu quả khi sao chép đệ quy một cây thư mục qua mạng, vì chỉ có sự khác biệt được truyền đi. 

    One often synchronizes the destination directory tree with the origin, using the rsync -r option to recursively walk down the directory tree copying all files and directories below the one listed as the source.

### Tính năng nổi bật của Rsync
- Rsync hỗ trợ copy giữ nguyên thông số của files/folder như Symbolic links, Permissions, TimeStamp, Owner và Group.
- Rsync nhanh hơn `scp` vì Rsync sử dụng giao thức remote-update, chỉ transfer những dữ liệu thay đổi mà thôi.
- Rsync tiết kiệm băng thông do sử dụng phương pháp nén và giải nén khi transfer.
- Rsync không yêu cầu quyền super-user.
- Tự xóa dữ liệu nếu dữ liệu đó không tồn tại trên source giúp đồng bộ dữ liệu giữa hai máy chủ linux từ xa.
- Rsync kết hợp SSH bảo mật dữ liệu truyền trên internet.
### Cài đặt Rsync
Rsync được cài đặt dễ dàng với một dòng lệnh:

– Trên Red Hat/CentOS
```
yum install rsync
```
– Trên Debian/Ubuntu
```
apt-get install rsysnc
```

### Sử dụng Rsync
Câu lệnh căn bản của rsync:
```
rsync options source destination
```
Trong đó:
- Source: dữ liệu nguồn
- Destination: dữ liệu đích
- Options: một số tùy chọn thêm :

    - `-v`:  hiển thị trạng thái kết quả
    - `-r`: copy dữ liệu recursively, nhưng không đảm bảo thông số của file và thư mục
    - `-a`: cho phép copy dữ liệu recursively, đồng thời giữ nguyên được tất cả các thông số của thư mục và file
    - `-z`: nén dữ liệu khi transfer, tiết kiệm băng thông tuy nhiên tốn thêm một chút thời gian
    - `-h`: human-readable, output kết quả dễ đọc
    - `-e`: sử dụng giao thức SSH để mã hóa dữ liệu.
    - `-P`: Option này dùng khi đường truyền không ổn định, nó sẽ gửi tiếp các file chưa được gửi đi khi có kết nối trở lại.
    - `--delete`: xóa dữ liệu ở destination nếu source không tồn tại dữ liệu đó.
    - `--exclude`: loại trừ ra những dữ liệu không muốn truyền đi, nếu bạn cần loại ra nhiều file hoặc folder ở nhiều đường dẫn khác nhau thì mỗi cái bạn phải thêm `--exclude` tương ứng.



## Compress and Archiving data

    Dữ liệu tệp thường được nén để tiết kiệm dung lượng ổ đĩa và giảm thời gian truyền tệp qua mạng. Linux sử dụng một số phương pháp để thực hiện việc nén này.

### Tar
Tar giúp đóng gói các files/thư mục vào trong 1 file, giúp ích rất nhiều cho việc sao lưu dữ liệu. Thông thường, Tar file có đuôi .tar. Để giảm tối đa kích thước tập tin, chúng ta cần thêm các tùy chọn nén gzip hoặc bunzip2. Tổng hợp các tùy chọn bao gồm

- -c: Tạo file lưu trữ.
- -x: Giải nén file lưu trữ.
- -z: Nén với gzip – Luôn có khi làm việc với tập tin gzip (.gz).
- -j: Nén với bunzip2 (bzip2) – Luôn có khi làm việc với tập tin bunzip2 (.bz2).
- -lzma: Nén với lzma – Luôn có khi làm việc với tập tin LZMA (.lzma).
- -f: Chỉ đến file lưu trữ sẽ tạo – Luôn có khi làm việc với file lưu trữ.
- -v: Hiển thị những tập tin đang làm việc lên màn hình.
- -r: Thêm tập tin vào file đã lưu trữ.
- -u: Cập nhật file đã có trong file lưu trữ.
- -t: Liệt kê những file đang có trong file lưu trữ.
- -delete: Xóa file đã có trong file lưu trữ.
- -totals: Hiện thỉ thông số file tar
- -exclude: loại bỏ file theo yêu cầu trong quá trình nén

### Gzip
GZIP được dùng khá phổ biến trong nền tảng Unix/Linux.
GZIP chỉ có thể làm việc trên 1 tập tin hoặc 1 dòng dữ liệu,
do đó không thể lưu trữ được nhiều tập tin. 
Vì vậy, nếu muốn sử dụng cho nhiều tập tin thì chúng ta phải sử dụng TAR đóng gói chúng lại trước.

1. Tạo file nén Gzip
```
gzip filename
```
#### Thiết lập mức độ nén

Mức độ nén được tùy chỉnh trong khoảng từ 1 đến 9. Trong đó, 1 ~ fast nén nhanh nhất nhưng mức độ nén thấp nhất còn 9 ~ best mức độ nén cao nhất nhưng nén chậm nhất
```
gzip --fast filename hoặc # gzip -1 filename
gzip --best filename hoặc # gzip -9 filename
```
Kiểm tra thuộc tính file nén
```
gzip -l filename.gz
```

2. Giải nén file Gzip
```
gzip -d filename
```

### Zip

#### 1. Tạo file nén .zip
```
zip filename.zip filename1 filename2
```
Trong đó, filename.zip là file zip 
sẽ được tạo từ việc nén filename1 và filename2

#### Nén folder thành 1 file zip

Sử dụng tùy chọn -r để zip nén toàn bộ folder và các file bên trong.

```
zip -r test.zip folder1
```
#### Tạo file nén ở chế độ yên lặng

Sử dụng tùy chọn -q để tạo file nén ở chế độ yên lặng – quiet, không hiển thị thông tin gì trong quá trình nén.
```
zip -rq test.zip folder
```
#### 2. Giải nén file .zip
```
unzip filename.zip

```
Khi đó, file trong filename.zip sẽ được giải nén vào thư mục hiện tại, file nén vẫn giữ nguyên
Nếu file đó còn tồn tại ở thư mục giải nén, chương trình sẽ hỏi bạn về các tùy chọn thay thế

```
[y]es, [n]o, [A]ll, [N]one, [r]ename
```
#### Giải nén ở chế độ yên lặng

Sử dụng tùy chọn -q để giải nén ở chế độ yên lặng – quiet, không hiển thị thông tin gì trong quá trình giải nén.
```
unzip -q test.zip
```


## Copying disks

    Câu lệnh dd trong linux là một trong những câu lệnh thường xuyên được sử dụng. Câu lệnh dd dùng để sử dụng trong các trường hợp sau:

- Sao lưu và phục hồi toàn bộ dữ liệu ổ cứng hoặc một partition
- Chuyển đổi định dạng dữ liệu từ ASCII sang EBCDIC hoặc ngược lại
- Sao lưu lại MBR trong máy (MBR là một file dữ liệu rất quan trong nó chứa các lệnh để LILO hoặc GRUB nạp hệ điều hanh)
- Chuyển đổi chữ thường sang chữ hoa và ngược lại
- Tạo một file với kích cơ cô định
- Tạo một file ISO

### Cú pháp và các trường tùy chọn

```
dd if=<địa chỉ đầu vào> of=<địa chỉ đầu ra> option
```
Trong đó:

- if= địa chỉ nguồn của dữ liệu nó sẽ bắt đầu đọc
- of= viết đầu ra của file
- option : các tùy chọn cho câu lệnh

#### Các tùy chọn cho câu lệnh
|Tùy chọn | Ý nghĩa |
|---------|---------|
|bs=Bytes |Quá trình đọc (ghi) bao nhiêu byte một lần đọc (ghi) |
|cbs=Bytes|Chuyển đổi bao nhiêu byte một lần |
|count=Blocks | thực hiện bao nhiêu Block trong quá trình thực thi câu lệnh |
|if | Chỉ đường dẫn đọc đầu vào |
|of | Chỉ đường dẫn ghi đầu ra|
|ibs=bytes | Chỉ ra số byte một lần đọc |
|obs=bytes | Chỉ ra số byte một lần ghi |
|skip=blocks | Bỏ qua bao nhiêu block đầu vào |
|conv=Convs | Chỉ ra tác vụ cụ thể của câu lệnh, các tùy chọn được ghi dưới bảng sau đây |

#### Các tùy chọn của conv

|Tùy chọn | Tác dụng  |
|-----------|----------|
|ascii | Chuyển đôi từ mã EBCDIC sáng ASCII |
|ebcdic | Chuyển đổi từ mã ASCII sang EBCDIC |
|lcase | Chuyển đổi từ chữ thường lên hết thành chữ in hoa |
|ucase | Chuyển đổi từ chữ in hoa sang chữ thường |
|nocreat | Không tạo ra file đầu ra |
|noerror | Tiếp tục sao chép dữ liệu khi đầu vào bị lỗi |
|sync | Đồng bộ dữ liệu với ổ đang sao chép sang |


*Lưu ý:* Khi bạn định dạng số lượng byte mỗi lần đọc. Mặc định nó được tính theo đơn vị là kb. Bạn có thể thêm một số trường sau để báo định dạng khác:

- c = 1 byte
- w = 2 byte
- b = 512 byte
- kB = 1000 byte 
- K = 1024 byte 
- MB = 1000000 byte
- M = (1024 * 1024) byte
- GB = (1000 * 1000 * 1000) byte
- G = (1024 * 1024 * 1024) byte

Để hiểu hơn về câu lệnh `dd`, chúng ta cần hiểu thêm về về các sector,tracks, Cylinders,.. các thuật ngũ liên quan đến ổ cứng, và kiến thức về MBR... [Các bạn có thể xem đây đủ tại đây](https://kipalog.com/posts/Series--Linux-System-Administrator-s-guide---Phan-4-1).

Để hiễu hơn về các ví dụ, các thực hành với câu lệnh `dd`, các bạn có thể xem [bài viết này](https://github.com/hocchudong/command-linux/blob/master/command-dd.md#user-content-2-kh%C3%A1i-ni%E1%BB%87m-v%C3%A0-%E1%BB%A9ng-d%E1%BB%A5ng-c%E1%BB%A7a-c%C3%A2u-l%E1%BB%87nh).


addmore