# Fail2ban
- Đây là 1 công cụ bảo mật cho rất nhiều dịch vụ như **SSH** , **FTP** , **SMTP** , **Apache** và các dịch vụ khác nữa chống lại nhưng vị khách không mời mà đến .
- Chương trình **Fail2ban** sẽ chạy nền dịch vụ và quét file **logs** được chỉ định bởi user hoặc sử dụng mẫu cấu hình mặc định . Sau đó **Fail2ban** sẽ sử dụng các khuôn mẫu mà **fail2ban** quy định để lọc và trích xuất các thông tin cần thiết . Từ những thông tin đó mà **Fail2ban** sẽ quyết định khóa truy cập IP đang thực hiện những hoạt động đáng ngờ , như đăng nhập **SSH** sai quá mật khẩu nhiều lần ,....
- Về cơ bản thì **Fail2ban** sẽ tạo ra 1 bộ rule tường lửa **iptables** để chặn truy cập từ địa chỉ IP đã xác định trong 1 khoảng thời gian nhất định . Như vậy , **Fail2ban** có khả năng giảm thiểu rất nhiều số hoạt động đăng nhập không chính xác vào dịch vụ hệ thống .
- Rất hữu dụng để chống lại khả năng tấn công của **Brute Force** , tuy nhiên không thể giải quyết các vấn đề như mật khẩu quá yếu , không đủ mạnh , phức tạp .
- Mặc định , **Fail2ban** không được cài đặt trên CentOS 7 .
## **1) Cài đặt Fail2ban**
- Cài đặt repo **EPEL** :
    ```
    # yum install -y epel-release
    ```
- Cài đặt gói **Fail2ban** :
    ```
    # yum install -y fail2ban
    ```
## **2) Cấu hình Fail2ban**
- Mở file cấu hình global **Fail2ban**  :
    ```
    # vi /etc/fail2ban/jail.conf
    ```
    <img src=https://i.imgur.com/GpoaT58.png>

    - Trong đó :
        - `ignoreip` : danh sách các địa chỉ IP mà không muốn bị khóa truy cập ( whitelist ) .
        - `bantime` : khoảng thời gian ( giây ) mà **Fail2ban** sẽ khóa truy cập từ địa chỉ ( block ) IP .
        - `findtime` : khoảng thời gian ( giây ) mà một IP phải login thành công .
        - `maxretry` : số lần login thất bại tối đa 
    - Thường thì không phải chỉnh sửa lại cấu hình này .
- Tạo mới file `/etc/fail2ban/jail.d/sshd.local` để chỉ định rule cho **SSH** . Thêm mới nội dung sau :
    ```
    [sshd]
    enabled = true
    filter = sshd
    action = firewallcmd-ipset
    #port=[port_number]
    sendmail-whois[name=SSH, dest=root, sender=thunderpassenger@gmail.com]
    logpath = /var/log/secure
    maxretry = 5
    bantime = 3600
    ```
    - Trong đó :
        - `enabled` : kích hoạt chức năng cho phép **Fail2ban** bảo vệ dịch vụ được cấu hình trong section `[ssh-iptables]` . Có thể tắt bằng giá trị `false` .
        - `filter` : có thể tìm thấy tên của các mẫu file quy chuẩn hoạt động filter riêng của **Fail2ban** được cấu hình sẵn trong thư mục `/etc/fail2ban/filter.d/*` . Sử dụng tên `ssh` vì nó là alias tương ứng file `/etc/fail2ban/filter.d/sshd.conf`
        - `action` : **Fail2ban** sẽ *ban* địa chỉ IP nếu thông tin lọc khớp với khuôn mẫu trong file `/etc/fail2ban/filter.d/sshd.conf` . Các hành vi *ban* địa chỉ IP được quy định tại `/etc/fail2ban/action.d/firewallcmd-ipset.conf` .
        - `port` : nếu đổi port SSH mà không dùng port `22` mặc định thì phải chỉnh lại thông số này
        - `sendmail-whois` : **Fail2ban** sẽ gửi email đến khi có IP bị *ban* . Việc gửi mail thành công hay không phụ thuộc vào dịch vụ **MTA ( Mail Transfer Agent )** của hệ thống .
        - `logpath` : đường dẫn file log **fail2ban** dùng để lọc thông báo đăng nhập sai
        - `maxretry` : số lần đăng nhập thất bại tối đa cho phép .
        - `bantime` : thời gian khóa truy cập từ IP đăng nhập sai quá số lần `maxretry` .
## **3) Khởi động dịch vụ Fail2ban**
- Khởi động dịch vụ và cho phép khởi động cùng hệ thống :
    ```
    # systemctl start fail2ban
    # systemctl enable fail2ban
    ```
## **4) Lệnh quản lý Fail2ban**
- Hiển thị trạng thái xem có IP nào đã bị *ban* :
    ```
    # fail2ban-client status sshd
    ```
- Xóa 1 IP khỏi danh sách banned :
    ```
    # fail2ban-client set sshd unbanip [IP]
    ```
