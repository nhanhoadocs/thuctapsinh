## Tìm hiểu về hai định dạng ổ đĩa RAW và QCOW2 trong KVM
Một máy ảo KVM được tạo ra gồm file `xml` và một file image là storage của VM. File images này thường có 2 định dạng phổ biến là `raw` và `qcow2`. Ở bài viết này tôi chỉ chỉ ra một vài điểm khác nhau và một số ưu nhược điểm của hai định dạng `raw` và `qcow2`.
#### 1. Kiểm tra dung lượng của 2 file 
Để kiểm tra dung lượng của 2 file tôi sẽ dùng lệnh `qemu-img` để tạo ra một file có định dạng `raw` và một file có định dạng `qcow2` cả 2 file nàu đều có dung lượng là `10G`. Sau khi tạo xong ta có thể thấy

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/1.png)

Như ta thấy ở trên thì dù ta lúc ta tạo dung lượng của 2 file đều là `10G` nhưng khi kiểm tra ta có thể thấy file `qcow2` dung lượng chỉ là `193K`. Ta có thể thấy dung lượng của nó đã nén xuống bởi định dạng này giống như cơ chế `Thin` ta đã tìm hiểu bài trước nó chỉ thể hiện đúng phần dung lượng của dữ liệu có trong đó. Trong khi đó thì với file `raw` thì nó vẫn có dung lượng như ban đầu ta tạo.
#### 2. Test performance giữa 2 định dạng
Để test hiệu năng giữa 2 định dạng này ta sử dụng câu lệnh `dd` để đọc và ghi dữ liệu từ các file trên.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/2.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/3.png)

Ta có thể thấy trong cả 2 trường hợp định dạng `qcow2` đều cho kết quả tốt hơn.
#### 3. Tạo snapshot
Với 2 định dạng này thì chỉ có định dạng `qcow2` là hỗ trợ tạo snapshot.
VM sử dụng định dạng **raw**

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/6.png)

VM sử dụng định dạng **qcow2**

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/7.png)

#### 4. Chuyển đôi giữa raw và qcow2
Thông thường định dạng mặc định khi cài máy ảo KVM sẽ là định dạng `qcow2` vì vậy ta muốn chuyển đổi giữa 2 định dạng ta dùng câu lệnh sau:

Chuyển từ `qcow2` sang `raw`: `qemu-img convert -f qcow2 -O raw file-qcow2 tên-file-mới`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/5.png)

Ở đây file qcow2 của tôi có tên là `test.qcow2` và tôi muốn chuyển sang file raw có tên `test.raw`. Và ta có thể thấy sau khi chuyển như thế thì file cũ cũng sẽ không bị mấy đi. Chúng chỉ bị mất đi khi chúng ta thực hiện thao tác xóa chúng như các file bình thường.

Tương tự như chuyển từ `raw` sang `qcow2`: `qemu-ing convert -f raw -O qcow2 file-raw tên-file-mới`

*Chú ý* chuyển đồi này chỉ thực hiện được khi VM đang được tắt và sau khi chuyển đổi xong ta phải tiến hành sửa lại file `xml` tương ứng

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/qcow-raw/4.png)

Sau khi sửa xong ta tiến hành lưu lại và define lại VM và bật VM lên và sử dụng.