# Hướng dẫn tạo máy ảo với cobbler

Click `Computes` sau đó chọn KVM muốn tạo máy ảo trên đó

![](../images/cobbler/01.png)

Click `Storages`

![](../images/cobbler/02.png)

Chọn thư mục chứa images của VM

![](../images/cobbler/03.png)

Chọn dấu cộng để tạo images cho VM

![](../images/cobbler/04.png)

Khai báo tên images và size sau đó chọn `Create`

Lưu ý:
 * Tên images để trùng với tên VM
 * Format để `qcow2`

![](../images/cobbler/05.png)

Sau đó vào `Instances`

![](../images/cobbler/06.png)

Click vào dấu cộng để add VM

![](../images/cobbler/07.png)

Chọn `Custom`

![](../images/cobbler/08.png)

Khai báo các thông số của VM

![](../images/cobbler/09.png)

Tối thiểu 2G RAM và 2 CPU để tạo được máy với cobbler.

Add disk là images ta vừa tạo.

Network add `vlan635` để tạo được máy bằng cobbler

Sau đó click `Create`

Tạo bản snapshot đầu tiên

![](../images/cobbler/10.png)

Chọn boot bằng card mạng

![](../images/cobbler/11.png)

Bật máy

![](../images/cobbler/12.png)

Vào console

![](../images/cobbler/13.png)

Chọn OS

![](../images/cobbler/14.png)

Ok giờ ngồi chơi đợi máy cài xong

![](../images/cobbler/15.png)

Login với tài khoản root. Password là pass mặc định của VM được note trong file Excel.

Vào đặt lại passwork.

Lúc này máy chỉ có 1 card mạng của dải cobbler. Bây giờ phải đổi sang dải mạng được cấp. 

Tắt máy sau đó vào `Settings` -> `Network`

![](../images/cobbler/16.png)

Chọn VLAN được cấp

![](../images/cobbler/17.png)

Bật lại máy và vào cấu hình IP tĩnh là ok.