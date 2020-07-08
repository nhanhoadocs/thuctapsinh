# Restore fail

Cài đặt: https://blog.hostvn.net/chia-se/vps-server/huong-dan-cai-dat-csf-firewall-tren-centos-7.html

Sử dụng: https://vinahost.vn/csf-la-gi

Thường thì sẽ không restore admin.

Khi restore admin và không thể đăng nhập lại thì SSH vào VPS và:

    passwd admin

Nếu bị chặn IP do đăng nhập thất bại nhiều lần

    csf
    /etc/csf/csf.deny

    Csf reload
    csf -r 

    Chặn IP: -> /etc/csf/csf.deny
    csf -d <IP>
    Unblock:
    csf -dr <IP>
    Unblock all
    csf -df
    
    Allow IP: -> /etc/csf/csf.allow
    csf -a <IP>
    Remove Allow
    csf -ar <IP>

