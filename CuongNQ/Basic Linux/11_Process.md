# Process
## **1) Khái niệm**
- Một **process ( *tiến trình* )** , hiểu theo cách đơn giản , là một ví dụ của một chương trình đang chạy . Bất cứ khi nào bạn thông báo một lệnh trong Linux , nó tạo hoặc bắt đầu một **process** mới . 
- Mỗi **process** có 1 **PID ( Process ID )** đại diện . **PID** gồm tối đa `5` chữ số và là duy nhất tại 1 thời điểm . **PID** của **process** A có thể được tận dụng cho **process** B nếu **process** A đã kết thúc .
- Có 2 loại **process** :
    - **Foreground Process**
    - **Background Process**
### **1.1) Foreground Process**
- Theo mặc định , mọi **process** mà bạn bắt đầu chạy là **foreground process** . Nó nhận input từ bàn phím và gửi output tới màn hình .
- Trong khi một chương trình đang chạy trong **foreground** và cần một khoảng thời gian dài , chúng ta không thể chạy bất kỳ lệnh khác ( bắt đầu **process** khác ) bởi vì dòng nhắc lệnh không có sẵn tới khi chương trình đang chạy kết thúc **process** và thoát ra .

    <img src=https://i.imgur.com/CLTOUmE.png>

### **1.2) Background Process**
- **Background process** chạy mà không được kết nối với bàn phím của bạn . Nếu **backround process** yêu cầu bất cứ đầu vào từ bàn phím , nó đợi .
- Lợi thế của chạy một chương trình trong **background** là có thể chạy các lệnh khác : không phải đợi tới khi nó kết thúc để bắt đầu một **process** mới !
- Để bắt đầu một **background process** , thêm dấu "`&`" tại cuối lệnh .
    ```
    # ping -c 10 8.8.8.8 &
    ```
    <img src=https://i.imgur.com/mpxpuHq.png>
### **1.3) Job ID với Process ID**
- **Background process** và **foreground** thường được thao tác thông qua **Job ID** . Số này khác với **Process ID** và được sử dụng bởi vì nó ngắn hơn .
- Ngoài ra , một công việc có thể bao gồm nhiều **process** đang chạy trong seri hoặc tại cùng một thời gian , song song , vì thế sử dụng **Job ID** là dễ dàng hơn theo dõi các tiến trình riêng lẻ .
### **1.4) Parent Process ( PPID ) và Child Process ( PID )**
- Mỗi một tiến trình Unix có hai ID được gán cho nó: Process ID (pid) và Parent Process ID (ppid).
- Mỗi tiến trình trong hệ thống có một Parent Process (gốc).
### **1.5) Zombie Process và Orphan Process**
- Thông thường , khi một **child process** bị `kill` , **parent process** được thông báo thông qua ký hiệu `SIGCHLD` . Sau đó , **parent process** có thể thực hiện một vài công việc khác hoặc bắt đầu lại **child process** nếu cần thiết .
- Tuy nhiên , đôi khi **parent process** bị `kill` trước khi **child process** của nó bị `kill` . Trong trường hợp này , **parent process** của tất cả các **process** , "**init process**" , trở thành **PPID** mới . Đôi khi những **process** này được gọi là **Orphan Process** .
- Khi một **process** bị `kill` , danh sách liệt kê `ps` có thể vẫn chỉ **process** với trạng thái `Z` . Đây là trạng thái `Zombie`, hoặc **process** không tồn tại . **Process** này bị `kill` và không được sử dụng.  Những **process** này khác với **orphan process** . Nó là những **process** mà đã chạy hoàn thành nhưng vần có một cổng vào trong bảng **process** .
### **1.6) Daemon Process**
- **Daemon** là các **background process** liên quan tới hệ thống mà thường chạy với quyền hạn truy cập của `root` và các dịch vụ yêu cầu từ **process** khác .
- Một **deamon** không có terminal điều khiển . Nó không thể mở `/dev/tty` . Nếu thực hiện lệnh `ps-aux` và quan sát vào trường `tty` , tất cả **deamon** sẽ có một dấu `?` cho `tty` .

    <img src=https://i.imgur.com/xUNbtsy.png>

- **Deamon** chỉ là một **process** mà chạy trong background , thường đợi cho cái gì đó xảy ra mà nó có khả năng làm việc với , giống như máy in deamon đang đợi các lệnh in .
## **2) Các lệnh về Process**
### **2.1) `ps` - process status**
- Dùng để quan sát các **process** đang chạy .
- Cấu trúc lệnh :
    ```
    # ps [options]
    ```
    - **Options :**
        - `-f` : hiển thị đầy đủ thông tin về các **process**
        - `-e` : hiển thị đầy đủ các **process** ( bao gồm cả **system process** )
        - `-aux` = `-ef` : hiển thị đầy đủ thông tin về tất cả các **process**
        - `-u` : hiển thị các **process** liên quan đến user hiện hành
        - `-p PID` : hiển thị thông tin **process** cụ thể
- Ý nghĩa output lệnh `ps -f` :
    
    <img src=https://i.imgur.com/actqrV9.png>

    | Number | Name | Meanings |
    |--------|------|----------|
    | 1 | **UID** | **UID** mà **process** này thuộc về ( người chạy nó ) |
    | 2 | **PID** | Process ID |
    | 3 | **PPID** | Process ID gốc ( ID của **process** mà bắt đầu nó )
    | 4 | **C** | CPU sử dụng của **process** |
    | 5 | **STIME** | Thời gian bắt đầu **process** |
    | 6 | **TTY** | Kiểu terminal liên kết với **process** |
    | 7 | **TIME** | Thời gian CPU bị sử dụng bởi **process** |
    | 8 | **CMD** | Lệnh mà bắt đầu **process** này |
### **2.2) `top`**
- Ý nghĩa tương tự lệnh `ps` .
- Nội dung hiển thị tương tự lệnh "`ps -aux`"
- Cấu trúc lệnh :
    ```
    # top [options]
    ```
    - **Options :**
        - `-n number` : chỉ định số dòng hiển thị
- Gõ `q` để thoát khỏi quá trình `top` .
- **Output :**
    
    <img src=https://i.imgur.com/y01exyP.png>

    | Number | Name | Meanings |
    |--------|------|----------|
    | 0.1 | **top** |  Cho biết thời gian `uptime` ( từ lúc khởi động ) cũng như số người dùng thực tế đang hoạt động. |
    | 0.2 | **Tasks** | thống kê về số lượng tiến trình, bao gồm tổng số tiến trình ( total ) , số đang hoạt động ( running ), số đang ngủ/chờ ( sleeping ) , số đã dừng ( stopped ) và số không thể dừng hẳn ( zombie ). |
    | 0.3 | **%Cpu(s)** | cho biết thông tin về CPU |
    | 0.4 | **KiB Mem** | cho biết thông tin về RAM |
    | 0.5 | **KiB Swap** | cho biết thông tin về Swap |
    | 1 | **PID** | Process ID |
    | 2 | **USER** | người dùng thực thi |
    | 3 | **PR** | độ ưu tiên của **process** |
    | 4 | **NI** |
    | 5 | **VIRT** |
    | 6 | **RES** |
    | 7 | **SHR** | 
    | 8 | **S** | 
    | 9 | **%CPU** | tỉ lệ sử dụng CPU của **process** |
    | 10 | **%MEM** | tỉ lệ sử dụng RAM của **process** |
    | 11 | **TIME+** | thời gian sử dụng CPU , giống như **TIME** nhưng phản ánh mức độ chi tiết hơn qua một phần trăm giây .
    | 12 | **COMMAND** | Lệnh mà bắt đầu **process** này |
### **2.3) `kill`**
- Là lệnh tắt **process** đang chạy .
- Khi sử dụng lệnh `kill` với một tiến trình con thì chỉ tiến trình đó được tắt nhưng nếu sử dụng `kill` với tiến trình cha thì toàn bộ con của nó cũng được tắt theo . 
- Cú pháp :
    ```
    # kill [options] [pid]
    ```
    - **Options :** 
        - `-9` : kill toàn bộ các **process** liên quan
> ### **So sánh `ps` và `top`**
- `ps` chỉ hiện thị từ dòng thứ `6` của lệnh `top` .
- Nếu `top` hiển thị một cách realtime các tiến trình thì `ps` chỉ hiện thị thông tin tại thời điểm khởi chạy lệnh .
- `top` và `ps` đều có thể dùng kết hợp với pipe tuy nhiên như vậy thì tính realtime của `top` sẽ không có ý nghĩa .