[ 1. Khái niệm](#khainiem) 

[ 2. Cách thức hoạt động và phân loại](#phanloai)

[ 3. Lệnh của hệ thống](#lenh)

<a name="khainiem">

# 1.khái niệm
- Processes( tiến trình ): là một chương trình đang xử lý 
- Một tiến trình có thể cần đến một số tài nguyên của máy: CPU, bộ nhớ chính, các tệp tin...
- Chương trình: là nơi chứa đựng các chỉ thị điều khiển máy tính. khi các chỉ thị này được thực hiện thì chương trình chuyển thành tiến trình.
- Một tiến trình được coi là một đơn vị làm việc của hệ thống 
- Các tiến trình có thể đọc lập với nhau hoặc không thể độc lập với nhau 
- Hệ điều hành sẽ phân bố tài nguyên của máy tính cho các tiến trình 
- Khi một máy tính chạy thì thường sẽ luôn có rất nhiều chương trình chạy song song chúng ta cứ tưởng rằng trong một thời điểm máy tính sẽ thực hiện nhiều chương trình nhưng trong thực tế các chương trình được chạy tuần tự với nhau đây gọi là sự hoạt động theo cơ chế đa nhiệm 
- Theo nhiệm vụ đang được thực hiện thì có thể có nhiều quy trình khác nhau

 <a name="phanloai">

# 2. Cách thức hoạt động và phân loại 
- Tiến trình ở trạng thái hoạt động: là nó đang ở trong trạng thái thực thi các lệnh ở trong CPU 
-  Tại bất cứ thời điểm nào thì cũng có rất nhiều tiến trình đang hoạt động. Nên để kiểm soát được tiến trình thì hệ điều hành gán cho chúng một PID để dễ dàng quản lý các tiến trình. Mỗi một PID có 5 ký tự số 
- Theo ta biết thì tại một thời điểm CPU chỉ có thể xử lý được một tiến trình nên khi có rất nhiều tiến trình thì sẽ có sự chậm trễ và CPU làm việc theo sự ưu tiên của các quy trình được linux chỉ định 
- Mỗi một tiến trình cần bao nhiêu thời gian và bao nhiêu thời gian đã được cấp cho một tiến trình tất cả các quá trình trong trạng thái này được nằm trên một hàng đợi chạy.
- Có những tiến trình để có thể tiếp tục chạy thì cần đến một thao tác tổ hợp phím hay một lệnh nào đó từ người sử dụng. Nó Không thực sự đang chạy như một tiến trình nhưng mà nó vẫn xuất hiện trong danh sách quy trình của hệ thống 

<a name="lenh">

# 3.Một số lệnh của hệ thống 
a) Lệnh  `ps`
- Cung cấp thông tin về các tiến trình đang chạy được khóa bởi PID 
- Lệnh `ps` có nhiều options. Nếu không sử dụng options thì lệnh `ps` sẽ hiển thị tất cả các tiếng trình đang chạy 
- Lệnh `pstree` hiển thị các tiến trình đang chạy trên hệ thống dưới dạng ơ đồ cây. Lưu ý lệnh `pstree` chỉ có sẵ n trong hệ điều hành linux còn trong centos thì phải cài đặt
- Để cài đặt lệnh `pstree` ta có thể làm như sau 
    - `yum install -y psmisc`
![](https://github.com/duckmak14/anh/blob/master/linux/Screenshot%20from%202018-11-15%2013-48-58.png)
- Sau khi cài đặt xong thì ta thử lệnh `pstree`
![](https://github.com/duckmak14/anh/blob/master/linux/Screenshot%20from%202018-11-15%2013-49-34.png)
- Một vài options của lệnh ps
    - Hiển thị toàn bộ process `ax`
    - Hiển thị thêm thông tin về các process `aux`
    - Hiển thị process bởi một user ` ps -f -u user`
    - Hiện thị theo tên hoặc ID ` ps -C name` 
    - Hiển thị theo ID `ps -f -p id`
b) Lệnh `Top`
- Cho chúng ta biết được thông số của CPU, RAM.. của các tiến trình hệ thống 
![](https://github.com/duckmak14/anh/blob/master/linux/Screenshot%20from%202018-11-15%2014-13-01.png)
- Một số  phần đọc lệnh `top`
    - Ở dòng đầu tiên sẽ chỉ ra thời gian hoạt động của lệnh top đến khi dừng lại 
        - `up là thời gian update
        - `User` là số user đăng nhập 
        - `load average` là thời gian trung bình cpu load 
    - Ở dòng thứ 2
        - `total` số tiến trình đang trong trạng thái hoạt động 
        - `runnung` số tiến trình đang chạy
        - `sleeping` tiến trình đang ở chế độ chờ 
        - `stopped` số tiến trình đang dừng 
        - `zombie` số tiến trình chờ dừng từ tiến trình khác 
    - Ở dùng thứ 3 nói về CPU 
        - `us` phần trăm cpu dành cho tiến trình của user 
        - `sy` phần trăm cpu dành cho tiến trình hệ thống 
        - `ni` phần trăm cpu dành cho tiến trình cấu hình các giá trị
        - `id` phần trăm cpu dành cho trạng thái tĩnh 
        - `wa` CPU đang trong trạng thái chờ 
        - `hi` CPU phục vụ coh phần cứng khi bị gián đoạn 
        - `si` CPU phục vụ cho phần mềm bị gián đoạn 
        - `st` CPU ảo chờ đợi CPU thực xử lý các process
    - Dòng thứ 4
        - `PID`: số ID hệ điều hành gán cho từng process
        - `User`: user thực hiện process trên 
        - `PR`: Độ ưu tiên của process
        - `VIRT` Dung lượng RAM ảo cho việc thực hiện process
        - `RES` Dung lượng RAM thực cho process
        - `SHR` Dung lượng RAM share cho process
        - `Time+` Tổng thời gian thực hiện 1 process
        - `Command` Tên process
c) Lệnh `Kill`
- Giúp chúng ta kết thúc một tiến trình đang chạy.
- Đầu tiên dùng lệnh `top` để biết được PID của tiến trình đang chạy 
- Sau đó dùng lệnh `kill PID`, để kiểm tra xem còn tiến trình không ta dùng ps -p PID
![](https://github.com/duckmak14/anh/blob/master/linux/Screenshot%20from%202018-11-15%2014-25-40.png)