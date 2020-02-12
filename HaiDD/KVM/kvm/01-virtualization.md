# Ảo hóa - Virtualization

## I. Ảo hóa là gì? (Virtualization)
- Ảo hóa trong khoa học máy tính là một môi trường phần cứng không có thật. Tại đó, ta nhân đôi chức năng phần cứng vật lí và dùng nó để cài một hệ điều hành. Công nghệ được sử dụng để tạo môi trường này có thể được gọi là ảo hóa (hay công nghệ ảo hóa).

- Đối với các ứng dụng chạy trên máy ảo, nó có thể xuất hiện như thể trên một máy chuyên dụng, nơi hệ điều hành, thư viện, và các chương trình khác là duy nhất cho máy ảo và không kết nối với hệ thống máy chủ dưới nó.

- Hệ thống vật lý chạy phần mềm ảo hóa (**Hypervisor hay Virtual Machine Monitor**) được gọi là máy chủ lưu trữ và các máy ảo được cài đặt trên của trình ảo hóa được gọi là khách

### **Mục đích sử dụng ảo hóa**: 
- Để có thể chạy 1 hệ điều hành khác ngay trên hệ thống hiện tại mà không cần phải đổi máy hay đổi hệ thống.
- Cung cấp một cách để phân đoạn một hệ thống lớn thành các phần nhỏ hơn.
- Nó cho phép sự cách ly, giữ cho các chương trình bên trong máy ảo được an toàn đối với các chương trình trên các máy ảo khác.
- Kiểm soát và bảo mật dữ liệu

## II. Hypervisor
**Linux's Kernel-based Virtual Machine (KVM)** nó được coi là cả Native hypervisor và Host base
### 1. Hypervisor là gì?
- Hypervisor hay có tên khác là Virtual machine moniter (VMM) dùng để chỉ các phần mềm cho phép tạo và quản lý các máy ảo. Quản lý và cho phép máy ảo truy cập vào tài nguyên phần cứng.

- Hypervisor là một công nghệ để tạo máy ảo và giám sát, điều khiển nó.

### 2. Phân loại
Có 2 loại Hypervisor là **Native hypervisor** (hay còn gọi là Bare metal, Embedded) và **Host Based**

#### **1. Native hypervisor**
Đây là loại hypervisor chạy trực tiếp trên nền phần cứng (chạy như một hệ điều hành). Ví dụ : VMware ESXi, Microsoft Hyper-V và Apple Boot Camp.

<img src = "..\images\native.png">

**Ưu điểm:**
- Cài đặt và cấu hình đơn giản
- Kích thước nhỏ, được tối ưu hóa để cung cấp hầu hết các tài nguyên vật lí cho máy khách (máy ảo -virtual machines)
- Chi phí thấp, vì nó chỉ đi kèm với các ứng dụng cần thiết để chạy các máy ảo
- An toàn hơn, do các vấn đề sự cố trong một hệ thống khách không ảnh hưởng đến các hệ thống khách khác đang chạy trên trình ảo hóa.

**Nhược điểm:** 
- Không có sự tùy chỉnh. Ta sẽ không thể cài đặt bất kì ứng dụng hay phần mềm bên thứ 3 nào lên.

#### **2. Host Based**
Đây là loại hypervisor cài trên nền một hệ điều hành như một ứng dụng. Hay còn được gọi là máy chủ lưu trữ (hosted hypervisors). 

Các hypervisor này phụ thuộc vào hệ điều hành máy chủ mà nó hoạt động.

**Ví dụ** : VMware Workstation, Oracle VirtualBox, Parallels Desktop for Mac, 
<img src = "..\images\hostbase.png">

**Ưu điểm**:
- Phạm vi hỗ trợ phần cứng rộng. Vì cơ bản hệ điều hành máy chủ cơ bản đang kiểm soát truy cập phần cứng.

## III. Protection Ring
Trong kiến trúc x86 một cơ chế để cách ly ứng dụng người dùng với hệ điều hành để tạo một môi trường hoạt động an toàn bằng cách sử dụng khái niệm cấp đặc quyền (privileged levels)

<img src = "..\images\Screenshot_16.png">

Như trong hình, ta thấy **Ring 0** có đặc quyền cao nhất. Nhó có thể thao tác với bất kì phần cứng nào như disk, CPU, Memory, ...

**Ring 3** có đặc quyền thấp nhất, nó dùng để chạy các ứng dụng người dùng. Nó không thể trực tiếp tác động đến phần cứng. Nếu muốn nó phải thông qua **Ring 0**

## IV. Phân loại ảo hóa
### 1. Full virtualization (ảo hóa toàn phần)
Với cách này, Guest OS chạy trên Ring 1, còn Ring 0 để chạy Hypervisor. Các Guest OS hoàn toàn không nhận ra nó đang nằm trên 1 lớp ảo hóa. Khi một phần mềm chạy trên Guest OS, các đoạn code không bị biến đổi mà chạy trực tiếp trên host OS và nó như chạy trên một hệ thống thực sự.

Hypervisor phải cung cấp cho máy ảo một thư viện của toàn hệ thống, bao gồm BIOS ảo, không gian bộ nhớ ảo và các thiết bị ảo.

<img src = "..\images\Screenshot_17.png">

### 2. Paravirtualization (ảo hóa song song)
Là một phương pháp ảo hóa mà HĐH cần phải thay đổi để có thể giao tiếp giữa hypervisor và guest OS thông qua (hypercalls).

Paravirtualization là một công nghệ trong đó hypervisor cung cấp một API và guest OS gọi các API đó yêu cầu sửa đổi HĐH máy vật lý. Mục đích của việc này là để giảm thiểu thời gian thi hành lệnh trên hệ thống. Như vậy các guest OS đã được sửa đổi chạy ở ring 0. Nhưng bên dưới ring 0 này là VMM.

<img src ="..\images\Screenshot_18.png">

### 3. Hardware assisted virtualization (Ảo hóa hỗ trợ phần cứng)
Ảo hóa có hỗ trợ phần cứng là một phương pháp ảo hóa nền tảng được thiết kế để sử dụng hiệu quả ảo hóa hoàn toàn với các khả năng của phần cứng.

Với ảo hóa hỗ trợ phần cứng, hệ điều hành có quyền truy cập trực tiếp vào tài nguyên mà không cần bất kỳ mô phỏng hoặc sửa đổi hệ điều hành nào

<img src ="..\images\Screenshot_19.png">

### 4. Ảo hóa hệ điều hành (Tạo máy ảo - virtual machine)
Từ máy tính vật lí, ta có thể tạo một máy ảo có hệ điều hành khác trên đó. Các thao tác hoàn toàn như trên máy thật.

### 5. Ảo hóa Memory
RAM ảo cũng được dùng nhiều trong hệ thống máy chủ của doanh nghiệp. RAM ảo được tạo ra bằng cách tập hợp chung hết các RAM thực có trên máy tính của hệ thống và tạo thành một RAM tổng.

RAM tổng này sẽ được sử dụng chung cho tất cả các máy tính trong hệ thống.

Các máy tính trong hệ thống máy chủ có thể truy cập và sử dụng RAM tổng này mà không bị giới hạn phần cứng

### 6. Ảo hóa thiết bị I/O
Loại ảo hóa này liên quan đến việc quản lý và định tuyến cho các yêu cầu I/O giữa các thiết bị ảo và phần cứng vật lý chia sẻ. Nó ảo hóa thiết bị phần cứng và trình bày mỗi máy ảo với một chuẩn của các thiết bị ảo.