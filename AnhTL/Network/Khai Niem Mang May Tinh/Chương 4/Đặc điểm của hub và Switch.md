# Đặc điểm của Hub và Switch

![img](https://i1.wp.com/2.bp.blogspot.com/-caV6dnoKfYk/VJVSQApAWPI/AAAAAAAAHJs/CalLN78V1LA/s1600/hub%2Bvs%2Bswitch.png)

#### 1. Hub
- Hub là thiết bị có khả năng kết nối nhiều máy tính và thiết bị mạng với nhau để tạo nên một mạng phân khúc duy nhất trong trung tâm hệ thống mạng. Đây là thiết bị đóng vai trò trung tâm trong việc thiết lập mạng LAN.

- Hub sở hữu nhiều cổng từ 4 lên tới 24 cổng. Khi thông tin được truyền tín hiệu vào một cổng của Hub, các cổng khác cũng sẽ nhận được thông tin ngay lập tức.
  - Hub không có bảng định tuyến thông minh về nơi gửi dữ liệu mà phát tất cả dữ liệu trên mỗi cổng kết nối. Do đó đem lại rủi ro về bảo mật dữ liệu.
  
  - Khi một gói dữ liệu đến một cổng, nó được sao chép và gửi tới tất cả các cổng khác.
  
- Nếu một Hub có đường truyền là 100Mbps thì Hub sẽ phải chia sẻ băng thông này với tất cả các cổng của nó. Vì vậy, Nếu chỉ có một thiết bị kết nối với Hub thì thiết bị này sẽ có quyền sử dụng băng thông tối đa của Hub. Trong khi đó, nếu nhiều thiết bị kết nối tới Hub thì băng thông này sẽ được chia đều cho mỗi thiết bị sử dụng. Do đó khi có càng nhiều thiết bị kết nối với Hub thì sẽ càng làm giảm tốc độ mạng.

- Chức năng chính của Hub chính là nhận và gửi các gói tin, khuếch đại các tín hiệu điện và phát sóng các gói tin tới các thiết bị trong mạng.

- Hub có cơ chế là Half duplex.
  - Tức là một cổng chỉ có thể gửi dữ liệu khi không nhận được dữ liệu. Nói cách khác, nó không thể gửi và nhận dữ liệu cùng một lúc. Các trung tâm mạng chạy ở chế độ bán song công để tránh va chạm và xảy ra hiện tượng collision domain
  
  ![img](http://www.homenethowto.com/wp-content/uploads/hub-forwards-signals.jpg)

#### 2. Switch
- Switch hay còn gọi là thiết bị chuyển mạch switch mạng, Switch có nhiều loại gồm có 8,16,24,48 port, là một thiết bị dùng để kết nối các đoạn mạng với nhau. switch đóng vai trò là thiết bị trung tâm, tất cả các máy tính đều được nối về đây

- Có 2 loại switch: 
  - Switch layer 2
  - Switch layer 3
  

- Switch làm cho các host có thể hoạt động ở chế độ song công (có thể đọc – ghi, nghe – nói) cùng lúc gọi là full duplex

![img](http://www.learnabhi.com/wp-content/uploads/2018/02/full-duplex.jpg)

- Không cần phải chia sẻ băng thông. Các port của switch sẽ quyết định băng thông truyền đi như thế nào.

- Có thể giới hạn lưu lượng truyền ở một mức ngưỡng nào đó.

- Khác với Hub nhận tín hiệu từ một cổng rồi chuyển tiếp tới tất cả các cổng còn lại, Do hoạt động ở layer 2  nên có các giao thức xác định đường đi. Switch khi nhận tín hiệu vật lý, chuyển đổi thành dữ liệu, từ một cổng, kiểm tra địa chỉ đích rồi gửi tới một cổng tương ứng.

# END
