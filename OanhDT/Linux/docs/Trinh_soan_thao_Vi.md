<a name ="Trình soạn thảo văn bản Vi"></a>

# Trình soạn thảo văn bản Vi
- Sử dụng Vi kèm theo tên file `Vi tên-file`
- Ấn phím lệnh *i* hoặc *a* từ chế độ command mode để chuyển sang insert mode.
    - i để thêm ký tự trước con trỏ
    - a để thêm ký tự sau con trỏ.
- Ấn Esc để chuyển từ insert mode sang command mode.
## 1. Các lệnh edit cơ bản 
- `u` khôi phục lại những thay đổi trước đó 
- `:wq ` hoặc `ZZ` để lưu thay đổi 
- `:q!` thoát mà không lưu thay đổi trước đó 
- `:w` ghi vào tập tin 
- `wq` ghi và thoát khỏi trình soạn thảo 
- `w!` buộc ghi 
- `:q ` thoát khỏi tập tin nếu không có thay đổi 

## 2. Cắt và dán 
- `yy` sao chép dòng hiện tại vào buffer.
- `Nyy` sao chép N dòng.
- `p` dán nội dung từ buffer vào dưới.
- `P`  dán nội dung từ buffer vào bên trên.
## 3. các lệnh tìm kiếm 
- Sử dụng `/` hoặc `?` đi theo sau là từ muốn tìm để tìm kiếm từ trong phần văn bản sau ( trước ) con trỏ
- Sau khi kết quả tìm kiếm đầu tiên hiện ra, sử dụng n để tìm kiếm tiếp trong phần văn bản còn lại sau con trỏ, N để tìm kiếm ngược trở lại đầu văn bản trước con trỏ.
- *Ví dụ* `*/and` tìm từ kế tiếp của and
- *Ví dụ* `*?and` tìm từ kết thúc là and 
## 4. Các lệnh xóa 
- Xóa một dòng: `dd`
- Xóa một từ: `dw`
- Xóa từ vị trí hiện tại tới đầu dòng: `d0` hoặc `d^`
- Xóa từ vị trí hiện tại tới cuối dòng: `d$`
- Xóa 10 dòng bên dưới: `d10j`
- Xóa 5 dòng bên trên: `d5k`
- Xóa 10 từ tiếp theo: `d10w`
-` xdw` xóa `x` từ
- Xóa tất cả các dữ liệu trong file : `:%d ` 
## 5. Di chuyển trong 1 file

|Lệnh|Miêu tả|
|---|---|
|0|đặt vị trí con trỏ ở đầu dòng|
|$|đặt vị trí con trỏ ở cuối dòng|
|nG|di chuyển con trở đi|
|:n|di chuyển tới dòng thứ n của file|
|M|di chuyển tới giữa màn hình|
|(|đặt vị trí con trỏ ở đầu câu văn hiện tại|
|)|đặt vị trí con trỏ ở cuối câu văn hiện tại|

## 6. Chèn file trong vi 

|Lệnh|Miêu tả|
|---|---|
|i|chèn văn bản trước con trỏ|
|I|chèn văn bản ở đầu dòng hiện tại|
|a|chèn văn bản ở sau vị trí con trỏ hiện tại|
|A|chèn văn bản ở phần cuối dòng hiện tại|
|o|tạo một dòng trống ở trên vị trí con trỏ hiện tại đề chèn văn bản|
|O|tạo một dòng trống ở dưới vị trí con trỏ hiện tại đề chèn văn bản|
