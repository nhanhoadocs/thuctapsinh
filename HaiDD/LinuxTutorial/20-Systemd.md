# System Service

`Systemd` là hệ thống init mới cho các phân phối Linux hiện đại thay thế init cũ dựa trên `/etc/init.d/script`. Nó cung cấp nhiều tính năng mạnh mẽ để khởi động, dừng và quản lí các tiến trình. Dưới đây là ví dụ để tạo dịch vụ MineCraft cho `systemd`. MineCraft là một game java từ Mojang.

## Cài đặt MineCraft
Install game và thông báo của nó:
```
[root@localhost ~]# yuminstalljava-1.8.0-openjdk.x86_64

[root@localhost ~]# which java
/usr/bin/java

[root@localhost ~]# mkdir /root/Minecraft
[root@localhost ~]# cd /root/Minecraft
[root@localhost Minecraft]# wget -0 minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.6/minecraft_server.1.8.6.jar
[root@localhost Minecraft]# ls -lrt
total 9588
-rw-r--r--. 1 root root 9780573 May  3  2017 minecraft_server.jar
-rw-r--r--. 1 root root     180 Dec 17 08:10 eula.txt
drwxr-xr-x. 2 root root    4096 Dec 17 08:10 logs
-rw-r--r--. 1 root root       2 Dec 17 08:10 usercache.json
-rw-r--r--. 1 root root       2 Dec 17 08:10 banned-players.json
-rw-r--r--. 1 root root       2 Dec 17 08:10 banned-ips.json
-rw-r--r--. 1 root root       2 Dec 17 08:10 ops.json
-rw-r--r--. 1 root root       2 Dec 17 08:10 whitelist.json
-rw-r--r--. 1 root root     755 Dec 17 08:10 server.properties
drwxr-xr-x. 7 root root    4096 Dec 17 08:20 world
```

Máy chủ của MineCraft có thể khởi động bằng dòng lệnh sau:

`# java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui`

Cách khác, một tệp cấu hình `systemd` có thể tạo để khởi động, kết thúc và kiểm tra trạng thái của máy chủ như một dịch vụ hệ thống tiêu chuẩn bằng cách sử dụng tiện ích `systemctl`.

```
[root@localhost ~]# vi /lib/systemd/system/minecraftd.service
[Unit]
Description=Minecraft Server
After=syslog.target network.target

[Service]
Type=simple
WorkingDirectory=/root/Minecraft
ExecStart=/bin/java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target



[root@localhost Minecraft]# systemctl start minecraftd
[root@localhost Minecraft]# systemctl status minecraftd
● minecraftd.service - Minecraft Server
   Loaded: loaded (/usr/lib/systemd/system/minecraftd.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2019-12-17 08:31:56 +07; 11s ago
 Main PID: 1782 (java)
   CGroup: /system.slice/minecraftd.service
           └─1782 /usr/bin/java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui

[root@localhost Minecraft]# systemctl stop minecraftd
```

**Chú ý:** `SuccessExitStatus=143` sẽ được yêu cầu khi một quá trình không xử lí đúng tín hiệu thoát. Điều này hầu như là do lỗi lập trình và khá phổ biến với các ứng dụng Java. Để tránh trạng thái thất bại của MineCraft khi dừng dịch vụ, mã thoát 143 cần được thêm vào tệp đơn vị ở trạng thái `success`.

Tiện ích `systemctl` có thể được sử dụng để bật/tắt dịch vụ khởi động
```
[root@localhost Minecraft]# systemctl enable minecraftd
Created symlink from /etc/systemd/system/multi-user.target.wants/minecraftd.service to /usr/lib/systemd/system/minecraftd.service.
[root@localhost Minecraft]# systemctl is-enabled minecraftd
enabled
[root@localhost Minecraft]# systemctl disable minecraftd
Removed symlink /etc/systemd/system/multi-user.target.wants/minecraftd.service.
```