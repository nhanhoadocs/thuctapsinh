Restore dữ liệu từ con 51 sang con 43, xóa IP con 51, đổi IP con 43 thành 51




Lưu ý khi đổi IP trên portal:
- Xóa IP con cũ khi VPS đang bật
- comment MAC address trong file caaus hinhf


Swap IP direct admin:
    cd /usr/local/directadmin/scripts  
    ./ipswap.sh <IP_hiện_tại> <IP_đổi>
    systemctl restart directadmin
    systemctl restart httpd

    systemctl restart proftpd
    systemctl restart pure-ftpd
    systemctl restart exim
    systemctl restart dovecot