# Jitsi Video Recording

Thông thường Recording và livestreaming của Jitsi do thành phần Jibri đảm nhận

Tuy nhiên nếu cài thủ công theo tài liệu trên news, hoăc boot từ image Cloud365 thì jibri mặc định sẽ không có.

## Cấu hình prosody bổ sung Virtualhost

Vào file `/etc/prosody/conf.d/<domain>.cfg.lua`.

Ở ví dụ này sẽ là `/etc/prosody/conf.d/jitsi.dangdohai.xyz.cfg.lua`.

Bổ sung các dòng sau nếu chưa có:

```
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

Restart prosody

    /etc/init.d/prosody reload

Tạo các tài khoản cần thiết

    prosodyctl register jibri auth.jitsi.dangdohai.xyz password
    prosodyctl register recorder recorder.jitsi.dangdohai.xyz password

## Cấu hình jicofo

    vi /etc/jitsi/jicofo/sip-communicator.properties

Bổ sung các cấu hình sau

    org.jitsi.jicofo.jibri.BREWERY=JibriBrewery@internal.auth.jitsi.dangdohai.xyz
    org.jitsi.jicofo.jibri.PENDING_TIMEOUT=90

Mẫu

    org.jitsi.jicofo.BRIDGE_MUC=JvbBrewery@internal.auth.jitsi.dangdohai.xyz
    org.jitsi.jicofo.auth.URL=XMPP:jitsi.dangdohai.xyz
    org.jitsi.jicofo.jibri.BREWERY=JibriBrewery@internal.auth.jitsi.dangdohai.xyz
    org.jitsi.jicofo.jibri.PENDING_TIMEOUT=90

Restart Jicofo

    /etc/init.d/jicofo restart

## Cấu hình jitsi

Cấu hình jitsi

Bổ sung các cấu hình sau để enable tính năng recording của jitsi

    vi /etc/jitsi/meet/jitsi.dangdohai.xyz-config.js

    fileRecordingsEnabled: true,
    liveStreamingEnabled: true,
    hiddenDomain: 'recorder.jitsi.dangdohai.xyz',

Sửa file `/usr/share/jitsi-meet/interface_config.js`

    vi /usr/share/jitsi-meet/interface_config.js

Tại phần TOOLBAR_BUTTONS Bổ sung nếu thiếu

    'recording', 'livestreaming'

## Cài đặt Jibri

Trong hướng dẫn ở youtube tác giả cài đặt Jibri trên 1 node khác, tuy nhiên mình hoàn toàn có thể cài đặt Jibri All in One trên cùng node Jitsi luôn

Kiểm tra xem jibri đã được cài đặt hay chưa

    dpkg -l | grep jibri

Nếu chưa có gì thì ta tiến hành cài đặt tiếp. Không thì chuyển sang phase cấu hình

Cài đặt  linux-image-extra-virtual

linux-image-extra-virtual là một modules được loại bỏ bớt cho bản server,  linux-image-extra-virtual thường dùng cho bản desktop. Vì tiếp theo chúng ta cần cài đặt chrome để record video nên phải cài  linux-image-extra-virtual. Chú ý cần phải cài phiên bản phù hợp với kernel

    apt update -y
    apt -y install linux-image-extra-virtual

    uname -a
    dpkg -l | grep linux-image-extra-virtual

![Imgur](https://i.imgur.com/frcse5j.png)

Reboot lại server

    reboot

Load module to enable record audio 

    modprobe snd-aloop

    lsmod | grep aloop  

![Imgur](https://i.imgur.com/4CEu8Cy.png)

    echo "snd-aloop" >> /etc/modules

Cài đặt Google Chrome và chromedriver

    apt -y install unzip curl

    cd && wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

    apt update -y
    apt -y install google-chrome-stable

    CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`

    wget http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip

    unzip chromedriver_linux64.zip -d /usr/local/bin/

    ll /usr/local/bin/

Cài đặt Jibri

    wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -

    echo "deb https://download.jitsi.org unstable/" > /etc/apt/sources.list.d/jitsi-unstable.list

    apt update -y

    apt -y install jibri

Cấu hình jibri

    cp /etc/jitsi/jibri/config.json /etc/jitsi/jibri/config.json.bak

    vi /etc/jitsi/jibri/config.json
```
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
                "password": "password"
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
                "password": "password"
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

Tạo thư mục để chứa các file record

    mkdir /srv/recordings
    chown jibri:jitsi /srv/recordings/

Restart jibri

    service jibri restart
    service jibri status

Tiến hành record video