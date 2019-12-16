# Swap memory


## Introuction
Swap là một không gian trên đĩa được sử dụng khi dung lượng bộ nhớ RAM vật lý hết, khi bộ nhớ RAM vật lý hết các trang (Linux chia RAM thành các vùng nhớ gọi là các trang - pages) không hoạt động sẽ được chuyển từ bộ nhớ RAM vật lý sang bộ nhớ swap (Bộ nhớ RAM ảo).

Tốc độ truy cập của bộ nhớ swap chậm hơn so với bộ nhớ RAM vật lý, nó tùy thuộc vào tốc độ của đĩa.

Bộ nhớ swap có thể ở 2 dạng:
- Phân vùng swap (swap partition): là một phân vùng riêng biệt trên đĩa
- Swap file: Là một file đặc biệt nằm trong hệ thống file

Để xem thông tin của swap ta sử dụng lênh `swapon -s`:

Kết quả:

```
# swapon -s
```


## Tại sao cần swap?
Một số lý do ta cần đến swap:

- Các chương trình tiêu thụ bộ nhớ nhiều dẫn đến bộ nhớ vật lý không đủ để sử dụng.

- Hibernation (suspend-to-disk): Tính năng Hibernation sẽ ghi nội dung của RAM vào đĩa trước khi tắt máy dó đó bạn cần phân vùng swap nhỏ nhất bằng kích thước của RAM. Một số hệ thống để hibernation yêu cầu cần có phân vùng swap hoặc suspend partition, nó không thể sử dụng swap file.

- Sự cố không lường trước được: các sự kiện không lường trước được có thể xảy ra, trong những trường hợp này bạn cần swap để có thể tìm hiểu những gì đã xảy ra hoặc để hoàn thành những gì bạn đang thực hiện.

- Tối ưu hóa việc sử dụng bộ nhớ: Vì ổ cứng cơ học chậm hơn đáng kể so với RAM, một số ứng dụng ghi dữ liệu ghi dữ liệu vào RAM và để đó (Hay còn được gọi là cache) để phục vụ việc truy cập nhanh hơn vào lần sau, linux kernel tự động chuyển dữ liệu RAM được dành riêng cho các chương trình đó (Nhưng không thực sự đang được sử dụng) vào swap để nó có thể phục vụ tốt hơn là việc mở rộng bộ nhớ đệm (cache).

- Tối ưu hóa hiệu suất swap: Vì không gian swap sử dụng một thiết bị đĩa, điều này có thể gây ra các vấn đề về hiệu suất, vì bản thân hệ thống có thể đang sử dụng cùng một thiết bị đĩa cùng với swap. Một cách để giảm vấn đề này là có không gian swap trên một ổ đĩa vật lý khác để loại bỏ hoặc giảm sự cạnh tranh cho tài nguyên.


## Nên cần bao nhiêu dung lượng bộ nhớ swap?
Một số nhà phát triển khuyên ta nên có dung lượng bộ nhớ swap tối thiệu bằng bộ nhớ RAM vật lý nếu bạn có sử dụng hibernation (Ngủ đông), nếu không bạn cần tối thiểu là sqrt(RAM) (Căn bậc hai bộ nhớ RAM vật lý) và tối đa là gấp đôi bộ nhớ RAM vật lý bạn có.

Dưới đây là một ví dụ tham khảo về cách phân chia bộ nhớ swap lợp lý:

```
        RAM   No hibernation    With Hibernation  Maximum
      256MB            256MB               512MB    512MB 
      512MB            512MB              1024MB   1024MB
     1024MB           1024MB              2048MB   2048MB

        RAM   No hibernation    With Hibernation  Maximum
        1GB              1GB                 2GB      2GB
        2GB              1GB                 3GB      4GB
        3GB              2GB                 5GB      6GB
        4GB              2GB                 6GB      8GB
        5GB              2GB                 7GB     10GB
        6GB              2GB                 8GB     12GB
        8GB              3GB                11GB     16GB
       12GB              3GB                15GB     24GB
       16GB              4GB                20GB     32GB
       24GB              5GB                29GB     48GB
       32GB              6GB                38GB     64GB
       64GB              8GB                72GB    128GB
      128GB             11GB               139GB    256GB
      256GB             16GB               272GB    512GB
      512GB             23GB               535GB      1TB
        1TB             32GB              1056GB      2TB
        2TB             46GB              2094GB      4TB
        4TB             64GB              4160GB      8TB
        8TB             91GB              8283GB     16TB
```



## Làm sao để thêm swap?
Phân vùng swap thường được tạo ra khi bạn cài đặt hệ điều hành, nhưng ngoài ra bất kỳ file nào cũng có thể trở thành swap. swap có thể được thêm bằng cách tăng kích thước của swap partition hoặc bằng cách thêm swap file, tuy nhiên khi ta tạo swap file có thể nó sẽ không được tạo ta trên các khôi đĩa (blocks) liền kề vì vậy có thể có tác động tiêu cực đến hiệu suất vì thời gian truy cập đĩa có thể lâu hơn và hệ thống của bạn càng sử dụng swap nhiều hơn, nó sẽ tồi tệ hơn.

Nhân Linux cũng truy cập vào khối đĩa trao đổi IO trực tiếp bỏ qua tất cả các bộ đệm (cache), siêu dữ liệu (metadata) và mã hệ thống tệp (filesystem code), do đó, một swap file sẽ không ảnh hưởng xấu đến sự ổn định của hệ thống tệp cơ sở (base filesystem) của bạn.
Kể từ kernel 2.6,29, hệ thống trao đổi đã tự động hỗ trợ các thiết bị có khả năng TRIM như SSD.

## Thêm swap file
Sau đây là các bước để thêm swap file:


### Tạo swap file
`$ sudo fallocate -l 1g /1GB.swap`

Lệnh trên sẽ tạo ra file 1GB.swap có dung lượng 1BG, bạn có thể xem thêm về `fallocate` [tại đây](http://man7.org/linux/man-pages/man2/fallocate.2.html).

Nếu hệ thống không có sẵn `fallocate` bạn có thể sử dụng `dd`:

`$ sudo dd if /dev/zero of=/1GB.swap bs=1024 count=1048576`

Tiếp theo bạn cần đặt quyền truy cập cho swap file thành 600 để đảm bảo chỉ có root user có quyền truy cập, ngăn chặn người dùng khác có thể đọc được các thông tin nhạy cảm tiềm ẩn trong swap file.

`$ sudo chmod 600 /1GB.swap`

Định dạng file dưới dạng swap:

`$ sudo mkswap /1BG.swap`


### Kích hoạt swap file
`$ sudo swapon /1GB.swap`


### Kích hoạt swap file khi khởi động
Để kích hoạt swap file khi khởi động hệ thống ta cần thêm vào `fstab` bằng cách chạy lệnh sau:
`$ sudo echo '/1GB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab`


### Ví dụ về cách tạo swap file
Dưới đây là ví dụ về cách tạo swap file:
```
Example here
```


## Xóa swap file
Đôi khi bạn không muốn sử dụng swap file vì một lý do nào đó, nếu bạn muốn loại bỏ swap file trước tiên hay chắc chắn bạn có đủ RAM free, dưới đây là cách để loại bỏ swap file:

Dừng sử dụng swap file:

`$ sudo swapoff /1GB.swap`

Bước tiếp theo là xóa mục tự kích hoạt khỏi fstab, bạn có thể mở `/etc/fstab` bằng trình xoạn thảo quen thuộc của mình và thực hiện, Ví dụ:

`$ sudo vim /etc/fstab`

Và cuối cùng là xóa swap file để giải phóng dung lượng bộ nhớ:

`$ sudo rm /1GB.swap`


## Swappiness là gì và làn thế nào để điều chỉnh swappiness?
Tham số swappiness kiểm soát xu hướng của kernel để di chuyển các tiến trình ra khỏi bộ nhớ vật lý vào swap. Vì các đĩa chậm hơn nhiều so với RAM, điều này có thể dẫn đến thời gian phản hồi chậm hơn cho hệ thống và ứng dụng nếu các quá trình di chuyển quá mạnh ra khỏi bộ nhớ.

swappiness có thể có giá trị từ 0 đến 100:

- swappiness = 0 nói với kernel để tránh sử dụng swap
- swappiness = 100 bảo kernel khuyến khích sử dụng swap, chuyển các dữ liệu ra khỏi RAM sang swap cache

Tùy và hệ thống của bạn mà bạn có thể đặt giá trị cho swappiness sao cho hợp lý để tối ưu hóa được hiệu suất của hệ thống.

Để kiểm tra swappiness:

`cat /proc/sys/vm/swappiness`

Để thay đổi giá trị swappiness Có thể thực hiện thay đổi tạm thời (mất khi khởi động lại) với giá trị swappiness bằng 10

`$ sudo sysctl vm.swappiness = 10`

Để thay đổi vĩnh viễn, hãy chỉnh sửa file config bằng trình chỉnh sửa yêu thích của bạn:

`$ sudo vim /etc/sysctl.conf`
Tìm kiếm `vm.swappiness` và thay đổi giá trị của nó như mong muốn. Nếu `vm.swappiness` không tồn tại, hãy thêm nó vào cuối tệp như sau:

`vm.swappiness = 10`

Lưu tập tin và khởi động lại và mọi thứ sẽ được cập nhật và hoạt động.


## Swap priority là gì và làn thế nào để điều chỉnh Swap priority?
Swap priority là độ ưu tiên sử dụng swap khi bạn có nhiều swap, để xem độ ưu tiên của các swap bạn có thể sử dụng lệnh sau:

`$ sudo cat /proc/swaps`

```
$ cat /proc/swaps
Filename                                Type            Size    Used    Priority
/dev/dm-1                               partition       2097148 0       -2
```

Cột `Priority` cho thấy mức độ ưu tiên của swap, ở đây là -2.

Để thay đổi mức độ ưu tiên của swap bạn có thể sử dụng lệnh với cú pháp sau:

`swapon -p/--priority <number> <swapfile>`

Ví dụ: `swapon -p 5 /1GB.swap`

Lệnh trên sẽ thay đổi mức độ ưu tiên của `1GB.swap` thành 5.