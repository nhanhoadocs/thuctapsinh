# API Bot Telegram 

Bot API là 1 giao diện dựa trên HTTP được tạo cho các nhà phát triển quan tâm đến việc xây dựng các bot trong Teleram 

API Bot là trung gian giữa bot của bạn trên Telegram và logic ứng dụng của riêng bạn 

Có 2 phần chính của API bot : update và methods. Bạn nhận được các bản cập nhật thể hiện sự tương tác của người dùng với bot của bạn, ví dụ như các tin nhắn được gửi đến bot của bạn và gọi các phương thức để khiến bot của bạn thực hiện 1 số hành động nhất định, chẳng hạn như gửi tin nhắn cho người dùng hoặc hiển thị thông báo trong của sổ trò chuyện.

## Yêu cầu 

Tất cả các truy vấn đối với API Telegram Bot phải được cung cấp qua HTTPS và cần được trình bày theo mẫu sau : `https://api.telegram.org/bot<token>/METHOD_NAME`

Ví dụ như sau :

`https://api.telegram.org/bot123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11/getMe`


nó hỗ trợ các phương thức GET và POST http. 

Có 4 cách truyền tham số tron yêu cầu API Bot : 
- URL query string 
- application/x-www-form-urlencoded 
- application/json (except for uploading files)
- multipart/form-data (use to upload files)

### Phương thức gọi 

Các phương thức API Bot về cơ bản là các cuộc gọi thủ tục từ xa (RPC) được thực hiện qua HTTP. 
Các phương thức khả dụng sau : 

#### getMe 

Một phương pháp đơn giản để kiểm tra mã thông báo xác thực bot, yêu cầu không có tham số. Trả về thông tin cơ bản về bot dưới dạng đối tượng người dùng 

#### sendMessage 

Sử dụng phương pháp này để gửi đi tin nhắn văn bản. Khi thành công, tin nhắn đã gửi được trả lại. 

Các tham số trong tin nhắn trả lại : 

`chat_id`, `text`, `parse_mode`, `disable_web_page_preview`, `disable_notification`, `reply_to_message_id`, `reply_markup` 

#### forwardMessage 

Sử dụng phương pháp này để chuyển tiếp tin nhắn của bất kỳ loại nào, khi thành công, tin nhắn đã gửi được trả lại 

Các tham số của  `forwardMessage`: 

`chat_id`, `from_chat_id`, `disable_notification`, `message_id` 

#### sendPhoto 

Sử dụng phương pháp này để gửi ảnh. Kho thành công, tin nhắn đã gửi được trả lại 

Các tham số của `sendPhoto`: 

`chat_id`, `photo`, `caption`, `parse_mode`, `disable_notification` `reply_to_message_id`, `reply_markup` 

#### sendVoice

Sử dụng phương pháp này để gửi tệp âm thanh, nếu bạn muốn máy khách telegram hiển thị tệp dưới dạng tin nhắn thoại có thể phát. Bots hiện tại có thể gửi tin nhắn thoại có kích thước lên đên 50MB, giới hạn này có thể đượcc thay đổi trong tương lai 

Các tham số của `sendVoice`: 

`chat_id`, `voice`, `caption`, `parse_mode`, `duration`, `disable_notification`, `reply_to_message_id`, `reply_markup` 

#### sendVideo 

Sử dụng phương pháp này gửi tệp video, máy khác telegram hỗ trợ video mp4(Các định dạng khác có thể được gửi dưới dạng tài liệu). Bots hiện tại có thể gửi cac tệp video có kích thuwocs lên đến 50MB, giới hạn này cũng có thể được thay đổi trong tương lai. 

Các tham số của `sendVideo` : 

`chat_id`, `video`, `duration`, `width`, `height`, `thumb`, `caption`, `parse_mode`, `supports_streaming`, `disable_notification`, `reply_to_message_id`, `reply_markup`

#### getUpdates 

Sử dụng phương pháp này để nhận các bản cập nhật đến bằng cách sử dụng long polling. Một mảng các đối tượng của Update được trả về. 

Tham số của `getUpdates`

`offset`, `limit`, `timeout`, `allowed_updates` 

#### setWebhook 

Sử dụng phương pháp này để chỉ định 1 url và nhận các bản cập nhật đến thông qua 1 webhook đi. 

Tham số của `setWebhook` :

`url`, `certificate`, `max_connections`, `allowed_updates` 