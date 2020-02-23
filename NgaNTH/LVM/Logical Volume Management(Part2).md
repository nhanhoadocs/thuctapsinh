
### Linear Volume & Striped Volume    

Ở bài trước ta đã tìm hiểu về công nghệ LVM như thế nào. Vậy ở 1 disk sẽ lưu trữ dữ liệu ra sao và cách lưu trữ nào là tối ưu. Trong phần tiếp theo ta sẽ tìm hiểu về `Linear Volume` và `Striped Volume`.  
1. Phân biệt 2 kiểu lưu trữ  


<img src="https://i.imgur.com/49BYPmt.png">

Giả sử ta có các phân vùng từ b đến i để lưu trữ dữ liệu vào ổ đĩa. 
- *Linear*: Dữ liệu sẽ được lưu trữ lần lượt: nếu 1 phân vùng này ghi full thì sẽ chuyển sang phân vùng tiếp theo.  
- *Striped*: Dữ liệu sẽ được chia đều ra và ghi vào các phân vùng đã có. Cách chia dữ liệu ra bao nhiêu sẽ được định sẵn bởi người quản trị.  

2. Ưu điểm và nhược điểm của Linear và Striped  
 
- Linear:
    + Ưu điểm: dữ liệu sẽ được tập trung nên dễ quản lý.
    + Nhược điểm: Tốc độ làm việc chậm vì chỉ có 1 phân vùng hoạt động trong khi đó có các phân vùng trống. Khi vùng ghi đĩa bị hỏng sẽ mất hết dữ liệu. 
- Striped:   
    + Ưu điểm: Tốc độ ghi và đọc nhanh vì tất cả các phân vùng đều làm việc.
    + Nhược điểm: Khi một phân vùng nào đó hỏng thì sẽ ảnh hưởng đến dữ liệu của tất cả các phân vùng còn lại.  

3. Kịch bản và chuẩn bị  

Ở bài trước ta đã tạo được 1 volume group là `g_volume`. Trong bài này ta sẽ tạo thêm 1 volume group nữa có tên `g_volume2`. `g_volume2` được tạo từ 2 partition là `/sdb2` và `/sdc2`. 

<img src="https://i.imgur.com/Dtx0fDS.png">

Kiểm tra lại thông tin các volume group đã được tạo:  

<img src="https://i.imgur.com/St6SxkP.png">  

Tiếp tục ta sẽ tạo 1 logical volume với kiểu lưu trữ là `linear` và một logical volume với kiểu lưu trữ là `striped`. Ở đây ta sẽ tạo logical có tên là `testlinear` ở `g_volume` theo cú pháp:  
```
# lvcreate --extents (số %)FREE --name (tên logical)
```  
<img src="https://i.imgur.com/bOPRpTd.png">  

Sau khi tạo xong có thể xem kết quả:  
<img src= "https://i.imgur.com/tIAMNIb.png">  
Để sử dụng được ta cần phải format và mount nó vào một thư mục:  

<img src="https://i.imgur.com/7AfqKst.png">  

Kiểm tra lại kết quả:  

<img src="https://i.imgur.com/U490ZjR.png">

Bây giờ ta có thể xem thông tin logical volume để xem nó thuộc loại logical nào bằng lệnh `vls --segment`  
<img src="https://i.imgur.com/ZF5fCH8.png">  

Để xem cách hoạt động của `lvm linear` ta có thể theo dõi sự đọc ghi trên các đĩa. Để làm điều này trước tiên ta cần cài gói `bwm-ng` để có thể giám sát sự hoạt động của ổ đĩa. Để cài đc gói này bạn tiến hành download file `rpm` hoặc `deb` về và tiến hành cài bình thường.  
Bây giờ để theo dõi sự hoạt động của các ổ đĩa ta mở hai terminal 1 cái sẽ tiến hành cho nó chạy đọc ghi dữ liệu trong thư mục mà ta đã mount ở trên(ở đây tôi sử dụng lệnh `dd` để ghi lên đó 1 file có dung lượng 2GB). Terminal còn lại ta sẽ dùng để chạy lệnh theo dõi sự làm việc trên tất cả các `physical volum`e tạo nên `linear logical volume` ta muốn giám sát.  
Câu lệnh giám sát là `bwm-ng -i disk -I các_physical_volume`. Các physical volume ở đây được ngăn cách nhau bởi dấu phẩy. VD `linear logical volume` của tôi được tạo từ 2 physical volume là sdb1 và sdc1 tôi dùng lệnh `bwm-ng -i disk -I sdb1,sdc1`.  

Để xem tốc độ ghi lên đĩa theo kiểu ghi `linear` và `stripe` ta sử dụng chạy script `curl -Lso- https://raw.githubusercontent.com/nhanhoadocs/scripts/master/Utilities/bench_vm.sh | bash` và so sánh kết quả.  

- Linear:  

<img src="https://i.imgur.com/NLg4SNG.png">  

- Striped:  

<img src="https://i.imgur.com/OB5PRy9.png">  

Nhìn vào 2 kết quả trên ta thấy trong 1 giây, kiểu Striped ghi được nhiều MB hơn do vậy tốc độ ghi là nhanh hơn kiểu Linear.   


3. Tìm hiểu thêm về Mirror Volume, Snapshot Volume và Thin Provisioning
- Mirror Volume:  
Kiểu ghi này copy data trên các thiết bị khác nhau. Khi các dữ liệu được viết vào 1 Physical Volume (PV) thì nó cũng được viết vào các PV còn lại. Như vậy sẽ cung cấp sự an toàn nếu có thiết bị hỏng hóc.  
- LVM Snapshot:  
Snapshot tạo 1 bản copy của các LVM Volume. Chỉ lưu các thay đổi của LVM trước khi đã tạo Snapshot Volume.
Ví dụ: Nếu volume gốc có thay đổi 1GB dữ liệu thì 1GB dữ liệu đó cũng được thay đổi tại snapshot volume.  
Khi snapshot volume full thì nó sẽ bị vô hiệu hóa. Vì vậy cần phải quan tâm đến kích thước của các snapshot. Snapshot có thể được resize như logical volume thông thường.  
- Thin Provisioned
Thinly-Provisioned volume cho phép chúng ta tạo `logical volume` với dung lượng lớn hơn dung lượng`volume group` vốn có . Sử dụng `thin provisioning` , ta cần quản lý một storage pool với dung lượng xác định (thin pool) . Thin pool có thể được expand tự động để tăng năng suất và tối ưu tài nguyên. 
- Over Provisioning : 
    + Theo như ở trên đã nói , ta có thể tạo các logical volume với dung lượng vượt quá dung lượng sẵn có .  
    + Giả sử với 200MB của volume group trên , ta có 2 logical volume 50MB ( Tổng dữ liệu là 100MB ), ta tạo một logical volume với dung lượng là 200MB (Vượt quá dung lượng volume group ).  
    + Lệnh : lvcreate -V 200M --thin -n thin_vol_3 vg_thin/thin_pool1








