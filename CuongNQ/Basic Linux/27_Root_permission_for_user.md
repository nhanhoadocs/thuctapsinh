# Root permission for User
## **File `/etc/sudoers`**
- Cấu trúc :
     ```
    %GROUP  HOSTNAME=(TARGET_USERS)  COMMAND
    ```
    - `%GROUP` ( hoặc `%USER` ) : tên `group` hoặc `user` được cấp quyền 
    - `HOSTNAME` : Tên máy mà luật được áp dụng lên. Tham số này cần thiết vì sudo được thiết kế để bạn có thể dùng một file sudoers cho các máy khác . Lúc này sudo sẽ xem máy đang chạy được dùng các luật nào . Nói cách khác , bạn có thể thiết kế các luật cho từng máy trong hệ thống . Tham số này thường đặt là **`ALL`**
    - `TARGET-USERS`: Tên người dùng đích “mượn” quyền root thực thi.
    - `COMMAND` : Tên “lệnh” ( thực ra là các tập tin thực thi `binary` - chỉ user `root` được sử dụng ) mà người dùng được quyền thực thi với bất kỳ tham số nào mà họ muốn . Tuy nhiên bạn cũng có thể đặc tả các tham số của lệnh ( bao gồm các dấu thay thế wildcards ). Ngược lại , có thể dùng kí hiệu `“”` để ám chỉ là lệnh chỉ được thực thi mà không có tham số nào cả .
## **Các bước thực hiện cấp quyền cho user**
- **B1 :** Đăng nhập dưới quyền user `root` . Nếu đang đăng nhập bằng user khác thì gõ lệnh :
    ```
    # su            => Nhập password Root
    hoặc
    # sudo -i       => Nhập password Root
    ```
- **B2 :** Chỉnh sửa file `/etc/sudoers`
    ```
    # vi /etc/sudoers
    ```
    => Gõ `I` để vào mode `--INSERT--`

- **B3 :** Gõ `:/Allows people in group` để tìm kiếm dòng :<br><br>
    <img src=https://i.imgur.com/6sRnkK7.png>

- **B4 :** Thêm vào bên dưới :
    - Các user trong group `u1` được phép thực thi tất cả các lệnh :
        ```
        %u1  ALL=(ALL)      ALL
        ```
    - Các user trong nhóm `u1` được thực hiện 1 số lệnh nhất định :
        ```
        %u1  ALL=(ALL)      /usr/sbin/useradd, /usr/sbin/userdel, /etc/init.d/httpd
        ```
- **B5 :** Gõ `Esc` để thoát khỏi ***Insert Mode*** .<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gõ "`:wq!`" để Save và thoát ra .
- **B6 :** Đăng nhập với các user và kiểm tra :
    - **VD :** Đăng nhập bằng user `u1` và thực hiện tạo user `u6` :

        <img src=https://i.imgur.com/42lK7hA.png width=80%><br><br>=> Kết quả ( dùng lệnh `cat /etc/passwd` để kiểm tra ) :<br><br><img src=https://i.imgur.com/t2q3SYB.png width=80%>


    
