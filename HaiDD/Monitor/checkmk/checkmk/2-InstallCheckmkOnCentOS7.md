# Cài đặt Checkmk trên CentOS-7

## Mô hình
**Mô hình**

<img src="https://i.imgur.com/Tuzmsmu.png">

**IP Planing**

<img src="https://i.imgur.com/HvohvGP.png">

## Cài đặt
1. Cài đặt các gói cần thiết
    ```
    yum install -y epel-release wget
    ```

2. Download file cài đặt
    
    Kiểm tra phiên bản release tại [đây](https://checkmk.de/download.php?). Trong bài viết này, ta sẽ cài phiên bản 1.6.0p10

    ```
    wget https://checkmk.com/support/1.6.0p10/check-mk-raw-1.6.0p10-el7-38.x86_64.rpm
    ```

3. Cài đặt checkmk
    ```
    yum install -y check-mk-raw-1.6.0p10-el7-38.x86_64.rpm
    ```

4. Tạo site 
    ```
    omd create monitoring
    ```
    **Trong đó:** `monitoring` là tên site. Ta có thể đổi tùy ý

    Sau Khi tạo site thành công, ta sẽ thấy một dòng chứa password để đăng nhập

    <img src="https://i.imgur.com/nOslcwM.png">

    

5. Khởi động site
    ```
    omd start monitoring
    ```

    <img src="https://i.imgur.com/83yssTn.png">

6. Đổi mật khẩu cho user `cmkadmin`
    - Chuyển sang user monitoring
        ```
        su - monitoring
        ```

    - Đổi pass cho user `cmkadmin` bằng câu lệnh
        ```
        htpasswd -m ~/etc/htpasswd cmkadmin
        ```
    
    - Nhập mật khẩu mới cho user `cmkadmin`

    <img src="https://i.imgur.com/Yjsd8uJ.png">

7. Quay lại user `root`
    ```
    logout
    ```

8. Mở port cho httpd
    ```
    firewall-cmd --permanent --add-port=80/tcp
    firewall-cmd --reload
    ```

9. Tắt SElinux
    ```
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0
    ```

10. Vào trình duyệt và truy cập địa chỉ server cài checkmk.
    ```
    <ip_checkmk>/<tên_site>
    ```
    Trong bài viết này là 
    ```
    10.10.34.161/monitoring
    ```

    <img src="https://i.imgur.com/Z8k6TWj.png">

11. Sử dụng user `cmkadmin` và password là pass bạn vừa đổi để đăng nhập
    
    <img src="https://i.imgur.com/oKRmmyx.png">

    Giao diện sau khi đăng nhập thành công
    
    <img src="https://i.imgur.com/TOgYUYL.png">