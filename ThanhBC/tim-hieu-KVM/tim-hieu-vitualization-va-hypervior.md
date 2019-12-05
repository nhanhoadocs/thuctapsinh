# Tìm hiểu cấu trúc x86, Virtualization và hypervisor.

Muc Lục.

[1. Kiến trúc X86.](#1)

[2. Virtualization là gì?](#2)

- [2.1. Full virtualization.](#2.1)

- [2.2. Para virtualization.](#2.2)

[3.Hypervisor là gì.](#3)

- [3.1 Hypervisor loại 1.](#3.1)

- [3.2 Hypervisorloại 2.](#3.2)

[4. Tài liệu tham khảo.](#4)

---- 
<a name="1"></a>
## 1. Kiến trúc X86.
 
Trong kiến trúc X86 có 1 có cơ chế hoạt động là **Ring**. Đây là cơ chế bảo vệ dữ liệu và chức năng 1 một chương trình tránh khả năng nguy có bị lỗi hoặc truy cập trái phép bởi các chương trình khác. Phân quyền sử dụng cho từng ring khác nhau.

Số lượng Ring đươc tùy thuộc vào kiên trúc của CPU và hệ điều hành chạy trên nên kiến trúc đó thông thường là từ 0 - 3 ring.

![](anhkvm/anh2.png)

Các chương trình tại Ring 0 có đặc quyền cao nhất, có thể tương tác với CPU, bộ nhớ và các thiết bị phần cứng. Ring có số càng cao thì đặc quyền càng thấp. Có thể coi từ Ring 0 đến Ring 3 tương ứng như sau:

Ring 0 : Tài nguyên vật lý.

Ring 1 : Các phần mềm ảo hóa.

Ring 2 : Máy ảo.

Ring 3 : Hệ điều hành.

Hầu hết các hệ điều hành chỉ có quyền sử dụng 2 Ring. VD : Window chỉ sử dụng 2 mức là Ring 0 và Ring 3.

Trong kiến trúc x86 và cơ chê hoạt động của Ring có 3 chế độ làm việc là:
- User mode: Đây là chế đọ của người dùng. Thường chạy từ các ring 3. Chế độ này muốn sử dụng phần cứng thì phải đi qua từng ring 2, ring 1 rồi với đến rinh 0 đê yêu cầu sử dungj phần cứng. để đi qua các ring thì nó phải sử dụng đến các lời gọi hệ thống là "system call".

- kernel mode: Đây là chế độ kernel. Được chạy trên ring 0 và có đặc quyền cao nhất có thể truy cập trực tiếp đên phần cứng và có toàn quyền với hệ thống. 

<a name="2"></a>
## 2. Virtualization là gì?

Trong triết học, ảo có nghĩa là "một cái gì đó không có thật".

Trong khoa học máy tính, ảo có nghĩa là "một môi trường phần cứng không có thật".

Ảo hóa là một công nghệ được thiết kế để tạo ra tầng trung gian giữa hệ thống phần cứng máy tính và phần mềm chạy trên nó. 

Tầng trung gian sẽ sử dụng Kỹ thuật áo hóa là trưu tượng hóa các phần cứng nhứ cpu memory, disk, nic.

Ý tưởng của công nghệ ảo hóa máy chủ là từ một máy vật lý có thể tạo thành nhiều máy ảo độc lập. Mỗi một máy ảo đều có một thiết lập hệ thống riêng, hệ điều hành riêng và các ứng dụng riêng.

Nói một cách đơn giản, ảo hóa là quá trình ảo hóa một cái gì đó như phần cứng,
network, storage, application, ....

Một số ưu điểm của ảo hóa:
- Hợp nhất máy chủ.
- Cách ly dịch vụ.
- Cung cấp máy chủ nhanh hơn.
- Phục hồi thảm họa.
- Cân bằng tải động.
- Môi trường thử nghiệm và phát triển nhanh hơn.
- Cải thiện độ tin cậy và bảo mật hệ thống.
- Độc lập hệ điều hành hoặc nhà cung cấp phần cứng.

Sau đây là sơ đồ cây thể hiện rõ các thành phần trong ảo hóa.

![](anhkvm/anh1.png)

Có rất nhiều kiểu ảo hóa như : Full virtualization, paravirtualization, ảo hóa hỗ trợ phần cứng, ảo hóa hệ điều hành, ảo hóa ứng dụng, ảo hóa mạng, ảo hóa lưu trữ
, ảo hóa dịch vụ.

Hiện nay có rất nhiều môi trường ảo hóa như KVM, Xen, QEMU, Virtualbox,..
Nhưng trong bài nay tôi đề cập đến KVM vì tính mở, linh hoạt và có hiệu suất tốt nhất.


<a name="2.1"></a>
### 2.1 Full virtualization.

![](anhkvm/anh4.jpg)

là một kỹ thuật ảo hóa được sử dụng để cung cấp VME (Virtual Machine Environment) mô phỏng hoàn toàn phần cứng bên dưới. Trong môi trường này, mọi phần mềm có khả năng thực thi trên phần cứng vật lý đều có thể chạy trong VM và mọi hệ điều hành được hỗ trợ bởi phần cứng đều có thể chạy trong từng VM riêng lẻ. Người dùng có thể chạy nhiều hệ điều hành khách khác nhau cùng một lúc. VM mô phỏng phần cứng để cho phép một hệ điều hành khách chưa sửa đổi được chạy độc lập. VM Sử dụng trực tiếp phần cứng.

Full virtualization là cách kết hợp sử dụng dịch nhị phân( binary translation) và thực thi trực tiếp (direct execution).

Ảo hóa hoàn toàn cung cấp sự cô lập và bảo mật tốt nhất cho máy ảo và đơn giản hóa việc di chuyển và tính di động vì cùng một phiên bản HĐH khách có thể chạy trên phần cứng ảo hoặc phần cứng gốc

VMware.

<a name="2.2"></a>
### 2.2. Para virtualization.

![](anhkvm/aohoa4.png))

Paravirtualization sư dụng bằng việc sửa đổi nhân hệ điều hành. Nhân hệ điều hành đóng vai trò là cầu nối giữa các ứng dụng và xử lý được thực hiện ở cấp phần cứng.

Paravirtualization cho phép một số hệ điều hành khác nhau chạy trên một bộ phần cứng bằng cách sử dụng hiệu quả các tài nguyên như bộ xử lý và bộ nhớ.

Paravirtualization sư dụng các lời gọi hypercalls  giao tiếp trực tiếp với các lớp ảo hóa hypervisor . Một hypercall hiểu tương tự như một cuộc gọi hệ thống. Các cuộc gọi hệ thống được một ứng dụng sử dụng để yêu cầu các dịch vụ từ HĐH và cung cấp giao diện giữa ứng dụng hoặc quy trình và HĐH. Hypervisor cũng cung cấp các giao diện cho các hoạt động khác bao gồm quản lý bộ nhớ và xử lý ngắt.

Trong paravirtualization, sau khi hệ điều hành máy chủ khởi động, trình giả lập VM được khởi chạy. Tại thời điểm đó, có hai HĐH. Máy chủ ở chế độ treo, trong khi khách chạy ở trạng thái hoạt động.

Paravirtualization có nhiều lợi thế đáng kể về hiệu suất và hiệu quả của nó mang lại khả năng mở rộng tốt hơn.

Xen

<a name="3"></a>
## 3.Hypervisor là gì.

Hypervisor là một lớp trừu tượng để tách các máy ảo khỏi phần cứng hệ thống. Nó là một lớp trung gian nằm giữa hệ thống phần cứng bên dươi và các ứng dụng nằm bên trên. Điều này cho phép cài đặt một máy ảo với bất kỳ hệ điều hành nào mà không phải lo lắng về việc có trình điều khiển thiết bị phù hợp cho nền tảng phần cứng . Trình ảo hóa cũng phân tách các máy ảo với nhau. Vì vậy, nếu một máy ảo gặp sự cố, nó không ảnh hưởng đến hoạt động của các máy ảo khác. Có hai loại hypervisor: Loại 1 và Loại 2.

<a name="3.1"></a>
### 3.1 Hypervisor loại 1.
Hypervisor loại 1

![](anhkvm/anh2.jpg)

Hypervisorloại 1 là hypervisor cấp độ phần cứng hoặc bare-metal. Các shypervisor loại 1 được cài đặt trực tiếp trên nền tảng phần cứng. Bởi vì các trình siêu giám sát loại 1 ngồi trực tiếp trên phần cứng, thường có ít chi phí hoạt động hơn so với các trình siêu giám sát loại 2. Điều này có thể tăng công suất và hiệu suất tổng thể của hệ thống.

<a name="3.2"></a>
### 3.2 Hypervisor loại 2.
Hypervisor loại 2

![](anhkvm/anh3.jpg))

Hypervisor loại 2 là các hypervisor giám sát phần mềm. Loại siêu giám sát loại 2 được cài đặt trên hệ điều hành hiện có . Bởi vì các trình ảo hóa Loại 2 có thể cài đặt trên hệ điều hành hiện có, chúng thuận tiện hơn các trình ảo hóa Loại 1. Ví dụ: khi bạn muốn kiểm tra một trình ảo hóa, bạn không phải dành một máy cụ thể cho nó. Bạn có thể sử dụng một máy hiện có với một hệ điều hành hiện có.


<a name="4"></a>
## 4. Tài liệu tham khảo.
1. https://www.sciencedirect.com/topics/computer-science/full-virtualization
2. https://www.sciencedirect.com/topics/computer-science/paravirtualization
3. https://www.sciencedirect.com/topics/computer-science/hypervisors
4. https://searchservervirtualization.techtarget.com/definition/paravirtualization
5. https://www.geeksforgeeks.org/virtualization-xen-paravirtualization/
6. https://www.geeksforgeeks.org/virtualization-vmware-full-virtualization/