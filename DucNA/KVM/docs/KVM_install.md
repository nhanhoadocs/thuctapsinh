# 1. Khái niệm 
- KVM(Kernel-based Virtual Machine): là công nghệ ảo hóa trong nhân linux cho phép hạt nhân hoạt động như một trình ảo hóa. Do đó máy chủ KVM giống như xen được cung cấp riêng tài nguyên để sử dụng tránh việc tranh chấp tài nguyên với máy chủ khác.
- Máy chủ gốc được cài hệ điều hành linux nhưng KVM hỗ trợ tạo máy chủ ảo có thể chạy cả Linux, Windows. Nó cũng hỗ trợ cả X86 và X86-64 system
-  KVM cung cấp ảo hóa hỗ trợ phần cứng cho nhiều hệ điều hành khách khác nhau. 
# 2. Kiến trúc kvm trong linux 
- ![](https://camo.githubusercontent.com/58ff9677170c2e2501f0d8b6d49c02727972093c/687474703a2f2f692e696d6775722e636f6d2f775a456a41656c2e706e67)
- Khi sử dụng KVM, máy ảo sẽ chạy như một tiến trình trên máy chủ Linux.
- Các CPU ảo được xem như các tiến trình bình thường khác và được xử lý theo cách xử lý tiến trình của Linux.
# 3.Cấu trúc của KVM 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/687474703a2f2f692e696d6775722e636f6d2f6b37795a5345372e706e67.png)
- User-facing tools: Là các công cụ quản lý máy ảo hỗ trợ KVM. Các công cụ có giao diện đồ họa (như virt-manager) hoặc giao diện dòng lệnh như (virsh)
- Management layer: Lớp này là thư viện libvirt cung cấp API để các công cụ quản lý máy ảo hoặc các hypervisor tương tác với KVM thực hiện các thao tác quản lý tài nguyên ảo hóa, vì tự thân KVM không hề có khả năng giả lập và quản lý tài nguyên như vậy.
- Virtual machine: Chính là các máy ảo người dùng tạo ra. Thông thường, nếu không sử dụng các công cụ như virsh hay virt-manager, KVM sẽ sử được sử dụng phối hợp với một hypervisor khác điển hình là QEMU.
- Kernel support: Chính là KVM, cung cấp một module làm hạt nhân cho hạ tầng ảo hóa (kvm.ko) và một module kernel đặc biệt hỗ trợ các vi xử lý VT-x hoặc AMD-V (kvm-intel.ko hoặc kvm-amd.ko)
# 4. KVM và QEMU
- ![](https://camo.githubusercontent.com/0027be0182b128ccb97e64dcf0a6868ad077504f/687474703a2f2f692e696d6775722e636f6d2f6978523369544d2e706e67)
- QEMU đã là một hypervisor hoàn chỉnh. QEMU có khả năng giả lập tài nguyên phần cứng, trong đó bao gồm một CPU ảo.
- Do KVM hỗ trợ ánh xạ CPU vật lý sang CPU ảo nên VM có thể sử lý các tiến trình được như một nhân linux bình thường 
- Như vậy chúng ta có thể thấy KVM thực chất là một module được sử dụng kết hợp với một hypervisor là QEMU.
# 5. Hướng dẫn cài đặt KVM 
- KVM chỉ làm việc nếu CPU hỗ trợ ảo hóa phần cứng Intel VT-x hoặc AMD-V. Để xác định CPU có những tính năng này hay không, Thực hiện lệnh sau
```
egrep -c '(svm|vmx)' /proc/cpuinfo
```
- Nếu giá trị bằng 0 nói rằng CPU không hỗ trợ ảo hóa phần cứng trong khi giá trị khác 0 chỉ thị là có ohox trợ. Người dùng có thể vẫn phải kích hoạt chức năng hỗ trợ ảo hóa phần cứng trong BIOS của máy kể cả khi câu lệnh này trả về giá trị khác 0.
```
kvm-ok
```

- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2014-20-29.png)
- Sau khi biết được có hỗ trợ ảo hóa thì ta sử dụng gói đi kèm và sử dụng lệnh. 
```
sudo apt-get install qemu-kvm libvirt-bin bridge-utils 
```
# 6. Tạo và quản lý máy ảo bằng lệnh
## a) Bằng lệnh virt-install 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2013-45-05.png)
```
- $ virt-install \
> --name=Centos7-may4 \
> --vcpus=1 \
> --memory=1024 \
> --cdrom=CentOS-7-x86_64-Minimal-1804.iso \
> --disk=may4,size=10 \
> --os-variant=rhel7 \
> --network bridge=virbr1
```
Trong đó

- `--name` đặt tên cho máy ảo định tạo
- `--vcpus` là tổng số CPU đinhj tạo cho máy ảo
- `--memory` chỉ ra dung lượng RAM cho máy ảo (tính bằng MB)
- `--cdrom` sau đó chỉ ra đường dẫn đến file ISO. Nếu muốn boot bằng cách khác ta dùng option 
- `--locaion` sau đó chỉ ra đường dẫn đến file (có thể là đường dẫn trên internet).
- `--disk` chỉ ra vị trí lưu disk của máy ảo. size chỉ ra dung lượng disk của máy ảo(tính bằng GB)
- `--os-variant` chỉ ra kiểu của HĐH của máy ảo đang tạo. Option này có thể chỉ ra hoặc không nhưng nên sử dụng nó vì nó sẽ cải thiện hiệu năng của máy ảo. Nếu bạn không biết HĐH hành của mình thuộc loại nào bạn có thể tìm kiếm thông tin bằng cách dùng lệnh osinfo-query os
- `--network` chỉ ra cách kết nối mạng của máy ảo. Trên đây là một số option cơ bản để tạo máy ảo. Bạn có thể tìm hiểu thêm bằng cách sử dụng lệnh virt-install --help
## b) Bằng virt-manager
- Sau khi cài xong virt-manager ta sử dụng ứng dụng như sau 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2014-21-50.png)
- Ta chọn file -> creat a new virtual manager 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-20%2022-22-35.png) 
ta chọn cái đầu tiên có nghĩa là boot bằng file iso trong hệ thống 
- Sau khi ta foward thì đến mục chọn file iso trong máy chúng ta
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2013-52-00.png)
- Tiếp theo là chọn số CPU và memory cần thiết 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2013-52-10.png)
- Tiếp đến là lựa chọn số GB để lưu trữ máy ảo 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2013-52-15.png)
- Cuối cùng là lựa chọn tên máy ảo và network 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/KVM_install/Screenshot%20from%202019-02-21%2013-52-24.png)
- Sau khi tạo xong máy ta có thể kiểm tra lại mọi thứ ở dấu chấm than bên cạnh
