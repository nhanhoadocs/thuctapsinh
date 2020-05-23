# Tính năng Record Video trên Jitsi

Thông thường Recording và livestreaming của Jitsi do thành phần Jibri đảm nhận

Tuy nhiên nếu cài thủ công theo tài liệu trên news, hoăc boot từ image Cloud365 thì jibri mặc định sẽ không có.

**Trong hướng dẫn này:**

Domain Server Jitsi sử dụng: ***jitsi.dangdohai.xyz***

---

## 1. Cấu hình Prosody
### Bước 1: Bổ sung một số mục còn thiếu vào file cấu hình
- Thêm các dòng sau vào file `/etc/prosody/conf.d/<DOMAIN>.cfg.lua` nếu trong file chưa có

    Trong hướng dẫn này, file đó sẽ là : `/etc/prosody/conf.d/jitsi.dangdohai.xyz.cfg.lua`
    ```java
    Component "internal.auth.jitsi.dangdohai.xyz" "muc"
        storage = "none"
        modules_enabled = {
        "ping";
        }
        admins = { "focus@auth.jitsi.dangdohai.xyz", "jvb@auth.jitsi.dangdohai.xyz" }
        muc_room_locking = false
        muc_room_default_public_jids = true

    VirtualHost "recorder.jitsi.dangdohai.xyz"
        modules_enabled = {
            "ping";
        }
        authentication = "internal_plain"
    ```

**File mẫu:**
```java
plugin_paths = { "/usr/share/jitsi-meet/prosody-plugins/" }

-- domain mapper options, must at least have domain base set to use the mapper
muc_mapper_domain_base = "jitsi.dangdohai.xyz";

turncredentials_secret = "yshBE07k";

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
    storage = "none"
    modules_enabled = {
        "muc_meeting_id";
        "muc_domain_mapper";
        -- "token_verification";
    }
    admins = { "focus@auth.jitsi.dangdohai.xyz" }

-- internal muc component
Component "internal.auth.jitsi.dangdohai.xyz" "muc"
    storage = "none"
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
    component_secret = "3mbYxAuE"

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

- Reload prosody
    ```
    /etc/init.d/prosody reload
    ```

### Bước 2: Tạo các tài khoản cần thiết
```
prosodyctl register jibri auth.jitsi.dangdohai.xyz jibripass
prosodyctl register recorder recorder.jitsi.dangdohai.xyz recorderpass
```

## 2. Cấu hình Jicofo
- Sửa file `/etc/jitsi/jicofo/sip-communicator.properties`
    ```
    vi /etc/jitsi/jicofo/sip-communicator.properties
    ```

    Thêm vào các dòng sau :
    ```
    org.jitsi.jicofo.jibri.BREWERY=JibriBrewery@internal.auth.jitsi.dangdohai.xyz
    org.jitsi.jicofo.jibri.PENDING_TIMEOUT=90
    ```

    **Lưu ý:** Sử dụng đúng domain server Jitsi của bạn

- Restart Jicofo
    ```
    /etc/init.d/jicofo restart
    ```

## 3. Cấu hình Jitsi
- Bổ sung các cấu hình sau để enable tính năng recording của jitsi

    ```
    vi /etc/jitsi/meet/jitsi.dangdohai.xyz-config.js
    ```

    Thêm vào các dòng sau
    ```
    fileRecordingsEnabled: true,
    liveStreamingEnabled: true,
    hiddenDomain: 'recorder.jitsi.dangdohai.xyz',
    ```

    <img src ="https://i.imgur.com/9aocerH.png">

- Chỉnh sửa file `/usr/share/jitsi-meet/interface_config.js`
    ```
    vi /usr/share/jitsi-meet/interface_config.js
    ```
    Tại phần `TOOLBAR_BUTTONS` bổ sung nếu chưa có
    ```
    'recording', 'livestreaming'
    ```

    <img src="https://i.imgur.com/hw6FB46.png">

## 4. Cài đặt Jibri
Trong hướng dẫn ở youtube tác giả cài đặt Jibri trên 1 node khác, tuy nhiên mình hoàn toàn có thể cài đặt Jibri All in One trên cùng node Jitsi luôn.

### Bước 1: Cài đặt các gói cần thiết
- Cài đặt  `linux-image-extra-virtual` : `linux-image-extra-virtual` là một modules được loại bỏ bớt cho bản server, `linux-image-extra-virtual` thường dùng cho bản desktop. Vì tiếp theo chúng ta cần cài đặt chrome để record video nên phải cài  `linux-image-extra-virtual`. 
    
    **Chú ý**: cần phải cài phiên bản phù hợp với kernel

    ```
    apt update -y
    apt -y install linux-image-extra-virtual
    ```

- Kiểm tra phiên bản Kernel
    ```
    uname -a
    ```

    <img src="https://i.imgur.com/J09x1au.png">

    Kiểm tra phiên bản `linux-image-extra-virtual`
    ```
    dpkg -l | grep linux-image-extra-virtual
    ```

    <img src="https://i.imgur.com/l19snVV.png">

- Lưu ý: Nếu a thấy 2 phiên bản không giống nhau, ta cần update để đưa cùng về 1 phiên bản
    ```
    apt update -y
    apt upgrade
    apt install --reinstall linux-image-generic
    ```

- Reboot server
    ```
    reboot
    ```

- Load module to enable record audio
    ```
    echo "snd-aloop" >> /etc/modules
    modprobe snd-aloop
    ```

- Kiểm tra
    ```
    lsmod | grep aloop
    ```
    <img src="https://i.imgur.com/IAsSyAV.png">


- Cài đặt Google Chrome và Chrome driver
    
    Cài đặt Google Chrome
    ```
    apt -y install unzip

    cd && wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

    apt update -y

    apt -y install google-chrome-stable
    ```

    Ẩn cảnh báo Chrome
    ```
    mkdir -p /etc/opt/chrome/policies/managed

    echo '{ "CommandLineFlagSecurityWarningsEnabled": false }' >>/etc/opt/chrome/policies/managed/managed_policies.json
    ```

    Cài đặt Chrome driver mới nhất
    ```
    apt -y install curl

    CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`

    wget http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip

    unzip chromedriver_linux64.zip -d /usr/local/bin/

    rm -f chromedriver_linux64.zip

    chown root:root /usr/local/bin/chromedriver

    chmod 0755 /usr/local/bin/chromedriver
    ```


    Kiểm tra lại thư mục giải nén
    ```
    ll /usr/local/bin/
    ```
    <img src="https://i.imgur.com/kPnz8kn.png">

    Khi kiểm tra đã có file driver, ta xóa file nén đã tải về đi:
    ```
    rm -f /root/chromedriver_linux64.zip
    ```

### Bước 2 : Cài đặt Jibri
- Kiểm tra xem jibri đã được cài đặt hay chưa
    ```
    dpkg -l | grep jibri
    ```

**Lưu ý:** Nếu không có gì tức là jibri chưa được cài đặt. Ta sẽ tiến hành cài đặt.
Còn nếu đã cài đặt, thì ta sẽ chuyển sang Bước 3 cấu hình Jibri

- Cài đặt Jibri:
    ```
    wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -

    
    echo "deb https://download.jitsi.org unstable/" > /etc/apt/sources.list.d/jitsi-unstable.list

    apt update

    apt -y install jibri
    ```

### Bước 3: Cấu hình Jibri
- Backup file cấu hình
    ```
    cp /etc/jitsi/jibri/config.json /etc/jitsi/jibri/config.json.bak
    ```

- Sửa file cấu hình
    ```
    vi /etc/jitsi/jibri/config.json
    ```
    Chỉnh sửa các dòng sau:
    Mục `control_login` và `call_login` thì user và password là 2 tài khoản ta tạo ở bước 2.
    ```js
    "recording_directory":"/srv/recordings",
    "xmpp_environments": [
            {
                "name": "prod environment",
                "xmpp_server_hosts": [
                    "jitsi.dangdohai.xyz"
                ],
                "xmpp_domain": "jitsi.dangdohai.xyz",
                "control_login": {
                    "domain": "auth.jitsi.dangdohai.xyz",
                    "username": "jibri",
                    "password": "jibripass"
                },
                "control_muc": {
                    "domain": "internal.auth.jitsi.dangdohai.xyz",
                    "room_name": "JibriBrewery",
                    "nickname": "jibri-nickname"
                },
                "call_login": {
                    "domain": "recorder.jitsi.dangdohai.xyz",
                    "username": "recorder",
                    "password": "recorderpass"
                },
    ```

    **File mẫu:**
    ```js
    {
        // NOTE: this is a *SAMPLE* config file, it will need to be configured with
        // values from your environment

        // Where recording files should be temporarily stored
        "recording_directory":"/srv/recordings",
        // The path to the script which will be run on completed recordings
        "finalize_recording_script_path": "/path/to/finalize_recording.sh",
        "xmpp_environments": [
            {
                // A friendly name for this environment which can be used
                //  for logging, stats, etc.
                "name": "prod environment",
                // The hosts of the XMPP servers to connect to as part of
                //  this environment
                "xmpp_server_hosts": [
                    "jitsi.dangdohai.xyz"
                ],
                // The xmpp domain we'll connect to on the XMPP server
                "xmpp_domain": "jitsi.dangdohai.xyz",
                // Jibri will login to the xmpp server as a privileged user
                "control_login": {
                    // The domain to use for logging in
                    "domain": "auth.jitsi.dangdohai.xyz",
                    // The credentials for logging in
                    "username": "jibri",
                    "password": "jibripass"
                },
                // Using the control_login information above, Jibri will join
                //  a control muc as a means of announcing its availability
                //  to provide services for a given environment
                "control_muc": {
                    "domain": "internal.auth.jitsi.dangdohai.xyz",
                    "room_name": "JibriBrewery",
                    "nickname": "jibri-nickname"
                },
                // All participants in a call join a muc so they can exchange
                //  information.  Jibri can be instructed to join a special muc
                //  with credentials to give it special abilities (e.g. not being
                //  displayed to other users like a normal participant)
                "call_login": {
                    "domain": "recorder.jitsi.dangdohai.xyz",
                    "username": "recorder",
                    "password": "recorderpass"
                },
                // When jibri gets a request to start a service for a room, the room
                //  jid will look like:
                //  roomName@optional.prefixes.subdomain.xmpp_domain
                // We'll build the url for the call by transforming that into:
                //  https://xmpp_domain/subdomain/roomName
                // So if there are any prefixes in the jid (like jitsi meet, which
                //  has its participants join a muc at conference.xmpp_domain) then
                //  list that prefix here so it can be stripped out to generate
                //  the call url correctly
                "room_jid_domain_string_to_strip_from_start": "conference.",
                // The amount of time, in minutes, a service is allowed to continue.
                //  Once a service has been running for this long, it will be
                //  stopped (cleanly).  A value of 0 means an indefinite amount
                //  of time is allowed
                "usage_timeout": "0"
            }
        ]
    }
    ```

- Tạo và phân quyền thư mục để chứa các file record
    ```
    mkdir /srv/recordings
    chown jibri:jitsi /srv/recordings/
    ```

- Restart jibri
    ```
    service jibri restart
    service jibri status
    systemctl enable jibri
    ```


