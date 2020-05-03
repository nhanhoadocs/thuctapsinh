# SetupVMware
 
### [I. VMware Workstation là gì?](#1)
### [II. Cài đặt VMware Workstation](#2)
### [III. Cài đặt hệ điều hành lên VMware Workstation](#3)
### [IV. Sử dụng máy ảo trên VMware](#4)
### [V. Cài đặt VMware Tools](#5)

-----------------------------------------------------------

# **I. VMware Workstation là gì?** <a name = "1"></a>

 **VMware Workstation** là một chương trình cho phép bạn tạo một máy tính ảo trên một máy tính vật lý.

 Máy ảo là môi trường khá lý tưởng để người dùng có thể chạy thử các hệ điều hành khác như Linux, truy cập các trang web có độ tin cậy thấp, tạo môi trường đặc biệt để kiểm tra ảnh hưởng của virus máy tính… 


# **II. Cài đặt VMware Workstation** <a name ="2"></a>

## 1. Đảm bảo máy tính đáp ứng đủ các yêu cầu hệ thống:
- Do sẽ phải tạo và chạy một hệ điều hành từ bên trong hệ điều hành của mình, nên **VMware Workstation** có các yêu cầu hệ thống khá cao. Nếu không đáp ứng được yêu cầu này, *VMware* sẽ không thể hoạt động một cách hiệu quả được
- Một số yêu cầu cơ bản:
    - Hệ thống xử lí phải là bộ xử lí 64 bit.
    - *VMware* hỗ trợ cài đặt hệ điều hành Linux và Window.
    - Bộ nhớ chạy hệ điều hành, hệ điều hành ảo và bất kỳ chương trình nào trong hệ điều hành đó(RAM): 1GB tối thiểu, tốt nhất trên 3GB
    - Phải có 16 bit hoặc 32 bit display adapter. Hiệu ứng 3D rất có thể không hoạt động tốt trong hệ điều hành ảo.
    - Bộ nhớ trống để cài đặt **VMware Workstation**: 1,5 GB. Cùng với ít nhất 1 GB cho mỗi hệ điều hành.

## 2. Tải xuống và cài đặt **VMware**:

a. Tải xuống **VMware**:
- Tải xuống *VMware installer* mới nhất từ trang chủ của [VMware website](https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html).
- Chọn phiên bản mới nhất rồi tải về.
- Chỉ có thể cài đặt một phiên bản **VMware Workstation** tại một thời điểm.

b. Cài đặt **VMware**:
- Sau khi tải xong tệp *Installer*, hãy chạy tệp bằng quyền **Admin** (*Run as administrator*).
- Đồng ý các điều khoản người dùng và cài đặt như các phần mềm khác.


# **III. Cài đặt hệ điều hành lên VMware Workstation** <a name = "3"></a>

## 1. Chuẩn bị các *file ISO* của hệ điều hành cần cài đặt.

## 2. Mở **VMware**
- Chọn *File -> New Virtual Machine*
<img src = "https://i.imgur.com/WtTgLqt.png?1">
- Chọn *Typical -> Next*
<img src = "https://i.imgur.com/A4GX18B.png">
- Chọn đường dẫn *file ISO*. Có thể là từ *file ISO*, từ đĩa CD hoặc chọn sau *-> Next*
<img src = "https://i.imgur.com/Oah4Q96.png">
- Chọn dung lượng tối đa để cài đặt hệ điều hành. Nên để theo gợi ý, còn nhu cầu cao hơn thì có thể tăng lên. Chọn cách lưu trữ đĩa ảo *-> Next*
    - `Store virtual disk as a single file`: lưu trữ đĩa ảo dưới dạng 1 tập tin.
    - `Split virtual disk into multiple files`: chia tách đĩa sẽ giúp việc di chuyển máy ảo sang máy tính khác dễ dàng hơn nhưng có thể làm giảm hiệu suất với các đĩa rất lớn.
<img src = "https://i.imgur.com/lZHd0yO.png">
- Chọn *Customize Hardware* để cấu hình phần cứng cơ bản máy ảo *-> Finish*
<img src = "https://i.imgur.com/brr2Eow.png">

## 3. Bắt đầu chạy máy ảo
Chọn ***Power on this virtual machine*** để chạy máy ảo và cài đặt hệ điều hành.
<img src = "https://i.imgur.com/e5ZU2r0.png">


# **IV. Sử dụng máy ảo trên VMware** <a name = "4"></a>
## 1. Khởi động **VMware Workstation**.
## 2. Chọn máy ảo cần sử dụng rồi click chuột chọn mục *Power on this virtual machine để khởi chạy máy ảo*.
<img src = "https://i.imgur.com/D6vomLs.png">

## 3. Đợi máy ảo khởi chạy ta sẽ được một máy ảo với hệ điều hành đã cài đặt. Các thao tác sử dụng giống như máy thật
<img src = "https://i.imgur.com/tYrNeWq.png">


# **V. Cài đặt VMware Tools** <a name = "5"></a>
## 1. **VMware Tools** để làm gì:
**VMware Tools** là bộ công cụ giúp tăng cường hiệu suất cho máy ảo *VMware*.
Các lợi ích của **VMware Tools**:
- Cho phép *Shutdown* một máy ngay từ giao diện quản lí chung bên ngoài.
- Tăng cường độ xử lý đồ họa trên máy ảo.
- Hỗ trợ về chuột tốt hơn.
- Hỗ trợ về *copy, cut, paste* giữa máy thật và máy ảo.
- Tăng hiệu suất kết nối mạng.

## 2. Hướng dẫn cài đặt **VMware Tools** trên máy ảo Window:
- Click chuột phải vào máy ảo đang chạy và chọn *Install VMware Tools*.(ở đây là máy đã cài đặt trước đó rồi nên hiện thị là *Reinstall VMware Tools…*)
<img src = "https://i.imgur.com/llJhK3K.png">

- *VMware* sẽ thêm *VMware Tools…* vào máy ảo. Ta mở *Windows Explorer* và click chạy *DVD Driver VMware Tools*.
<img src = "https://i.imgur.com/neZAbjD.png">

- Cài đặt các bước như cài đặt phần mềm bình thường trên Windows.
<img src = "https://i.imgur.com/Rer3GKk.png">

- Restart lại máy ảo ta sẽ thấy biểu tượng *VMware Tools* dưới góc thanh Taskbar.
<img src = "https://i.imgur.com/RCOOwi6.png">

- Bây giờ ta có thể *copy-paste file* từ máy thật qua máy ảo và ngược lại.


## **Tổng kết**

Bài viết dựa trên sự tìm hiểu về **VMware WorkStation** của tôi.

Chắc chắn bài viết còn nhiều thiếu sót. Mong mọi người thông cảm và góp ý để bài viết của tôi được hoàn thiện hơn.

Xin chân thành cảm ơn !