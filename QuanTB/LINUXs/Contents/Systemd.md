# Systemd


Systemd là một itit system ( tiến trình được khởi động lên đầu tiên ) mới cho các phiên bản của Linux thay thế cho các init cũ dựa trên `/etc/init.d/script`. Nó cung cấp nhiều chức năng mạnh mẽ cho việc khởi động, dừng và quản lí các tiến trình . Sau đây là một ví dụ tạo service cho systemd.

Ví dụ bạn có một kịch bản lệnh python là `foo.py`, sau đó bạn muốn cho nó khỏi động cùng hệ thống, chạy hoặc dừng lại với systemd.

```
[root@CentOS ~]# /lib/systemd/system/Foo.service
[Unit]
Description=Python Demo Service

[Service]
# Command to execute when the service is started
ExecStart=/usr/bin/python /foo.py
```

Cuối cùng ta cần lưu lại và thử start, stop, enable, disable với systemctl:

**Chú ý:** /foo.py là script của bạn.

```
[root@CentOS ~]# systemctl start Foo
[root@CentOS ~]# systemctl status Foo
● Foo.service - Python Demo Service
   Loaded: loaded (/usr/lib/systemd/system/Foo.service; static; vendor preset: disabled)
   Active: active (running) since Wed 2019-11-20 23:45:48 EST; 5s ago
 Main PID: 2176 (python)
   CGroup: /system.slice/Foo.service
           └─2176 /usr/bin/python /foo.py

Nov 20 23:45:48 CentOS systemd[1]: Started Python Demo Service.
[root@CentOS ~]# systemctl enable Foo
[root@CentOS ~]# systemctl stop Foo
[root@CentOS ~]# systemctl disable Foo
[root@CentOS ~]# systemctl status Foo
● Foo.service - Python Demo Service
   Loaded: loaded (/usr/lib/systemd/system/Foo.service; static; vendor preset: disabled)
   Active: inactive (dead)

Nov 20 23:42:46 CentOS systemd[1]: Unit Foo.service entered failed state.
Nov 20 23:42:46 CentOS systemd[1]: Foo.service failed.
Nov 20 23:44:13 CentOS systemd[1]: Started Python Demo Service.
Nov 20 23:44:13 CentOS python[2161]: /usr/bin/python: can't open file '/foo.py': [Errno 2] No such file or directory
Nov 20 23:44:13 CentOS systemd[1]: Foo.service: main process exited, code=exited, status=2/INVALIDARGUMENT
Nov 20 23:44:13 CentOS systemd[1]: Unit Foo.service entered failed state.
Nov 20 23:44:13 CentOS systemd[1]: Foo.service failed.
Nov 20 23:45:48 CentOS systemd[1]: Started Python Demo Service.
Nov 20 23:46:18 CentOS systemd[1]: Stopping Python Demo Service...
Nov 20 23:46:18 CentOS systemd[1]: Stopped Python Demo Service.
[root@CentOS ~]#
```