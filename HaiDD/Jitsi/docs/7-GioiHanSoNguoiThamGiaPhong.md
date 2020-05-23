# Giới hạn số người tối đa tham gia phòng họp trên Jitsi

## Lưu ý:
- Node jitsi cài theo tài liệu https://news.cloud365.vn/huong-dan-cai-dat-jitsi-meet-tren-ubuntu-18-04-lts/
- Đã cấu hình xong letencrypt, domain https://jitsi.dangdohai.xyz

---

# Bước 1: Nâng cấp Version Prosody
### Lưu ý:
- Mặc định Version cài đặt Jitsi là 0.10.0
- Để giới hạn được số người truy cập mỗi phòng ta cần upgrade lên version 0.11.5

### Thực hiện
- Câu lệnh kiểm tra Version
    ```
    prosodyctl about
    ```
    **OUTPUT**
    ```
    Prosody 0.10.0

    # Prosody directories
    Data directory:     /var/lib/prosody
    Config directory:   /etc/prosody
    Source directory:   /usr/lib/prosody
    Plugin directories:
    /usr/share/jitsi-meet/prosody-plugins/
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

- Chỉ định repo chứa phiên bản
    ```
    echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | tee -a /etc/apt/sources.list

    wget https://prosody.im/files/prosody-debian-packages.key -O- | apt-key add -

    apt-get update -y
    ```

- Kiểm tra phiên bản hiện có
    ```
    apt-cache policy prosody
    ```
    OUTPUT:
    ```
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

- Nâng cấp Version
    ```
    apt-get update -y

    apt-get install prosody -y
    ```

- Kiểm tra lại
    ```
    apt-cache policy prosody
    ```
    OUTPUT
    ```
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

# Bước 2: Cấu hình Prosody
Mặc định sau khi nâng cấp Prosody sẽ bỏ qua hết các Virtualhost của bản trước. Vì vậy ta cần thêm lại giá trị này

- Truy cập `/etc/prosody/prosody.cfg.lua`
    ```
    vi /etc/prosody/prosody.cfg.lua
    ```
    Thêm vào cuối file
    ```
    Include "conf.d/*.cfg.lua"
    ```

**LƯU Ý:**
Chỉnh sửa `storage = None` sang `storage = "memory"` tại Domain hiện tại đang sử dụng (Nếu có)

- Để kiểm tra, ta sử dụng lệnh
    ```
    grep -Rin 'storage' /etc/prosody/conf.avail
    ```
    OUTPUT
    ```
    /etc/prosody/conf.avail/jitsi.dangdohai.xyz.cfg.lua:46:    storage = "none"
    /etc/prosody/conf.avail/jitsi.dangdohai.xyz.cfg.lua:58:    storage = "none"
    ```

- Tiến hành sửa file `/etc/prosody/conf.avail/jitsi.dangdohai.xyz.cfg.lua`

- Kết quả sau khi sửa
    ```
    /etc/prosody/conf.avail/jitsi.dangdohai.xyz.cfg.lua:46:    storage = "memory"
    /etc/prosody/conf.avail/jitsi.dangdohai.xyz.cfg.lua:58:    storage = "memory"
    ```

- File cấu hình mẫu
    ```conf
    plugin_paths = { "/usr/share/jitsi-meet/prosody-plugins/" }

    -- domain mapper options, must at least have domain base set to use the mapper
    muc_mapper_domain_base = "jitsi.dangdohai.xyz";

    turncredentials_secret = "yzetI7wc4t0u7ydm";

    turncredentials = {
    { type = "stun", host = "jitsi.dangdohai.xyz", port = "4446" },
    { type = "turn", host = "jitsi.dangdohai.xyz", port = "4446", transport = "udp" },
    { type = "turns", host = "jitsi.dangdohai.xyz", port = "443", transport = "tcp" }
    };

    cross_domain_bosh = false;
    consider_bosh_secure = true;

    VirtualHost "jitsi.dangdohai.xyz"
            -- enabled = false -- Remove this line to enable this host
            authentication = "anonymous"
            -- Properties below are modified by jitsi-meet-tokens package config
            -- and authentication above is switched to "token"
            --app_id="example_app_id"
            --app_secret="example_app_secret"
            -- Assign this host a certificate for TLS, otherwise it would use the one
            -- set in the global section (if any).
            -- Note that old-style SSL on port 5223 only supports one certificate, and will always
            -- use the global one.
            ssl = {
                    key = "/etc/prosody/certs/jitsi.dangdohai.xyz.key";
                    certificate = "/etc/prosody/certs/jitsi.dangdohai.xyz.crt";
            }
            speakerstats_component = "speakerstats.jitsi.dangdohai.xyz"
            conference_duration_component = "conferenceduration.jitsi.dangdohai.xyz"
            -- we need bosh
            modules_enabled = {
                "bosh";
                "pubsub";
                "ping"; -- Enable mod_ping
                "speakerstats";
                "turncredentials";
                "conference_duration";
            }
            c2s_require_encryption = false

    Component "conference.jitsi.dangdohai.xyz" "muc"
        storage = "memory"
        modules_enabled = {
            "muc_meeting_id";
            "muc_domain_mapper";
            -- "token_verification";
        }
        admins = { "focus@auth.jitsi.dangdohai.xyz" }
        muc_room_locking = false
        muc_room_default_public_jids = true

    -- internal muc component
    Component "internal.auth.jitsi.dangdohai.xyz" "muc"
        storage = "memory"
        modules_enabled = {
        "ping";
        }
        admins = { "focus@auth.jitsi.dangdohai.xyz", "jvb@auth.jitsi.dangdohai.xyz" }
        muc_room_locking = false
        muc_room_default_public_jids = true

    VirtualHost "auth.jitsi.dangdohai.xyz"
        ssl = {
            key = "/etc/prosody/certs/auth.jitsi.dangdohai.xyz.key";
            certificate = "/etc/prosody/certs/auth.jitsi.dangdohai.xyz.crt";
        }
        authentication = "internal_plain"

    Component "focus.jitsi.dangdohai.xyz"
        component_secret = "MkSteufw"

    Component "speakerstats.jitsi.dangdohai.xyz" "speakerstats_component"
        muc_component = "conference.jitsi.dangdohai.xyz"

    Component "conferenceduration.jitsi.dangdohai.xyz" "conference_duration_component"
        muc_component = "conference.jitsi.dangdohai.xyz"

    VirtualHost "recorder.jitsi.dangdohai.xyz"
        modules_enabled = {
            "ping";
        }
        authentication = "internal_plain"
    ```

- Khởi động lại prosody
    ```
    /etc/init.d/prosody restart
    ```

- Kiểm tra
    ```
    ss -atun | grep 5347
    ```
    OUTPUT
    ```
    tcp  LISTEN    0      128                   127.0.0.1:5347         0.0.0.0:*
    tcp  LISTEN    0      128                       [::1]:5347            [::]:*
    tcp  ESTAB     0      0                         [::1]:44070          [::1]:5347
    tcp  ESTAB     0      0                         [::1]:5347           [::1]:44070
    ```

Kiểm tra lại phòng họp, tạo cuộc họp và test khi có người truy cập

# Bước 3: Cấu hình giới hạn User trên mỗi phòng
Ta sẽ sử dụng module `mod_muc_max_occupants` để giới hạn user truy cập trên phòng

**Lưu ý:** Nếu cài Jitsi từ APT, module này đã có sẵn trong thư mục `/usr/share/jitsi-meet/prosody-plugins/`

- Kiểm tra
    ```
    ll -lh /usr/share/jitsi-meet/prosody-plugins/mod_muc_*
    ```
    OUTPUT
    ```
    -rw-r--r-- 1 root root  462 Feb 26  2017 /usr/share/jitsi-meet/prosody-plugins/mod_muc_allowners.lua
    -rw-r--r-- 1 root root 4.0K Jul 17  2018 /usr/share/jitsi-meet/prosody-plugins/mod_muc_call.lua
    -rw-r--r-- 1 root root 6.3K Dec 10 17:00 /usr/share/jitsi-meet/prosody-plugins/mod_muc_domain_mapper.lua
    -rw-r--r-- 1 root root 2.3K Apr  1 05:44 /usr/share/jitsi-meet/prosody-plugins/mod_muc_max_occupants.lua
    -rw-r--r-- 1 root root 1.1K Nov 26 17:51 /usr/share/jitsi-meet/prosody-plugins/mod_muc_meeting_id.lua
    -rw-r--r-- 1 root root  11K Jan 24 02:51 /usr/share/jitsi-meet/prosody-plugins/mod_muc_poltergeist.lua
    -rw-r--r-- 1 root root 6.1K Jan 24 02:51 /usr/share/jitsi-meet/prosody-plugins/mod_muc_size.lua
    ```

- Cấu hình Domain giới hạn số lượng truy cập. Chỉnh sửa file `/etc/prosody/conf.avail/jitsi.dangdohai.xyz.cfg.lua`
    
    **Lưu ý:** Thêm mới giá trị vào phần `Component "conference.jitsi.dangdohai.xyz" "muc"`.
    - `muc_max_occupants` bằng số lượng người tham gia tối đa trên mỗi phòng. Trong bài giới hạn tối đa 5 người
    - `muc_access_whitelist` domain được phép truy cập kể cả khi phòng đã tới giới hạn

    Cấu hình mẫu
    ```
    Component "conference.jitsi.dangdohai.xyz" "muc"
    storage = "memory"
    modules_enabled = {
        "muc_meeting_id";
        "muc_domain_mapper";
        -- "token_verification";
        "muc_max_occupants";
    }
    admins = { "focus@auth.jitsi.dangdohai.xyz" }
    muc_room_locking = false
    muc_room_default_public_jids = true
    muc_access_whitelist = {"auth.jitsi.dangdohai.xyz"}
    muc_max_occupants = 5
    ```

- Khởi động lại Prosody
    ```
    /etc/init.d/prosody restart
    ```

# Bước 4: Chỉnh timestamp
Mặc định thì đồng hồ đo thời gian phòng họp sẽ là bắt đầu từ mốc 7:00:00. Do Jitsi đã fix cứng mốc thời gian bắt đầu từ múi giờ UTC. Vậy ta cần chỉnh lại để bộ đếm thời gian được chính xác.

- Sửa file : `/usr/share/jitsi-meet/prosody-plugins/mod_conference_duration_component.lua`
    ```
    vi /usr/share/jitsi-meet/prosody-plugins/mod_conference_duration_component.lua
    ```

- Sửa phần:
    ```
    room.created_timestamp = os.time(os.date("!*t")) * 1000;
    ```
    thành
    ```
    room.created_timestamp = os.time(os.date("*t")) * 1000;
    ```

- Khởi động lại Prosody
    ```
    /etc/init.d/prosody restart
    ```
    
# Bước 5: Truy cập jitsi và kiểm tra
Tới user thứ 6 truy cập sẽ thầy thông báo sau `Maximum participants limit reached`

- Trong phòng có sẵn 5 người

    <img src="https://i.imgur.com/GWVyU2k.png">

- Người thứ 6 truy cập sẽ nhận được thông báo
    
    <img src="https://i.imgur.com/PcmJg6l.png">