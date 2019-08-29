# Phân biệt x86 và x64
> ## **1) 32-bit và 64-bit**
- `32-bit` và `64-bit` là một thuật ngữ nói đến độ rộng thanh ghi ( **Register** ) của bộ vi xử lý ( **CPU** ).
- Thanh ghi là một lượng lưu trữ nhỏ mà **CPU** dùng để lưu trữ dữ liệu nào nó cần để có thể truy cập nhanh nhằm đạt được hiệu suất tính toán tối ưu . Trong đó số bit là độ rộng của thanh ghi.
- Thanh ghi `64-bit` có thể chứa nhiều dữ liệu hơn thanh ghi `32-bit`, `32-bit` nhiều hơn thanh ghi `16-bit` và `8-bit` .
- Không gian càng rộng trong hệ thống thanh ghi của CPU thì nó càng có thể xử lý nhiều hơn , đặc biệt là khả năng quản lý và sử dụng bộ nhớ hệ thống - **RAM** một cách hiệu quả hơn .
<p align="center"><img src=https://i.imgur.com/cnvf6o7.png width=80%></p>

- Trong kiến trúc máy tính , `32-bit` hay `64-bit` đề cập đến luồng dữ liệu của bộ vi xử lý ( **CPU** ) .
- Nó có nghĩa là hệ điều hành có thể sử dụng nhiều bộ nhớ máy tính cùng một lúc . Điều này làm cho hệ thống `64-bit` nhanh hơn nhiều so với hệ thống `32-bit`.
- Một hệ thống `32-bit` chỉ có thể sử dụng tối đa `3,56 gigabyte` bộ nhớ truy cập ngẫu nhiên ( được gọi là **RAM** hoặc bộ nhớ) . Trong khi đó , một hệ thống `64-bit` có thể sử dụng nhiều bộ nhớ hơn khiến nó nhanh hơn đáng kể .
- Bộ xử lý `32-bit` là bộ xử lý chính được sử dụng trong tất cả các máy tính cho đến đầu những năm `1990` . Bộ xử lý **Intel Pentium** và bộ xử lý **AMD** đời đầu là `32 bit`, có nghĩa là hệ điều hành và phần mềm hoạt động với các đơn vị dữ liệu rộng `32-bit` .
- Bộ xử lý `64-bit` đã xuất hiện từ năm `1961` khi **IBM** tạo ra siêu máy tính **IBM 7030 Stretch** , tuy nhiên , nó đã không được đưa vào sử dụng trong các máy tính gia đình . Cho đến năm `2003` , **CPU** `64-bit` đầu tiên được giới thiệu vào thị trường máy tính cá nhân chính dưới dạng bộ xử lý `x86-64` . Các bộ vi xử lý - **CPU** hiện nay đều là `64-bit` .
> ## **2) x86 và x64**
- Thuật ngữ `x86` được đề cập đến hệ thống `32-bit` và `x64` dành cho hệ thống `64-bit`.
- Về mặt kỹ thuật `x86` chỉ đơn giản đề cập đến một họ bộ xử lý và tập lệnh mà tất cả chúng sử dụng . Nó không thực sự nói lên bất cứ điều gì cụ thể về kích thước dữ liệu .
- Thuật ngữ `x86` bắt đầu như một tập lệnh `16-bit` cho bộ xử lý `16-bit` ( bộ xử lý `8086` và `8088` ) , sau đó được mở rộng thành tập lệnh `32-bit` cho bộ xử lý `32-bit` ( `80386` và `80486` ) , và hiện đã được mở rộng thành tập lệnh `64-bit` cho bộ xử lý `64-bit` .

<p align="center"><img src=https://i.imgur.com/Fakoz4C.jpg width=50%></p>
<p align="center"><i>Bộ xử lý 8086</i></p>

- Nó từng được viết là `80x86` để phản ánh giá trị thay đổi ở giữa số mô hình chip , nhưng để đơn giản hơn số 80 ở phía trước đã bị bỏ đi , chỉ còn lại x86 .
- Khi bộ xử lý `64-bit` tương thích với kiến ​​trúc `x86` được giới thiệu , chúng được gọi là `x86-64` và cũng đã được rút ngắn thành `x64` .<br>
=> Như vậy `x86` hay `x64` là đề cập đến phần cứng , là một máy vi tính được trang bị bộ vi xử lý `32-bit` hay `64-bit`, không phải nói đến hệ điều hành `32-bit` hay `64-bit` .
> ## **3) Hệ điều hành 32-bit và 64-bit**
- Với sự phát triển của bộ xử lý `64-bit` và dung lượng bộ nhớ - RAM ngày càng lớn hơn thì các nhà sản xuất phần mềm cũng đều đã nâng cấp các phiên bản hệ điều hành được thiết kế để tận dụng tối đa công nghệ mới .
- Các phiên bản **Itanium** của **Windows XP** và **Windows Server 2003** đã được phát hành vào năm `2003` để tương thích với bộ vi xử lý `64-bit` **Itanium ( IA-64 )** .

<p align="center"><img src=https://i.imgur.com/8Ezlyd3.jpg width=30%></p>

- Năm `2005` , hệ điều hành **Microsoft Windows XP Professional x64 Edition** được phát hành , đây là phiên bản **Windows XP** dành cho máy tính cá nhân `x86-64` .
- Hệ điều hành `64 bit` hoàn toàn đầu tiên của **Apple** là **Mac OS X Leopard** được phát hành vào năm `2007` .

<p align="center"><img src=https://i.imgur.com/6ldsGSc.png width=50%></p>

- Trong khi đó, điện thoại thông minh đầu tiên có chip `64 bit` ( **Apple A7** ) là **iPhone 5s** được phát hành vào năm `2013` .

<p align="center">    <img src=https://i.imgur.com/CUEy0ph.jpg width=20%> <img src=https://i.imgur.com/J38Fg37.png width=30%> </p>

> *Một máy tính có bộ xử lý `32-bit` không thể cài đặt phiên bản `64-bit` của hệ điều hành . Nó chỉ có thể cài đặt phiên bản `32-bit` của hệ điều hành .*

> *Một máy tính có bộ xử lý `64-bit` có thể cài đặt phiên bản hệ điều hành `64-bit` hoặc `32-bit`. Tuy nhiên , với hệ điều hành `32-bit` , bộ xử lý `64-bit` sẽ không chạy hết công suất .*

> ## **4) Các phần mềm ứng dụng 32-bit và 64-bit**
- Các phần mềm cũng đã được phát triển, được thiết kế để chạy trên máy tính `64-bit` , trong đó chúng hoạt động với các đơn vị dữ liệu rộng `64-bit` .
- Nhiều phần mềm ứng dụng `32-bit` sẽ hoạt động với bộ xử lý và hệ điều hành `64-bit` , nhưng một số phần mềm ứng dụng `32-bit` cũ hơn có thể không hoạt động hoặc hoạt động không tốt do hạn chế hoặc không tương thích .
    > *Không thể cài phần mềm ứng dụng `64-bit` trên phiên bản hệ điều hành `32-bit` .*
> ## **5) Driver**
- **Driver** sẽ không có tính kế thừa , nghĩa là phải cài đặt đúng phiên bản dành cho hệ điều hành `32-bit` hoặc `64-bit` .
> ## **6) Hệ thống 64-bit**
- Một hệ thống `64-bit` là máy vi tính được trang bị bộ vi xử lý `x64` , được cài đặt hệ điều hành `64-bit` và các phần mềm ứng dụng cũng hỗ trợ `64-bit` .



