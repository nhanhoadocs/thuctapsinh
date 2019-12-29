### BACKUP THE DATA ###  
**1. Sao lưu dữ liệu**  
Sao lưu dữ liệu trên máy tính cá nhân hoặc máy chủ rất quan trọng bởi vì ngăn ngừa việc mất dữ liệu.  
Có nhiều cách sao lưu dữ liệu, cách cơ bản là dùng lệnh `cp` hoặc cách mạnh hơn là dùng `rsync`.  
Cả 2 cách trên đều dùng để đồng bộ hóa toàn bộ cây thư mục nhưng sử dụng `rsync` hiệu quả hơn vì nó kiểm tra tệp được sao chép đã tồn tại hay chưa. Nếu tệp tồn tại và chúng không thay đổi kích thước và thời gian chỉnh sửa, `rsync` sẽ không sao chép, như vậy sẽ tránh được một bản sao không cần thiết và tiết kiệm thời gian. Hơn nữa `rsync` chỉ sao chép những phần của tệp đã thực sự thay đổi nên nó có thể rất nhanh.   
`rsync` rất hiệu quả khi sao chép đệ quy từ cây thư mục này sang cây thư mục khác.   

**2. Lệnh rsync**
```
# rsync option source destination
```
trong đó:  
*option*: các tùy chọn,  
*source*: dữ liệu nguồn,  
*destination*: dữ liệu đích   
Ta có thể xem một số tùy chọn:  
`-v`  hiển thị trạng thái kết quả.  
 `-r` copy dữ liệu recursively nhưng không đảm bảo thông số của file và thư mục.  
`-z`  nén dữ liệu khi transfer, tiết kiệm băng thông nhưng tốn thêm một ít thời gian.   
`-a` cho phép copy dữ liệu recurisively đồng thời giữ nguyên thông số của file và thư mục.  
`-h`  human-readable, output kết quả dễ đọc  
`--delete` xóa dữ liệu ở destination nếu source không tồn tại dữ liệu đó.  
`--exclude` loại trừ dữ liệu không muốn truyền, nếu cần loại ra nhiều file hoặc folder ở nhiều đường dẫn khác nhau thì mỗi cái cần phải thêm tùy chọn *--exclude* tương ứng.    

Ví dụ về backup dữ liệu  
- **Backup trên cùng 1 server**  
Sao lưu dữ liệu ở thư mục `data` sang thư mục `/tmp/backup/` 
```
rsync -avzh data /tmp/backup/
```
- **Backup lên một server khác**  
    + Để backup dữ liệu từ thư mục `data` trong máy của mình đến thư mục `/home` trên server có địa chỉ IP 192.168.1.10 ta gõ lệnh:  `rsync -avh data root@192.168.1.10:/home/`  
    + Để backup dữ liệu từ thư mục /home của máy chủ trên server có địa chỉ IP 192.168.1.10 đến thư mục data trong máy tính của mình ta gõ lệnh:  `rsync -avh data root@192.168.1.10:/home/`  

**Sử dụng các tùy chọn --include, --exclude và --delete**  
Tùy chọn *--include* cho phép chúng ta thêm 1 file hoặc thư mục trong quá trình đồng bộ dữ liệu.  
Ví dụ muốn backup thư mục /home trên server 192.168.1.10 nhưng muốn bỏ qua những file và thư mục có tên bắt đầu *file* lên thư mục backup1 trên máy của mình ta thực hiện:
```
rsyns -avh --exclude 'file*' root@192.168.1.10:/home/ backup1
```
Tương tự với lệnh *--include*.  
Để xóa dữ liệu đích nếu ở nguồn không tồn tại dữ liệu đó thì ta sử dụng tùy chọn *--delete*.  
```
rsyns -avh --delete root@192.168.1.10:/home/ backup1
```

**3. Nén dữ liệu (Compress the data)**  
Dữ liệu thường được nén để tiết kiệm dung lượng đĩa và giảm thời gian truyền qua mạng.  
Hệ điều hành Linux dùng một số phương pháp để nén:   
- `gzip`: Tiện ích được dùng thường xuyên nhất trong hệ điều hành  
- `bzip2`: Tạo các tệp nhỏ hơn so với tệp tạo bằng gzip 
- `xz`: Tiện ích nén hiệu quả về không gian nhất trong hệ điều hành    
- `zip`: Thường được yêu cầu kiểm tra và giải nén tài liệu lưu trữ từ các hệ điều hành khác   

Các kỹ thuật này khác nhau về hiệu quả của việc nén (tiết kiệm bao nhiêu dung lượng) và thời gian nén. Nếu việc nén hiệu quả thì cần phải tốn thời gian hơn. 
Ngoài ra tiện ích `tar` được dùng để nén các tệp trong kho lưu trữ và sau đó nén toàn bộ kho lưu trữ cùng một lúc.   

**3.1 Nén dữ liệu bằng gzip**  
Cú pháp: 
```
gzip [option] [file_name]
```
- Nén tất cả các tệp có trong thư mục hiện hành, các tệp được nén được đổi tên phần mở rộng là `.gz`.  
```
gzip *
```
Để giải nén tệp, ta dùng các lệnh sau:  
```
gunzip [file_name]
gzip -d [file_name]
```
**3.2 Nén dữ liệu bằng bzip2**  
- Nén tất cả các tệp có trong thư mục hiện hành và đổi tên phần mở rộng thành `bz2`.  
```
bzip2 *
```
- Giải nén tất cả các tệp có phần mở rộng là `.bz2`
```
bunzip2 *bz2
```
Hoặc sử dụng lệnh tương đương `bzip -d [ten_file_nen].  

**3.3 Nén dữ liệu bằng xz**
- Nén tất cả các tệp trong thư mục hiện hành, các tệp được nén được đổi tên phần mở rộng là `.xz` 
```
xz *
```
- Nén tệp `foo` thành `foo.xz` bằng mức nén mặc định (-6) và xóa `foo` nếu nén thành công
```
xz foo
```
- Giải nén `bar.xz`thanhf `bar` và không khóa `bar.xz` khi giải nén thành công
```
xz -dk bar.xz
```
**3.4 Nén dữ liệu bằng zip**  
- Nén tất cả các tệp trong thư mục hiện hành và đưa chúng vào tệp `backup.zip`.  
```
zip backup *
```
**3.5 Nén dữ liệu bằng tar**  

`tar` là viết tắt của *tape archive* (kho lưu trữ băng), được sử dụng bởi số lượng lớn quản trị viên hệ thống Linux/Unix để xử lý sao lưu ổ đĩa băng. Lệnh `tar` được sử dụng để trích xuất một tập hợp các tệp và thư mục thành tệp lưu trữ được nén cao thường được gọi là **tarbal** hoặc *tar*, *gzip*, *bzip* trong Linux. `tar` được sử dụng rộng rãi nhất để tạo các tệp lưu trữ nén và có thể dễ dàng di chuyển từ đĩa này sang đĩa khác hoặc từ máy này sang máy khác.  
- Tạo tập tin lưu trữ tar:  
Ví dụ tạo một tệp lưu trữ `data-09-10-19.tar` cho một thư mục `/home/ngahong` trong thư mục làm việc hiện tại. 
```
# tar -cvf data-09-10-19.tar /home/ngahong/
```
Trong đó:  
c - Tạo 1 tệp lưu trữ `.tar` mới  
v - Hiển thị rõ ràng tiến trình tập tin `.tar`.  
f - loại tên tệp của tệp lưu trữ.  

- Tạo tập tin lưu trữ tar.gz  
Để tạo 1 tập tin lưu trữ nén, ta sử dụng tùy chọn `-z`:  
```
# tar -cvzf data-09-10-19.gz /home/ngahong/
```
Chú ý: Ý nghĩa của các tùy chọn:
- c - tạo một tệp lưu trữ.
- x - giải nén một tập tin lưu trữ.
- v - hiển thị tiến trình của tập tin lưu trữ.
- f - tên tệp của tệp lưu trữ.
- t - xem nội dung của tập tin lưu trữ.
- j - lưu trữ bộ lọc thông qua bzip2.
- z - lưu trữ bộ lọc thông qua gzip.
- r - nối hoặc cập nhật tệp hoặc thư mục vào tệp lưu trữ hiện có.
- W - Xác minh tệp lưu trữ.
- ký tự đại diện - Chỉ định các mẫu trong lệnh unix tar.  

**4. Copy từ đĩa đến đĩa**  
4.1 Tính năng của lệnh `dd`  
Tiện ích `dd` rất hữu ích trong hệ điều hành Linux dùng để chuyển đổi và sao lưu tệp tin, tạo các bản sao của không gian đĩa.  
Có thể sử dụng lệnh `dd` với những trường hợp cơ bản sau:  
- Sao lưu hoặc phục hồi dữ liệu ổ cứng hoặc một phân vùng định trước.  
- Sao lưu lại MBR trong máy. MBR là file rất quan trọng, nó chứa các lệnh để GRUB hoặc LILO nạp hệ điều hành.  
- Chuyển chữ hoa sang chữ thường và ngược lại.  
- Tạo file có kích thước cố định.  
- Tạo file ISO.  

4.2 Cú pháp
```
# dd if=source of=destination [option]
```
- *source* ở đây là ổ đĩa, thư mục, file ta muốn sao lưu.  
- *destination* ở đây là ổ đĩa, thư mục, file ta muốn ghi data vào.  

Các tùy chọn [option] cơ bản:  
- `bs`=byte quá trình đọc ghi bao nhiêu bytes 1 lần  
- `cbs`=bytes chuyển đổi bao nhiêu bytes 1 lần    
- `count`=x thực hiện `x` block trong quá trình thực hiện lệnh.  
- `ibs/obs` chỉ ra số byte một lần đọc ghi.  
- `skip`=x bỏ qua `x` block đầu vào  
- `conv`=option. Có thể có các option sau:  
    + ucase/lcase: Chuyển chữ thường thành chữ hoa và ngược lại.  
    + noerror: Tiếp tục sao chép dữ liệu khi đầu vào bị lỗi.  
- rsync: Đồng bộ dữ liệu với ổ đang sao chép sang. 

Lưu ý: Đơn vị mặc định mỗi lần đọc được tính theo kb. Chúng ta có thể sử dụng một số tùy chọn sau để thay đổi định dạng:
- c = 1  
- w = 2  
- b = 512  
- kB = 1000  
- K = 1024
- MB = 1000*1000  
- M = 1024*1024  
- GB = 1000* 1000* 1000
- G = 1024* 1024* 1024    

4.3 Ví dụ  
- Sao chép từ sda sang sdb, tiếp tục khi báo lỗi và đồng bộ dữ liệu sao chép.  
```
dd if=/dev/sda of=/dev/sdb conv=noerror, sync
```
- Tạo một file image cho ổ đĩa sda1
```
dd if=/dev/sda1 of=/root/sda1.img
``` 
- Phục hồi dữ liệu
```
dd if=/root/sda1.img of=/dev/sda1
```
- Sao chép MBR (Master Boot Record). Ví dụ sao lưu bản ghi khởi động chính (MBR) cần 512 bytes đầu tiên trên đĩa chứa bảng mô tả phân vùng trên đĩa đó.
```
dd if=/dev/sda of=/root/mbr.txt bs=512 count=1
```
- Phục hồi MBR
```
dd if=/root/mbr.txt of=/dev/sda1
```
- Tạo 1 file kích thước 100M 
```
dd if=/root/test.doc of=/root/test1.doc bs=100M count=1
```
- Chuyển nội dung file test.doc sang chữ hoa
```
dd if=/root/test.doc of=/root/test1,doc conv=ucase
```
