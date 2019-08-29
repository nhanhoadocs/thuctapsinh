I. dịch vụ và nguyên tắc
    nằm giưac tầng úng dụn và tầng mạng, đay là tang trung tâm cung cấp các dịc vụ truyền thông giữa cac tiến trình
    sử dụng 2 giao thức chính là TCP và UDP
    cung cấp kênh truyền logic ảo, nằm trên các thiết bị đầu cuối
    khi gửi thông điệp  nó chèn thêm vào các 4-PDU( protocol data unit) khi chia nhiều đoạn nhỏ  sau đó gủi xuống tầng mạng (3-PDU)
     các gia thức  dề cung cấp dịch vụ dồn kênh(multiplex và phân kênh(demultiplex),
    tâng giao thức tầng  giiao vận cung cấp các dịch vụ  truyền tin cậy, đảm bảo băng thông, giới hạn độ trễ.
# quan hệ tâng giao vận và tầng mạng 
 giao thức tầng giao vận cung cấp đượng truyền logic giữa cá máy  tính khác nhau thì ở tầng mạng cung cấp đường truyền giữa các máy tính
# tông quan
có 2 giao thức chính là TCP và UDP 
trong mô hình iinternet coi là 4-PUD là một segment đối với TCP và datagram đối với UDP.
giao thức tầng mạng là IP ( internet protocol). cung cấp đường truyền logic giữa các máy tính. mô hình  dịch vụ best effort delivery service)
udp va tcp kiểm tra tính toàn vẹn của dữ liêu  nhờ cơ chế phất hiện lỗi
# phân kênh và dồn kênhư
phân kênh là  công việc chuyển dữ liệu  trong segment  tói đúng tiến trình ứng dụng
TCP và UDP thực hiện dồn kênh qua 2 trường là  source port number và destination port number công nguồn và công đích
# UDP ( USER DATAGRAM PROTOCOL)
     - là giao thức không hướng nối
      - không có tính tin cậy, 
      - chỉ có cơ chế phát hiện lỗi đợn giản 
       - làm việc trực tiếp với IP 
UDP lấy thông điệp từ tâng ứng dụng chèn thêm tiêu đề gắn gói IP datagram và số hiệu cổng khi máy tính địch nhận được  gói tĩn nó sẽ đọc cổng giao tiếp đính kèm địa chỉ 
UDP  không có giai đoạn thiết lấp kết nối , không duy trì trạng thái kết nối, tiêu đề gói dữ liệu nhỏ 8 bytes
# cấu trúc UDP segment 
( source port, dest port, length, checksum, application data)
      - udp checksum được sử dụng để phát hiện lỗi 
phép tính  gtri bù 1 của tổng từ các 16 bit trong segment được đặt vào trường checksum

# nguyên tắc truyền tin tin cậy
rdt 2.1
rdt 2.2 
 các gói ACK VÀ NAK

# giao thức truyền dữ liệu tin cậy liên tục (pipeline)
rdt 3.0 hành vi dừng và chờ ( stop and wait)
sau khi phát 1 gói tin , thiết bị dừng phát (stop) để chờ nhận phẩn hồi từ thiết bị nhận kết quả nhận số liệu (wait) nếu kết quả nhận tốt  biện nhận ACK , bên phát dc quyền phát tiếp, nếu kết qur nhận sai (biên nhận NAK) bên phát phải gủi lại dữ liệu
 T(trans) = SP /C ( với sp là tốc độ truyền "Kbit/s" ;; c là đường truyền có tốc độ "1 Mbit/s")
        -- kỹ thuật đương ống pipe: gửi đồng thời nhiều  gói dữ liệu nối tiếp nhau qua trong ống
        -- ký thuật pipe  có 2 cách tiếp cận  quay lại N (Go Back N)  và lặp lại có lựa chọn ( selective repeat)

    +  goback -  N :gửi gói tin giới hạn bởi giá trị  N
          - base : số thứ tụ gói tín đã dc truyền đi lâu nhất chưa được biên nhận
             - nextseqnum : số thứ tự nhỏ nhất chưa được sử dụng ( để làm stt tiếp theo gửi di)

    +  selective repeat ( lặp lại có lựa chọn)

# kết nối TCP    
    thủ tục bắt tay ( three way handshake), kiết nối 2 điểm đàu cuối end-to-end
    cung cấp đường truyền song công ( full duplex)
    người gửi gửi TCP send buffers qua segment  đến người nhận nhận qua TCP receive buffers
 # cấu trúc TCP Segment : trường tiêu đề và trường dữ liệu, trường thứ tụ, trường số biên nhận, trường độ lớn của sổ, trường độ dài tiêu đề, trường opption, 
        - trường thứ tự  và số biên nhận: TCP đánh số thự tự từng bytes của dữ liệu, mỗi segment có 1 số thứ tự  là số thứ tự đầu tiên  của bytes của segment
# telnet 
