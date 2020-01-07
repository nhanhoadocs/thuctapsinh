# Cấu hình graylog cảnh báo SSH qua email  
Là một System Admin bạn luôn phải lưu ý vấn đề bảo mật của hệ thống. Khi có hoạt động đăng nhập bất thường xảy ra, làm cách nào để bạn nhận biết được nó và rút ngắn thời gian kiểm tra nhanh nhất có thể? Nối tiếp chuỗi bài về Graylog, hôm nay Cloud365 sẽ chia sẻ đến các bạn cách cấu hình graylog server để nhận cảnh báo SSH qua email.  

## Điều kiện:  
- Graylog server đã cài đặt Postfix để gửi mail. Nếu bạn chưa biết cách cài đặt Postfix trên Linux có thể tham khảo tại bài viết theo [link]()  
- Máy client01 đâ cài đặt sidecar để đẩy log về graylog server.  

## Cấu hình  

