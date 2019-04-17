## Tìm hiểu về ảo hóa và hypervisor
### Ảo hóa là gì?
`Ảo hóa`- virtualization là các phương pháp để tạo ra một phiên bản ảo của một cái gì đó trên một máy tính vật lý như máy tính ảo (virtual machine), ổ đĩa ảo(virtual disk), mạng ảo (virtual network), CPU ảo,... 
### Hypervisor là gì?
`Hypervisor` hay có tên khác là Virtual machine moniter (VMM) dùng để chỉ các phần mềm công nghệ cho phép tạo và quản lý các máy ảo. Quản lý và cho phép máy ảo truy cập vào tài nguyên phần cứng.
Như vậy ta có thể hiểu ảo hóa là phương pháp tạo ra máy ảo còn hypervisor là một công nghệ để tạo máy ảo và giám sát, điều khiển nó.
Có 2 loại hypervisor là `Native` hay `Bare metal` và `Host Based`

#### Native
Đây là loại hypervisor chạy trực tiếp trên nền phần cứng (chạy như một hệ điều hành). 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper1.png)

#### Host based
Đây là loại hypervisor cài trên nền một hệ điều hành như một ứng dụng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper2.png)

### Ring là gì?
Trong kiến trúc x86 một cơ chế để cách ly ứng dụng người dùng với hệ điều hành để tạo một môi trường hoạt động an toàn bằng cách sử dụng khái niệm cấp đặc quyền (privileged levels).

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper3.png)

Như ta thấy ở đây `ring 0` có đặc quyền cao nhất. Nó có có thể thao tác với bất kỳ phần cứng nào như disk, CPU, memory,...
`Ring 3` có đặc quyền thấp nhất. Nó chạy các ứng dụng người dùng. Nó không thể trục tiếp tác động đến phần cứng. Nếu muốn sử dụn phần cứng nó phải thông qua `ring 0`.
### Phân loại virtualization
#### 1. Ảo hóa CPU
##### 1.1 Full virtualization

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper4.png)

Với cách này thì guest OS chạy trên ring 1 còn ring 0 để chạy hypervisor. Các guest OS hoàn toàn không nhận ra hòan toàn không nhận ra nó đang nằm trên một lớp ảo hóa. Khi một phần mềm chạy trên guest OS các đoạn code của nó không bị biến đổi mà chạy trực tiếp trên host OS và phần mềm đó như đang chạy trên một hệ thống thực sự. Hypervisor phải cung cấp cho máy ảo một thư viện của toàn hệ thống, bao gồm BIOS ảo, không gian bộ nhớ ảo và các thiết bị ảo.
##### 1.2 Paravirtualization
Là một phương pháp ảo hóa mà HĐH cần phải thay đổi để có thể giao tiếp giữa hypervisor và guest OS thông qua (hypercalls).

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper5.png)

Paravirtualization là một công nghệ trong đó hypervisor cung cấp một API và guest OS gọi các API đó yêu cầu sửa đổi HĐH máy vật lý. Như vậy các guest OS đã được sửa đổi chạy ở ring 0. Nhưng bên dưới ring 0 này là VMM. 
##### 1.3 Hardware assiseted virtualization
Ảo hóa hỗ trợ phần cứng là sử dụng phần cứng vật lý để hỗ trợ phần mềm tạo và quản lý máy ảo.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/hyper6.png)

Như ta thấy ở trên với công nghệ này thì VMM nằm ở ring mới bên dưới ring 0.
#### 2. Ảo hóa memory
Loại ảo hóa này chia sẻ RAM vật lý và phân bổ nó cho máy ảo. Nó thực hiện ánh xạ RAM thật vào RAM ảo trong máy và các máy ảo sử dụng để chạy các tiến trình.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/aohoa1.png)

#### 3. Ảo hóa thiết bị và I/O

Loại ảo hóa này liên quan đến việc quản lý và định tuyến cho các yêu cầu I/O giữa các thiết bị ảo và phần cứng vật lý chia sẻ. Nó ảo hóa thiết bị phần cứng và trình bày mỗi máy ảo với một chuẩn của các thiết bị ảo.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/aohoa2.png)