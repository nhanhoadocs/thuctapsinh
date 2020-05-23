# Yêu cầu phần cứng

Node SolusVM KVM Slave phải phù hợp với các yêu cầu phần cứng tương tự như node KVM thông thường không có phần mềm SolusVM. Đây là 1 ví dụ về cài đặt được đề xuất:
- Mỗi core hoặc thread cho mỗi CPU ảo hóa và 1 host.
- RAM: 2GB cho các dịch vụ hệ thống + RAM cho máy ảo
- KVM templates & iso sẽ được lưu tại `/home/solusvm/kvm` + không gian đĩa dành cho máy ảo.
- SWAP 4GB++

**Xác định ảo hóa CPU:**
```
egrep -c "svm|vmx" /proc/cpuinfo
```

### OS đề nghị : **CentOS 7**
- Giải pháp vững chắc, ổn định và được đề nghị
- Không làm việc với hệ thống tệp NTFS bên ngoài
- Các sửa đổi bổ sung là cần thiết
- Xem [Libguestfs](#7)
