# 1. Khái niệm 
- `RAW` và `QCOW2` là hai kiểu định dạng của ổ đĩa trong KVM  
- Khi tạo máy ảo KVM thì nó sẽ có 2 file là `xml` và `image`. File image này thường có 2 định dạng thường dùng đó là `raw` và `qcow2`. Ở bài này ta sẽ đi tìm hiểu về 2 kiểu định dạng này 
# 2. Kiểm tra dung lượng 2 file
- Ta tạo ra 2 file có dung lượng giống nhau ta sẽ thấy được dung lượng 2 file khi tạo ra
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/raw_qcow2/Screenshot%20from%202019-03-06%2009-48-15.png)
- Ở đây ta thấy được rằng tuy tạo 2 file đều có dung lượng bằng nhau là 10Gb nhưng khi tạo ra file dung lượng lưu trữ lại khác như file raw sẽ giữ nguyên dung lượng còn file qcow2 sẽ bị giảm đi do cơ chế  lưu trữ file được gọi là `thin`
# 3. Ta Kiểm tra tốc độ đọc file của 2 file 
- Để kiểm tra tốc độ đọc thì ta sử dụng lệnh `dd`
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/raw_qcow2/Screenshot%20from%202019-03-06%2009-51-34.png)
- Ta sẽ thấy rằng định dạng raw sẽ thấy tốc độ đọc ghi tốt hơn 
# 4. Tạo snapshot
Khi tạo bản snapshot thì chỉ dùng định dạng qcow2 là hỗ trợ cho bản snapshot khi ta tạo bản đó nó sẽ mặc định tạo theo định dạng qcow2
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/raw_qcow2/Screenshot%20from%202019-03-06%2010-09-18.png)
- Ta vào file img để kiểm tra và thấy rằng nó đã tạo ra một bản snapshot qcow2 
![](https://github.com/duckmak14/linux/blob/master/KVM/images/raw_qcow2/Screenshot%20from%202019-03-06%2010-14-13.png)
# 5.Chuyển đổi giữa 2 định dạng
- Thông thường mặc định là KVM sẽ dùng định dạng qcow2 muốn chuyển đổi định dạng ta sử dụng lệnh 
- Đổi từ qcow2 sang raw
```
qemu-img convrt -f qcow2 -0 raw file-qcow2 ten_file.qcow2 ten_file.raw
```
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/raw_qcow2/Screenshot%20from%202019-03-06%2010-19-48.png)
- Đổi từ raw sang qcow2
```
qemu-img convrt -f raw -0 qcow2 file-qcow2 ten_file.raw ten_file.qcow2
```
![](https://github.com/duckmak14/linux/blob/master/KVM/images/raw_qcow2/Screenshot%20from%202019-03-06%2010-20-52.png)