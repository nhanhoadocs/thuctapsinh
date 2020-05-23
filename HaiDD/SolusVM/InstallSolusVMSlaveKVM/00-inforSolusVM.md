# Thông tin cần lưu ý trước khi cài đặt SolusVM

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