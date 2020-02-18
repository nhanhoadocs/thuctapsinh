# Cài đặt SolusVM

## Lưu ý trước khi cài đặt
**SolusVM** có 2 loại như sau:
- **SolusVM Master** : 
    - Hỗ trợ: chỉ hỗ trợ ảo hóa OpenVZ
    - Phải được cài đặt trên máy chủ clean: máy chủ mới cần phải được update lên phiên bản mới nhất với `yum update`

- **SolusVM Slave** : (ta tập trung vào phần này)
    - Hỗ trợ : Xen và KVM
    - Có thể được cài đặt trên máy chủ có VPS đang chạy trên đó và ta có thể import chúng vào SolusVM
    - Không được cài đặt trên máy chủ có phần mềm tương tự như Virtalizor

- Tài liệu tập trung vào việc sử dụng các hệ điều hành dựa trên RHEL7, do đó có thể có một chút khác biệt đối với các hệ điều hành cũ hơn

## Port sử dụng cho SolusVM Slave
|Port|Mục đích|
|-|-|
|6767|Port này được sử dụng để liên lạc với node Master. Port này phải được mở cho IP nút Master|
|22(*)|Cổng SSH được sử dụng cho bảng điều khiển HTML 5 trong trường hợp OpenVZ. Nó nên được mở trên các slave nodes cho IP node Master|
|5901 ... 5999(**)|Các cổng này được sử dụng cho VNC. Nó nên được mở cho tất cả internet|

(*) Bất kỳ cổng SSH nào cũng có thể được sử dụng, không chính xác là cổng 22

(**) Cổng này có thể lên cao hơn, ví dụ như 6001, trong trường hợp node có hơn 99 VPS