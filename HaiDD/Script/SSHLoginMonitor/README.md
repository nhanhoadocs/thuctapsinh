# Hướng dẫn sử dụng Script SSH Login Monitor

## Chuẩn bị và yêu cầu
1. Máy chủ cài Linux: CentOS hoặc Ubuntu
2. Có kết nối internet
3. API Token bot Telegram
4. ID chat nhận cảnh báo Telegram

**Chú ý:** Truy cập bằng user `root` hoặc quyền sudo

## Thực hiện
### 1. Cài đặt một số gói hỗ trợ
- Cài đặt `wget` để sử dụng tải file script về máy
    Trên CentOS-7
    ```
    yum -y install wget
    ```
    Trên Ubuntu 18
    ```
    apt -y install wget
    ```
- Cài `jq`
    Trên CentOS 7
    ```
    yum install epel-release -y

    yum install jq -y
    ```

    Trên Ubuntu 18
    ```
    apt-get -y install jq
    ```

### 2. Tải script
- Tải script về `/etc/profile.d/`
    ```
    wget -P /etc/profile.d/ https://raw.githubusercontent.com/danghai1996/thuctapsinh/master/HaiDD/Script/SSHLoginMonitor/sshLoginMonitor.sh
    ```

- Cấp quyền thực thi:
    ```
    chmod +x /etc/profile.d/sshLoginMonitor.sh
    ```

### 3. Thay đổi API Token và ID Telegram
Thay đổi API Token bot và ID nhận cảnh báo trong Script thành của bạn:

`USERID="<target_user_id>"` : Điền ID chat nhận cảnh báo

`TOKEN="<bot_private_TOKEN>"` : Điền API Token bot bắn tin

Hoặc chạy 2 lệnh sau với API Token bot và ID nhận cảnh báo của bạn:
```
sed -i 's|USERID=""|USERID="<ID Chat nhận cảnh báo>"|' /etc/profile.d/sshLoginMonitor.sh

sed -i 's|TOKEN=""|TOKEN="<API Token bot>"|' /etc/profile.d/sshLoginMonitor.sh
```

**Ví dụ:**
```
sed -i 's|USERID=""|USERID="-12837873492"|' /etc/profile.d/sshLoginMonitor.sh

sed -i 's|TOKEN=""|TOKEN="132907487sadkaAAABE:dao"|' /etc/profile.d/sshLoginMonitor.sh
```


Sau đó, lưu lại là hoàn thành.

Bài viết: [Giám sát truy cập ssh vào hệ thống](https://news.cloud365.vn/script-3-giam-sat-truy-cap-ssh-vao-he-thong/)