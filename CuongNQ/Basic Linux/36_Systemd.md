# Systemd
- **Systemd** là 1 nhóm các chương trình đặc biệt quản lý , vận hành và theo dõi các tiến trình khác hoạt động .
### **Vai trò của systemd**
- **Systemd** cung cấp 1 chương trình đầu tiên được khởi động trong hệ thống ( **PID** = `1` ) . Và khi hoạt động , `/sbin/init` sẽ giữ vai trò kích hoạt các file cấu hình cần thiết cho hệ thống , và các chương trình này sẽ nối tiếp để hoàn tất công đoạn khởi tạo .
### **Các thành phần của systemd**
- Về cơ bản thì **systemd** tương đương với 1 chương trình quản lý hệ thống và các dịch vụ trong Linux . Nó cung cấp các tiện ích sau :
    - `systemctl` : dùng để quản lý trạng thái của các dịch vụ hệ thống ( bắt đầu , kết thúc , khởi động hoặc kiểm tra trạng thái hiện tại ) .
    - `journald` : dùng để quản lý nhật ký hoạt động của hệ thống ( hay còn gọi là ghi log ) .
    - `logind` : dùng để quản lý và theo dõi việc đăng nhập / đăng xuất của người dùng .
    - `networkd` : dùng để quản lý các kết nối mạng thông qua các cấu hình mạng .
    - `timedated` : dùng để quản lý thời gian trên hệ thống hoặc mạng .
    - `udev` : dùng để quản lý các thiết bị và firmware
### **Unit file**
- Tất cả các chương trình được quản lý bởi **systemd** đều được thực thi dưới dạng **daemon** hay **background** bên dưới nền và được cấu hình thành 1 file configuration gọi là **unit file** .
- Các **unit file** này sẽ gồm 12 loại :
    - `service` : các file quản lý hoạt động của 1 số chương trình .
    - `socket` : quản lý các kết nối
    - `device` : quản lý thiết bị
    - `mount` : gắn thiết bị
    - `automount` : tự động gắn thiết bị
    - `swap` : vùng không gian bộ nhớ trên đĩa cứng
    - `target` : quản lý tạo liên kết
    - `path` : quản lý các đường dẫn
    - `timer` : dùng cho cronjob để lập lịch
    - `snapshot` : sao lưu
    - `slice` : dùng cho quản lý tiến trình
    - `scope` : quy định không gian hoạt động
### **Service**
- Mặc dù có 12 loại **unit file** trong **systemd** , tuy nhiên có lẽ `service` là loại được quan tâm nhất .
- Loại này sẽ được khởi động khi bật máy và luôn chạy ở chế độ nền ( **daemon** hoặc **background** ) .
- Các `service` thường được cấu hình trong các file riêng biệt và được quản lý thông qua **systemctl** .
- Có thể dùng các câu lệnh sau để xem các `service` :
    ```
    # systemctl list-units | grep -e '.service'
    hoặc
    # systemctl -t service
    ```

    <img src=https://i.imgur.com/khfmXxw.png>
    
- Các tùy chọn bật/tắt `service` trong **systemctl** :
    - `start` : bật service
    - `stop` : tắt service
    - `restart` : khởi động lại service
    - `reload` : load lại file cấu hình ( chỉ có 1 số `service` hỗ trợ như **Apache / NginX** ,... )
    - `enable` : service được khởi động cùng hệ thống
    - `disable` : service không được khởi động cùng hệ thống
### **Các hệ thống tương tự Systemd**
- **Systemd** mới chỉ xuất hiện từ `30-3-2010` , trước đó có 2 hệ thống khác đã từng được sử dụng :
    - **Upstart** : hệ thống init được phát triển bởi **Canonical** và được sử dụng trong Ubuntu Linux giai đọan đầu .
    - **SysV** : hệ thống init cổ điển của **Unix BSD SystemV** , được viết bằng shell script và đã quá lâu đời .
