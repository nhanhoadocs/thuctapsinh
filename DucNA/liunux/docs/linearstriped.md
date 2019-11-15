# 1 Khái niệm 
- Linear và striped là tên của hai loại, kiểu ghi dữ liệu vào ổ cứng khi tao dùng kỹ thuật LVM
- Phân biệt giữa linear và striped
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/27-linear-vs-striped-logical-volume-overview.png)
- giả sử ta phải ghi vào một dữ liệu vào các ổ cứng thì cách ghi dữ liệu của hai kiểu sẽ như trên hình
    - Linear: sẽ lưu dữ liệu vào từng phân vùng hết phân vùng này đến phân vùng khác 
    - Striped: sẽ chia đều các dữ liệu ra và ghi vào các phân vùng đã có. Và cách chia dữ liệu ra bao nhiêu thì được định sẵn bởi người cài đặt nó
    - Ví dụ: ta có 8 ổ SSD như trên và được ký hiệu từ b cho đến i. và mỗi ổ SSD có 800GB lưu trữ. Bây giờ nếu phải lưu dữ liệu có dung lượng 1000GB thì cách ghi và lưu trữ của hai cái sẽ như sau 
        -  Linear: nó sẽ ghi hết 800GB vào ổ SSD `b` và 200GB còn lại nó sẽ được ghi vào ổ SSD `c` 
        - Striped: Đầu tiên nó đã được cài mỗi một lần lưu là mốt số lượng lưu trữ nhất định. giả sử ở đây mỗi một lần lưu trữ nó sẽ lưu 1GB thì đầu tiên nó sẽ lưu 1GB vào ổ `b` tiếp đó là 1GB vào ổ `c` cứ lần lượt đến ổ `i` rồi lại quay lại đến khi nào hết dữ liệu cần ghi thì thôi. 
# 2. Cách cài đặt 
## a) Linear
- Để cài đặt được `linear logical volume` trước tiên ta phải có `group volume` mà nó chưa cấp cho `logical volume` nào cả. 
- Sau đó ta dùng lệnh `lvcreate --extents (số %)FREE --name (tên logical)
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2010-11-48.png)
- Sau khi tạo xong ta có thể dùng lệnh `lvs` để kiểm tra
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2010-13-14.png)
- để sử dụng được thì ta cần `mount` và kiểm tra lại ta dùng `df -h`
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2010-50-12.png)
- bây giờ ta đã có thể dùng được và để check lại các kiểu ta dùng lệnh `lvs --segment`
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2011-19-54.png)
- Để có thể kiểm tra lại thì đầu tiên ta phải cài đặt được một gói đó là `bwn-ng`
- Để có thể kiểm chứng lại thì ta có thể xem cách hoạt động và theo dõi sự đọc ghi trên các đĩa. Để có thể theo dõi thì ta có thể giám sát sự hoạt động ổ đĩa thì ta cần phải cài đặt gói wget bằng câu lệnh `yum install wget`
![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-27%2008-04-40.png)
- Sau khi cài `wget` thì ta cài `bwn-ng` để có thể giám sát sự đọc ghi 
![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-27%2008-05-25.png)
- Rồi ta mở hai tab. Tab 1 để chạy lệnh `dd` để đọc ghi 
![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-27%2008-40-59.png)
- Tab2 ta chạy lệnh `bwn-ng` để có thể thấy sự đọc ghi của kiểu ghi linear 
- lệnh có dạng: `bwn-ng -i disk -I sdb1,sdc1`( trong đó sdb1 và sdc1 là phân vùng có kiểu linear)
![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-27%2008-21-46.png)

## b) LVM Stripe
- Cũng như linear để tạo được một striped thì ta cũng phải có volume group và dung lượng nó trống
- rồi ta dùng lệnh `lvcreate --extents N%FREE --stripes (số physical) --stripesize (số dung lượng) --name (tên logical) (tên group )`
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2011-19-24.png)
- Và giờ chúng ta fomat và mount nó lại 
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2011-20-34.png)
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2011-21-51.png)
- Rồi ta kiểm tra lại 
- ![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-26%2011-19-54.png)
- Cũng như trên kiểu ghi linear thì kiểu ghi stripe có thể giám sát được 
- ta chạy 2 tab như kiểu linear 
![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-27%2008-22-01.png)
- tab thứ 2 chạy lệnh `bwn-ng` như trên với 2 phân vùng kiểu striped
![](https://github.com/duckmak14/linux/blob/master/linear_striped/Screenshot%20from%202018-11-27%2008-37-50.png)

# 3. Ưu nhược điểm của linear và striped
- Linear
    - Ưu điểm: Các dữ liệu tập trung vào một phân vùng sẽ dễ dàng quản lý
    - Nhược điểm: Khi bị mất dữ liệu sẽ mất hết dữ liệu của một phần đó. Làm việc chậm hơn bởi vì chỉ có một phân vùng mà trong khi các khu vừng khác không hoạt động   
- Striped 
    - Ưu điểm: Tốc độ sẽ nhanh hơn vì tất cả các phân vùng sẽ cùng làm việc. Tốc độ đọc và ghi cũng nhannh hơn phương pháp Linear
    - Nhược điểm: Khi mất dữ liệu ở một phân vùng thì sẽ bị mất và ảnh hưởng rất nhiều dữ liệu bởi vì mỗi dữ liệu đều được lưu ở nhiều phân vùng khi sử dụng phương pháp striped 