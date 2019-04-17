# Rsync

##  1. Tính năng nổi bật của Rsync

 * **Rsync** cho phép copy giữ nguyên thông số của file/folder như nguyên file gốc.
 
 * **Rsync** nhanh hơn *cp* vì nó sử dụng giao thức remote-update, nó chỉ copy và thay thế những data thay đổi.
 
 * **Rynsc** tiết kiệm băng thông do nó nén dữ liệu khi trasfer và giải nén tại đích.
 
 * Không yêu cầu quyền super-user.
 
## 2. Cài đặt `Rsync`

Cài trên Red Had/ CentOS 

`yum install rsync`

Cài trên Debian/Ubuntu

`apt-get install rsync`

## 3. Sử dụng Rsync 

Lệnh : `rsync option sorce destination`

### Một số option cơ bản 

 * `-v` hiển thị trạnh thái kết quả 
 
 * `-r` copy dữ liệu recursively, nhưng không đảm bảo thông số của file và thư mục 
 
 * `-a` cho phép copy dữ liệu recursively đồng thời giữ nghuyên được tất cả thông số và thư mục của file 
 
 * `-z` nén dữ kiệu khi trasfer giúp tiết kiệm băng thông nhưng mất thêm chút thời gian.
 
 * `-h` trả về kết quả dễ đọc 
 
 * `--delete` xóa dữ liệu destination nếu source không tồn tại dữ liệu đó.
 
 * `--exclude` loại trừ dự liệu không muốn truyền , nếu càn loại ra nhiều file hoặc folder ở nhiều đường dẫn khác nhau thì mỗi 
 cái cần thêm `--exckude` tương ứng.
 
### Backup trên cùng một server

VD để backup từ thư mục `data` đến thư mục `/tmp/backup`

`rsync -vah data /tmp/backup`

### Backup lên server khác 

 * VD Để backup thư mục `data` trên máy của mình đến thư mục `/root/backup` trên server có địa chỉ `192.168.1.5` 

`rsync -vah data root@192.168.1.5:/root/backup`

 * Để backup dữ liệu từ thư mục `/root/backup` trên server có địa chỉ 192.168.1.5 về thư mục `data` trên máy của mình ta thực hiện:
 
`rsync -vah root@192.168.1.5:/root/backup data`

### Sử dụng tùy chọn `-include`, `-exclude` và tùy chọn `-delete`

Tùy chọn -`include` cho phép chúng ta thêm 1 file hoặc thư mục trong quá trình đồng bộ dữ liệu 
 
VD muốn backup thư mục `/root/backup` trên server 192.168.1.5 nhưng muốn bỏ qua những file và thư mục có tên 
bắt đầu `file` lên thư mục `backup4` trên máy của mình ta thực hiện:

`rsync -vah --exclude 'file*' root@192.168.1.5:/root/backup backup4`

Tương tự với lệnh `--include`

Với tùy chọn `--delete` sẽ cho phép ta xóa dữ liệu ở đich nếu nguồn không tồn tại dữ liệu đó.

`rsync -vah --delete root@192.168.1.5:/root/backup backup4`

### Giới hạn dung lượng tối đa của file được đồng bộ 

Sử dụng tùy chọn `--max-size`

`rsync -vah --max-size='200k' root@192.168.1.5:/root/backup backup4`

### Tự động xóa dữ liệu nguồn khi đồng bộ dữ liệu thành công 

Ta thêm option `--remove-source-files` vào dòng lệnh 

`rsync --remove-source-files -zvh backup.tar /tmp/backups/`

# Sao lưu dữ liệu sử dụng lệnh `dd`

## 1. Tính năng của lệnh `dd` 

Dùng để dùng để sao lưu dữ liệu, copy, chuyển đổi dữ liệu với những option tương ứng. Có thể sử dụng với những trường hợp cơ 
 bản sau:
 
 * Sao lưu hoặc phục hồi dữ liệu ổ cứng hoặc một phân vùng xá định trước.

 * Sao lưu lại MBR trong máy. MBR là file rất quan trọng, nó chứa các lệnh để GRUB hoặc LILO nạp hệ điều hành.

 * Chuyển chữ hoa sang chữ thường và ngược lại.

 * Tạo file có kích thước cố định.

 * Tạo file ISO.

## 2. Cú pháp 

`dd if=nguồn  of=đích  các tùy chọn`

 * `nguồn` ở đây là ổ đĩa, thư mục, file ta muốn sao lưu 

 * `đích`  ở đây là ổ đĩa, thư mục, file ta muốn lưu data vào đó.
 
Các tùy chọn ta cơ bản:

 * bs=byte quá trình đọc ghi bao nhiêu bytes 1 lần 
 
 * cbs=bytes chuyển đổi bao nhiêu bytes 1 lần 
 
 * count=x thực hiện `x` block trong quá trình thực hiện lệnh 
 
 * ibs/obs: chỉ ra số byte một lần đọc ghi 
 
 * skip=x bỏ qua `x` block đầu vào 
 
 * conv=option. Option có thể là các option sau:
   
     - ucase/lcase: Chuyển chữ thường thành chữ hoa và ngược lại.
	 
	 - noerror : Tiếp tục sao chép dữ liệu khi đầu vào bị lỗi.
	 
	 -rsync: Đồng bộ dữ liệu với ổ đang sao chép sang.

*Lưu ý*: Đơn vị mặc định mỗi lần đọc được tính theo kb. Chúng ta có thể sử dụng một số tùy chọn sau để thay đổi định dạng:
 * c=1
 * w=2
 * b=512
 * kB=1000
 * K=1024
 * MB=1000*1000
 * M=1024*1024
 * GB=1000 * 1000 * 1000
 * G=1024 * 1024 * 1024
	 
## 3. Ví dụ 

`dd if=/dev/sda of=/dev/sdb conv=noerror, sync` 

Sao chép từ sda sang sdb, tiếp tục khi báo lỗi và đồng bộ dữ liệu sao chép.


`dd if=/dev/sda1 of=/root/sda1.img `

Tạo một file image cho ổ sda1 


`dd if=/root/sda1.img of=/dev/sda1`

Phục hồi dữ liệu.


`dd if=/dev/sda1 of=/root/mbr.txt bs=512 count=1`

Sao chép MBR


`dd if=/root/mbr.txt of=/dev/sda1`

Phục hồi MBR.


`dd if=/dev/zero of=/root/file1 bs=100M count=1`

Tạo 1 file kích thước 100M.


`dd if=/root/test.doc of=/root/test1.doc conv=ucase`

 Chuyển nội dung file test.doc sang chữ hoa.