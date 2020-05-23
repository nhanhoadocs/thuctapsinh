# Sử dụng lệnh stress trên Linux

Stress là một câu lệnh được sử dụng để áp một mức tải cho hệ thống để kiểm tra khả năng chịu tải của nó trong thực tế. Nó sẽ tạo ra các process sử dụng rất nhiều tài nguyên của hệ thống như CPU, RAM hay disk để ta có thể kiểm tra được khả năng và ngưỡng mà hệ thống của ta hoạt động tốt nhất. Nó cũng rất có ích để tái hiện lại trạng thái tải cao gây ra lỗi hệ thống để ta có thể tìm cách xử lý.

## Cài đặt

Trên CentOS

    yum install stress

Trên Ubuntu

    apt-get install stress

## Sử dụng

Bạn có thể có thể stress hệ thống của bạn với các thông số CPU, memory, io, hdd hoặc stress cùng lúc nhiều thông số. Dưới đây tôi sẽ ví dụ một số trường hợp cụ thể để bạn có thể biết cách sử dụng nó.

**Test CPU**

Để test CPU ta dùng option `--cpu` hoặc `-c`

    stress -c 1

CPU trước khi sử dụng câu lệnh `stress`

![Imgur](https://i.imgur.com/W6rUjsi.png)

Tiến hành chạy câu lệnh stress

![Imgur](https://i.imgur.com/mMvzka0.png)

CPU sau khi sử dụng câu lệnh `stress`

![Imgur](https://i.imgur.com/B18iiIu.png)

Với câu lệnh này thì 1 tiến trình được tạo ra để tính toán hàm `sqrt()` của một số bất kỳ. Như vậy thì CPU sẽ tính toán liên tục cho đến khi bạn nhấn `Ctrl + C` hoặc bạn có thể đặt thời gian cho nó bằng cách thêm vào option `--timeout` hoặc `-t`. Ví dụ:

    stress --cpu 1 --timeout 30

Thì câu lệnh này sẽ tự động dừng sau 30s

Vì mỗi hàm sqrt() được đẩy vào sẽ là một tiến trình và nó sẽ chiếm trọn CPU. Như vậy điều gì sẽ xảy ra khi số tiến trình nhiều hơn số CPU mà ta đang có. Ở đây tôi đẩy vào 4 tiến trình lớn gấp đôi số CPU trong máy của tôi.

    stress -c 4

Kết quả

![Imgur](https://i.imgur.com/5BmxoQF.png)

Lúc này mỗi tiến trình sẽ chỉ sử dụng 50% CPU đồng nghĩa với việc tốc độ xử lý sẽ bị giảm đi một nửa.

**Test memory**

Để đẩy tải vào RAM để test ta dùng option `-m` hoặc `--vm`

    stress -m 1

Câu lệnh này sẽ sử dụng hàm `malloc()` để cấp phát vùng nhớ cho 1 process ở đây sẽ cấp là 256M. Hoặc ta có thể chỉ ra dung lượng cấp phát cho một process bằng option `--vm-bytes`. Ví dụ cấp cho mỗi process là `500M` thì dùng lệnh:

    stress -m 1 --vm-bytes 500M

Mức độ sử dụng RAM trước khi sử dụng lệnh `stress`

![Imgur](https://i.imgur.com/pjc8Hay.png)

Ta thấy RAM sử dụng ít và bộ nhớ swap chưa được sử dụng. Bây giờ ta chạy lệnh stress

    [root@localhost ~]# stress -m 1 --vm-bytes 2.1G
    stress: info: [13643] dispatching hogs: 0 cpu, 0 io, 1 vm, 0 hdd

![Imgur](https://i.imgur.com/nt4Sprk.png)

Ta thấy giá trị RAM thay đổi liên tục là bởi vì câu lệnh này sử dụng liên tục hai hàm `malloc` để cấp phát vùng nhớ sau đó dùng hàm `free` để giải phóng nó.

**Test disk**

Bạn cũng có thể xem hệ thống của bạn hoạt động như thế nào khi bị ràng buộc về I/O. Bạn sử dụng option `-i`

    stress -i 1

Câu lệnh này sẽ gọi đến hàm `sync()`

Ngoài ta bạn có thể test khả năng ghi dữ liệu của disk bằng cách dùng option `-d`.

    stress -d 1 --timeout 60s

Câu lệnh tiến hành ghi một file có dung lượng 1G vào disk. Bạn có thể chỉ ra dung lượng của nó bằng cách thêm option `--hdd-bytes`. Ví dụ muốn ghi 1 file 2G

    stress -d 1  --hdd-bytes 2G --timeout 1m

Output    

```
[root@localhost ~]# stress -d 1  --hdd-bytes 2G --timeout 1m
stress: info: [13654] dispatching hogs: 0 cpu, 0 io, 0 vm, 1 hdd
stress: info: [13654] successful run completed in 61s
[root@localhost ~]#
```

Bạn không phải lo dọn dẹp các file này sau khi chạy câu lệnh vì nó sẽ tự dọn dẹp các file này cho bạn khi kết thúc câu lệnh.