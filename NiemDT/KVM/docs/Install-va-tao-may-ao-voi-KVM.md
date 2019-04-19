## Cài đặt và tạo máy ảo với virt-manager

### 1. Cài đặt
Để cài đặt và tạo được máy ảo với KVM thì cần phải được CPU hỗ trợ. Để biết CPU có hỗ trợ hay không thì ta cần chạy lệnh sau để kiểm tra:
`egrep -c "svm|vmx" /proc/cpuinfo`
Khi chạy lệnh này nếu kết quả trả về là `0` thì CPU của ta không hỗ trợ ảo hóa phần cứng. Còn nếu kết quả trả về là khác `0` thì CPU của ta có hỗ trợ.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm1.png)

Nếu CPU của ta có hỗ trợ để cài KVM ta dùng lệnh sau:
`sudo apt-get install quemu-kvm libvirt-bin bridge-utils virt-manager`
Với câu lệnh này ta đã cài KVM và một công cụ quản trị `virt-manager` để quản lý việc tạo và quản lý máy ảo với giao diện.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm2.png)

Bây giờ ta có thể thấy biểu tượng sau ở trong số các ứng dụng

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm4.png)

Hoặc ta có thể dùng câu lệnh `virt-manager` trên terminal để mở giao diện của nó.
Nếu bạn đã từng sử dụng ứng dụng `VMware workstation` để tạo máy ảo thì giao diện của `virt-manager` không có gì lạ lẫm với bạn.

Để tạo một máy ảo ta click vào biểu tượng

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm3.png)

Ở bước này ta sẽ được chọn cách để boot HĐH có thể từ file ISO có sẵn trên máy của ta, boot qua mạng... Như ở đây tôi chọn cách boot bằng một file ISO có sẵn trong máy của tôi.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm5.png)

Ở đây ta cần chỉ ra vị trí lưu file ISO

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm6.png)

Click vào `Browse Local` để chọn file ISO

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm7.png)

Chọn `Forward` để chuyển qua bước tiếp theo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm8.png)

Bước này ta chọn dung lượng RAM (tính bằng M) và số CPU của máy ảo. Sau khi chọn xong ta nhấn `Forward` để tiếp tục

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm9.png)

Ở bước này ta chọn dung lượng ổ cứng cho cho máy ảo. Nếu ta click và `Create a disk image for the virtual machine` thì máy ảo của ta sẽ nằm trong thư mục `/var/lib/libvirt/images` còn nếu ta chọn `select or create custom storage` thì ta được chỉ ra vị trí lưu máy ảo của ta. Khi chọn xong ta chọn `Forward` để tiếp tục

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm10.png)

Ở bước này ta được phép đổi tên máy ảo và được chọn card mạng và kiểu kết nối mạng (Bridge hoặc NAT)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm11.png)

Đến bước này ta setup máy như bình thường 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm12.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm17.png)

Ta có thể trở lại `virt-manager` để quản lý các máy ảo đã tạo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm18.png)

Để tạo bản snapshort ta chọn lần lượt các bước sau

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm19.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm20.png)

Để xem thông tin phần cứng ta chọn 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/kvm21.png)

