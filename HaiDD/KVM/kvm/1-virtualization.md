# Ảo hóa - Virtualization

## 1. Ảo hóa là gì? (Virtualization)
- Ảo hóa trong khoa học máy tính là một môi trường phần cứng không có thật. Tại đó, ta nhân đôi chức năng phần cứng vật lí và dùng nó để cài một hệ điều hành. Công nghệ được sử dụng để tạo môi trường này có thể được gọi là ảo hóa (hay công nghệ ảo hóa).

- Đối với các ứng dụng chạy trên máy ảo, nó có thể xuất hiện như thể trên một máy chuyên dụng, nơi hệ điều hành, thư viện, và các chương trình khác là duy nhất cho máy ảo và không kết nối với hệ thống máy chủ dưới nó.

- Hệ thống vật lý chạy phần mềm ảo hóa (**Hypervisor hoặc Virtual Machine Monitor**) được gọi là máy chủ lưu trữ và các máy ảo được cài đặt trên của trình ảo hóa được gọi là khách

### **Mục đích sử dụng ảo hóa**: 
- Để có thể chạy 1 hệ điều hành khác ngay trên hệ thống hiện tại mà không cần phải đổi máy hay đổi hệ thống.
- Cung cấp một cách để phân đoạn một hệ thống lớn thành các phần nhỏ hơn.
- Nó cho phép sự cách ly, giữ cho các chương trình bên trong máy ảo được an toàn đối với các chương trình trên các máy ảo khác.
- Kiểm soát và bảo mật dữ liệu

## 2. Các loại ảo hóa
Ảo hóa là quá trình ảo hóa 1 cái gì đó như là: phần cứng, mạng, ổ lưu trữ, ứng dụng, ...
### 2.1. Ảo hóa hệ điều hành (Tạo máy ảo - virtual machine)
Từ máy tính vật lí, ta có thể tạo một máy ảo có hệ điều hành khác trên đó. Các thao tác hoàn toàn như trên máy thật.

### 2.2. Ảo hóa phần cứng
Máy thực dùng để ảo hóa không cần có hệ điều hành từ trước, thay vào đó, sẽ ảo hóa trực tiếp trên phần cứng của máy thực.

### 2.3. Ổ đĩa ảo
Giúp người dùng có thể đọc các file .iso hay .img mà không cần thêm phần mềm hỗ trợ

### 2.4. RAM ảo
RAM ảo cũng được dùng nhiều trong hệ thống máy chủ của doanh nghiệp. RAM ảo được tạo ra bằng cách tập hợp chung hết các RAM thực có trên máy tính của hệ thống và tạo thành một RAM tổng. 

RAM tổng này sẽ được sử dụng chung cho tất cả các máy tính trong hệ thống. 

Các máy tính trong hệ thống máy chủ có thể truy cập và sử dụng RAM tổng này mà không bị giới hạn phần cứng.

### 2.5. Destop ảo
Desktop ảo thường được sử dụng trong hệ thống máy chủ của doanh nghiệp. Desktop ảo giúp cho các nhân viên của doanh nghiệp có thể truy cập vào cùng một màn hình làm việc chung ở bất kỳ đâu mà không cần phải mang chiếc máy tính đó xem

### 2.5. Máy chủ ảo (VPS – Virtual Private Server)
Máy chủ ảo là loại ảo hóa hay gặp nhất của công nghệ ảo hóa. Máy chủ ảo được tạo ra bằng phương pháp phân chia tài nguyên trên máy chủ vật lý thông thường. Một máy chủ vật lý có thể tạo ra nhiều máy chủ ảo

Máy chủ ảo hoạt động như một máy chủ vật lý thông thường với đầy đủ các chức năng: tạo môi trường lưu trữ, kết nối và chia sẻ.