# Một số lệnh omd

Tạo instances (or site)

    omd create name_site

Xác định user/group ID

    omd create -u 6100 -g 180 name_site

Switch vào site

    su - name_site

Start instances

    OMD[name_site]:~$ omd start

Stop instances

    OMD[name_site]:~$ omd stop

Bật hoặc tắt một service

    OMD[name_site]:~$ omd stop apache
    OMD[name_site]:~$ omd reload apache

Kiểm tra status của các service

    OMD[name_site]:~$ omd status

Xóa một instance

    root@checkmk# omd rm name_site

Lệnh trên sẽ hỏi lại bạn có chắc chắn xóa hay ko. Nếu muốn xóa mà ko hỏi lại sử dụng thêm option `-f`

    root@checkmk# omd -f rm name_site
    
Cấu hình các thành phần

    OMD[name_site]:~$ omd config

Đặt giá trị cho các biến

    OMD[name_site]:~$ omd config set CORE cmc

Hoặc

    root@checkmk# omd config name_site set CORE cmc

Show cấu hình của site

    OMD[name_site]:~$ omd config show
    APACHE_MODE: own
    APACHE_TCP_ADDR: 127.0.0.1
    APACHE_TCP_PORT: 5000
    AUTOSTART: off
    CMCRUSHD: on
    CORE: cmc
    [...]

Copy instances

    root@checkmk# omd cp site_old site_new

Chỉ được copy khi site đã được stop

Một số option

- --no-rrds: Bỏ qua dữ liệu của RRD
- --no-logs: Ko copy log
- -N: bao gồm cả 2 option trên

Rename instances

    root@checkmk# omd mv site_old site_new

Show những thay đổi trong file cấu hình so với ban đầu

    OMD[name_site]:~$ omd diff

Hoặc có thể kiểm tra 1 thư mục

    OMD[name_site]:~$ omd diff etc/apache

Xem chi tiết thay đổi trong file

    OMD[name_site]:~$ omd diff etc/apache/apache.conf

Backup instanse

    OMD[name_site]:~$ omd backup /tmp/mysite.tar.gz

Hoặc

    root@checkmk# omd backup name_site /var/backups/mysite.tar.gz

Restore instances

Chuyển file backup sang server muốn restore (server đã cài checkmk)

    root@linux# omd restore /var/backups/mysite.tar.gz

Hoặc restore với một tên khác

    root@linux# omd restore mysite2 /var/backup/mysite.tar.gz