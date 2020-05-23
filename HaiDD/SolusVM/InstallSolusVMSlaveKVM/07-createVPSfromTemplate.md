# Tạo VPS từ Template trên SolusVM

## I. Upload Template lên MasterNode
Ta sẽ upload các template lên thư mục `/home/solusvm/kvm/template/`

Có thể xem một số template tại : https://tdn.solusvm.com/

## II. Đăng kí template trong SolusVM
1. Sau khi upload xong template. Trở lại giao diện, chọn **Media** -> **List template** -> Click **Add KVM Template**

<img src="..\images\Screenshot_17.png">

2. Trong giao diện Add Template, ta điền các thông tin vào các trường
    - **Name** : trường này hiển thị trong SolusVM Interface trên mỗi trang đề cập đến template
    - **Description** : Mô tả của template, chỉ hiển thị trên trang danh sách template
    - **Template** : Chọn template đã up load trên SolusVM Master

    <img src="..\images\Screenshot_18.png">

    Xem thêm tại [đây](https://documentation.solusvm.com/display/BET/Registering+the+templates+in+SolusVM) .

## III. Đồng bộ template với Slave Nodes
Các template được up lên cần dượcd đồng bộ với Slave Nodes để tạo các máy chủ ảo.

- **Media** -> **Media Sync**

<img src="..\images\Screenshot_19.png">

- Chọn tab **Create**, sau đó chọn các template muốn đồng bộ và chọn Node phù hợp. Sau đó, click **Create sync job**

<img src="..\images\Screenshot_20.png">

- Sau khi đồng bộ thành công

<img src="..\images\Screenshot_21.png">

## IV. Đăng kí Block IP để phân bổ IP cho các node
- Để đăng kí IP block, ta chọn **IP Blocks** -> **Add IPv4 Block**

    <img src="..\images\Screenshot_22.png">

- Điền tên, và các thông số mạng: gateway, dns. Trong phần Nodes, gán khối IP cho Slave server. Rồi click **Add Block**

    <img src="..\images\Screenshot_23.png">

- Sau khi tạo xong, click **Manage IPs** để thêm địa chỉ IP.

    <img src="..\images\Screenshot_25.png">

## V. Tạo Customer
Mỗi máy chủ ảo phải có chủ sở hữu máy khách. Trước khi chuyển sang triển khai các máy chủ ảo, bạn cần tạo 1 Client thử nghiệm

**Clients** -> **Add Client**

<img src="..\images\Screenshot_27.png">

Sau khi tạo xong, ta sẽ thấy trong List client

<img src="..\images\Screenshot_26.png">

## VI. Tạo VPS
### Đối với mọi máy chủ ảo, các điều sau phải chính xác
- Chủ sở hữu nên tồn tại
- Node cần có địa chỉ IP miễn phí từ IP Blocks
- Template phải được tải lên Node Master SolusVM và phải được đồng bộ hóa với Node Slave.
- Node nên có đủ tài nguyên để tạo VPS (RAM, Dung lượng đĩa, v.v.).


### Các bước tạo VPS
- **Virtual Servers** -> **Add virtual server**

    <img src="..\images\Screenshot_28.png">

- Chọn kiểu máy chủ ảo. Ở đây, ta chọn KVM

    <img src="..\images\Screenshot_29.png">

- Chọn node rồi click **Continue**

    <img src="..\images\Screenshot_30.png">

- Chọn Client sở hữu máy chủ, đặt tên, chọn template VM và IP

    <img src="..\images\Screenshot_31.png">

- Sau khi tạo xong, ta sẽ thấy giao diện thông báo thành công và chi tiết của server ảo. 

    <img src="..\images\Screenshot_32.png">

- Click **Continue** để hoàn tất.