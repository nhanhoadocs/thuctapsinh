# Crontab
- **Crontab** là 1 tính năng trong Linux thực hiện chế độ sắp xếp tự động các chương trình , ứng dụng và kích hoạt chúng tại 1 thời điểm nhất định trong hệ thống .
## **1) Cài đặt ứng dụng Crontab**
- **CentOS / RHEL** :
    ```
    # yum install cronie
    ```
- **Ubuntu / Debian** :
    ```
    # sudo apt-get install cron
    ```
- Khởi động dịch vụ **crond** lên :
    ```
    # service crond start
    ```
- Kích hoạt cho phép khởi động **crond** khi vừa khởi động hệ thống :
    - **CentOS / RHEL** :
        ```
        # systemctl enable crond
        ```
    - **Ubuntu / Debian** : 
        ```
        # sudo update-rc.d crond enable
        ```
## **2) Các lệnh cơ bản trong Crontab**
### **2.1) Chỉnh sửa job trong crontab**
- Mở trình editor để chỉnh sửa các file **crontab**
    ```
    # crontab -e
    ```

    <img src=https://i.imgur.com/F6Pd0b9.png>

- Thường nội dung **crontab** của các user sẽ được lưu tại thư mục tương ứng `/var/spool/cron/<user_name>` . Để sửa **crontab** của user khác dùng lệnh :
    ```
    # crontab -u <user_name> -e
    ```
### **2.2) Hiển thị toàn bộ job crontab**
- Của user hiện tại :
    ```
    # crontab -l
    ```
- Của user khác :
    ```
    # crontab -u <username> -l
    ```
### **2.3) Xóa cron đã lên lịch hiện tại**
```
# crontab -r
```
### **2.4 ) Khôi phục cron từ file text**
```
# crontab cron-backup.txt    ( file khôi phục )
```

## **3) Cấu trúc 1 dòng Crontab**

<img src=https://i.imgur.com/nkBCG9B.png>

- Trong đó : 
    - `phút` : giá trị từ `0` -> `59`
    - `giờ` : giá trị từ `0` -> `23`
    - `ngày trong tháng` : giá trị từ `1` -> `31`
    - `tháng` : giá trị từ `1` -> `12`
    - `ngày trong tuần ( thứ )` : từ `0` ( Sunday ) đến `6` ( Saturday )
- **TH1 :** Nếu không khai báo số cụ thể thì để dấu "`*`" , ký hiệu này sẽ thay thể tất cả các con số trên .
- **TH2 :** Dùng dấu phẩy "`,`" để thiết lập nhiều số cho nhiều thời điểm .<br>**VD :** `20,40 * * * * [command]` => thực hiện vào phút thứ `20` và `40`
- **TH3 :** Dùng dấu sược "`/`" để chia đều khoảng cách thời gian được chạy .<br>**VD :** `*/5 * * * * [scan system]` => `5p` quét hệ thống 1 lần
- **TH4 :** Dùng dấu gạch ngang "`-`" để chỉ khoảng thời gian .<br>**VD :** `30 10-12 * * * [command]` => chạy lệnh vào `10h30` , `11h30` , `12h30` sáng
- **TH5 :** Dùng các thiết lập đặc biệt :
    - `@reboot` : chạy lệnh khi server reboot lại
    - `@hourly` : chạy hàng giờ vào phút thứ `0`
    - `@daily` : chạy hàng ngày vào `00:00`
    - `@monthly` : chạy hàng tháng vào `00:00` của ngày đầu tiên mỗi tháng
    - `@yearly` : chạy hàng năm vào `00:00` của ngày đầu tiên mỗi năm<br>
    **VD :** `@reboot [command]`
- **TH6 :** Khai báo biến hệ thống :
    - Có thể khai báo các thông số sau để chỉ định chúng theo ý mình
        - `SHELL` : là shell mà **cron** chạy . Nếu không chỉ định thì mặc định sẽ là những shell trong `/etc/passwd`
        - `PATH` : thay vì sử dụng full path trong **cron** thì có thể khai báo `PATH` để dùng đi dùng lại nhiều lần
        - `MAILTO` : sẽ chỉ định xem ai nhận được email về output của mỗi lệnh . Nếu không chỉ định thì output ( nếu có ) sẽ được gửi đến người sở hữu tiến trình mà tạo ra output đó , tức là người lập ra lịch chạy **cron** .
        - `HOME` : thư mục home được sử dụng cho **cron** . Nếu không khai báo thì mặc định sẽ là thư mục trong file `/etc/paswd`
## **4) Các ví dụ cụ thể về Crontab**
- Thực thi **cron** vào `2h` sáng hằng ngày :
    ```
    0 2 * * * /bin/sh backup.sh
    ```
- Thực thi **cron** 2 lần trong ngày :
    ```
    0 5,17 * * * /scripts/script.sh
    ```
- Thực thi **cron** theo từng phút :
    ```
    * * * * * /scripts/script.sh
    ```
- Thực thi **cron** vào `17h` chủ nhật hàng tuần :
    ```
    0 17 * * sun /scripts/script.sh
    ```
- Thực thi **cron** `10p` 1 lần :
    ```
    */10 * * * * /scripts/monitor.sh
    ```
- Thực thi **cron** theo ngày , tháng được chỉ định :
    ```
    * * * jan,may,aug * /scripts/script.sh
    0 17 * * sun,fri /scripts/script.sh
    ```
- Thực thi **cron** theo chu kì `4h` :
    ```
    0 */4 * * * /scripts/script.sh
    ```
- Thực thi **cron** cứ `30s` 1 lần :
    ```
    * * * * * /scripts/script.sh
    hoặc
    * * * * * sleep 30 ; /scripts/script.sh
    ```
- Thực thi nhiều scripts trong 1 **cron** :
    ```
    * * * * * /scripts/script1.sh; /scripts/script2.sh
    ```
- Thực thi script hằng ngày :
    ```
    @daily /scripts/script.sh
    ```
- Thực thi 2 **cron** vào chủ nhật đầu tiên hàng tháng :
    ```
    0 2 * * sun [$(date+%d) -le 07] && /scripts/script.sh
    ```
- Chuyển kết quả **cron** sang mail :
    ```
    MAIL = cuongnq
    ```
- Sao lưu kết quả trên file txt :
    ```
    # crontab -l > cron-backup.txt
    # cat cron-backup.txt
    ```
