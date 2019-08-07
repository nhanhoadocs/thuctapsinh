# Cấu trúc hệ điều hành Linux
- Kiến trúc hệ điều hành **Linux** chia thành 3 phần : **Kernel** , **Shell** , **Application**

<p align=center><img src=https://i.imgur.com/rxmES6P.png width=50%><p>

## **1) Kernel ( nhân )**
- Đây là phần quan trọng và được ví như trái tim của hệ điều hành .
- Là lớp phần mềm nằm giữa phần cứng và các chương trình ứng dụng chạy trên một máy tính.
- Phần **kernel** chứa các module , thư viện để quản lý và giao tiếp với phần cứng và các ứng dụng .<br>**VD :** một bản Red Hat Linux 5 chiếm khoảng 2,5GB ổ cứng thì trong đó phần nhân, bao gồm tất cả các module, chỉ có 47MB ( 63MB ), tức là khoảng 2%.
- **Kernel** trên **CentOS** 7 có version `3.10.0` .
- Kernel cung cấp các dịch vụ cho các phần mềm ứng dụng chạy trên nó qua một tập hợp các cổng vào (entry points) được gọi là các lời gọi hệ thống (system calls).

    <p align=center><img src=https://i.imgur.com/hoTDKvB.png width=70%></p>

- Các loại kernel :
    - **Microkernel** : Microkernel có đầy đủ các tính năng cần thiết để quản lý bộ vi xử lý , bộ nhớ và IPC . Có rất nhiều thứ khác trong máy tính có thể được nhìn thấy, tiếp xúc và quản lý trong chế độ người dùng . Microkernel có tính linh hoạt khá cao, vì vậy bạn không phải lo lắng khi thay đổi 1 thiết bị nào đó , ví dụ như card màn hình , ổ cứng lưu trữ... hoặc thậm chí là cả hệ điều hành . Microkernel với những thông số liên quan footprint rất nhỏ , tương tự với bộ nhớ và dung lượng lưu trữ , chúng còn có tính bảo mật khá cao vì chỉ định rõ ràng những tiến trình nào hoạt động trong chế độ user mode , mà không được cấp quyền như trong chế độ giám sát - supervisor mode. 
    - **Monolithic Kernel** : Với Monolithic thì khác , chúng có chức năng bao quát rộng hơn so với microkernel , không chỉ tham gia quản lý bộ vi xử lý , bộ nhớ , IRC , chúng còn can thiệp vào trình điều khiển driver, tính năng điều phối file hệ thống , các giao tiếp qua lại giữa server... Monolithic tốt hơn khi truy cập tới phần cứng và đa tác vụ , bởi vì nếu 1 chương trình muốn thu thập thông tin từ bộ nhớ và các tiến trình khác , chúng cần có quyền truy cập trực tiếp và không phải chờ đợi các tác vụ khác kết thúc . Nhưng đồng thời , chúng cũng là nguyên nhân gây ra sự bất ổn vì nhiều chương trình chạy trong chế độ supervisor mode hơn , chỉ cần 1 sự cố nhỏ cũng khiến cho cả hệ thống mất ổn định . **Linux** sử dụng kernel này .
    - **Hybrid Kernel** : Khác với 2 loại kernel trên , Hybrid có khả năng chọn lựa và quyết định những ứng dụng nào được phép chạy trong chế độ user hoặc supervisor . Thông thường, những thứ như driver và file hệ thống I/O sẽ hoạt động trong chế độ user mode trong khi IPC và các gói tín hiệu từ server được giữ lại trong chế độ supervisor . Tính năng này thực sự rất có ích vì chúng đảm bảo tính hiệu quả của hệ thống , phân phối và điều chỉnh công việc phù hợp, dễ quản lý . **Windows** và **Mac OS X** sử dụng kernel này .
- Cấu trúc **module** của nhân : 
    - Mỗi **module** chức năng chỉ được tải vào **kernel** khi cần đến. Do đó **kernel** có kích thước nhỏ và có thể tải hoặc thay thế các **module** trong một nhân đang chạy mà không cần phải reboot.
    - 1 **module** thông thường sẽ gán chức năng cơ bản tới các **kernel** như điều khiển driver, file hệ thống...
    - Lúc boot, phần lõi của **kernel** được tải vào bộ nhớ từ một file trong thư mục `/boot` , thường là file `vmlinuz-<phiên bản của nhân>` ( **VD :** `vmlinuz-3.10.0-957.5.1.el7.x86_64` ) . Các **module** của **kernel** nằm trong thư mục `/lib/modules/<phiên bản của nhân>`.
    - Chữ `z` trong `vmlinuz` có nghĩa file này đã được nén bằng `zlib`
- Cách kiểm tra phiên bản kernel hiện tại :
    ```
    # uname -r
    3.10.0-957.5.1.el7.x86_64
    ```
    - Trong đó :
        - `3` là phiên bản kernel .
        - `10` đề cập đến phiên bản sửa đổi chính hiện tại
        - `0` đề cập đến phiên bản sửa đổi phụ hiện tại
        - `957.5.1` đề cập đến bản vá cuối cùng được cập nhật cho phiên bản này
        - `e17` có nghĩa kernel này dành cho tất cả các phiên bản RHEL/CentOS 7.x
- Kiểm tra tất cả các phiên bản **kernel** đã cài đặt trên **CentOS** :
    ```
    # rpm -q kernel
    kernel-3.10.0-957.el7.x86_64
    kernel-3.10.0-957.5.1.el7.x86_64
    ```
- Xóa các bản kernel cũ hơn không dùng đến :
    ```
    # yum remove kernel-3.10.0-957.el7.x86_64
    ```
## **2) Shell**
- **Shell** là 1 chương trình có chức năng thực thi các command từ người dùng hoặc từ các ứng dụng - tiện ích yêu cầu chuyển đến cho **Kernel** xử lý .
- Hoạt động của **shell** : *phân tích cú pháp lệnh -> thông dịch yêu cầu của lệnh -> truyền thông điệp tới kernel -> nhận kết quả trả về từ kernel và hiển thị ra màn hình kết quả của lệnh*.
- Bên cạnh đó , **Shell** còn có khả năng bảo vệ **Kernel** từ các yêu cầu không hợp lệ .
- Có các loại **shell** : 
    - ***sh ( the Bourne Shell )*** : đây là **shell** nguyên thủy của **UNIX** được viết bởi Stephen Bourne vào năm `1974` . Đến nay **shell sh** vẫn được sử dụng rộng rãi . **sh** đơn giản, dung lượng nhỏ, ít tính năng nhất so với các Shell ra đời sau này . **sh** thiếu hẳn các tính năng cần thiết như:
        - Tự động hoàn thành tên file , câu lệnh . Tức là , bạn chỉ cần gõ vào ký tự đầu của file , tên lệnh và nhấn phím Tab thì Shell đưa ra 1 số tên file , câu lệnh bắt đầu bằng ký tự đó .
        - Lưu lại các câu lệnh đã gõ vào bộ nhớ ( `history` ) và cho phép duyệt , chỉnh sửa hoặc sử dụng lại các câu lệnh này .
    - ***bash ( Bourne-again Shell )*** : là **shell** mặc định trên **Linux** được viết bởi **Brian Fox** và **Chet Ramey** cho dự án **GNU** ( mục đích của **GNU** là phát triển 1 hệ điều hành hoàn toàn miễn phí, toàn diện, hiệu năng cao và tương thích với Unix ) . **Bash** được cải tiến từ **sh** , nó hỗ trợ nhiều câu lệnh hơn .
    - ***csh ( the C shell )*** : **shell** được viết bằng ngôn ngữ lập trình C , được viết bởi Bill Joy năm `1978` - ông chính là tác giả của trình soạn thảo văn bản `vi` nổi tiếng và sau này là đồng sáng lập ***Sun Microsystems*** .
    - Ngoài ra còn có các loại **shell** khác như ***ash ( the Almquist shell )*** , ***tsh ( the TENEX shell )*** , ***zsh ( the Z shell )*** .
- Dấu nhắc **shell** ( **shell prompt** ) : là 1 ký tự hoặc 1 tập ký tự luôn đứng tại điểm bắt đầu của bất kỳ dòng lệnh nào , nó ám chỉ rằng Shell đã sẵn sàng nhận lệnh từ người dùng . `Shell prompt` thường kết thúc với ký tự `$` cho người dùng thông thường và ký tự `#` cho user `root` .
    ```
    [root@localhost ~]#
    [username@localhost root]$
    ```
> ## **3) Applications**
- Là các ứng dụng và tiện ích mà người dùng cài đặt trên Linux .<br> **VD :** ftp , samba , proxy ,...