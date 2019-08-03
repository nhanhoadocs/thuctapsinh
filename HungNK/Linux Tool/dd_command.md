# dd command

## dd dùng để làm gì

Dùng để copy, sao lưu, chuyển đổi dữ liệu với những options tương ứng. Có thể sử dụng trong trường hợp cơ bản sau:
- Sao lưu hoặc phục hồi dữ liệu ổ cứng hoặc 1 phân vùng theo xác định trước.
- Chuyển đổi định dạng dữ liệu từ ASCII sang EBCDIC hoặc ngược lại
- Sao lưu lại MBR trong máy. MBR là file rất quan trọng, nó chứa các lệnh để GRUB hoặc LILO nạp HĐH.
- Chuyển chữ hoa sang chữ thường và ngược lại.
- Tạo 1 file với kích thước cố định.
- Tạo file ISO.

## cú pháp và các trường tùy chọn

### Cú pháp

    #dd if=<địa chỉ đầu vào> of=<địa chỉ đầu ra> option

Trong đó:

- if= địa chỉ nguồn của dữ liệu nó sẽ bắt đầu đọc
- of= viết đầu ra của file
- option : các tùy chọn cho câu lệnh

### option 

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

**Các tùy chọn của conv**

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

Nguồn tham khảo

[Link](https://github.com/hocchudong/command-linux/blob/master/command-dd.md#user-content-c-chuy%E1%BB%83n-%C4%91%E1%BB%95i-ch%E1%BB%AF-th%C6%B0%E1%BB%9Dng-th%C3%A0nh-ch%E1%BB%AF-in-hoa)

[Link](https://tuhoctonghop.blogspot.com/2016/09/su-dung-lenh-dd-co-ban-tren-linux.html)    