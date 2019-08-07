# Hard link and Soft link
- Trong 1 hệ thống file , mỗi file có 1 và chỉ 1 ***inode***  , mỗi ***inode*** cũng chỉ có 1 ***số inode*** duy nhất . Nhưng 1 file có thể có nhiều ***tên file*** tùy theo số ***hard link*** trỏ đến nó .
## **Hard Link :**
- Là 1 ***liên kết** ( link )* trỏ đến vị trí lưu 1 file trên ổ cứng .
- Nếu đổi tên , xóa hoặc di chuyển file gốc sang thư mục khác , ***hard link*** vẫn mở được file đó vì nó vẫn trỏ đến vị trí lưu file cố định trên ổ cứng .
- Tên ***hard link*** có thể khác tên file gốc , ***hard link*** có thể nằm trong 1 thư mục khác với thư mục của file gốc . Vì vậy , 1 file có thể có nhiều tên file nằm ở các thư mục khác nhau . Khi truy cập vào ***hard link*** ( VD : click chuột ) sẽ truy cập thẳng đến file ( mở file hoặc thực thi file ) .
- Nếu đồng thời mở 1 file từ các ***hard link*** và tên file gốc , khi sửa ở 1 bản , các bản khác cũng thay đổi theo sau khi refresh hoặc reload vì thực chất là sửa trên cùng 1 file .
- Nếu muốn xóa 1 ***hard link*** hoặc xóa tên file gốc nhưng còn 1 ***hard link*** , file vẫn không bị xóa . File chỉ bị xóa khi không còn gì trỏ đến vị trí lưu nó => Muốn xóa 1 file , phải xóa tên file và tất cả các ***hard link*** của nó .
- ***Hard link*** không tạo được với thư mục và không tạo được với file nằm trên partition khác .
- ***Hard link*** được tạo bởi lệnh `ln` :
    ```
    # ln <path/file_name> <hard-link_name>
    ```
## **Soft link :**
- Còn được gọi là **Symbolic Link** hoặc **symlink** .
- Là 1 ***liên kết*** tạo ra 1 đường dẫn khác đến thư mục hoặc file gốc .
- **VD :** File gốc `passwd` có đường dẫn là `/etc/passwd` . Trong thư mục `/home/u1` tạo ra 1 ***soft link*** đặt tên là `mat_khau` trỏ đến file đó . Khi truy cập 1 trong 2 đường dẫn đều là truy cập đến file `passwd` .
- Nếu đổi tên , xóa hoặc di chuyển file gốc sang thư mục khác thì ***soft link*** bị mất tác dụng , không truy cập được đến file đó nữa . Khác với ***hard link*** , khi xóa file có ***soft link*** , file bị xóa thật .
- Có thể tạo ***soft link** với thư mục và file nằm trên partition khác .
- ***Soft link*** được tạo bởi lệnh `ln -s` :
    ```
    # ln -s <path/file_name> <soft-link_name>
    ```
## **So sánh Hard link và Soft link**
- Tên file giống như tên khai sinh và các ***hard link*** giống như các bí danh . Chúng đều tham chiếu trực tiếp đến 1 **số inode** cụ thể và từ đó tới **inode** trỏ tới các **block** đang lưu file trên ổ cứng . Đi từ ***tên file*** hay ***hard link*** đều thông qua **số inode** để đến cùng 1 vị trí trên ổ cứng .
- ***Soft link*** không tham chiếu trực tiếp đến **số inode** mà tham chiếu đến "*cấp trung gian*" là ***tên file*** ( kèm theo 1 đường dẫn ở 1 thư mục cụ thể ) , từ ***tên file*** mới đến **số inode** rồi dùng **inode** để truy cập vào file . Vì vậy nếu ***tên file*** bị thay đổi , file bị di chuyển hoặc xóa là ***soft link*** "*bơ vơ*" không truy cập được vào nội dung file nữa .
- ***Hard link*** chỉ tạo được với file nằm *cùng một partition* , không tạo được với thư mục hoặc file nằm trên partition khác .
- ***Soft link*** tạo được với cả thư mục và thư mục / file nằm trên partition khác .
- ***Hard link*** có thể làm việc với mọi ứng dụng . ***Soft link*** không được cho phép với 1 số ứng dụng .
- ***Hard link*** , ***soft link*** không làm tăng dung lượng ổ cứng .