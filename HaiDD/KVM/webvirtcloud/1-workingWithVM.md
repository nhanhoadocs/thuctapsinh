# Các thao tác với VM trên WebvirtCloud

<img src= "..\images\Screenshot_68.png">

## 1. Thêm VM
- Ta sẽ tạo 1 storage để chạy VM đó. Ta chọn Computer

<img src= "..\images\Screenshot_69.png">

- Giao diện Computes hiện ra. Ta sẽ chọn 1 máy để tạo storage. Ở đây, ta chọn **kvmlab2**

<img src= "..\images\Screenshot_70.png">

- Trên giao diện của **kvmlab2**, ta chọn Storages

<img src= "..\images\Screenshot_71.png">

- Trên giao diện Storage, ta sẽ chọn 1 mục để tạo phân vùng cài VM. Ở đây, ta chọn **default**

<img src= "..\images\Screenshot_72.png">

- Click chọn biểu tượng **+** để thêm Volume

<img src= "..\images\Screenshot_73.png">

- Ta điền tên, định dạng và kích thước cho VM. Sau đó, click **Create**

<img src ="..\images\Screenshot_74.png">

Khi thành công, ta sẽ thấy có thông báo thành công

<img src= "..\images\Screenshot_75.png">

- Ta chọn Instances, rồi click biểu tượng **+** để thêm VM

<img src= "..\images\Screenshot_76.png">

- Ta có thể sử dụng những mẫu có sẵn hoặc custom. Ở đây, ta sẽ chọn **Custom**

<img src= "..\images\Screenshot_77.png">

- Tại phần HDD, ta chọn volume đã tạo ở trên để tạo VM. ở đây, ta chọn **default**, và chọn volume đã tạo

<img src= "..\images\Screenshot_78.png">

- Chọn Network. Rồi click **Create**

<img src= "..\images\Screenshot_79.png">

- Sau khi thành công, ta sẽ thấy giao diện sau dưới. Sau đó, ta chọn Settings

<img src ="..\images\Screenshot_80.png">

- Ta chọn Disk. Chọn file iso cài đặt hệ điều hành rồi click **Mount**

<img src = "..\images\Screenshot_81.png">

- Sang mục Boot. Tại mục Boot Order, ta sẽ chọn 2 phần **vda**, **hda** rồi click **Apply**

<img src="..\images\Screenshot_82.png">

- Chọn sang Power -> click Power On để tiến hành cài đặt VM

<img src ="..\images\Screenshot_83.png">

- Sau đó, ta sang phần Access, click Console:

<img src = "..\images\Screenshot_84.png">

- Ta tiến hành cài đặt hệ điều hành cho VM

<img src = "..\images\Screenshot_85.png">

## 2. Sửa VM
Thay đổi thông số **CPU**, **RAM**, **Disk**. Ta sẽ chọn mục **Resize**

<img src ="..\images\Screenshot_86.png">

Tại đây, ta có thể thay đổi thông số của CPU, RAM, Disk. Sau khi thay đổi xong, ta click **Resize**.

**Lưu ý:** Cần tắt VM trước khi **Resize**

## 3. Clone VM
Ta chọn Setting -> Clone

<img src ="..\images\Screenshot_88.png">

Lưu ý: Đặt tên không chứa các kí tự đặc biệt.

Sau khi clone thành công, ta sẽ thấy giao diện của VM clone

<img src = "..\images\Screenshot_89.png">

## 4. Snapshot
Cần tắt VM trước khi Snapshot

Ta chọn **Snapshot** -> **Take Snapshot**. Ta đặt tên cho bản Snapshot rồi click **Take Snapshot**

<img src = "..\images\Screenshot_90.png">

Sau khi Snapshot thành công, ta sẽ thấy bản Snapshot bên mục Manager Snapshots. Tại đây, ta cũng có thể thấy các bản Snapshot khác của VM

<img src ="..\images\Screenshot_91.png">

### Quay lại bản snapshot nào đó
Ta chọn bản snapshot rồi click biểu tượng như hình

<img src = "..\images\Screenshot_92.png">

### Xóa bản Snapshot
Ta chọn bản snapshot rồi click biểu tượng xóa như hình

<img src = "..\images\Screenshot_93.png">

Click OK

<img src ="..\images\Screenshot_94.png">

## 5. Xóa VM
Để xóa VM, ta chọn mục **Destroy** -> Click **Destroy** để xóa

<img src ="..\images\Screenshot_95.png">