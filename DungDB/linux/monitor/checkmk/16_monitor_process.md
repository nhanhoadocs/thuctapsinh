# Monitoring process linux bởi check_mk

Hướng dẫn: https://github.com/domanhduy/ghichep/blob/master/DuyDM/Check-MK/thuc-hanh/docs/7.linux-process-monitoring.md

Ở đây áp dụng cho Centos 7.

Command regex đối với http: `.*usr/sbin/httpd*`

Command regex đối với mysql: `.*usr/libexec/mysqld*`

Kết quả: 

![Imgur](https://i.imgur.com/dpdIkCd.png)

**Lưu ý:** 

Cách làm này sẽ áp dụng rule lên toàn bộ các host đặt trong folder. Trong host 10.10.10.115 tôi đã cài dịch vụ http và mysql nên sẽ thấy dịch vụ đang được giám sát như trên hình.

Đối với host Windows đặt chung thư mục thì sẽ báo không có tiến trình nào của 2 dịch vụ trên đang chạy:

![Imgur](https://i.imgur.com/ItZ4o7b.png)

Vì thế cần lưu ý đặt các host có điểm chung với nhau trong cùng một thư mục để tiện việc giám sát.
