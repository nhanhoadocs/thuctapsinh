## 1. Trỏ sub domain cho server Redmine dịch vụ Nhân Hòa

### Chuẩn bị

Trước hết bạn cài đặt redmine theo như hướng dẫn [**ở đây**](https://news.cloud365.vn/huong-dan-cai-dat-redmine-tren-centos-7/)

Bạn cần có sẵn một domain. Bạn có thể tham khảo mua [**tại đây**](https://nhanhoa.com/)

Trong hướng dẫn dưới đây chúng tôi sử dụng domain : workfromehome.vn

### Các bước thực hiện trỏ subdomain

Đầu tiên truy cập vào trang zonedns.vn

![Imgur](https://i.imgur.com/t91EsMs.png)

Nhập thông tin đăng nhập domain của bạn

![Imgur](https://i.imgur.com/K8kIhlO.png)

Nếu muốn trỏ domain vào một IP public cụ thể. Cách đơn giản nhất là bạn kéo xuống cuối trang. Click vào ô `Tạo record mặc định theo IP`. Sau đó nhập IP vào là xong.

![Imgur](https://i.imgur.com/9BeSrg6.png)

Nếu bạn muốn trỏ subdomain cho domain của bạn thì thực hiện tương tự như ví dụ dưới đây.

Ở ví dụ này tôi sẽ tạo subdomain với tên "redmine.workfromehome.vn" cho domain "workfromehome.vn".

![Imgur](https://i.imgur.com/aH8w74w.png)

Bạn cần phải thêm bản ghi mới với tên = subdomain và trỏ IP để Domain của bạn có thể nhận được subdomain. Vào phần Tạo Record:

+ Gõ tên subdomain vào ô tên Record
+ Chọn Record A
+ Điền IP của Server cần trỏ đến
+ Bấm vào Tạo Record để hoàn tất việc tạo subdomain

Sau khi hoàn tất 2 bước trên thì subdomain : "redmine.workfromehome.vn" đã được tạo và trỏ về Server IP đã điền, khi đó các Record của Domain sẽ có dạng như hình dưới:

![Imgur](https://i.imgur.com/TW8ljBx.png)

Kiểm tra việc trỏ subdomain bằng trang [MXToolBox](https://mxtoolbox.com/)

![Imgur](https://i.imgur.com/hK7QYBC.png)

Click vào ô "DNS lookup"

![Imgur](https://i.imgur.com/yhTIbfB.png)

Điền subdomain "redmine.workfromehome.vn" và click vào ô "DNS lookup"

Hiển thị kết quả như sau tức là đã thành công.

![Imgur](https://i.imgur.com/GCDT81p.png)

Như vậy là đã hoàn thành việc trỏ subdomain cho trang redmine của ta.