# Hướng dẫn cấu hình thống kê Jitsi
## Bản mới
Thay đổi thông số sau trong file cấu hình `/etc/jitsi/videobridge/config`
    
    JVB_OPTS="--apis=rest"

Rồi restart lại service

    service jitsi-videobridge2 restart

Kiểm tra ở địa chỉ sau:

http://ip-jitsi:8080/colibri/stats

## Bản cũ
Thêm cấu hình sau nếu chưa có vào file `/etc/jitsi/videobridge/sip-communicator.properties`

    org.jitsi.videobridge.ENABLE_STATISTICS=true

Chỉnh sửa file cấu hình `/etc/jitsi/videobridge/config`

    JVB_OPTS="--apis=rest,xmpp"

Sau đó restart service và kiểm tra như trên.

    service jitsi-videobridge restart

![Imgur](https://i.imgur.com/5EwnM54.png)



```
{"inactive_endpoints":0,"inactive_conferences":0,"total_ice_succeeded_relayed":0,"total_loss_degraded_participant_seconds":0,"bit_rate_download":0,"muc_clients_connected":1,"total_participants":0,"total_packets_received":0,"rtt_aggregate":0.0,"packet_rate_upload":0,"p2p_conferences":0,"total_loss_limited_participant_seconds":0,"octo_send_bitrate":0,"total_dominant_speaker_changes":0,"receive_only_endpoints":0,"total_colibri_web_socket_messages_received":0,"octo_receive_bitrate":0,"loss_rate_upload":0.0,"version":"2.1.169-ga28eb88e","total_ice_succeeded":0,"total_colibri_web_socket_messages_sent":0,"total_bytes_sent_octo":0,"total_data_channel_messages_received":0,"loss_rate_download":0.0,"total_conference_seconds":0,"bit_rate_upload":0,"total_conferences_completed":0,"octo_conferences":0,"num_eps_no_msg_transport_after_delay":0,"endpoints_sending_video":0,"packet_rate_download":0,"muc_clients_configured":1,"conference_sizes":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"total_packets_sent_octo":0,"conferences_by_video_senders":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"videostreams":0,"jitter_aggregate":0.0,"total_ice_succeeded_tcp":0,"octo_endpoints":0,"current_timestamp":"2020-04-18 07:16:15.544","total_packets_dropped_octo":0,"conferences":0,"participants":0,"largest_conference":0,"total_packets_sent":0,"total_data_channel_messages_sent":0,"total_bytes_received_octo":0,"octo_send_packet_rate":0,"conferences_by_audio_senders":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"total_conferences_created":0,"total_ice_failed":0,"threads":36,"videochannels":0,"total_packets_received_octo":0,"graceful_shutdown":false,"octo_receive_packet_rate":0,"total_bytes_received":0,"rtp_loss":0.0,"total_loss_controlled_participant_seconds":0,"total_partially_failed_conferences":0,"endpoints_sending_audio":0,"total_bytes_sent":0,"mucs_configured":1,"total_failed_conferences":0,"mucs_joined":1}
```



## Các thông số và ý nghĩa

https://github.com/jitsi/jitsi-videobridge/blob/master/doc/statistics.md

- `current_timestamp` : Giá trị là ngày và thời gian khi số liệu thống kê được tạo (múi giờ UTC).

- `threads` : Số lượng các luồng Java mà video bridge đang sử dụng.

- `bit_rate_download` : tổng tốc độ bit đến của video brigde (kilobit/s)

- `bit_rate_upload` : tổng tốc độ bit đi ra ngoài của video brigde (kilobit/s)

- ` packet_rate_download` : tổng tốc độ gói đến (số packet/s)

- `packet_rate_upload` : tổng tốc độ gói đi (số packet/s)

- `loss_rate_download` : Các thành phần của gói RTP đến bị mất. Điều này dựa trên số thứ tự RTP và tương đối chính xác

- `loss_rate_upload` : Các phần của gói RTP đi ra ngoài bị mất. Điều này dựa trên Báo cáo người nhận RTCP đến và cố gắng trừ đi phần nhỏ của các gói không được gửi. Thông số này được tính trung bình vì vậy Điều này không chính xác, nhưng dù sao cũng có thể là một số liệu hữu ích.

- `rtp_loss` : Tổng của loss_rate_doad và loss_rate_upload.

- `rtt_aggregate` : Giá trị trung bình (tính bằng mili giây) của RTT trên tất cả các luồng.

- `largest_conference` : Số lượng người tham gia hội nghị lớn nhất hiện đang được tổ chức.

- `conference_sizes` : Sự phân bố quy mô phòng họp. Nó là mảng số nguyên có kích thước 15 và giá trị tại chỉ số i là số lượng hội nghị với i người tham gia. Yếu tố cuối cùng (chỉ số 14) cũng bao gồm các hội nghị với hơn 14 người tham gia.

- `audiochannels` : Số lượng kênh âm thanh hiện tại

- `videochannels` : Số lượng kênh video hiện tại.

- `conferences` : Số lượng hội nghị hiện tại

- `participants` : Số lượng người tham gia hiện tại

- `videostreams` : Ước tính số lượng luồng video hiện tại được chuyển tiếp bởi bridge.

- `total_loss_controlled_participant_seconds` : Tổng thời gian tham gia của người dùng bị mất kiểm soát. (tính bằng giây)

- `total_loss_limited_participant_seconds` : Tổng số giây người tham gia bị giới hạn mất kiểm soát.

- `total_loss_degraded_participant_seconds` : Tổng thời gian người tham gia bị giảm chất lượng cuộc họp (tính bằng giây)

- `total_conference_seconds` : Tổng độ dài của tất cả các hội nghị đã hoàn thành. Tính bằng giây.

- `total_conferences_created` : Tổng số hội nghị được tạo ra

- `total_failed_conferences` : Tổng số hội nghị bị failed. Một hội nghị bị failed khi tất cả các kênh của nó đều thất bại. Một kênh thất bại nếu nó không có hoạt động tải trọng.

- `total_partially_failed_conferences` : Tổng số hội nghị thất bại một phần. Một hội nghị được đánh dấu là thất bại một phần khi một số kênh của nó bị lỗi

- `total_data_channel_messages_received` / `total_data_channel_messages_sent` : Tổng số tin nhắn nhận được và gửi qua các kênh dữ liệu

- `total_colibri_web_socket_messages_received` / `total_colibri_web_socket_messages_sent` : Tổng số tin nhắn nhận được và gửi qua COLIBRI web sockets.

- `version` : Phiên bản hiện tại của Jitsi

## Đổi port giám sát

https://github.com/jitsi/jitsi-videobridge/blob/master/doc/rest.md

Sửa dòng 

    org.jitsi.videobridge.rest.private.jetty.port = <số port>

tại file `/etc/jitsi/videobridge/sip-communicator.properties`