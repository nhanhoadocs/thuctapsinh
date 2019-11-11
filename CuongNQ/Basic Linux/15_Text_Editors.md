# Text Editors
## **1) `vi` ( vim )**
- `vi` là trình soạn thảo có mặt trên các hệ điều hành Unix/Linux .
- `vi` thường được dùng trong việc chỉnh sửa các file cấu hình trong Linux .
### **1.1) Các chế độ làm việc của `vi`**
- Để tạo hoặc chỉnh sửa file ta thực hiện lệnh :
    ```
    # vi [file]
    ```
- Khi thực hiện lệnh này ta sẽ vào **Command Mode** : ở chế độ này ta sẽ sử dụng các lệnh để làm việc .
- Nếu muốn chỉnh sửa văn bản , ta chuyển sang chế độ **Text Mode** . Để chuyển từ chế độ **Command Mode** sang **Text Mode** ta bấm phím `I` hoặc `A` hoặc phím `Insert` .
- Để thoát chế độ **Text Mode** về **Command Mode** ta bấm phím `Esc` .
- Để thoát khỏi `vi` , ta phải ở chế độ **Command Mode** và thực hiện lệnh thoát :
    - Thoát và không lưu thay đổi : `:q!`
    - Thoát và lưu : `:x` hoặc `:wq!`
### **1.2) Các lệnh trong Command Mode**
- Nhóm lệnh điều hướng :
    - `h` : sang trái 1 space
    - `e` : sang phải 1 space
    - `b` : sang trái 1 từ
    - `w` : sang phải 1 từ
    - `k` : lên 1 dòng
    - `j` : xuống 1 dòng
    - `)` : cuối câu
    - `(` : đầu câu
    - `}` : cuối đoạn văn
    - `{` : đầu đoạn văn
- Nhóm lệnh xóa :
    - `x` : xóa 1 kí tự
    - `dw` : xóa 1 từ
    - `3dw` : xóa 3 từ
    - `d^` : xóa kí tự từ con trỏ đến đầu dòng
    - `d$` : xóa kí tự từ con trỏ đến cuối dòng
    - `dd` : xóa dòng hiện hành
    - `5dd` : xóa 5 dòng hiện hành
- Nhóm lệnh thay thế :
    - `cc` : thay thế 1 từ
    - `3cw` : thay thế 3 từ
    - `cc` : thay thế 1 dòng
    - `5cc` : thay thế 5 dòng
- Nhóm lệnh tìm kiếm :
    - `?text` : tìm trở lên
    - `/text` : tìm trở xuống
    - `*/and` : tìm từ kế tiếp của `and`
    - `*/?and` : tìm từ kế thúc là `and`
    - `*/nThe` : tìm dòng kế tiếp bắt đầu bằng `The`
        - `n` : tìm hướng xuống
        - `N` : tìm hướng lên
- Nhóm lệnh tìm kiếm và thay thế :
    - `:%s/text1/text2/g` : thay thế `text1` bằng `text2`
    - `:1.$s/tập_tin/thư_mục` : thay tập tin bằng thư mục này từ hàng 1
    - `:g/one/s/1/g` : thay thế `one` bằng `1`
- Nhóm lệnh *copy , paste , undo* :
    - `u` : undo lại thao tác trước đó
    - `y$` : copy từ vị trí hiện tại của con trỏ đến cuối
    - `yy` : copy toàn bộ dòng tại vị trí cursor
    - `3yy` : copy 3 dòng liên tiếp
    - `p` : paste vào vị trí con trỏ chuột
- Nhóm lệnh *save* và *exit* :
    - `w` : lưu vào tập tin
    - `wq` : lưu và thoát khỏi `vi`
    - `:w newfile` : lưu nội dung vào file mới
    - `q` : thoát nếu không có thay đổi
    - `q!` : thoát mà không lưu thay đổi
    - `wq!` : thoát và ghi đè tập tin read-only
    - `r` : mở tập tin đọc
- Các lệnh khác :
    - `:set nu` : hiển thị số thứ tự dòng trong file
    - `:set nonu` : không hiển thị số dòng của file
    - `:<number>` : di chuyển con trỏ đến dòng thứ mấy<br><br>
    <img src=https://i.imgur.com/bhyyIuY.png>
## **2) `nano`**
## **3) `emacs`**
