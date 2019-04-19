Tìm hiểu kiến trúc CPU x86, user space và kernel space. Khi tìm hiểu về user space và kernel space sẽ có khái niệm `ring` tìm hiểu khái niệm `ring`.

Virtualization là  gì, các loại virtualization?

Hypervisor là gì, các loại hypervisor?

Phân biêt Virtualization và Hypervisor?

Tìm hiểu KVM.
 
 * KVM thuộc loại ảo hóa và hypervisor nào?

 * Cài đặt KVM

 * Sử dụng công cụ virt-manager để tạo VM hiểu từng bước khi tạo.

 * Sử dụng công cụ virsh

    * Tạo VM bằng cách sử dụng lệnh
    * Các lệnh quản lý VM: hiển thị danh sách VM, bật, tắt, reboot, xóa VM, tạo snapshot...

 * Tìm hiểu mô hình mạng trong KVM
    * Trong KVM có các mô hình mạng nào
    * So sánh sự khác nhau giữa các mô hình đó?
 
 * Công nghệ Linux-bridge
    * Đường đi của gói tin trong mô hình này
    * Sử dụng tcpdump để chứng minh đường đi chỉ ra ở bên trên
    * Cách tạo linux-bridge

 * File xml
    * Khi một VM được tạo ra sẽ có một file `xml` chính được tạo ra. File này chứa các thông tin gì?
    * Nếu có 1 file xml có thể tạo ra được Vm không?
    * File này có thể sửa được hay không? Nếu được thì thay một vài thông số như RAM, CPU, đường dẫn đến file img khác, thêm card mạng cho VM bằng cách sửa file xml.

 * Tìm hiểu cơ chế lưu trữ của `thin` và `thick`
    * Từ đó tìm hiểu định dạng `raw` và `qcow2` khi tạo file img của VM.
    * Ưu nhược điểm của 2 định dạng này
    * Có thể chuyển đổi giữa 2 định dạng này không?
    * Hai định dạng này thì cách nào có hiệu năng tốt hơn?
    * Dùng lệnh để test lại hiệu năng xem lý thuyết là đúng hay sai?

 * Tìm hiểu cơ chế tạo, xóa và revert snapshot. So sánh 2 loại snapshot `internal` và `external`

 * Cài webvirtmgr
    * Để sử dụng được webvirt thì trước tiên cần phải kết nối được với libvirt của các KVM host.
    * Sau đó cài đặt webvirtmgr
    * Tìm hiểu cách sử dụng

 * Cài đặt và sử dụng Kimchi
 * Live migrate VM giữa các KVM host
 * Tìm hiểu Iptables: Tìm hiểu các bảng, các chain, và các rule. Cách gói tin đi vào và đi ra.
 * Mô hình mạng NAT trong KVM:
    * Chỉ ra cách nó NAT
    * Chỉ ra đường đi của gói tin trong mô hình này
    * Sử dụng `iptables` và `tcpdump` chứng minh lại lý thuyết đường đi của gói tin.
