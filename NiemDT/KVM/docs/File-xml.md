# Tìm hiểu file xml trong KVM

XML (eXtensible Markup Language) là một loại file có khả năng lưu trữ nhiều loại dữ liệu khác nhau. Mục đích của XML là đơn giản hóa việc chia sẻ dữ liệu giữa các hệ thống khác nhau, đặc biệt là các hệ thống được kết nối với internet.

Một VM trong KVM có hai thành phần chính đó là VM's definition được lưu dưới dạng file XML và nằm trong thư mục `/etc/libvirt/qemu` và VM's storage lưu dưới dạng file image.
File domain XML chứa các thông tin về máy ảo như (số CPU, RAM, các thiết lập của I/O, card mạng,...)

Ngoài file domain XML còn có các file XML khác để lưu thông tin network, storage...
Ta có thể thấy mỗi máy ỏa được tạo ra có một file xml chứa các thông tin của nó.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml1.png)

Ta có thể dùng lệnh `virsh edit tên_file` đẻ chỉnh sửa (chú ý tên file bỏ phần đuôi `.xml`) hoặc ta cũng có thể sử dụng `vi` hoặc `vim` để chỉnh sủa nó.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml2.png)

Trong file xml này chứa rất nhiều thông số nhưng ở đây tôi chỉ đề cập đến một số thông số đáng chú ý

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml3.png)

Trong đó:
* `1` là tên của VM
* `2` là đơn vị, mặc định là KiB. Ta có thể chuyển về các đơn vị khác.
* `3` là lượng RAM thực tế đang được sử dụng
* `4` là số CPU của VM

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml4.png)

Ta thấy địa chỉ file image của VM

## Thêm card mạng bằng các sửa file XML

Ở bài trước tôi đã tìm hiểu về các mô hình mạng trong KVM và đã hướng dẫn thêm các mạng đó và KVM. Để add thêm card mạng cho máy ảo KVM ta vào file xml và tìm phần

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml5a.png)

Trong máy của tôi có các mạng ảo sau

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml6.png)

Ban đầu máy VM của tôi chỉ có 1 card mạng và đang hết nối tới mạng có tên là `host-only`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml5a.png)

Ở dòng đầu tiên của cấu hình card mạng ta thấy dòng `interface type='network'` Ở dòng này chúng ta để là `network` nếu chúng ta sử dụng mô hình `NAT` hoặc `host-only` và để là `bridge` nếu sử dụng mô hình `bridge`

Ở dòng thứ 2 ta thấy địa chỉ mac dòng này nếu ta thêm card  mạng thì ta không cần đặt mà hệ thống sẽ tự gen cho ta.
Sau khi add thêm card mạng ta có thể thấy

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml5.png)

Ở đây chúng ta cần chú ý đến các vị trí tôi đánh dấu. Ở dòng `source` ta để là `source network` nếu phần `interface type` ta để là `network` và `source bridge` nếu `interface type` là `bridge` Sau đó nếu mà network thì chỉ ra mạng ảo kết nối tới. Còn nếu để bridge thì chỉ ra tên của switch ảo.

Ở card mạng đầu tiên ta cần thêm `multifunction='on'` vào vị trí như ở trên để cho phép sử dụng nhiều PCI. Và các card ta cần thay đổi đánh số thứ tự từ 0 đến hết cho các card ở mục `function` như tôi đánh dấu ở trên để thay đổi chỉ số PCI cho các card.

Sau khi sửa đổi file xml ta cần chạy lệnh ` sudo virsh define tên_file` để máy ảo có thể cập nhật thay đổi đó.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/xml7.png)