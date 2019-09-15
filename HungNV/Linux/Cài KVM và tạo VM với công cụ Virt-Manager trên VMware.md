# Cài KVM và tạo VM với công cụ Virt-Manager trên VMware

#### 1. Cài KVM 

Trước tiên ta kiểm tra xem máy có hỗ trợ ảo hóa hay không bằng lệnh : 
```
egrep -c "svm|vmx" /proc/cpuinfo
```
nếu kết quả khác 0 tức là máy có hỗ trợ ảo hóa. Nếu kết quả bằng 0, ta tiến hành bật ảo hóa bằng cách sau: 

![Imgur](https://i.imgur.com/u9YLQHH.png)

Sau đó tiếp tục cài KVM với các lệnh sau.

* Cài đặt các gói cần thiết :

```
yum -y install qemu-kvm libvirt virt-install bridge-utils
```
* Kiểm tra modul KVM đã được cài :  

```
[root@CentOS ~]# lsmod | grep kvm
kvm_intel             188683  0
kvm                   621392  1 kvm_intel
irqbypass              13503  1 kvm
```
* Bật libvirt và khởi động cùng hệ thống 

```
systemctl start libvirtd
systemctl enable libvirtd
```  
#### 2. Sử dụng công cụ virt-manager để cài vm
Download file iso CentOS 7 
```
cd /var/lib/libvirt
mkdir file-iso
wget http://mirrors.nhanhoa.com/centos/7.6.1810/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso
```
Vào virt-manager để cấu hình VM
```
virt-manager
```
Chọn `File` -> `New Virtual Machine` 

![Imgur](https://i.imgur.com/xTJXgyh.png)

Chọn `Browser` để chỉ ra vị trí lưu file iso -> `Forward`

![Imgur](https://i.imgur.com/XjCLJRT.png)

Chọn dung lượng RAM và số CPU cho máy ảo  -> `Forward` để tiếp tục.

![Imgur](https://i.imgur.com/ckrgZky.png)

Chọn dung lượng ổ cứng cho máy ảo và `Forward` đến giao diện tiếp theo `Forward` để hoàn tất quá trình tạo máy ảo. 

![Imgur](https://i.imgur.com/yzfFPLc.png)

Đến đây, ta tiến hành cài OS cho máy ảo như bình thường.

![Imgur](https://i.imgur.com/8BqJvlk.png)


