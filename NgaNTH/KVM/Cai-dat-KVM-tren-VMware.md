# Cài đặt KVM trên VMware Workstation  

## 1. Cài KVM  

Ta sẽ tiến hành cài KVM trên CentOS 7.
Trước tiên cần kiểm tra máy có hỗ trợ ảo hóa hay không bằng lệnh  
```
egrep -c "svm|vmx" /proc/cpuinfo
0  
```
Nếu kết quả là hiển thị khác 0 thì tức là có hỗ trợ, còn kết quả là `0` thì ta cần phải cài đặt lại bằng cách chỉnh sửa trong `Virtual Machine Settings`, tích vào 2 chế độ hỗ trợ ảo hóa. 

<img src="https://i.imgur.com/69VroEM.png">  

Sau đó kiểm tra lại  
```
# egrep -c "svm|vmx" /proc/cpuinfo
2
```  
Sau đó tiếp tục cài KVM với các lệnh sau.  
- Cài đặt các gói cần thiết
```
yum -y install qemu-kvm libvirt virt-install bridge-utils virt-manager
```
- Sau khi cài xong ta kiểm tra xem module KVM bằng lệnh  
```
lsmod | grep kvm
kvm_intel             188688  0
kvm                   636931  1 kvm_intel
irqbypass              13503  1 kvm
```
- Bật libvirt và khởi động cùng hệ thống
```
systemctl start libvirtd
systemctl enable libvirtd
```
- Tạo card bridge `br0` trên CentOS 7 ở chế độ NAT để khi ta tạo các máy ảo KVM ta sẽ gắn các card mạng vào bridge này.  
```
#nmcli connection add type bridge autoconnect yes con-name br0 ifname br0
#nmcli connection modify br0 ipv4.addresses 192.168.95.10/24 ipv4.method manual  
#nmcli connection modify br0 ipv4.gateway 192.168.95.2
#nmcli connection modify br0 ipv4.dns 192.168.95.2  
#nmcli connection delete ens33
#nmcli connection add type bridge-slave autoconnect yes con-name ens33 ifname ens33 master br0
```
- Khởi động lại hệ thống
```
reboot
```

## 2. Sử dụng công cụ virt-manager để cài VM  

- Download file iso CentOS 7
```
cd /var/lib/libvirt
mkdir file-iso
wget http://repos-va.psychz.net/centos/7.6.1810/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso
```

- Đối với bản Minimal để dùng được công cụ đồ họa `virt-manager` người dùng phải cài đặt gói x-window bằng câu lệnh  
```
yum install "@X Window System" xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y
```
- Vào virt-manager để cấu hình VM  
```
virt-manager 
```
Chọn File -> New Virtual Machine -> Local install media (ISO imange or CDROM) và click `Foward`  
Chọn đường dẫn đến file cài đặt và tiếp tục `Forward`  

<img src="https://i.imgur.com/Gb5mEuU.png">  

Ta tiếp tục cài đặt các thông số cho máy ảo.  
Lưu ý ở phần `Network selection` ta sẽ gắn card mạng vào bridge `br0`  

<img src="https://i.imgur.com/X6gNcUP.png">  

Sau đó chọn `Finish`  

Cuối cùng là chọn `Begin Install ` để bắt đầu quá trình cài máy ảo như thông thường.  

- Ta có thể tạo nhiều máy ảo KVM. Sau khi cài đặt xong các máy ảo ta có thể xem danh sách cũng như trạng thái các máy ảo KVM bằng lệnh  

```
virsh list --all
 Id    Name                           State
----------------------------------------------------
 2     centos7.0                      running
```  
