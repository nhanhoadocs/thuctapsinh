Command mode
## VI/Vim là 1 trình xử lý văn bản phổ biến trên linux. 

Vim là bản nâng cấp của vi có thêm các hightlight đọc config đẽ dàng hơn. 

Có 3 chế độ làm việc của Vi. Đó là `Insert` `Visual` và `Command`

##  Chế độ Insert  

Để chuyển sang chế độ Insert  nhấn phím `i` hoặc ` Insert` . Ở chế độ này cho phéo ta soạn thảo bình thường như các trình soạn thảo khác.

## Chế độ Command

Khi mở file bằng vi thì mặc định nó ở chế độ Command. Nếu đang  ở chế độ insert muốn trở lại chế độ Command t nhấn tổ hợp phím `Ctrl C`.

Để mở một file bằng bằng trình duyệt Vi/Vim ta dùng lệnh: `vi tên_file`

### Các lệnh xóa 

`dw` xóa 1 từ 

`d^` xóa từ vị trí con trỏ đến đầu dòng 

`d$` xóa từ vị trí con con trỏ dến cuối dòng 

` xdw ` xóa `x` từ

`dd` xóa dòng hiện hành 

`xdd` xóa `x` dòng 

`x` xóa 1 ký tự 
## Các lệnh thay thế 

`cw`  thay thế 1 từ 

`xcw` thay thế `x` từ 

`cc` thay thế 5 dòng 

## Các lênhj tìm kiếm 

`?` tìm trở lên

`/`  tìm trở xuống 

` */and ` tìm từ kế tiếp của and 

` *?and` tìm từ kết thúc là `and`

` */nand ` tìm dòng bắt đầu bằng `and`

`n` tìm hướng xuống 

`N` tìm hướng lên 

## Nhóm lệnh tìm kiếm và thay thế 

` :s/text1/text2/g` thay thế text1 bằng text2 

` :g/từ_1/s/từ_2/g` thay thế từ_1 bằng từ_2

## Các lệnh copy, paste, undo 

Để copy dùng lệnh `y` và `p` để paste 

`yy` copy dòng hiện tại của con trỏ 

`3yy` copy 3 dòng liên tiếp 

`u` quay trở lại thao tác trước đó 

## Thao tác trên tập tin 

`:w` ghi vào tập tin 

`:wq` ghi và thoát khỏi chế độ soạn thảo 

`:q` thoát khỏi tập tin nếu không có thay đổi 

`:q!` buộc thoát thỏi vi mà ko lưu 

`:w!` buộc ghi 

