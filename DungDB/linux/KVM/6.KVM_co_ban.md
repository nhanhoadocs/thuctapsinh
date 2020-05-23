# Cơ bản về KVM

## I. Khái niệm

KVM(Kernel-based Virtual Machine): là công nghệ ảo hóa trong nhân linux cho phép hạt nhân hoạt động như một trình ảo hóa. Do đó máy chủ KVM được cung cấp riêng tài nguyên để sử dụng tránh việc tranh chấp tài nguyên với máy chủ khác.

Máy chủ gốc được cài hệ điều hành linux nhưng KVM hỗ trợ tạo máy chủ ảo có thể chạy cả Linux, Windows. Nó cũng hỗ trợ cả X86 và X86-64 system

KVM cung cấp ảo hóa hỗ trợ phần cứng cho nhiều hệ điều hành khách khác nhau.

## II. Chức năng

KVM giúp ta sử dụng hệ thống máy chủ để tạo ra môi trường để tạo các máy ảo phục vụ cho mục đích mình cần.

KVM chuyển đổi một nhân Linux (Linux kernel) thành một bare metal hypervisor và thêm vào đó những đặc trưng riêng của các bộ xử lý Intel như Intel VT-X hay AMD như AMD-V.

Khi đã trở thành một hypervisor, KVM hoàn toàn có thể setup các máy ảo với các hệ điều hành khác nhau và không phụ thuộc vào hệ điều hành của máy chủ vật lý.

Trong kiến trúc của KVM, Virtual machine được thực hiện tương tự như là quy trình xử lý thông thường của Linux, được lập lịch hoạt động như các scheduler tiểu chuẩn của Linux.

Trên thực tế, mỗi CPU ảo hoạt động như một tiến trình xử lý của Linux. Do đó, KVM được quyền thừa hưởng những ưu điểm từ các tính năng của nhân Linux.

## III. Loại ảo hóa của KVM

KVM thuộc loại ảo hóa phần cứng Hardware assisted virtualization

Và thuộc loại Hypervisor type 2: Host Based. KVM có thể cài đặt trên tất cả các Distro khác nhau của Linux.

### 1. Ưu điểm

**Linh hoạt:** Tuy máy chủ gốc được cài đặt Linux, nhưng KVM hỗ trợ tạo máy chủ ảo có thể chạy cả Linux, Windows. Sử dụng kết hợp với QEMU, KVM có thể chạy Mac OS X. KVM cũng hỗ trợ cả x86 và x86-64 system.

**Tính độc quyền cao:** Cấu hình từng gói VPS KVM sẽ chỉ một người sở hữu và toàn quyền sử dụng tài nguyên đó (CPU, RAM, diskspace…) mà không hề bị chia sẻ hay ảnh hưởng bởi các VPS khác trên cùng hệ thống.

**Bảo mật:** Tích hợp các đặc điểm bảo mật của Linux như SELinux với các cơ chế bảo mật nhiều lớp, KVM bảo vệ các máy ảo tối đa và cách ly hoàn toàn.

**Hỗ trợ, độ mở rộng cao:** Được phát triển trên nền tảng mã nguồn mở hoàn toàn miễn phí, được hỗ trợ từ cộng đồng và từ nhà sản xuất thiết bị, KVM ngày càng lớn mạnh và trở thành một lựa chọn hàng đầu cho doanh nghiệp với chi phí thấp, hiệu quả sử dụng cao.

### 2. Nhược điểm

Là công nghệ ảo hóa hoàn toàn phần cứng, VPS KVM yêu cầu cấu hình server vật lý khá cao. Thậm chí yêu cầu phải sử dụng các server của các thương hiệu lớn như IBM, Dell thì mới đảm bảo hoạt động tốt được.

## IV. Cấu trúc KVM

![Imgur](https://i.imgur.com/RX1D8mV.png)

- User-facing tools: Là các công cụ quản lý máy ảo hỗ trợ KVM. Các công cụ có giao diện đồ họa (như virt-manager) hoặc giao diện dòng lệnh như (virsh)

- Management layer: Lớp này là thư viện libvirt cung cấp API để các công cụ quản lý máy ảo hoặc các hypervisor tương tác với KVM thực hiện các thao tác quản lý tài nguyên ảo hóa, vì tự thân KVM không hề có khả năng giả lập và quản lý tài nguyên như vậy.

- Virtual machine: Chính là các máy ảo người dùng tạo ra. Thông thường, nếu không sử dụng các công cụ như virsh hay virt-manager, KVM sẽ sử được sử dụng phối hợp với một hypervisor khác điển hình là QEMU.

- Kernel support: Chính là KVM, cung cấp một module làm hạt nhân cho hạ tầng ảo hóa (kvm.ko) và một module kernel đặc biệt hỗ trợ các vi xử lý VT-x hoặc AMD-V (kvm-intel.ko hoặc kvm-amd.ko)

### Một số lưu ý về KVM và QEMU

Có thể hình dung KVM giống như driver cho hypervisor để sử dụng được virtualization extension của CPU vật lí nhằm boots performance cho Guest VM. KVM như định nghĩa trên trang chủ thì là Core Virtualization Infrastructure (cơ sở hạ tầng ảo hóa lõi), nó được các hypervisor khác lợi dụng làm back-end để tiếp cận được các công nghệ hardware acceleration (Dịch code để mô phỏng phần cứng)

QEMU là một Emulator nên nó có bộ dịch của nó là TCG (Tiny Code Generate) để xử lý các yêu cầu trên CPU ảo và giả lập kiến trúc của máy ảo. Nên có thể coi, QEMU như là một hypervisor type 2, nhằm nâng cao hiệu suất của VM.

Cụ thể, lúc tạo VM bằng QEMU có VirtType là KVM thì khi đó các instruction có nghĩa đối với virtual CPU sẽ được QEMU sử dụng KVM để mapping thành các instruction có nghĩa đối với physical CPU. Làm như vậy sẽ nhanh hơn là chỉ chạy độc lập QEMU, vì nếu không có KVM thì QEMU sẽ phải quay về (fall-back) sử dụng translator của riêng nó là TCG để chuyển dịch các instruction của virtual CPU rồi đem thực thi trên physical CPU

=> Vậy khi QEMU và KVM kết hợp với nhau thì tạo thành 1 hypervisor type 1.

QEMU cần KVM để boost performance và ngược lại KVM cần QEMU (modified version) để cung cấp giải pháp full virtualization hoàn chỉnh.

Do KVM kết hợp QEMU nên các máy ảo và mạng ảo có file cấu hình xml sẽ được lưu lại tại thư mục /etc/libvirt/qemu/