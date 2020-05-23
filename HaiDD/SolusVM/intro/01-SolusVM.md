# SolusVM

## SolusVM là gì?
**Solus Virtual Manager** ( SolusVM ) là một trong những giải pháp quản lý VPS thương mại phổ biến nhất. Nó cung cấp hỗ trợ đầy đủ của OpenVZ, Linux KVM , XEN Paravirtualization và XEN HVM. SolusVM GUI thân thiện cho phép người dùng quản lý VPS cluster một cách dễ dàng.

- Trang chủ **SolusVM**: https://solusvm.com/

- **Docs** : https://docs.solusvm.com/

## Một số thuật ngữ

|Word|Definition|
|-|-|
|SolusVM Master node|Máy chủ cài đặt phần mềm SolusVM Master. Nó chứa GUI và giao diện API để quản lí cơ sở hạ tầng và tạo máy chủ ảo|
|SolusVM Slave node|Máy chủ cài đặt phần mềm SolusVM Slave. Máy chủ đang sử dụng cho lưu trữ VPS thực tế và chứa giao diện API để chỉ tương tác với SolusVM Master node|
|IP Block|Danh sách các địa chỉ IP với gateway và subnet mask. Địa chỉ IP từ nhóm này được gán cho áy chủ ảo|
|Volume group|The Volume group là mức trừu tượng cao nhất được sử dụng trong LVM. Nó bắt buộc với KVM và Xen|
|LVM|Logical volume. Được tạo từ Volume group và sử dụng để lưu trữ dữ liệu của VPS cho ảo hóa KVM và Xen|
|Template|Bộ đệm được tạo trước sử dụng để tạo máy ảo|