# Hướng dẫn cấu hình thống kê Jitsi

## Bản mới
- Thay đổi thông số sau trong file cấu hình `/etc/jitsi/videobridge/config`
    ```
    JVB_OPTS="--apis=rest"
    ```
- Rồi restart lại service
    ```
    service jitsi-videobridge2 restart
    ```

- Mở port 8080. Trên Ubuntu 18.04
    ```
    ufw allow from any to any port 8080 proto tcp
    ```

- Kiểm tra ở địa chỉ sau:
    ```
    http://<ip-jitsi>:8080/colibri/stats
    ```


## Bản cũ
- Thêm cấu hình sau nếu chưa có vào file `/etc/jitsi/videobridge/sip-communicator.properties`
    ```
    org.jitsi.videobridge.ENABLE_STATISTICS=true
    ```

- Chỉnh sửa file cấu hình /etc/jitsi/videobridge/config
    ```
    JVB_OPTS="--apis=rest,xmpp"
    ```

- Sau đó restart service và kiểm tra như trên.
    ```
    service jitsi-videobridge restart
    ```

## Để thay đổi port lấy API ta làm như sau
Thêm dòng sau vào file `/etc/jitsi/videobridge/sip-communicator.properties`
```
org.jitsi.videobridge.rest.private.jetty.port=9999
```
Trong đó: 9999 là port bạn muốn sử dụng.

Lưu ý: Nên kiểm tra port có đang chạy dịch vụ nào không trước khi gán.

Sau đó restart lại dịch vụ
```
service jitsi-videobridge restart
```

## Ví dụ kết quả thống kê dưới dạng json

```json
  "inactive_endpoints": 2,          
  "inactive_conferences": 1,
  "total_ice_succeeded_relayed": 0,
  "total_loss_degraded_participant_seconds": 0,
  "bit_rate_download": 1,      
  "muc_clients_connected": 1,
  "total_participants": 3,
  "total_packets_received": 0,
  "rtt_aggregate": 8.5,
  "packet_rate_upload": 4,
  "p2p_conferences": 1,
  "total_loss_limited_participant_seconds": 0,
  "octo_send_bitrate": 0,
  "total_dominant_speaker_changes": 179,
  "receive_only_endpoints": 0,
  "total_colibri_web_socket_messages_received": 0,
  "octo_receive_bitrate": 0,
  "loss_rate_upload": 0.0,
  "version": "2.1.169-ga28eb88e",
  "total_ice_succeeded": 3,
  "total_colibri_web_socket_messages_sent": 0,
  "total_bytes_sent_octo": 0,
  "total_data_channel_messages_received": 2241,
  "loss_rate_download": 0.0,
  "total_conference_seconds": 0,
  "bit_rate_upload": 2,
  "total_conferences_completed": 0,
  "octo_conferences": 0,
  "num_eps_no_msg_transport_after_delay": 0,
  "endpoints_sending_video": 0,
  "packet_rate_download": 4,
  "muc_clients_configured": 1,
  "conference_sizes": [
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ],
  "total_packets_sent_octo": 0,
  "conferences_by_video_senders": [
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ],
  "videostreams": 4,
  "jitter_aggregate": 2.828048968682684,
  "total_ice_succeeded_tcp": 0,
  "octo_endpoints": 0,
  "current_timestamp": "2020-04-15 02:34:21.213",
  "total_packets_dropped_octo": 0,  
  "conferences": 1,
  "participants": 2,
  "largest_conference": 2,
  "total_packets_sent": 0,
  "total_data_channel_messages_sent": 3071,
  "total_bytes_received_octo": 0,
  "octo_send_packet_rate": 0,
  "conferences_by_audio_senders": [
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ],
  "total_conferences_created": 1,
  "total_ice_failed": 0,
  "threads": 62,       
  "videochannels": 2,
  "total_packets_received_octo": 0,
  "graceful_shutdown": false,
  "octo_receive_packet_rate": 0,
  "total_bytes_received": 0,
  "rtp_loss": 0.0,
  "total_loss_controlled_participant_seconds": 12,
  "total_partially_failed_conferences": 0,
  "endpoints_sending_audio": 0,
  "total_bytes_sent": 0,
  "mucs_configured": 1,
  "total_failed_conferences": 0,
  "mucs_joined": 1
}
```

