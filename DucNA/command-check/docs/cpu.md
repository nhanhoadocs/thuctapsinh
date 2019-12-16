#  Cách kiểm tra trạng thái CPU và RAM trong linux
Lệnh top : lệnh trên được sử dụng để hiển thị các quy trình Linux. Nó cung cấp một cái nhìn thời gian thực của các tiến trình trong hệ thống đang chạy. 


```
top - 14:16:30 up  3:29,  1 user,  load average: 0,83, 0,90, 1,11
Tasks:  88 total,   1 running,  87 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0,3 us,  0,0 sy,  0,0 ni, 99,7 id,  0,0 wa,  0,0 hi,  0,0 si,  0,0 st
KiB Mem :   498800 total,   176900 free,   121836 used,   200064 buff/cache
KiB Swap:  1048572 total,  1048572 free,        0 used.   346520 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND                 
 3367 root      20   0  161880   2220   1608 R  0,7  0,4   0:00.03 top                     
    1 root      20   0  125424   3776   2568 S  0,0  0,8   0:00.96 systemd                 
    2 root      20   0       0      0      0 S  0,0  0,0   0:00.00 kthreadd                
    3 root      20   0       0      0      0 S  0,0  0,0   0:00.03 ksoftirqd/0             
    4 root      20   0       0      0      0 S  0,0  0,0   0:00.50 kworker/0:0             
    5 root       0 -20       0      0      0 S  0,0  0,0   0:00.00 kworker/0:0H            
    7 root      rt   0       0      0      0 S  0,0  0,0   0:00.00 migration/0             
    8 root      20   0       0      0      0 S  0,0  0,0   0:00.00 rcu_bh                  
    9 root      20   0       0      0      0 S  0,0  0,0   0:00.17 rcu_sched               
   10 root       0 -20       0      0      0 S  0,0  0,0   0:00.00 lru-add-drain           
   11 root      rt   0       0      0      0 S  0,0  0,0   0:00.00 watchdog/0              
   13 root      20   0       0      0      0 S  0,0  0,0   0:00.00 kdevtmpfs               
   14 root       0 -20       0      0      0 S  0,0  0,0   0:00.00 netns                   
   15 root      20   0       0      0      0 S  0,0  0,0   0:00.00 khungtaskd              
   16 root       0 -20       0      0      0 S  0,0  0,0   0:00.00 writeback 
```

Trong bảng ta có các thông số sau: 
- PID : mã tiến trình mỗi tiến trình có một mã riêng để phân biệt với các mã khác
- User: là user đang thực hiện tiến trình đó
- PR : Mức độ ưu tiên của tiến trình được nhìn thấy bởi kernel
- NI :  Mức độ ưu tiên của tiến trình là một khái niệm ở không gian người dùng
- VIRT : Lượng RAM ảo mà tiến trình chiếm 
- RES : lượng RAM dùng cho tiến trình 
- s : cho biết trạng thái của quá trình
- SHR : 
- %CPU : Phần trăm CPU dùng cho tiến trình
- %MEM : phần trăm RAM dùng cho tiến trình
- TIME+ : Thời gian CPU hoàn thành tiến trình 
- COMMAND : Dòng lệnh để thực hiện tiến trình 

Hàng đầu tiên :
- top - 14:16:30 : Thời gian hiện tại 
-  up  3:29 : Thời gian hệ thống chạy 
-   1 user : số lượng user đăng nhập 
- load average: Số lượng công việc trong vòng 1 phút 0,83, 0,90, 1,11 : trong 1,5,15 phút. Khi có 2 core thì số hoạt động bình thường là dưới 2.0 

Hàng thứ 2:
- 88 total,   : Tổng số tiến trình 
- 1 running,          : Số tiền trình chạy 
- 87 sleeping,        :  Số tiến  trình ngủ 
- 0 stopped,          : Số tiến trình bị dừng lại 
- 0 zombie            : Số tiến đa hoàn thành và đang đợi đọc 

Hàng thứ 3%(Cpu(s)):  
- 0,3 us,  : %CPU sử dụng bởi tiến trình user 
- 0,0 sy,  : %CPU sử dụng bởi tiến trình hệ thống
- 0,0 ni,  : %CPU tiến trình sử dụng bởi cài đặt nice giá trị 
- 99,7 id, : %CPU trong trạng thái rảnh 
- 0,0 wa,  : %CPU Sử dụng để chờ hoạt động I/O hoàn thành 
- 0,0 hi,  : %CPU Sử dụng tắt phần cứng 
- 0,0 si,  : %CPU Sử dụng tắt phần mềm 
- 0,0 st   : %CPU Sử dụng  Trong môi trường ảo hóa. Lượng CPU được lấy để dùng để chạy máy ảo khác 

Hàng thứ 4:(memory)
- 498800 total,    : lượng RAM  Tổng
- 176900 free,     : lượng RAM  Trống
- 121836 used,     : lượng RAM  Được sử dụng 
- 200064 buff/cache : lượng RAM  Đã được cache. Khi một tiến trình chạy thì sẽ được cấp phát một lượng RAM. Khi mà ta chạy và dừng một tiến trình thì lượng RAM cấp phát đó sẽ được chuyển thành Inactive memory và được cache lại. Khi tiến trình này lặp lại một lần nữa thì Inactive memory sẽ được cung cấp ngay lập tức mà không phải cấp phát lại

Hàng thứ 5 (Swap)
- 1048572 total,   : Lượng Swap Tổng   
- 1048572 free,    : Lượng Swap Trống    
- 0 used.          : Lượng Swap Sử dụng 
- 346520 avail Mem : Dung lượng có sẵn 

*File lưu trữ thông tin của CPU là `/proc/cpuinfo`*
# Link tham Khảo 

https://www.geeksforgeeks.org/top-command-in-linux-with-examples/

https://unix.stackexchange.com/questions/390518/what-do-the-buff-cache-and-avail-mem-fields-in-top-mean

https://www.tecmint.com/set-linux-process-priority-using-nice-and-renice-commands/

https://tecadmin.net/understanding-linux-top-command-results-uses/

