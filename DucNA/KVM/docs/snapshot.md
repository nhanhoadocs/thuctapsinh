# 1. Khái niệm 
-   Snapshot là một điều rất quan trọng đối với ảo  hóa. Nó sẽ lưu trữ lại tất cả có gì trong máy của chúng ta tại một thời điểm nào đó lại và luưu trữ chúng. Chúng ta cần phải nâng cấp hệ thống nên thường ngày nhưng mà nhỡ có xảy ra lỗi gì đó thì ta sẽ lại phải cài lại một chiếc máy ảo khác. Ví dụ như một chiếc máy ảo chúng ta cần để test có 10 bước làm nếu ta làm được 9 bước và bước cuối cùng bị lỗi ta sẽ cần phải tạo lại máy và làm lại 9 bước còn lại. Thay vì như thế mỗi khi làm xong một bước nào đó ta sẽ tạo ra một bảo ảnh ảo(snapshot) thì khi lỗi ở đâu ta có thể quay lại ở bước đó. 
- ![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/snapshot/1.png)
- Libvirt chỉ hỗ trợ việc tạo bản snapshot trong khi máy ảo đang chạy. Ta có thể snapshot bằng virt-manager hoặc như ta đã tìm hiểu ở phần quản lý máy ảo băng lệnh virsh và nó có một vài hạn chế 
    - Chỉ hỗ trợ duy nhất định dạng qcow2
    - VM sẽ bị ngưng lại khi tiến hành snapshot
- Cho nên khi mà cần sử dụng bản snapshot nào đó thì máy ảo sẽ copy cái bản snapshot đó vào phiên bản đang khởi động để có thể sử dụng được bản snapshot. 
# 2. Xóa một bản snapshot 
- Khi xóa một bản snapshot có nghĩa là ta xóa đi một khối nào đó. Lúc này nó sẽ giữ lại những thông tin mà các bản snapshot tạo sau đang đọc từ nó và chỉ xóa đi những thông tin liên quan
- Những thông tin liên quan sẽ được gộp chung với khối là bản snapshot được tạo ngay phía sau nó
- ![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/virsh/3.png)
# 3. Convert một bản snapshot 
- Khi ta muốn sử dụng lại một bản snapshot trước đó mà ta đã lưu thì ta phải convert nó vào bản ban đầu và cơ chế của convert là:
- ![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/snapshot/2.png)
- Nó sẽ copy bản snapshot trước đó và ghi đè lên bản đang chạy hiện tại và sử dụng nó 
# 4. Phân loại kiểu snapshot 
- `Internal`: Các bản snapshot được tạo ra sẽ nằm bên trong file disk của máy ảo. Với cách này sẽ dễ dàng để tạo nhưng có trở ngại khi file disk của ta bị giới hạn.
- `External`: Các bản snapshot được tạo ra sẽ nằm ở một file riêng biệt với file disk. Với loại này ta có thể lưu trạng thái disk của máy ảo ở một file và trạng thái về RAM của máy ảo ở một file khác. Với kiểu này ta có thể tránh được sự hết dung lượng disk của máy ảo khi tạo  snapshot.
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/snapshot/Screenshot%20from%202019-03-19%2017-15-33.png)
- Để kiểm tra ta vào /var/lib/libvirt/images để có thể nhìn thấy file snapshot đã được tạo ra một file riêng 
```
root@anhduc:/var/lib/libvirt/images# ll
total 2261868
drwx--x--x 2 root         root        4096 Thg 3 19 16:37 ./
drwxr-xr-x 7 root         root        4096 Thg 3 19 15:54 ../
-rwxrwxrwx 1 libvirt-qemu kvm  11596398781 Thg 3 19 17:13 centos7.0-2.qcow2*
-rw-r--r-- 1 root         root        4096 Thg 3 19 16:37 .centos7.0-2.qcow2.swp
root@anhduc:/var/lib/libvirt/images# 
```