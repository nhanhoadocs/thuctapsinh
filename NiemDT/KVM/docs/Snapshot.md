# Tìm hiểu cơ chế snapshot trong KVM

## 1. Cơ chế tạo snapshot
Snapshot là ghi lại tất cả trạng thái, tất cả những gì liên quan đến máy ảo ở một thời điểm nhất định. Ta có thể hình dung các dữ liệu này gom lại thành một khối và khi ta tạo một bản snapshot mới thì các dữ lệu cũ được đóng lại và chỉ có thể đọc với khối đó và sẽ có một khối mới nối tiếp với khối cũ. Và bây giờ tất cả trạng thái của VM nếu thay đổi gì thì sẽ được ghi lại trên khối mới mày. Nếu VM cần sử dụng một dữ liệu nào đó trong khối cũ thì nó sẽ đọc ở trong khối đó còn nếu thay đổi gì thì nó không được thay đổi trực tiếp trên khối cũ đó mà được ghi trên khối mới nhất.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/snapshot/1.png)

## 2. Cơ chế convert một bản snapshot

Với mỗi một khối như thế là một bản snapshot. Khi muốn sử dụng lại bản snapshot nào đó thì VM sẽ tiến hành copy cái khối tương ứng với bản snapshot đó vào khối đang sử dụng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/snapshot/2.png)

## 3. Cơ chế xóa một bản snapshot

Khi xóa một bản snapshot có nghĩa là ta xóa đi một khối nào đó. Lúc này nó sẽ giữ lại những thông tin mà các bản snapshot tạo sau đang đọc từ nó và chỉ xóa đi những thông tin liên quan. 

Những thông tin liên quan sẽ được gộp chung với khối là bản snapshot được tạo ngay phía sau nó.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virsh/3.png)

## 4. Phân loại snapshot

Dựa vào cách lưu trữ các bản snapshot ta có thể phân loại nó như sau:

 * `Internal`: Các bản snapshot được tạo ra sẽ nằm bên trong file disk của VM. Với cách này sẽ dễ dàng để tạo nhưng có trở ngại khi file disk của ta bị giới hạn. Chính vì vậy ta khi tạo snapshot kiểu này ta nên `pause` VM để nó ko phải lưu lại trạng thái của VM mà nó chỉ lưu thông tin trên disk điều này sẽ làm giảm sự lãng phí dung lượng cho VM.
 
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virsh/4.png)

 * `External`: Các bản snapshot được tạo ra sẽ nằm ở một file riêng biệt với file disk. Với loại này ta có thể lưu trạng thái disk của VM ở một file và trạng thái về RAM của VM ở một file khác. Với kiểu này ta có thể tránh được sự hết dung lượng disk của VM khi tọa snapshot.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virsh/5.png)