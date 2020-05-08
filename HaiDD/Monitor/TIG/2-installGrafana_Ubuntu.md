# Install Grafana on Ubuntu

## 1. Update và cài đặt các gói cần thiết
```
apt-get install -y apt-transport-https

apt-get install -y software-properties-common wget

apt-get update

apt-get -y upgrade

reboot
```

## 2. Add key vào các gói cài đặt
```
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -

add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
```

Kiểm tra lại GPG key để chắc chắn nó đã được thêm
```
apt-key list
```
Outout sẽ có key của Grafana:
```
pub   rsa2048 2017-01-24 [SC]
      4E40 DDF6 D76E 284A 4A67  80E4 8C8C 34C5 2409 8CB6
uid           [ unknown] Grafana <info@grafana.com>
sub   rsa2048 2017-01-24 [E]
```

## 3. Update repo và cài đặt Grafana
Chạy 2 lệnh sau
```
apt-get update

apt-get install -y grafana
```

## 4. Cấu hình firewalld
Grafana chạy trên port 3000
```
ufw allow 3000
```

## 5. Khởi động dịch vụ
Khởi động grafana-server và cho phép khởi động cùng hệ thống
```
systemctl start grafana-server

systemctl enable grafana-server

systemctl status grafana-server
```

<img src="https://i.imgur.com/OoQIq8m.png">

## 6. Kiểm tra
- Kiểm tra phiên bản
    ```
    grafana-server -v

    Version 6.7.3 (commit: a04ef6cefc, branch: HEAD)
    ```

- Truy cập trên trình duyệt với địa chỉ. Grafana mặc định sẽ sử dụng port 3000
    ```
    <địa_chỉ_ip>:3000
    ```

    <img src="https://i.imgur.com/jxhuH5L.png">

- Đăng nhập bằng tài khoản admin/admin. Sau đó, bạn sẽ được yêu cầu đổi mật khẩu ngay

    <img src="https://i.imgur.com/7ujOrCw.png">

    Nhập mật khẩu mới và chọn **Save**

    <img src="https://i.imgur.com/K5u4w5y.png">

    Giao diện chính của Grafana trên server của bạn tương tự như sau:

    <img src="https://i.imgur.com/KNpzLTD.png">

## 7. Disable anonymous access
Bạn có thể hạn chế người dùng ẩn danh truy cập hệ thống của bạn. Các bước làm như sau:

File cấu hình Grafana: `/etc/grafana/grafana.ini`

- Sửa file cấu hình
    ```
    vi /etc/grafana/grafana.ini
    ```

- Tìm vị trí `[auth.anonymous]`. bằng cách gõ `?[auth.anonymous]`

- Sửa thành:
    ```conf
    #################################### Anonymous Auth ######################
    [auth.anonymous]
    # enable anonymous access
    enabled = false

    # specify organization name that should be used for unauthenticated users
    org_name = Main Org.

    # specify role for unauthenticated users
    org_role = Viewer
    ```

    <img src="https://i.imgur.com/AdHUueX.png">

- Restart service
    ```
    systemctl restart grafana-server
    ```

## 8. Tắt đăng kí tài khoản
Mặc định thì bạn sẽ không thấy nút đăng kí tài khoản. Tuy nhiên, có thể truy cập đường dẫn dưới để đăng kí 
```
<địa_chỉ_ip>:3000/signup
```
<img src="https://i.imgur.com/0eURCAU.png">

Để chặn việc người ngoài đăng kí tài khoản để truy cập hệ thống, bạn có thể tắt tính năng đăng kí bằng cách sửa file cấu hình.

- Mở file cấu hình:
    ```
    vi /etc/grafana/grafana.ini
    ```
    Tìm phần `[users]`. Sửa `allow_sign_up = true` -> `allow_sign_up = false`
    ```
    [users]
    # disable user signup / registration
    allow_sign_up = false
    ```

- Restart serivce
    ```
    systemctl restart grafana-server
    ```

- Thử đăng kí, ta sẽ thấy thông báo không thể đăng kí
    <img src="https://i.imgur.com/sK3qgVb.png">