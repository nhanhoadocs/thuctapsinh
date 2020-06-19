# Directadmin

https://drive.google.com/drive/u/1/folders/1iYruV8h-03H-rx5WyjpZ5dQOLw7ADnVP

Sử dụng DA cơ bản

https://docs.google.com/document/d/1CvJ96SyMVXGUPTF8TSrditiAssWVVsgtLSoekq-jxmA/edit

## Cài SSL

Let’s Encrypt là một nhà cung cấp chứng chỉ số SSL (Certificate Authority) hoàn toàn miễn phí

**Bước 1:** Bật tính năng Let's Encrypt và SNI trên DirectAdmin

Kiểm tra và update version DirectAdmin lên bản 1.5 hoặc cao hơn

    /usr/local/directadmin/directadmin v

Bật tính năng Let’s Encrypt và SNI trên DirectAdmin

    echo "letsencrypt=1" >> /usr/local/directadmin/conf/directadmin.conf
    echo "enable_ssl_sni=1" >> /usr/local/directadmin/conf/directadmin.conf

Khởi động lại dịch vụ DirectAdmin

    systemctl restart directadmin

Update license Let’s Encrypt

    wget -O /usr/local/directadmin/scripts/letsencrypt.sh http://files.directadmin.com/services/all/letsencrypt.sh

Update web-server configs trên DirectAdmin

    cd /usr/local/directadmin/custombuild
    ./build update
    ./build apache
    ./build php n
    ./build rewrite_confs

Trỏ tên miền trên zonedns
