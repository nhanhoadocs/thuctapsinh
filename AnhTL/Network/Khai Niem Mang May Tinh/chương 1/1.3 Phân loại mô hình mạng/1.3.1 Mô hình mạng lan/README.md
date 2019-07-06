# Các kiểu topology trong mô hình mạng LAN

Topology của mạng là cấu trúc hình học không gian mà thực chất là cách bố trí phần tử của mạng cũng nh cách nối giữa chúng với nhau. Thông thờng mạng có 3 dạng cấu trúc là: Mạng dạng hình sao (Star Topology), mạng dạng vòng (Ring Topology) và mạng dạng tuyến (Linear Bus Topology). Ngoài 3 dạng cấu hình kể trên còn có một số dạng khác biến tớng từ 3 dạng này nh mạng dạng cây, mạng dạng hình sao - vòng, mạng hỗn hợp,v.v....

### 1. Mạng dạng tuyến ( BUS topology)
![alt](https://vnpro.vn/wp-content/uploads/2015/11/H%C3%ACnh-3.3-M%E1%BA%A1ng-d%E1%BA%A1ng-BUS.jpg)

Theo cách bố trí hành lang các đường như hình vẽ thì máy chủ (host) cũng như tất cả các máy tính khác (workstation) hoặc các nút (node) đều được nối về với nhau trên một trục đường dây cáp chính để chuyển ti n tín hiệu. Tất cả các nút đều sử dụng chung đường dây cáp chính này. Phía hai đầu dây cáp được bịt bởi một thiết bị gọi là terminator. Các tín hiệu và gói dữ liệu (packet) khi di chuyển lên hoặc xuống trong dây cáp đều mang theo điạ chỉ của nơi đến

- Ưu điểm:

  - Loại hình mạng này dùng dây cáp ít nhất, dễ lắp đặt nên tiết kiệm được chi phí lắp đặt

- Nhược điểm:

  - Tuy vậy cũng có những bất lợi đó là sẽ có sự ùn tắc giao thông khi di chuyển dữ liệu với luư lượng lớn o Khi có sự hỏng hóc ở đoạn nào đó thì rất khó phát hiện, một sự ngừng trên đường dây để sửa chữa sẽ ngừng toàn bộ hệ thống.

### 2. Mạng dạng hình sao (Star topology)
![alt](https://vnpro.vn/wp-content/uploads/2015/11/H%C3%ACnh-3.1-M%E1%BA%A1ng-d%E1%BA%A1ng-h%C3%ACnh-sao.jpg)

Mạng dạng hình sao bao gồm một trung tâm và các nút thông tin. Các nút thông tin là các trạm đầu cuối, các máy tính và các thiết bị khác của mạng. Trung tâm của mạng điều phối mọi hoạt động trong mạng với các chức năng cơ bản là:
- Xác định cặp địa chỉ gửi và nhận được phép chiếm tuyến thông tin và liên lạc với nhau.
- Cho phép theo dõi và xử lý sai trong quá trình trao đổi thông tin.
- Thông báo các trạng thái của mạng...

- Ưu điểm:

  - Mạng dạng hình sao cho tốc độ nhanh nhất o Khi cable mạng bị đứt thì thưởng chí làm mất kết nối của một máy, còn những máy khác vẫn hoạt động bình thường.

  - Khi có lỗi xảy ra , ta dễ dàng kiểm tra và sửa chữa

  - Mạng có thể được mở rộng tuỳ theo nhu cầu sử dụng của người dùng

- Nhược điểm:

  - Khả năng mở rộng mạng đều phụ thuộc vào khả năng của trung tâm. Khi trung tâm gặp sự cố thì toàn mạng đều ngưng hoạt động.

  - Mạng yêu cầu nối độc lập riêng rẽ từng thiết bị ở các nút thông tin đến trung tâm. Khoảng cách từ máy đến trung tâm rất hạn chế (100 m).

### 3. Mạng dạng vòng (Ring Topology)
![alt](https://vnpro.vn/wp-content/uploads/2015/11/H%C3%ACnh-3.2-M%E1%BA%A1ng-d%E1%BA%A1ng-v%C3%B2ng.jpg)

Mạng dạng này, bố trí theo dạng xoay vòng, Các máy tính sẽ kết nối vào 1 thiết bị kiểu dạng giống Switch rồi các Switch đó sẽ nối với nhau tạo thành 1 vòng, tín hiệu được chạy theo 1 chiều cụ thể nào đó. Các tín hiệu truyền cho nhau phải đi lần lượt  và phải kèm theo địa chỉ cụ thể của người tiếp nhận.

- Ưu điểm:

  - Mạng dạng vòng có thuận lợi là có thể nới rộng ra xa, tổng đường dây cần thiết ít hơn nên tiết kiệm được dây cable, tốc độ nhanh hơn kiểu BUS

- Nhược điểm:

  - Nhược điểm của mạng này là tốc độ vẫn bị chậm

  - Khi trên đường cable có sự cố thì toàn bộ mạng sẽ ngưng hoạt động

  - Khi có sự cố rất khó kiểm tra phát hiện lỗi Do mạng này có nhiều nhược điểm nên trong thực tế ít được sử dụng
