# Operating System Unix

![img](https://techvccloud.mediacdn.vn/zoom/650_406/2018/12/27/595267cec5-1545909723024862426370-crop-15459097260001293012447.jpg)

#### 1. Unix là gì?
- **Hệ điều hành Unix** là tập hợp các chương trình mà thực hiện vai trò như một đường dẫn giữa máy tính và người sử dụng.
- Các chương trình máy tính phân cấp các nguồn hệ thống và phối hợp tất cả các phần bên trong của máy tính được gọi là Hệ điều hành hoặc kernel (hạt nhân).
- Người sử dụng giao tiếp với kernel thông qua một chương trình được gọi là **Shell**. 
  - **Shell** là một bộ biên dịch dòng lệnh, nó biên dịch các lệnh được nhập bởi người sử dụng và chuyển đổi chúng thành một ngôn ngữ mà kernel có thể hiểu.
- Có rất nhiều phiên bản Unix khác nhau trên thị trường. **Solaris Unix, AIX, HP Unix và BSD** là một số ví dụ. Linux cũng là một phiên bản của Unix mà là miễn phí.
- Nhiều người có thể sử dụng một máy tính Unix cùng một lúc. Vì thế Unix được gọi là hệ thống đa người dùng.
- Một người sử dụng có thể chạy nhiều chương trình cùng một lúc; vì thế Unix được gọi là đa nhiệm.

#### 2. Cấu trúc Unix/Linux.
- Sơ đồ cấu trúc của một hệ thống Unix:

![img](https://st.quantrimang.com/photos/image/2018/08/18/unix-linux-la-gi-1.jpg)

- Khái niệm chính mà được thống nhất trong tất cả các phiên bản Unix gồm 4 cơ sở sau:
  - **Kernel:** Kernel là trái tim của hệ điều hành. Nó tương tác với phần cứng và hầu hết nhiệm vụ như quản lý bộ nhớ, quản lý file, lên chương trình nhiệm vụ.
  - **Shell:** Shell là một tiện ích mà xử lý các yêu cầu của ta. Khi ta gõ một lệnh tại terminal, shell sẽ biên dịch lệnh đó và gọi chương trình mà ta muốn. Shell sử dụng cú pháp chuẩn cho tất cả các lệnh. C Shell, Bourne Shell và Korn Shell là những shell được biết đến nhiều nhất và có sẵn trong hầu hết các phiên bản Unix.
  - **Các lệnh và các tiện ích:** Có rất nhiều lệnh và tiện ích mà ta có thể sử dụng trong công việc hàng ngày.
    - VD: tạo folder: mkdir <folder_name> và 1 số lệnh **cp, mv, cat và grep…** là một số ví dụ của lệnh và tiện ích. Có trên 250 lệnh tiêu chuẩn cộng với một số lệnh khác được cung cấp bởi phần mềm thứ 3. Tất cả các lệnh này đi cùng với các tùy chọn (chức năng) của nó.
  - **File và thư mục:** Tất cả dữ liệu trong Unix được tổ chức trong các file. Tất cả các file được tổ chức vào trong các thư mục. Những thư mục này được tổ chức trong một cấu trúc dạng cây được gọi như là hệ thống file.
 
#### 3. Unix hoạt động như thế nào và tại sao Unix lại quan trọng?
- Unix sở hữu một hệ khái niệm khiến cho hệ điều hành này trở nên độc đáo. Ví dụ, Unix sử dụng văn bản dạng đơn giản để lưu trữ dữ liệu. Unix cũng sử dụng các hệ thống tệp phân cấp, tương tác với các thiết bị và một số kiểu giao tiếp liên quá trình (IPC) nhất định.

![img](https://techvccloud.mediacdn.vn/thumb_w/650/2018/12/27/78546-636322767446917539-16x9-1545909767226623546465.jpg)

- Người dùng Unix có thể liên kết các tool phần mềm và chương trình nhỏ lẻ với nhau thông qua trình thông dịch command-line và bằng cách sử dụng các pipe. Trình thông dịch command-line là một chương trình ở cấp độ user, các lệnh bổ sung là các chương trình riêng biệt. Người dùng có thể lựa chọn shell hoặc viết shell của riêng mình và thêm các lệnh mới mà không cần thay đổi shell vì shell sử dụng cùng loại ngôn ngữ cho các lệnh tương tác khi tạo script.
- (OS-Operating System) Unix gồm có (kernel-Nhân): là trình điểu khiển chính cung cấp các service để khởi động và kết thúc chương trình. Kernel cũng xử lý các tác vụ cấp thấp, chẳng hạn như xử lý hệ thống tệp/file system và ngăn xung đột khi các chương trình cố gắng truy cập cùng một tài nguyên.

#### 4. Các hệ thống Unix-like nguồn mở và miễn phí.
- Unix đã phát triển dưới dạng một sản phẩm phần mềm miễn phí, với nhiều phần mở rộng và các ý tưởng mới được bổ sung qua nhiều phiên bản Unix từ các công ty, trường đại học và cá nhân khác nhau.
- Một giao diện kết hợp từ ngôn ngữ C và shell – user command - từ các phiên bản khác nhau của Unix đã được chuẩn hóa dưới sự bảo trợ của IEEE là Giao diện hệ điều hành di động - Portable Operating System Interface (POSIX). Đổi lại, các giao diện POSIX đã được thiết lập trong X/Open Programming Guide 4.2. Các giao diện này còn được gọi là Single UNIX Specification và, trong phiên bản gần đây nhất, là UNIX 03.
- Các hệ thống tương tự với chức năng của Unix, như Linux và Minix, hoạt động tương tự như các tính năng kỹ thuật của Unix. Ví dụ, họ phải có một chương trình quản lý các phiên đăng nhập và command-line.
![img](https://techvccloud.mediacdn.vn/2018/12/27/screenasmall-15459098357521929041261.jpg)

#### Tài liệu tham khảo.

https://quantrimang.com/unix-linux-la-gi-156576

https://tech.vccloud.vn/unix-la-gi-he-dieu-hanh-nguon-mo-mien-phi-noi-tieng-the-gioi-20181227182447811.htm

#END






