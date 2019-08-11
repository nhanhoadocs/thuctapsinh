# Disk Quota

- **Quota** được dùng để thể hiện việc sử dụng và giới hạn đĩa cứng với người dùng .
- Không phải áp dụng **quota** cho tất cả các hệ thống tập tin nào cần thiết ta mới dùng **quota** .
- Khi được gọi , **quota** sẽ đọc tập tin `/etc/fstab` và kiểm tra những tập tin trong hệ thống này .
- Các khái niệm cơ bản :
    - **Giới hạn cứng ( *Hard Limit* )** : Định nghĩa dung lượng tối đa mà user có thể sử dụng . Nếu user cố tình lưu thêm dữ liệu vào thì dữ liệu này có thể bị hỏng . Việc giới hạn này mạnh mẽ và cần thiết đến 1 số user .
    - **Giới hạn mềm ( *Soft limit* )** : Định nghĩa dung lượng đĩa cứng tối đa mà user có thể sử dụng . Tuy nhiên , không giống như ***hard limit*** , ***soft limit*** cho phép user sử dụng vượt quá dung lượng cho phép trong 1 khoảng thời gian nào đó . Thời gian này được xác định trước và gọi là **thời gian gia hạn** ( ***grace period*** ) . Khi user sử dụng vượt quá dung lượng cho phép , họ sẽ nhận được 1 lời cảnh báo trước .
    - **Thời gian gia hạn ( *Grace Period* )** : Là thời gian cho phép user vượt quá dung lượng đĩa cứng được cấp phép trong ***soft limit*** .

## **Các bước triển khai Quota**
### **`Xfs` File System**
- **B1 :** Vào file `/etc/fstab` , chỉnh sửa cho partition muốn quota :
    ```
    # vi /etc/fstab
    ```
    ```
    dev/sdb2 /DATA xfs defaults,uquota,gquota 0 0
    ```
- **B2 :** Thực hiện tạo quota :
    ```
    # xfs_quota [options] [path]
    ```
    - **Options :** 
        - `-x` : chế độ ***expert mode***
        - `-c` : thực hiện chế độ Command ngay trên dòng lệnh
        - `-v` : hiển thị version và exit
    - **Commands :** 
        - `df` : hiển thị dung lượng ổ
        - `path` : hiển thị đường dẫn và mount point
        - `limit [-g|-p|-u] [bsoft=N bhard=N] [isoft=N ihard=N] [user/group/project_name]` : đặt giới hạn quota với `bsoft` , `bhard` là giới hạn theo dung lượng , `isoft` , `ihard` là giới hạn theo số file copy
        - `report -h` : hiển thị thông tin quota
    - **VD :** Thực hiện quota cho user `u1` :
        ```
        # xfs_quota -x -c 'limit bsoft=3G bhard=5G u1' /DATA
        ```
        hoặc
        ```
        # xfs_quota -x /DATA
        xfs_quota> limit bsoft=3G bhard=5G u1
        ```
- **B3 :** Xem thông tin quota đã tạo :
    ```
    # xfs_quota -x -c "report -h" /DATA
    ```
    <img src=https://i.imgur.com/Ow2ogz7.png>
- **B4 :** Kiểm tra hiệu quả của **quota** :
    - Khi dung lượng sử dụng của user vượt quá ***bsoft*** , dữ liệu sẽ được sử dụng thêm 1 khoảng ***grace period*** là `6 days` :

        <img src=https://i.imgur.com/s70vqj5.png>

    - Khi dung lượng sử dụng của user vượt quá ***bhard*** , quá trình ghi dữ liệu bị ngừng , xuất hiện cảnh báo "`Disk quota exceeded`"

        <img src=https://i.imgur.com/OggQI4S.png>
### **`Ext4` File System**
- **B1 :** Thực hiện Quota Check :
    ```
    # quotacheck [options]
    ```
    - **Options :** 
        - `-a` : kiểm tra tất cả những hệ thống tập tin có liên quan
        - `-v` : hiển thị thông tin trạng thái khi kiểm tra
        - `-u` : kiểm tra quota của user
        - `-g` : kiểm tra quota của group
- **B2 :** Tắt **SE Linux** 
- **B3 :** Chỉnh sửa file `fstab` giống `xfs`
- **B4 :** Thực hiện tạo quota :
    ```
    # edquota [options] [user/group]
    ```
    - **Options :**
        - `-g` : chỉnh sửa quota của group
        - `-p` : sao chép quota của 1 user này cho 1 user khác
        - `-u` : chỉnh sửa quota cho user ( mặc định )
        - `-t` : chỉnh sửa thời gian cho **soft limit**
    - Gõ `i` để edit các thông số , `Esc` để thoát edit , `:x` để lưu và thoát
- **B5 :** Thực hiện bật/tắt quota :
    ```
    # quotaon [path]
    ```
    hoặc
    ```
    # quota -a : bật toàn bộ các path đã tạo quota
    ```
    ```
    # quotaoff : tạm ngưng quota
    ```
- **B6 :** Kiểm tra quota :
    ```
    # quota [options] [user/group]
    ```
    - **Options :**
        - `-g` : hiển thị quota của group mà user này là thành viên
        - `-q` : chỉ hiển thị những path có quota
        - `-u` : hiển thị quota của user