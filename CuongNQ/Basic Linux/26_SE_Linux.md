# SE Linux
## **1) SE Linux là gì ?**
- **SE Linux ( *Secure-enhanced Linux* )** là một tính năng bảo mật của Linux kernel, được thiết kế để bảo vệ máy chủ chống lại cấu hình sai và/hoặc các compromised daemons . Nó đặt các giới hạn và chỉ thị cho server và các chương trình : những file nào user có thể truy cập và những hành động nào user có thể thực hiện bằng cách đưa ra một chính sách bảo mật .
- **SE Linux** được tạo bởi 1 tổ chức của **NSA**
## **2) DAC - Discretionary Access Control**
- Là phương pháp giới hạn truy cập vào các đối tượng ( file , dvd ,... ) dựa trên quyền truy cập của nhóm mà chúng thuộc về .
- Quyền truy cập trên đối tượng gồm `user` ( owner của file ) , `group` ( tất cả các user thuộc group ) , `others` ( các user không thuộc cả 2 nhóm trên )
- Nhược điểm của **DAC** là khi 1 chương trình xâm nhập hệ thống và thừa hưởng quyền truy cập của user thực thi chương trình , khi đó chương trình xâm nhập có thể làm mọi việc mà user có quyền .
## **3) MAC - Mandatory Access Control - SE Linux**
- Phương pháp này thực thi theo nguyên tắt " quyền tối thiểu " và an toàn hơn . Các chương trình khi chạy chủ có thể làm những gì chúng cần để thực hiện nhiệm vụ , ngoài ra không được làm gì khác . **VD :** nếu có 1 chương trình đáp ứng các yêu cầu đến 1 `socket` mà không cần truy cập vào file system , thì chương trình đó chỉ được lắng nghe trên 1 `socket` cố định mà không có quyền đụng đến file system . Nếu hacker tấn công và kiểm soát chương trình đó thì quyền truy cập của nó cũng được tối thiểu hóa rõ ràng .
- **SE Linux ( MAC )** phân loại đối tượng trong hệ thống Server làm 2 loại , sau đó sẽ đánh nhãn để kiểm sóat và giám sát chương trình tương tác giữa 2 loại :
    - **Subject** : `user` , `process`
    - **Objects** : `files` ( text / binary / sockets / named_pipes )
- Mặc định **SE Linux** sẽ không cho phép tương tác giữa **Subject** và **Object**
- **SE Linux** vẫn giữ nguyên các đặc tính của **DAC** và thêm vào các chức năng trên giúp hệ thống an toàn hơn rất nhiều .
## **4) Có nên tắt SE Linux ?**
- Nên nhận thức rằng , khi tắt **SE Linux** đi , tức là đang loại bỏ 1 cơ chế bảo vệ hệ thống khỏi những rủi ro bảo mật . Nhưng cũng nên hiểu rằng **SE Linux** là 1 cơ chế bảo mật Linux thuộc dạng nâng cao của **CentOS/RHEL** nên việc tìm hiểu cách sử dụng thông thạo cũng rất mất thời gian . Và tất nhiên nếu đã biết dùng **SE Linux** thì sẽ thật tuyệt khi hệ thống **CentOS/RHEL** được mang 1 lớp áo bảo vệ .
- Tuy nhiên , với những người dùng cơ bản như quản lý VPS / Hosting hay những người không cần sự rườm rà thì hãy tắt ngay **SE Linux** đi , vì khi cài đặt và vận hành hệ thống Linux trên **CentOS/RHEL** sẽ rất hay vướng phải các rule xử lý quyền hạn của **SE Linux** gây mất thời gian tìm hiểu và xử lý vấn đề , gián đoạn các hoạt động dịch vụ khác .
## **5) Cách tắt SE Linux**
- **B1 :** Kiểm tra trạng thái hoạt động của **SE Linux** :
    ```
    # sestatus
    ```
    - `enabled`
    - `disabled`
    ```
    # getenforce
    ```
    - `enforcing`
    - `permissive`<br><br>

    <img src=https://i.imgur.com/pQgY6Et.png>

- **B2.1 :** Tắt **SE Linux** tạm thời :
    - Chỉ tắt **SE Linux** tạm thời trong thời gian hệ thống còn đang chạy . Nếu hệ thống restart lại thì tính năng **SE Linux** sẽ khôi phục lại trạng thái ban đầu trước khi bị tắt tạm thời
    - Để tắt **SE Linux** tạm thời ( `permissive` ) làm như sau :
        ```
        # setenforce 0
        ```
        <img src=https://i.imgur.com/4BBGmI5.png>
    - Để quay lại trạng thái kích hoạt **SE Linux** :
        ```
        # setenforce 1
        ```
        <img src=https://i.imgur.com/rTniSjd.png>
- **B2.2 :** Tắt **SE Linux** vĩnh viễn :
    - Chỉnh sửa lại file `/etc/selinux/config` ,  thay đổi giá trị cấu hình **SE Linux** sang `disabled` .
        ```
        # vi /etc/selinux/config
        ```
        <img src=https://i.imgur.com/ym3LwPC.png>
    - Có 2 cấu hình tắt **SE Linux** :
        - `permissive` : chuyển chế độ **SE Linux** sang chế độ cho phép mọi hoạt động truy cập thực thi từ tiến trình và file trên hệ thống được thông qua ( tạm thời )
        - `disabled` : **SE Linux** sẽ chuyển cơ chế tắt hoàn toàn tính năng quản lý truy cập của **SE Linux** trong kernel
    - Sau khi edit xong tiến hành reboot và kiểm tra :
        ```
        # reboot
        # sestatus
        ```