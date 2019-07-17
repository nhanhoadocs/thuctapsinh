# Shell là gì ?

Về cơ bản, SHELL (hay còn gọi là hệ vỏ) là một interface nằm giữa OS Kernel và người dùng, nó cung cấp môi trường để người dùng thao tác với Kernel. Các chương trình shell sẽ làm nhiệm vụ thông dịch (interpret) các lệnh của người dùng sang chương trình có sẵn trên hệ thống từ đó thực thi các chức năng tương ứng. Các lệnh này người dùng có thể nhập trực tiếp qua chế độ tương tác (interactive) hoặc thông qua dạng script. Các shell script sẽ được thông dịch (chứ không phải biên dịch – compile). Điểm khác biệt giữa cách thức hoạt động của shell và trình biên dịch (compiler) đó là:

- Shell đọc các lệnh trong script tuần tự từ trên xuống, tìm vị trí các lệnh đó trong hệ thống để thực thi.
- Compiler sẽ biên dịch các lệnh trong script sang một dạng mà máy tính có thể hiểu được, ví dụ mã máy và sinh ra một chương trình (program) tương ứng. Chương trình này sẽ có thể được sử dụng bởi các shell script sau này.

**Chú thích**: biên dịch và thông dịch khác nhau như nào:
``` 
Biên dịch là dịch một lần hết toàn bộ mã nguồn của một chương trình còn thông dịch là chạy đến câu lệnh nào thì dịch câu lệnh đó. Ví dụ cổ điển là thông dịch giống như một thông dịch viên dịch tiếng Việt sang tiếng Anh cho một người nước ngoài trong khi giao tiếp trực tiếp, khi họ nghe đến câu nào thì dịch đến câu đó, còn biên dịch giống như dịch một cuốn sách, sau khi dịch toàn bộ cuốn sách mới đem tới cho người đọc.
```

# Shell script là gì

Shell là chương trình giao tiếp với người dùng. Có nghĩa là shell chấp nhận các lệnh từ bạn (keyboard) và thực thi nó. Nhưng nếu bạn muốn sử dụng nhiều lệnh chỉ bằng một lệnh, thì bạn có thể lưu chuỗi lệnh vào text file và bảo shell thực thi text file này thay vì nhập vào các lệnh. Điều này gọi là shell script.

Định nghĩa: Shell script là một chuỗi các lệnh được viết trong plain text file. Shell script thì giống như batch file trong MS-DOS nhưng mạnh hơn.

Tại sao phải viết shell script:

• Shell script có thể nhận input từ user, file hoặc output từ màn hình.

• Tiện lợi để tạo nhóm lệnh riêng.

• Tiết kiệm thời gian.

• Tự động làm một vài công việc thường xuyên.

# Các loại Shell

Các loại shell thông dụng

- Shell Bourne (sh)
Do Steven Bourne viết, đó là Shell nguyên thuỷ có mặt trên hầu hết các hệ thống Unix/Linux…Nó rất hữu dụng cho việc lập trình Shell nhưng nó không xử lý tương tác người dung như các Shell khác…

- Bourne Again Shell (bash)
Đây là phần mở rộng của sh, nó kế thừa những gì sh đã có và phá huy những gì sh chưa có…Nó có giao diện lập trình rất mạnh và linh hoạt…Cùng với giao diện lệnh dễ dung…Đây là Shell được cài đặt mặc định trên các hệ thống Linux.

- Shell C (csh)
Đáp ứng tương thích cho người dung…Nó hỗ trợ rất mạnh cho những Programmer C…và với đặc tính tự động hoàn thành dòng lệnh…

- Shell Korn (ksh)
Có thể nói đây là một Shell tuyệt vời, nó kết hợp tính năng ưu việt của sh và csh…

Ngoài ra còn có các shell khác như sh, nfssh, mcs, zsh, ...

Ở bài viết này chúng ta sẽ nói chủ yếu về `bash`

#  Cấu trúc file bash

Dòng đâu tiên và bắt buộc với một file bash với đuôi mở rộng là .sh là câu lệnh sau :
```
#!/bin/bash#

// tiếp theo là những câu lệnh thực thi  
```

# Thực hành lab

chúng ta cần chuẩn bị máy tính chạy hệ điều hành Linux, trình soạn thảo. Ở đây tôi dùng Centos 7 và trình soạn thảo vim

## Tạo file bash đầu tiên
```
vim hello.sh
```

sau khi tạo file chúng ta viết vào file nội dung sau đây
```
#!/bin/bash
echo Hello World
```

sau đó ta cấp quyền thực thi cho file
```
chmod +x hello.sh 
```

cuối cùng chúng ta cho chạy file
```
./hello.sh
```
Kết quả ta nhận được là dòng chữ `Hello World` hiện ra terminal





