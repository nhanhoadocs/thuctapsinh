# Chỉnh timestamp

Mặc định thì đồng hồ đo thời gian phòng họp sẽ là bắt đầu từ mốc 7:00:00. Do Jitsi đã fix cứng mốc thời gian bắt đầu từ múi giờ UTC. Vậy ta cần chỉnh lại để bộ đếm thời gian được chính xác.

Sửa file : `/usr/share/jitsi-meet/prosody-plugins/mod_conference_duration_component.lua`

    vi /usr/share/jitsi-meet/prosody-plugins/mod_conference_duration_component.lua

Sửa phần:

    room.created_timestamp = os.time(os.date("!*t")) * 1000;

thành

    room.created_timestamp = os.time(os.date("*t")) * 1000;

Khởi động lại Prosody

    /etc/init.d/prosody restart