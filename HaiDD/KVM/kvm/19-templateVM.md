# Tạo Template cho VM và tạo VM từ Template

## 1. Template là gì
- Template là một dạng file image pre-configured của hệ điều hành được dùng để tạo nhanh các máy ảo. Sử dụng template sẽ khiến bạn tránh khỏi những bước cài đặt lặp đi lặp lại và tiết kiệm thời gian rất nhiều so với việc cài bằng tay từng bước một.
- Giả sử bạn có 4 máy Apache web server. Thông thường, bạn sẽ phải cài 4 máy ảo rồi lần lượt cài hệ điều hành cho từng máy, sau đó lại tiếp tục tiến hành cài đặt dịch vụ hoặc phần mềm. Điều này tốn rất nhiều thời gian và template sẽ giúp bạn giải quyến vấn đề này.
- Hình dưới đây mô tả các bước mà bạn phải thực hiện theo ví dụ trên nếu bạn cài bằng tay. Rõ ràng từ bước 2-5 chỉ là những tasks lặp đi lặp lại và nó sẽ tiêu tốn rất nhiều thời gian không cần thiết.

<img src="..\images\Screenshot_180.png">

- Với việc sử dụng template, số bước mà người dùng phải thực hiện sẽ được rút ngắn đi rất nhiều, chỉ cần thực hiện 1 lần các bước từ 1-5 rồi tạo template là bạn đã có thể triển khai 4 web servers còn lại một cách rất dễ dàng. Điều này sẽ giúp người dùng tiết kiệm rất nhiều thời gian:

<img src="..\images\Screenshot_181.png">

## 2. Tạo Template 1 VM
Hai khái niệm mà người dùng cần phân biệt đó là `clone` và `template`:
- `clone` : đơn thuần chỉ là một bản sao của máy ảo
- `template` : được coi là master copy của VM, nó có thể được dùng để tạo ra rất nhiều clone khác nữa.

Có hai phương thức để triển khai máy ảo từ template đó là Thin và Clone
- **Thin**: Máy ảo được tạo ra theo phương thức này sẽ sử dụng template như một base image, lúc này nó sẽ được chuyển sang trạng thái read only. Cùng với đó, sẽ có một ổ mới hỗ trợ "copy on write" được thêm vào để lưu dữ liệu mới. Phương thức này tốn ít dung lượng hơn tuy nhiên các VM được tạo ra sẽ phụ thuộc vào base image, chúng sẽ không chạy được nếu không có base image
- **Clone**: Máy ảo được tạo ra là một bản sao hoàn chỉnh và hoàn toàn không phụ thộc vào template cũng như máy ảo ban đầu. Mặc dù vậy, nó sẽ chiếm dung lượng giống như máy ảo ban đầu.

### **Các bước tạo Template**
- **Bước 1**: Cài đặt máy ảo với đầy đủ các phần mềm cần thiết để biến nó thành template
- **Bước 2**: Loại bỏ tất cả những cài đặt cụ thể ví dụ như password SSH, địa chỉ MAC... để đảm bảo rằng nó sẽ không được áp dụng giống nhau tới tất cả các máy ảo được tạo ra sau này.
- **Bước 3**: Đánh dấu máy ảo là template bằng việc đổi tên.

## 3. Virt-sysprep
Sử dụng `virt-sysprep` để "niêm phong" máy ảo:

- `virt-sysprep` là một tiện ích nằm trong gói `libguestfs-tools-c` được sử dụng để loại bỏ những thông tin cụ thể của hệ thống đồng thời niêm phong và biến máy ảo trở thành template
- Có 2 options để dùng `virt-sysprep` đó là `-a` và `-d`. Tùy chọn `-d` được sử dụng với tên hoặc UUID của máy ảo, tùy chọn `-a` được sử dụng với đường dẫn tới ổ đĩa máy ảo.

Người dùng cũng có thể liệt kê các options cụ thể khi sử dụng với `virt-sysprep`. Ví dụ: `virt-sysprep --operations ssh-hostkeys,udev-persistent-net -d`

## 4. Lab tạo template và cài đặt VM từ template
### Tạo template
- Cài đặt 1 VM CentOS-7 trên host KVM1. Cài đặt các gói cần thiết để dùng làm template
- Shutdown VM `virsh shutdown demo`

    <img src="..\images\Screenshot_182.png">

- Cài đặt gói `libguestfs-tools-c` trên KVM host
    ```
    yum -y install libguestfs-tools-c
    ```
- Sử dụng `virt-sysprep` để loại bỏ các thông tin cấu hình như UUID, MAC, ... đồng thời niêm phong và biến máy ảo thành template.
    ```
    virt-sysprep -d demo
    ```

    <img src ="..\images\Screenshot_183.png">

- Backup file xml của template bằng cách `dumpxml`
    ```
    virsh dumpxml demo > /root/template.xml
    ```
- Undefine máy ảo
    ```
    virsh undefine demo
    ```

    <img src="..\images\Screenshot_184.png">

Ta đã tạo xong file image Template.

### Sử dụng template
- Copy file image template sang host KVM2
- Tạo ra file image mới với định dạng qcow2 để file template làm file backups bằng câu lệnh 
    ```
    qemu-img create -b /var/lib/libvirt/images/demo.qcow2 -f qcow2 /var/lib/libvirt/images/vm1.qcow2
    ```
- Kiểm tra xem file mới tạo ra đã được chỉ tới file backup của nó hay chưa bằng câu lệnh: 
    ```
    qemu-img info /var/lib/libvirt/images/vm1.qcow2
    ```

    <img src="..\images\Screenshot_185.png">

- Dùng virt-clone để tạo ra máy ảo mới từ file XML
    ```
    virt-clone --original-xml /root/template.xml -f /var/lib/libvirt/images/vm1.qcow2 -n vm1 --preserve-data
    ```
    - Nếu muốn VM có Disk tách hẳn ra, ta thay `--preserve-data` thành `--auto-clone`

    <img src="..\images\Screenshot_186.png">

- Kiểm tra các máy ảo đã tạo bên trên
    ```
    virsh list --all
    ```
    <img src="..\images\Screenshot_187.png">

- Tiến hành download 1 số thứ rồi kiểm ta dung lượng. Máy ảo được tạo ra sẽ có dung lượng file image đúng bằng dung lượng file bạn vừa down. Cơ chế hoạt động giống như Thin Provisioning giúp tiết kiệm bộ nhớ tuy nhiên nếu file template bị remove, các máy ảo tạo từ nó cũng sẽ không thể chạy được nữa.





## Tham khảo

- https://www.cyberciti.biz/faq/how-to-clone-existing-kvm-virtual-machine-images-on-linux/

- https://www.cyberciti.biz/faq/reset-a-kvm-clone-virtual-machines-with-virt-sysprep-on-linux/