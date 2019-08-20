# Apache MPM
## **1) Khái niệm**
- **MPM - Multi Process Module** là 1 cơ chế quyết định hoạt động của Web Server Apache . Cơ chế này sẽ quyết định cách thức tiếp nhận và xử lý các kết nối request từ người dùng .
- **MPM** là module trong **Apache** vì vậy mà ta có thể enable/disable trong cấu hình module của **Apache** . **Apache** cũng yêu cầu và chỉ có thể sử dụng duy nhất 01 trong các **module MPM** cho cấu hình .
- **Apache** hỗ trợ 3 cơ chế **MPM** tại thời điểm hiện tại , tùy nhu cầu sử dụng :
    - **MPM prefork**
    - **MPM worker**
    - **MPM event**
- Kiểm tra **Apache** đang chạy **MPM** nào :
    ```
    # httpd -V | grep -i 'mpm'
    ```
    <img src=https://i.imgur.com/gRACjaT.png>

### **1.1) MPM prefork**
- Đây là **MPM** mặc định khi cài đặt **Apache** . 
- Sử dụng nhiều child process với một thread. Tại một thời điểm thì mỗi process đó sẽ chỉ xử lý chỉ một request .

    <img src=https://i.imgur.com/kKiMa1W.png>

- Do cách hoạt động đó - mỗi yêu cầu được xử lý trên một tiến trình riêng - độc lập, mà Apache trên server cần nhiều tài nguyên hơn các MPM khác. Tuy nhiên nó vẫn được sử dụng, có thể vì yêu cầu an toàn nào đó (các thread được cách ly riêng biệt trên nhưng process riêng) hoặc bắt buộc Apache phải sử dụng loại thư viện non-thread safe (không đa luồng) như mod_php mà MPM prefork vẫn được dùng.
- Khi sử dụng MPM prefork thì những thiết lập Apache ( trong `httpd.conf` ) sau nên xem xét
    ```
    StartServers 5
    MaxSpareServers 10
    MinSpareServers 5
    MaxRequestWorkers 256
    ```
    - `StartServers` : thiết lập khởi tạo sẵn khi hệ thống khởi động số process chờ request gửi đến ( để xử lý cùng lúc được nhiều yêu cầu, mặc định là 5, nếu nhiều RAM, CPU thì tăng lên )
    - `MaxSpareServers / MinSpareServers` : thiết lập số lượng process Apache lớn nhất, nhỏ nhất có thể ở chế độ chờ, lượng process chờ này do Apache tự tạo ra hay kill nó tùy thuộc vào nó đánh giá số lượng request gửi đến.
    - `MaxRequestWorkers` : thiết lập số lượng request cùng lúc được phục vụ
- Tóm lại chỉ nên sử dụng MPM này nếu có yêu cầu an toàn đặc biệt hoặc cần dùng mod_php , ví loại này tốn nhiều tài nguyên, phục vụ lượng truy cập lớn kém .
### **1.2) MPM worker**
- Khác với **MPM prefork** , **MPM worker** sử dụng nhiều **child process** với nhiều **thread** . Và mỗi **thread** sẽ xử lý một request tại một thời điểm .

    <img src=https://i.imgur.com/tVcjyfa.png>

- Thiết lập quan trong của MPM worker đó là ThreadsPerChild thiết lập số luồng (thread) được tạo ra cho mỗi tiến trình (process), MaxRequestWorkers tổng số luồng được kích hoạt trong các process
- Tham khảo thiết lập sau khi sử dụng MPM worker từ http://httpd.apache.org. Bạn điều chỉnh sao cho tối ưu với tài nguyên server của mình
    ```
    ServerLimit         16
    StartServers         2
    MaxRequestWorkers  150
    MinSpareThreads     25
    MaxSpareThreads     75
    ThreadsPerChild     25
    ```
### **1.3) MPM event**
- MPM event thực chất dựa trên MPM worker, nó được thiết kế nhằm cho phép nhiều yêu cầu được phục vụ cùng một lúc hơn bằng cách: chuyển các process đã hoàn thành cho một request sang ngay chế độ chờ request mới mà vẫn sử dụng socket cũ, có nghĩa là tình trạng keep-alive .
- Sử dụng mô hình event-based, cho phép truy cập và xử lý các yêu cầu bất đồng bộ (asynchronous) .

    <img src=https://i.imgur.com/hR3l72q.png>
    <img src=https://i.imgur.com/fHQqrHl.png>
- Event MPM dựa trên mô hình MPM worker, nên nó cũng gần giống với mpm worker .
- Nó tạo ra nhiều child process, với nhiều thread. Mỗi parent process chịu trách nhiệm chạy các child process. Mỗi child process tạo ra một số lượng thread cố định (Số lượng thread được định nghĩa trong chỉ thị “ThreadsPerChild“) .
- Để biết được child process được sinh ra ta sử dụng :
    ```
    # ps -ef |grep httpd |grep -v grep
    ```
    <img src=https://i.imgur.com/LFTBiP9.png>
- Đây là MPM khuyên dùng nếu có thể
## **2) Cách thay đổi MPM**
- **B1 :** Mở file `/etc/httpd/conf.modules.d/00-mpm.conf` :
    - Để chọn MPM nào thì bỏ dấu `#` trước dòng của nó
    - Bỏ chọn MPM nào thì đặt dấu `#` vào đầu dòng của nó
    
        <img src=https://i.imgur.com/uflXPUZ.png>

- **B2 :** Khởi động lại dịch vụ `httpd` :
    ```
    # systemctl restart httpd
    ```