# Classful và Classless

Khi làm việc với các hiện thực của Cisco cũng như tham khảo các giáo trình, tài liệu của hãng, chúng ta rất thường bắt gặp các thuật ngữ “classful” và “classless”. Các thuật ngữ này lại được sử dụng rất khác nhau trong nhiều ngữ cảnh khác nhau. Điều này khiến chúng ta không khỏi bối rối khi diễn giải thuật ngữ trong quá trình nghiên cứu tài liệu.

- Có 3 ngữ cảnh trong việc sử dụng bộ thuật ngữ “classful” và “classless”:
  - Cách đánh địa chỉ IP theo kiểu classful và theo kiểu classless.
  - Tra cứu bảng định tuyến theo kiểu classful và theo kiểu classless.
  - Các giao thức định tuyến thuộc trường phái classful và các giao thức định tuyến thuộc trường phái classless.

- Một major network là một mạng lớp A, B hay C chưa bị chia nhỏ ra. Vd: 10.0.0.0/8, 172.16.0.0/16 hay 192.168.1.0/24 là các major network. Ngược lại với major network là các mạng subnet được chia ra từ các major network. Vd: 10.1.1.0/24 là subnet được chia ra từ major 10.0.0.0/8; 172.16.1.0/24 là subnet được chia ra từ major 172.16.0.0/16 hay 192.168.1.96/28 là subnet được chia ra từ major 192.168.1.0/24.

##### Cách đánh địa chỉ IP classful và classless
- Đánh địa chỉ IP theo kiểu classful là cách đặt địa chỉ sử dụng luật phân lớp A, B và C. Một địa chỉ sẽ được chia thành hai phần network và host, một subnet – mask sẽ được sử dụng kèm để xác định được phần mạng trong một địa chỉ IP.
- Ngược lại, đánh địa chỉ theo kiểu classless bỏ qua luật phân lớp A, B và C. Với cách đánh địa chỉ này, một địa chỉ IP sẽ không được xem xét theo lớp, không sử dụng subnet – mask. Kiểu đánh địa chỉ classless sẽ xem một địa chỉ IP gồm hai phần: phần prefix và phần host. Các địa chỉ có cùng phần prefix sẽ được xem như cùng một nhóm (có thể hiểu nhóm như một subnet). Để xác định các bit prefix trong một địa chỉ, người ta sử dụng số prefix – length: số bit prefix trong địa
chỉ ấy. Vậy, định dạng của cách đánh địa chỉ classless sẽ là: A.B.C.D/n, với n là số prefix – length.
- Ví dụ: Địa chỉ mạng 192.168.1.0 nếu được thể hiện dưới định dạng classful sẽ là “192.168.1.0 255.255.255.0”  còn nếu thể hiện dưới định dạng classless sẽ là “192.168.1.0/24”.
Một điểm cần lưu ý là thuật ngữ “classful network” hay “classful boundary” cũng được sử dụng để chỉ một major network.
  - Ví dụ, thay vì nói là “các major network 10.0.0.0/8, 172.16.0.0/16, 192.168.1.0/24…” ta có thể nói “các classful network 10.0.0.0/8, 172.16.0.0/16 hay 192.168.1.0/24…
- Sau này, khác với IPv4, IPv6 chỉ sử dụng cách đánh địa chỉ classless, không sử dụng cách đánh địa chỉ classful.

### Đây chỉ là khái niệm. Vẫn còn thiếu phần lệnh cấu hình và chi tiết. ( em sẽ update sau )
Tham Khảo: http://waren.vn/chuyen-de/classful-va-classless.html

# END
