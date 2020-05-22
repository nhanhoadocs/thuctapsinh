## Tiến trình trong Linux
Mục lục
#### 1. [Tiến trình là gì?](#1)
#### 2. [Phân loại tiến trình](#2)
#### 3. [Tìm hiểu lệnh top và lệnh ps](#3)

<a name="1"></a>
**1. Tiến trình là gì?**  
Hệ thống sẽ không thực sự quản lý toàn bộ các chương trình, mà chỉ quản lý khi nó được thực thi. Một chương trình để có thể thực thi được trên bất cứ một hệ điều hành nào thì nó đều phải ở dạng mã máy, mỗi chương trình chứa rất nhiều các đoạn mã máy (hay mã chỉ dẫn) giúp cho máy tính có thể biết được chương trình sẽ làm gì. Các đoạn mã này sẽ được nạp vào bộ nhớ khi thực thi, được cấp phát vùng hoạt động, thời gian thực thi .... Và khi điều này xảy ra, thay vì gọi là chương trình, ta có một thuật ngữ khác là **tiến trình**. Và chính xác thì các tiến trình này là những thứ được quản lý bởi một hệ thống/hệ điều hành Linux (hoặc Windows hay OSX)

Tiến trình (Process) đơn giản là một thể hiện của một hoặc nhiều tác vụ (luồng) liên quan thực thi trên cùng một máy. Nó không giống như một chương trình (program) hoặc một lệnh. Một chương trình có thể có 1 hoặc nhiều tiến trình. Một số tiến trình có thể độc lập hoặc liên quan với nhau. Vì vậy khi một tiến trình bị lỗi, nó có thể (hoặc không thể) ảnh hưởng đến các tiến trình khác đang chạy trên hệ thống.  
 Các tiến trình sử dụng nhiều tài nguyên hệ thống như bộ nhớ, CPU và các thiết bị ngoại vi như máy in và màn hình. Hệ điều hành (đặc biệt là kernel) chịu trách nhiệm phân bổ một phần thích hợp các tài nguyên này cho từng tiến trình và đảm bảo tổng thể sử dụng tối ưu.  

 Tiến trình có 3 trạng thái:
 - Đang chạy (running): Tiến trình chiếm quyền xử lý CPU, dùng tính toán hoặc thực hiện các công việc của mình.
 - Chờ (waiting): tiến trình bị Hệ điều hành tước quyền xử lý CPU và chờ đến lượt cấp phát khác.    
 - Tạm dừng (suspend): Hệ điều hành tạm dừng tiến trình. Tiến trình được đưa vào trạng thái ngủ (sleep). Khi cần thiết hay có nhu cầu, Hệ điều hành sẽ đánh thức (wake up) hay nạp lại mã lệnh của tiến trình vào bộ nhớ. Cấp phát tài nguyên CPU để tiến trình tiếp tục hoạt động.  
 Tại bất kì thời điểm nào luôn có nhiều tiến trình hoạt động. Hệ điều hành theo dõi chúng bằng cách gán cho mỗi tiến trình một ID gọi là PID (Process ID). PID là số duy nhất, được sử dụng để theo dõi trạng thái tiến trình, sử dụng CPU, sử dụng bộ nhớ...


<a name ="2"></a>
 **2. Phân loại tiến trình**  

 Các PID mới thường được chỉ định theo thứ tự tăng dần khi các tiến trình được sinh ra. Do đó PID 1 biểu thị tiến trình **init** (tiến trình khởi tạo). Các tiến trình sau đó sẽ dần dần được đánh số PID cao hơn. 

 **2.1 Init Process**    

 *Init process* là tiến trình đầu tiên được khởi động sau khi bạn lựa chọn hệ điều hành trong boot loader. Trong cây tiến trình, *init process* là tiến trình cha của các tiến trình khác. Init process có đặc điểm sau:  
 - PID = 1;
 - Không thể kill init process.

**2.2 Parent process - Child process**

Trong hệ điều hành linux, các tiến trình được phân thành parent process và child process. Một tiến trình khi thực hiện lệnh fork() để tạo ra một tiến trình mới thì được gọi là *parent process* , các tiến trình mới được tạo gọi là child process.

<img src="https://i.imgur.com/s1mjoZ1.png">

Một parent process có thể có nhiều child process nhưng mỗi child process chỉ có một parent process. Thông tin của tiến trình ngoài PID (Process ID) còn có PPID (Parent Process ID).   

**2.3 Orphan process - Zombie Process**  
Khi parent process - child process hoạt động sẽ xảy ra một số trường hợp đặc biệt. Lúc đó Orphan process - Zombie process sẽ được hình thành.  
Khi một parent process bị tắt trước khi child process được tắt, tiến trình con đó sẽ trở thành một orphan process. Lúc này init process sẽ trở thành parent process của orphan process và thực hiện tắt chúng.    

Khi một child process được kết thúc, mọi trạng thái của child process sẽ được thông báo bởi lời gọi hàm wait() của parent process. Vì vậy kernel sẽ đợi parent process trả về hàm wait() trước khi tắt child process. Tuy nhiên vì một vài lý do mà parent process không thể trả về hàm wait(), khi đó child process sẽ trở thành một zombie process. Khi ở trạng thái này, tiến trình gần như giải phóng hoàn toàn bộ nhớ, chỉ lưu trữ một vài thông tin như PID, lượng tài nguyên sử dụng,... trên bảng danh sách tiến trình.
Câu lệnh tìm các zombie process:
```
# ps aux | grep Z
```
hoặc  
```
# ps aux | grep "defunct"
```
<img src="https://i.imgur.com/FvUf3WJ.png">   

Lệnh xem Zombie process để chúng ta biết được những tiến trình nào chưa được tắt hẳn và thực hiện tắt nó đi. Bởi khi có quá nhiều Zombie process thì lượng PID sẽ bị quá tải, máy sẽ không cấp phát được PID mới và các tiến trình khác sẽ không được tạo ra.

**2.4 Deamon Process**  
Một Daemon Process là một tiến trình chạy nền. Nó sẽ luôn trong trạng thái hoạt động và sẽ được kích hoạt bởi một điều kiện hoặc câu lệnh nào đó. Trong Unix, các daemon thường được kết thúc bằng "d". Ví dụ như httpd, sshd, crond, mysqld...  

<a name="3"></a>
#### 3. Tìm hiểu lệnh top và lệnh ps
**3.1 Lệnh top**  

Một chương trình đặc biệt là `top` sẽ cho chúng ta biết thông tin các tiến trình đang hoạt động trong hệ thống.  

<img src="https://i.imgur.com/H9khBBB.png">
Lệnh `top` cho ta biết các thông tin về tiến trình như:
Line 1: Thời gian uptime (từ lúc khởi động) cũng như số người dùng thực tế.  
Line 2: Thống kê số lượng tiến trình: Số tiến trình (total), số đang hoạt động (running), số đang ngủ/chờ (sleeping), số đã dừng (stopped) và không thể dừng hẳn (zombie).  
Line 3-5: Thông tin về CPU, RAM, bộ nhớ SWAP...  
Lệnh `top` hiển thị realtime (thời gian thực) các tiến trình.  

**3.2 Lệnh ps**
`ps` cũng là một tiện ích để xem thông tin các tiến trình đang chạy trong hệ thống.  
Cú pháp:
```
$ ps [option]
```





