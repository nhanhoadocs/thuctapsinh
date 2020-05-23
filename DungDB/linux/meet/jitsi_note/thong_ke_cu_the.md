# Thống kê

## Bước 1: Nâng cấp Version Prosody
Lưu ý:

Mặc định Version cài đặt Jitsi là 0.10.0

Để giới hạn được số người truy cập mỗi phòng ta cần upgrade lên version 0.11.5

Câu lệnh kiểm tra Version
```
root@jitsi1086:~# prosodyctl about
Prosody 0.10.0 # LƯU Ý DÒNG NÀY

# Prosody directories
Data directory:     /var/lib/prosody
Config directory:   /etc/prosody
Source directory:   /usr/lib/prosody
Plugin directories:
  /usr/lib/prosody/modules/


# Lua environment
Lua version:                    Lua 5.1

Lua module search paths:
  /usr/lib/prosody/?.lua
  /usr/local/share/lua/5.1/?.lua
  /usr/local/share/lua/5.1/?/init.lua
  /usr/local/lib/lua/5.1/?.lua
  /usr/local/lib/lua/5.1/?/init.lua
  /usr/share/lua/5.1/?.lua
  /usr/share/lua/5.1/?/init.lua

Lua C module search paths:
  /usr/lib/prosody/?.so
  /usr/local/lib/lua/5.1/?.so
  /usr/lib/x86_64-linux-gnu/lua/5.1/?.so
  /usr/lib/lua/5.1/?.so
  /usr/local/lib/lua/5.1/loadall.so

LuaRocks:               Not installed

# Lua module versions
lfs:            LuaFileSystem 1.6.3
libevent:       2.1.8-stable
luaevent:       0.4.4
lxp:            LuaExpat 1.3.0
socket:         LuaSocket 3.0-rc1
ssl:            0.6
```

Chỉ định repo chứa phiên bản
```
echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list
wget https://prosody.im/files/prosody-debian-packages.key -O- | sudo apt-key add -
sudo apt-get update -y
```
Kiểm tra phiên bản hiện có
```
root@jitsi1086:~# apt-cache policy prosody
prosody:
  Installed: 0.10.0-1build1
  Candidate: 0.11.5-1~bionic6
  Version table:
     0.11.5-1~bionic6 500
        500 http://packages.prosody.im/debian bionic/main amd64 Packages
 *** 0.10.0-1build1 500
        500 http://vn.archive.ubuntu.com/ubuntu bionic/universe amd64 Packages
        100 /var/lib/dpkg/status
```
Nâng cấp Version

    sudo apt-get update -y
    sudo apt-get install prosody -y

Kiểm tra
```
root@jitsi1086:~# apt-cache policy prosody
prosody:
  Installed: 0.11.5-1~bionic6
  Candidate: 0.11.5-1~bionic6
  Version table:
 *** 0.11.5-1~bionic6 500
        500 http://packages.prosody.im/debian bionic/main amd64 Packages
        100 /var/lib/dpkg/status
     0.10.0-1build1 500
        500 http://vn.archive.ubuntu.com/ubuntu bionic/universe amd64 Packages
```

## Bước 2: Cấu hình Prosody

Mặc định sau khi nâng cấp Prosody sẽ bỏ qua hết các Virtualhost của bản trước. Vì vậy ta cần thêm lại giá trị này

Truy cập `/etc/prosody/prosody.cfg.lua`, thêm vào cuối file
```
...
.....
---Set up an external component (default component port is 5347)
--
-- External components allow adding various services, such as gateways/
-- transports to other networks like ICQ, MSN and Yahoo. For more info
-- see: https://prosody.im/doc/components#adding_an_external_component
--
--Component "gateway.example.com"
--      component_secret = "password"

Include "conf.d/*.cfg.lua"
```
**LƯU Ý:**

Chỉnh sửa `storage = None` sang `storage = "memory"` tại Domain hiện tại đang sử dụng (Nếu có)

Cách kiểm tra

    grep -Rin 'storage' /etc/prosody/conf.avail

Kiểm tra
```
root@jitsi1086:~# grep -Rin 'storage' /etc/prosody/conf.avail
/etc/prosody/conf.avail/10.10.10.86.cfg.lua:46:    storage = "none"
/etc/prosody/conf.avail/10.10.10.86.cfg.lua:58:    storage = "none"
```
Sau khi sửa, kết quả như sau
```
root@jitsi1086:~# grep -Rin 'storage' /etc/prosody/conf.avail
/etc/prosody/conf.avail/10.10.10.86.cfg.lua:46:    storage = "memory"
/etc/prosody/conf.avail/10.10.10.86.cfg.lua:58:    storage = "memory"
```

Phân quyền lại thư mục Prosody

    chown -R prosody:prosody /etc/prosody/

Khởi động lại prosody

    /etc/init.d/prosody restart

Kiểm tra
```
root@jitsi1086:~# ss -atun | grep 5347
tcp  LISTEN 0      128                127.0.0.1:5347              0.0.0.0:*
tcp  ESTAB  0      0                  127.0.0.1:5347            127.0.0.1:46414
tcp  ESTAB  0      0                  127.0.0.1:5347            127.0.0.1:46416
tcp  LISTEN 0      128                    [::1]:5347                 [::]:*
tcp  ESTAB  0      0         [::ffff:127.0.0.1]:46416  [::ffff:127.0.0.1]:5347
tcp  ESTAB  0      0         [::ffff:127.0.0.1]:46414  [::ffff:127.0.0.1]:5347
```

## Bước 3: Cài đặt Mod Muc Status

Cài đặt môi trường
```
sudo apt update -y
sudo apt install build-essential libreadline-dev -y
sudo apt-get install liblua5.2-dev -y
sudo apt-get install unzip git -y
apt install libssl1.0-dev -y
apt install curl -y
```
Cài đặt Lua Rock
```
wget https://keplerproject.github.io/luarocks/releases/luarocks-2.4.1.tar.gz
tar -xvf luarocks-2.4.1.tar.gz
cd luarocks-2.4.1/

./configure --lua-version=5.2 --versioned-rocks-dir
make build
sudo make install
```
Cài đặt gói hỗ trợ
```
luarocks install net-url
luarocks install lua-cjson 2.1.0-1
luarocks install lbase64
luarocks install luajwtjitsi
luarocks install basexx
```
Tải thêm Plugin mod_muc_status

    cd /usr/share/jitsi-meet/prosody-plugins
    wget https://gist.githubusercontent.com/lacoski/b5717aefe2d5da67bb1360e7150c67aa/raw/1656b7250e2b8e7314a5098d7299aa43cfe3a0a9/mod_muc_status.lua

Cấu hình Mod Muc Status (Thêm vào Virtual Host chính) tại đường dẫn `/etc/prosody/conf.avail/10.10.10.86.cfg.lua`
```
...
allow_empty_token = true # Thêm dòng này
...
VirtualHost "10.10.10.86"
        ssl = {
                key = "/etc/prosody/certs/10.10.10.86.key";
                certificate = "/etc/prosody/certs/10.10.10.86.crt";
        }
        speakerstats_component = "speakerstats.10.10.10.86"
        conference_duration_component = "conferenceduration.10.10.10.86"
        -- we need bosh
        modules_enabled = {
            "bosh";
            "pubsub";
            "ping"; -- Enable mod_ping
            "speakerstats";
            "turncredentials";
            "conference_duration";
	        "muc_status"; # Thêm dòng này
        }
	    app_id=""
        app_secret=""
        c2s_require_encryption = false
```
Khởi động lại Prosody

    /etc/init.d/prosody restart

Kiểm tra các đường dẫn

    curl http://10.10.10.86:5280/status?domain=10.10.10.86

http://meet.workfromhome.vn:5280/status?domain=meet.workfromhome.vn

http://meet.workfromhome.vn:5280/sessions

Nguồn:

https://community.jitsi.org/t/statiscs-just-enable-muc-size/22298/12

https://community.jitsi.org/t/jitsi-monitoring-mod-room-list-occupant-list/31191