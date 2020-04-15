# Ý nghĩa thông số thống kê Jitsi

# Các thông số và ý nghĩa 
- `current_timestamp` : Giá trị là ngày và thời gian khi số liệu thống kê được tạo (múi giờ UTC).

- `threads` : Số lượng các luồng Java mà video bridge đang sử dụng.
- `bit_rate_download` : tổng tốc độ bit đến của video brigde (***kilobit/s***)
- `bit_rate_upload` : tổng tốc độ bit đi ra ngoài của video brigde (***kilobit/s***)
- `packet_rate_download` : tổng tốc độ gói đến (***số packet/s***)
- `packet_rate_upload` : tổng tốc độ gói đi (***số packet/s***)
- `loss_rate_download` : Các thành phần của gói RTP đến bị mất. Điều này dựa trên số thứ tự RTP và tương đối chính xác
- `loss_rate_upload` : Các phần của gói RTP đi ra ngoài bị mất. Điều này dựa trên Báo cáo người nhận RTCP đến và cố gắng trừ đi phần nhỏ của các gói không được gửi. Thông số này được tính trung bình vì vậy Điều này không chính xác, nhưng dù sao cũng có thể là một số liệu hữu ích.
- `rtp_loss` : Tổng của `loss_rate_doad` và `loss_rate_upload`.
- `rtt_aggregate` : Giá trị trung bình (tính bằng mili giây) của RTT trên tất cả các luồng.
- `largest_conference` : Số lượng người tham gia hội nghị lớn nhất hiện đang được tổ chức.
- `conference_sizes` : Sự phân bố quy mô phòng họp. Nó là mảng số nguyên có kích thước 15 và giá trị tại chỉ số `i` là số lượng hội nghị với `i` người tham gia. Yếu tố cuối cùng (chỉ số 14) cũng bao gồm các hội nghị với hơn 14 người tham gia.
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
- `total_data_channel_messages_received / total_data_channel_messages_sent` : Tổng số tin nhắn nhận được và gửi qua các kênh dữ liệu
- `total_colibri_web_socket_messages_received / total_colibri_web_socket_messages_sent` : Tổng số tin nhắn nhận được và gửi qua COLIBRI web sockets.
- `version` : Phiên bản hiệnn tại của Jitsi
- 