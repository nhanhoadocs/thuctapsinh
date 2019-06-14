# Difference between a service and process?
**1. Sự khác biệt giữa dịch vụ và quy trình là gì?**
- Trong Linux, một dịch vụ chỉ là một tên gọi khác của daemon, đó là một ứng dụng khách / máy chủ chạy trong nền. Một dịch vụ liên tục lắng nghe các yêu cầu đến và gửi phản hồi dựa trên yêu cầu được cung cấp. 
  - Daemon: Là chương trình chạy nền giống như các service trên Windows, có thể tắt mở tự động mà không ảnh hưởng gì đến giao diện người dùng.
- Một tiến trình chỉ đơn giản là một ứng dụng hoặc một tập lệnh có thể chạy ở nền.
  - Ví dụ: khi ta gõ lệnh pwd, được sử dụng để liệt kê vị trí thư mục hiện tại mà người dùng đang ở, thì một quá trình bắt đầu.
  
- Để bắt đầu, ta có thể kiểm tra những dịch vụ nào bạn đang chạy bằng cách nhập:
`` service --status-all ``

- Một quy trình có thể được chạy theo hai cách:
  - Quy trình đầu tiên: Mọi quy trình khi bắt đầu chạy ở nền trước theo mặc định, nhập vào từ bàn phím và gửi đầu ra màn hình. 
    - VD: Nhập lệnh pwd 
  - Quá trình Backround: Nó chạy trong nền mà không cần nhập bàn phím và đợi cho đến khi cần nhập bàn phím. Do đó, các quy trình khác có thể được thực hiện song song với quy trình đang chạy trong nền vì chúng không phải đợi quá trình trước đó được hoàn thành. 
    - VD: Pwd & ls -l

