# Add Swap Space on Ubuntu 18.04
![](http://mundo.openit.com.bo/wp-content/uploads/2019/04/swapp.png)

## Mục lục:

[1. Kiểm tra](#1)

[2. Tạo một tập tin swap](#2)

[3. Giá trị Swappiness](#3)

[4. Xóa tệp swap](#4)

-----------------

### <a name="1"> 1. Kiểm tra </a>
Kiểm tra xem cài đặt Ubuntu của ta đã được bật swap chưa bằng cách nhập:
```
swapon --show
```
Nếu không hiện ra gì, điều đó có nghĩa là hệ thống của ta không kích hoạt Swap Space.

Ngược lại, nếu ta nhận được một file như kiểu dưới đây, có nghĩa là ta đã kích hoạt swap trên máy.
![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/66282232_459698367923162_533757769380003840_n.png?_nc_cat=103&_nc_oc=AQkjDyudIwEJ-HUR7qxuapXMdthwPLvYlyJMV9Wo9__QGbcMJSzRSibai_Sg_ugWiCY&_nc_ht=scontent.fhan5-7.fna&oh=4dd3b9794115c5afc2a7cc8e92737e8e&oe=5DC3E15C)

### <a name="2"> 2. Tạo một tập tin swap </a>
Đầu tiên ta phải có đặc quyền sudo hoặc là người quản trị thì mới có thể kích hoạt swap.

Trong bài này ta sẽ thêm 1G swap, nếu muốn thêm nhiều swap, ta thay thế 1G bằng kích thước cần thiết.

**B1: Tạo một tệp sẽ được sử dụng để trao đổi:**
```
fallocate -l 1G /swapfile
```
Nếu **fallocate** không được cài đặt hoặc ta nhận được thông báo lỗi, ``fallocate failed: Operation not supported`` hãy sử dụng lệnh sau để tạo tệp hoán đổi:
```
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
```

**B2: Ta thay đổi quyền cho tệp. Chỉ người dùng root mới có quyền đọc, viết:**
```
chmod 600 /swapfile
```

**B3: Sử dụng tiện ích mkswap để thiết lập vùng swap trên tệp:**
```
mkswap /swapfile
```

**B4: Kích hoạt tệp swap bằng lệnh sau:**
```
swapon /swapfile
```
hoặc để kích hoạt tất cả các tệp swap ta dùng option **-a**
```
swapon -a
```
Mỗi lần reboot tệp swapfile này sẽ mất, để thực hiện thay đổi vĩnh viễn, ta mở tệp ``/etc/fstab``
```
vi /etc/fstab
```
và dán dòng sau:
```
/swapfile swap swap defaults 0 0
```

**B4: Để xác minh rằng swap được kích hoạt bằng cách sử dụng lệnh ``swapon`` hoặc ``free`` như dưới đây:**
```
swapon --show
```
![](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/66228271_934306270252924_22738540412534784_n.png?_nc_cat=102&_nc_oc=AQkt0lFFB7yIDlkq5QRAeSkqCusYltQzUKwKJ33uEL-jTtWk0dM1-afSSHPsIijLZ7M&_nc_ht=scontent.fhan5-2.fna&oh=1fc054eb6bd790c34704e2af067d6e2f&oe=5DBE49C7)

```
free -h
```
![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/66357423_670378436720318_5280276138512351232_n.png?_nc_cat=103&_nc_oc=AQm7Y1tNWs6uV4PPFRPGL_8ZMwawW1OQtMlTQbDSA9S9D7kx0qSgSS8IRKgF2Mjbxrc&_nc_ht=scontent.fhan5-7.fna&oh=7b3650ac48f6299a946f965a77d5fa0c&oe=5D7B3405)

### <a name="3"> 3. Giá trị Swappiness </a>
Swappiness là một thuộc tính nhân Linux xác định tần suất hệ thống sẽ sử dụng. Swappiness có thể có giá trị từ 0 đến 100. Giá trị càng thấp sẽ khiến kernel cố gắng tránh hoán đổi bất cứ khi nào có thể, Trong khi giá trị càng cao sẽ khiến kernel sử dụng không gian hoán đổi mạnh hơn.

- Swappiness chấp nhận một giá trị trong khoảng từ 0 đến 100. Các thông số của Swap có thể chỉnh

  - swappiness = 0 – có nghĩ là bình thường swap không sử dụng và nó chỉ được sử dụng khi RAM thực bị tràn (tức hết ram )
  - swappiness = 10 – Có nghĩa là nếu RAM thực còn 10% thì hệ thống sẽ dùng đến swap
  - swappiness = 60 – Mặc định
  - swappiness = 100 – Swap sẽ hoạt động hết mình . ưu tiên như là ram thật

Giá trị swappiness mặc định là **60**. Bạn có thể kiểm tra giá trị swappiness hiện tại bằng cách gõ lệnh sau:
```
cat /proc/sys/vm/swappiness
```
![](https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/66339602_935516576787383_5549389744078585856_n.png?_nc_cat=109&_nc_oc=AQlkEliyCp2A8Qczr-8PaTy46IrCNrKARPe8-UnGMEzKUYttzeoxTaooGQZYBxPV-fc&_nc_ht=scontent.fhan5-1.fna&oh=59892a570d7b6e231e353cf1e8ad48cf&oe=5DBE8D6D)

Giá trị swap bằng **60** là ổn đối với máy tính cá nhân, nhưng đối với các máy chủ, ta nên đặt giá trị thấp hơn vì có quá nhiều process cần xử lý.

- Ví dụ: để đặt giá trị swappiness thành **10**, hãy nhập:
```
sysctl vm.swappiness=10
```

Để làm cho tham số này không bị mất sau các lần khởi động lại, hãy nối dòng sau vào tệp ``etc/sysctl.conf``
```
vm.swappiness=10
```

Giá trị swap tối ưu phụ thuộc vào khối lượng công việc vào hệ thống của ta và cách sử dụng bộ nhớ như thế nào. Ta nên điều chỉnh tham số này theo lần lượt theo từng khoảng cách nhỏ để tìm giá trị tối ưu.

### <a name="4"> 4. Xóa tệp swap </a>
Để hủy kích hoạt và xóa tệp swap, hãy làm theo các bước sau:

**B1**: Đầu tiên ta hủy kích hoạt swap space bằng lệnh:
```
swapoff -v /swapfile
```

**B2**: Tiếp theo, ta loại bỏ mục nhập tập tin swap ``/swapfile swap swap defaults 0 0``
trong tập tin  ``/etc/fstab``

**B3**: Cuối cùng, xóa tệp swap
```
rm /swapfile
```

# END
