# Cài đặt Netbox

Cài đặt theo tài liệu:

https://news.cloud365.vn/huong-dan-cai-dat-netbox-tren-centos-7/

https://github.com/domanhduy/ghichep/blob/master/DuyDM/Netbox/Thuc-hanh/docs/1.Cai-dat-netbox-tren-CentOS7.md

Sửa lỗi migrate nếu gặp:

https://github.com/netbox-community/netbox/issues/4633

Dùng reverse proxy thuctap. Cài SSL certbot

https://github.com/lukabobo/DoanBaDung_NhanHoa/blob/master/linux/web%20server/wordpress/reverse_proxy.md

Khai báo thêm trong file `/opt/netbox/netbox/netbox/configuration.py` để không bị lỗi đăng nhập 403

![Imgur](https://i.imgur.com/ErT6l0k.png)

Phải chạy dịch vụ bằng lệnh `python manage.py runserver 0.0.0.0:8000 --insecure` mới sử dụng được nếu chưa cấu hình systemd.



