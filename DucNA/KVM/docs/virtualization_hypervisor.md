# 1. Virtualization 
## a) Khái niệm 
- Ảo hóa(Virtualization) là công nghệ được thiết kế để tạo ra tầng trung gian giữa hệ thống phần cứng máy tính và phần mềm chạy trên nó
-  Là các phương pháp để tạo ra một phiên bản ảo của một cái gì đó trên một máy tính vật lý như máy tính ảo (virtual machine), ổ đĩa ảo(virtual disk), mạng ảo (virtual network), CPU ảo,...
- Thường thấy nhất là công nghệ ảo hóa máy chủ, từ một máy vật lý đơn lẻ có thể tạo thành nhiều máy ảo độc lập (VPS). 
- Virtual private server (VPS) là dạng máy chủ được tạo ra bằng cách phân chia 1 máy chủ vật lý thành nhiều máy chủ khác nhau có tính chất như một máy chủ riêng biệt.Mỗi một máy ảo VPS đều được thiết lập nguồn hệ thống riêng lẻ, hệ điều hành riêng và các ứng dụng riêng
# 2. Hypervisor 
## a) Khái niệm 
Hypervisor hay có tên khác là Virtual machine moniter (VMM) dùng để chỉ các phần mềm công nghệ cho phép tạo và quản lý các máy ảo. Quản lý và cho phép máy ảo truy cập vào tài nguyên phần cứng. Như vậy ta có thể hiểu ảo hóa là phương pháp tạo ra máy ảo còn hypervisor là một công nghệ để tạo máy ảo và giám sát, điều khiển nó. Có 2 loại hypervisor là `Native` hay còn được gọi là `Bare metal` và `Host Based`
## b) Phân loại 
1. Native ( bare metal)
- Đây là loại hypervisor chạy trực tiếp trên nền phần cứng (chạy như một hệ điều hành).
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper1.png)
2. Host based
- Đây là loại hypervisor cài trên nền một hệ điều hành như một ứng dụng.
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper2.png)
# 3. Tìm hiểu về Ring 
- Trong kiến trúc x86 một cơ chế để cách ly ứng dụng người dùng với hệ điều hành để tạo một môi trường hoạt động an toàn bằng cách sử dụng khái niệm cấp đặc quyền (privileged levels)
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper3.png)
- Như ta thấy ở đây ring 0 có đặc quyền cao nhất. Nó có có thể thao tác với bất kỳ phần cứng nào như disk, CPU, memory,... Ring 3 có đặc quyền thấp nhất. Nó chạy các ứng dụng người dùng. Nó không thể trục tiếp tác động đến phần cứng. Nếu muốn sử dụn phần cứng nó phải thông qua ring 0.
# 4. Phân loại ảo hóa 
1. Full virtualization (ảo hóa toàn phần)
- Toàn bộ phần cứng của máy tính sẽ được ảo hóa hết để một hệ điều hành khác có thể được chạy trên nó được gọi là hệ điều hành ảo.
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper4.png)
- Với cách này thì guest OS chạy trên ring 1 còn ring 0 để chạy hypervisor. Các guest OS hoàn toàn không nhận ra hòan toàn không nhận ra nó đang nằm trên một lớp ảo hóa. Khi một phần mềm chạy trên guest OS các đoạn code của nó không bị biến đổi mà chạy trực tiếp trên host OS và phần mềm đó như đang chạy trên một hệ thống thực sự. Hypervisor phải cung cấp cho máy ảo một thư viện của toàn hệ thống, bao gồm BIOS ảo, không gian bộ nhớ ảo và các thiết bị ảo
2. Paravirtualization( ảo hóa song song )
- Là một phương pháp ảo hóa mà HĐH cần phải thay đổi để có thể giao tiếp giữa hypervisor và guest OS thông qua (hypercalls).  
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper5.png)
- Paravirtualization là một công nghệ trong đó hypervisor cung cấp một API và guest OS gọi các API đó yêu cầu sửa đổi HĐH máy vật lý. Mục đích của việc này là để giảm thiểu thời gian thi hành lệnh trên hệ thống. Như vậy các guest OS đã được sửa đổi chạy ở ring 0. Nhưng bên dưới ring 0 này là VMM.
3. Hardware assiseted virtualization ( ảo hóa hỗ trợ phần cứng)
- Ảo hóa hỗ trợ phần cứng cho phép ảo hóa toàn bộ dữ liệu bằng cách sử dụng trợ giúp từ các khả năng của phần cứng 
- Ảo hóa hỗ trợ phần cứng là sử dụng phần cứng vật lý để hỗ trợ phần mềm tạo và quản lý máy ảo.
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper6.png)
- Như ta thấy ở trên với công nghệ này thì VMM nằm ở ring mới bên dưới ring 0.
4. Ảo hóa hệ điều hành 
- Đây là phương pháp ta thường thấy nhất ta có thể tạo ra và chạy nhiều máy ảo cùng một lúc trên một chiếc máy 
- và việc chuyển đổi giữa các hệ điều hành cũng dễ dàng giống như ta chuyển đổi giữa các tab ứng dụng 
- Và việc chia sẻ tài liệu, Tài nguyên cũng rất dễ dàng giữa các hệ điều hành với nhau 
5. Ảo hóa memory 
- Loại ảo hóa này chia sẻ RAM vật lý và phân bổ nó cho máy ảo. Nó thực hiện ánh xạ RAM thật vào RAM ảo trong máy và các máy ảo sử dụng để chạy các tiến trình.
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/aohoa1.png)
6. Ảo hóa thiết bị và I/O
- Loại ảo hóa này liên quan đến việc quản lý và định tuyến cho các yêu cầu I/O giữa các thiết bị ảo và phần cứng vật lý chia sẻ. Nó ảo hóa thiết bị phần cứng và trình bày mỗi máy ảo với một chuẩn của các thiết bị ảo.
![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/aohoa2.png)