# Tạo VPS từ ISO trên SolusVM

## I. Upload ISO lên Solus Master
Ta sẽ upload các file iso lên thư mục `/home/solusvm/kvm/iso`

## II. Đăng kí file-iso trên Solus Master
1. Sau khi upload xong file-iso lên solus master. Trở lại giao diện, chọn **Media** -> **Add ISO**

    <img src="..\images\Screenshot_33.png">

2. Trong giao diện Add ISO, ta điền thông tin các trường. Rồi click **Add iso**
    - **Name** : tên của bản iso
    - **Description** : Mô tả
    - **iso** : chọn file ISO muốn add
    - **Status** : chọn Active
    - **Arch** : kiến trúc phần cpu, ở đây, ta chọn x86_64

    <img src="..\images\Screenshot_34.png">

## III. Đồng bộ file-iso với Slave Nodes
- **Media** -> **Media Sync**

    <img src="..\images\Screenshot_19.png">

- Chọn tab **Create**, sau đó chọn các file-iso muốn đồng bộ và chọn Node phù hợp. Sau đó, click **Create sync job**

    <img src="..\images\Screenshot_35.png">

- Sau khi đồng bộ thành công

<img src="..\images\Screenshot_21.png">

## IV. Tạo VPS
### Đối với mọi máy chủ ảo, các điều sau phải chính xác
- Chủ sở hữu nên tồn tại
- Node cần có địa chỉ IP miễn phí từ IP Blocks
- File-iso phải được tải lên Node Master SolusVM và phải được đồng bộ hóa với Node Slave.
- Node nên có đủ tài nguyên để tạo VPS (RAM, Dung lượng đĩa, v.v.).

### Các bước tạo VPS
- **Virtual Servers** -> **Add virtual server**

    <img src="..\images\Screenshot_28.png">

- Chọn kiểu máy chủ ảo. Ở đây, ta chọn KVM

    <img src="..\images\Screenshot_29.png">

- Chọn node rồi click **Continue**

    <img src="..\images\Screenshot_30.png">

- Chọn Client sở hữu máy chủ, đặt tên, chọn file-iso cài đặt VM và IP

    <img src="..\images\Screenshot_36.png">

- Sau khi tạo xong, ta sẽ thấy giao diện thông báo thành công và chi tiết của server ảo. 

    <img src="..\images\Screenshot_37.png">

- Click **Continue** để hoàn tất.

- 