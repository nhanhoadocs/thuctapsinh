# Cài đặt checkmk trên Centos 7

## Mô hình

![Imgur](https://i.imgur.com/b1vnM5N.png)

## Cài đặt

Cài các gói cần thiết

    yum install -y epel-release wget

Download file cài đặt

    wget https://checkmk.com/support/1.6.0p13/check-mk-raw-1.6.0p13-el7-38.x86_64.rpm

Cài đặt checkmk

    yum install -y check-mk-raw-1.6.0p13-el7-38.x86_64.rpm

Tạo site

    omd create monitoring

Khởi động site

    omd start monitoring

Đổi mật khẩu cho user cmkadmin

    su - monitoring
    htpasswd -m ~/etc/htpasswd cmkadmin

Quay trở lại user root để thực hiện các bước tiếp theo (nhấn Ctrl D)

Nếu bạn sử dụng firewalld bạn cần mở port cho httpd

    firewall-cmd --permanent --add-port=80/tcp
    firewall-cmd --reload

Tắt SELinux

    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0

Bây giờ vào trình duyệt truy cập vào địa chỉ http://172.16.4.251/monitoring và sử dụng user cmkadmin và password bạn đặt bên trên để đăng nhập

