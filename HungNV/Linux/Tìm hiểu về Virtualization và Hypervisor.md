# Tìm hiểu về Virtualization và Hypervisor 

### 1. Virtualization (ảo hóa)
Là 1 công nghệ mà từ đó, 1 máy chủ vật lý riêng rẽ có thể tạo ra nhiều máy ảo độc lập, các máy ảo đó có thể chạy các hệ điều hành riêng, làm các công việc riêng, chạy các ứng dụng riêng...

**Ví dụ:** khi 1 máy vật lý chạy, người ta nhận thấy rằng sẽ có những ứng dụng không thể cùng hoạt động với nhau trên 1 máy (xung đột) => sử dụng công nghệ ảo hóa.

Thay vì sử dụng nhiều máy chủ vật lý tiêu tốn nhiều tài nguyên thì ta sử dụng công nghệ ảo hóa để tiết kiệm chi phí và tối ưu hóa hạ tầng công nghệ thông tin.

*  **Virtual machine**  
Hay còn gọi là máy ảo - là 1 môi trường hoạt động độc lập. Là 1 chương trình phần mềm hoặc hệ điều hành, không chỉ thể hiện hành vi của 1 máy tính riêng biệt mà còn có khả năng thực hiện các tác vụ như chạy các ứng dụng và chương trình như 1 máy tính riêng.

##### Phân loại Virtualization

- Ảo hóa RAM 
- Ảo hóa CPU
- Ảo hóa Network 
- Ảo hóa Device I/O (thiết bị vào ra)

###### Ảo hóa CPU 
Có 6 loại ảo hóa CPU 
- Full Virtualization
- Para Virtualization
- Container-based Virtualization
- Hardware Asisted Virtualization
- OS level Virtualization
- Hybrid virtualization
### 2. Hypervisor - Phần mềm giám sát máy ảo 
Là phần mềm để tạo, giám sát, điều khiển máy ảo ..  
Có 2 loại Hypervisor là : Native và hosted
 ###### 1. Native 
 Chạy trực tiếp trên phần cứng, tương tác trực tiếp với kernel, không có hệ điều hành nào cạnh tranh tài nguyên với nó.
 
 ###### 2. Hosted 
 Được cài trên 1 hệ điều hành, nó chạy trên 1 hệ điều hành như 1 ứng dụng cũng như các phần mềm khác trên máy tính. Nó có thể được bật lên hoặc tắt đi khi cần thiết, giải phóng tài nguyên cho máy chủ.
 vd: các hypervisor chạy hosted: VMware Workstation, Oracle Virtualbox..
 
 ### Ring (Protection Rings)
 
 Là cơ chế nhằm bảo vệ dữ liệu và chức năng của 1 chương trình tránh khả năng nguy cơ bị lỗi hoặc truy cập trái phép (vô tình hay cố ý) bởi các chương trình khác.
 
 Số lượng Ring tùy thuộc vào kiến trúc CPU và hđh chạy trên kiến trúc đó có khả năng hỗ trợ bao nhiêu Ring

##### Ring trong kiến trúc CPU x86

![Imgur](https://i.imgur.com/s1JAJrc.png)
 
 Các chương trình tại Ring 0 có đặc quyền cao nhất, có thể tương tác với CPU, Ring càng cao thì đặc quyền càng thấp.
Có thể coi từ Ring 0 đến Ring 3 tương ứng như sau:  
Ring 0 : Tài nguyên vật lý  
Ring 1 : Các phần mềm ảo hóa     
Ring 2 : Máy ảo  
Ring 3 : Hệ điều hành    

Hầu hết các hệ điều hành chỉ chạy 2 Ring. VD : Window chỉ sử dụng 2 mức là Ring 0 và Ring 3      
> Ring cách lý người dùng bằng các cấp đặc quyền

###### X86 : 
Kiến trúc tập lệnh của dòng vi xử lý 8086 của Intel 
X86 thường là nhắc đến bộ nhớ 32 bit. Tức là thế hệ này chỉ hỗ trợ 2^32 = 4G RAM. Thế hệ sau này X86-64 được mở rộng lên 64bit để đáp ứng nhu cầu máy tính.
 
##### Full virtualization 

Hệ điều hành máy chủ chạy trực tiếp trên phần cứng trong khi hđh khách chạy trên máy ảo.
Hệ điều hành khách không nhận ra nó đang nằm trên 1 lớp ảo hóa, các đoạn code của nó không bị sửa đổi. Các yêu cầu thực thi được dịch nhị phân và gửi cho hardware  
Nhược điểm: Do có bản dịch liên tịch giữu tài nguyên vật lý và máy ảo nên ảnh hưởng đến hiệu suất hệ thống.

##### Para virtualization 
Hệ điều hành khách bị sửa đổi để có thể nằm ở Ring 0 và giao tiếp với bộ ảo hóa. hệ điều hành khách biết vị trí của mình là khách nhưng có thể nhìn trực tiếp tài nguyên của máy thật => hiệu suất cao hơn.

##### QEMU 
QEMU hỗ trợ ảo hóa khi sử dụng modul hạt nhân KVM trong Linux.   
- KHi sử dụng KVM, QEMU có thể ảo hóa X86
- KVM là 1 nhánh của thực thi QEMU
- QEMU sẽ hoạt động ở bất cứ đâu nếu có sẵn modul hạt nhân KVM.