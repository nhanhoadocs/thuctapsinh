# Filename, Hardlink and Softlink on Linux

**Filename**
- Một số khái niệm:
  - Về phía người sử dụng, file chứa data và được phân biệt với nhau bằng file name.
  - Về phía hệ thống, file được phân biệt bằng chỉ số index node, viết tắt là inode. Mỗi file name có 1 inode đi kèm. Chỉ số inode tham chiếu đến 1 vùng nhớ trong đó có chứa địa chỉ vùng nhớ lưu trữ data.
  - Mỗi inode cũng chỉ có một số inode duy nhất.
  - Nhưng một file có thể có nhiều tên file tùy theo số hard link trỏ đến nó.
  
**Hard Link**
- Là một liên kết (link) trỏ đến vị trí lưu một file trên ổ cứng:
  - Nếu đổi tên, xóa hoặc di chuyển file gốc sang thư mục khác, hard link vẫn mở được file đó vì nó vẫn trỏ đến vị trí lưu file cố định trên ổ cứng.
  - Tên hard link có thể khác tên file gốc, hard link có thể nằm trong một thư mục khác với thư mục của file gốc. Vì vậy một file có thể có nhiều tên file nằm ở các thư mục khác nhau. Khi truy cập vào hard link (ví dụ nhấn chuột) sẽ truy cập đến file (mở hoặc chạy).
  - Nếu đồng thời mở một file từ các hard link và tên file gốc, khi sửa ở một bản, các bản khác cũng sẽ thay đổi theo sau khi refresh hoặc reload vì thực chất là sửa trên cùng một file.
  - Nếu xóa hard link hoặc xóa tên file gốc nhưng còn một hard link, file vẫn không bị xóa. File chỉ bị xóa khi không còn cái gì trỏ đến vị trí lưu nó. Như vậy muốn xóa một file, phải xóa tên file và tất cả các hard link của nó.
  - Hard link không tạo được với thư mục và không tạo được với file nằm trên một partition khác.
  - Hard link được tạo bởi lệnh ln: ln <path/tên file> <tên hard link>.

![](https://miro.medium.com/max/1307/1*RG7QIumsTVILMUzsE3YyOA.jpeg)

**Soft link** 
- Còn gọi là Symbolic link hoặc symlink. là một liên kết tạo một đường dẫn khác đến thư mục hoặc file gốc.
  - Ví dụ file gốc passwd có đường dẫn là /etc/passwd. Trong thư mục /home/zxc ta tạo một soft link đặt tên là “mật khẩu” trỏ đến file đó. Như vậy đường dẫn mới đến file /etc/passwd là /home/zxc/mật khẩu. Khi truy cập đến một trong hai đường dẫn trên đều là truy cập đến file passwd.
  - Nếu đổi tên, xóa hoặc chuyển file gốc sang thư mục khác thì soft link mất tác dụng, không truy cập được đến file đó nữa. Khác với hard link, khi xóa file có soft link, file bị xóa thật.
  - Có thể tạo soft link với thư mục và file nằm trên partition khác.
  - Soft link tạo bằng lệnh ln -s <path/tên file> <tên soft link>

## Sự giống và khác nhau giữa tên file, hardlink và softlink?
- Tên file giống như tên khai sinh và tên các hardlink giống như các bí danh (tên gọi khác). Chúng đều tham chiếu trực tiếp tới một số inode cụ thể và từ đó tới inode trỏ tới các block đang lưu file trên ổ cứng.
- Đi từ tên file hay hardlink đều thông qua số inode để đến cùng một chỗ trên ổ cứng.

**Softlink**

- không tham chiếu trực tiếp đến số inode mà tham chiếu đến “cấp trung gian” là tên file (kèm theo đường dẫn ở một thư mục cụ thể), từ tên file mới đến số inode rồi inode để truy cập vào file.
Vì vậy nếu “cấp trung gian” là tên file thay đổi, file bị di chuyển hoặc xóa là softlink “bơ vơ” không truy cập được vào nội dung file nữa.
- Softlink tạo được với thư mục và tạo được với thư mục, file nằm trên partition khác.

**Hardlink**
- Chỉ tạo được với file nằm trên cùng một partition, không tạo được với thư mục hoặc với file nằm trên partition khác.
