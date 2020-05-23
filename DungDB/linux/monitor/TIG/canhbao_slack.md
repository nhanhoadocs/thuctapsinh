# Cảnh báo qua Slack

Tại giao diện Slack, click vào tên project

![Imgur](https://i.imgur.com/2QqqnDh.png)

Administration > Manage Apps

![Imgur](https://i.imgur.com/wO0Br9Y.png)

Thêm vào app **Incoming Webhook**

![Imgur](https://i.imgur.com/4TA21OS.png)

Add to slack

![Imgur](https://i.imgur.com/dlSzTEe.png)

Chọn kênh để grafana gửi thông báo đến, copy Webhook URL. Những phần còn lại đặt tùy thích. Sau đó lưu lại.

![Imgur](https://i.imgur.com/MP6xMCw.png)

Tạo channel cảnh báo trong grafana. Dán Webhook URL vào ô URL. Các mục còn lại 

![Imgur](https://i.imgur.com/URFuSTy.png)

Các mục setting khác thêm vào tùy ý (là optional). Di chuột vào chữ i để xem thêm.

![Imgur](https://i.imgur.com/X4wHjmB.png)

Gửi cảnh báo test. Click vào send test. Kết quả như sau:

![Imgur](https://i.imgur.com/Ryr1xdI.png)

Cảnh báo đã được gửi đến đúng kênh.

