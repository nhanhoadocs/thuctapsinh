# Hướng dẫn sử dụng Script File Intergrity Files

## Chuẩn bị
- Máy chủ cài CentOS hoặc Ubuntu
- Đăng nhập với quyền `root`
- [Cài đặt SSMTP nếu như sử dụng mail để nhận cảnh báo](https://news.cloud365.vn/cai-dat-va-cau-hinh-ssmtp-tren-linux/)
- API Token bot Telegram và ID chat nhận cảnh báo Telegram nếu dùng Telegram nhận cảnh báo

## Thực hiện
### 1. Cài đặt `wget`
- Cài đặt `wget` (nếu chưa có) để sử dụng tải file script về máy
    Trên CentOS-7
    ```
    yum -y install wget
    ```
    Trên Ubuntu 18
    ```
    apt -y install wget
    ```

### 2. Tải script
Tùy việc cảnh báo qua mail hay Tele mà chọn script phù hợp:

Tải script về `/opt/`: 

- Cảnh báo với mail:
    ```
    wget -P /opt/ https://raw.githubusercontent.com/danghai1996/thuctapsinh/master/HaiDD/Script/FileIntergrityCheck/FIM_user_mail.sh
    ```
    Đường dẫn file script: `/opt/FIM_user_mail.sh`

- Cảnh báo qua Telegram:
    ```
    wget -P /opt/ https://raw.githubusercontent.com/danghai1996/thuctapsinh/master/HaiDD/Script/FileIntergrityCheck/FIM_user_telegram.sh
    ```
    Đường dẫn file script: `/opt/FIM_user_telegram.sh`

### 3. Cấp quyền thực thi
- Cảnh báo qua mail
    ```
    chmod +x /opt/FIM_user_mail.sh
    ```

- Cảnh báo qua telegram
    ```
    chomod +x /opt/FIM_user_telegram.sh
    ```

### 4. Đặt crontab
```
crontab -e
```
Thêm cronjob: 30 phút kiểm tra một lần
- Cảnh báo qua mail
    ```
    */30 * * * * /opt/FIM_user_mail.sh > /dev/null 2>&1
    ```

- Cảnh báo qua Telegram
    ```
    */30 * * * * /opt/FIM_user_telegram.sh > /dev/null 2>&1
    ```

Bài viết: File [Integrity Check Script](https://news.cloud365.vn/script-1-file-integrity-monitor-fim-giam-sat-su-thay-doi-cua-file-tren-linux/)
