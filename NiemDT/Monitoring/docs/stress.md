## Câu lệnh stress

**stress** là câu lệnh được sử dụng để tạo ra khối lượng công việc để kiểm tra hiệu năng của phần cứng.

Để có thể kiểm tra tôi sử dụng 2 terminal để kiểm tra. Một tôi dùng chạy câu lệnh `stress` và một tôi sử dụng để dùng câu lệnh `htop` để theo dõi

Trước tiên cần cài đặt công cụ stress

```
yum install stress
```

**Một số ví dụ cụ thể**

#### Test CPU

Để test CPU ta sử dụng option `-c`

Để thấy sự khác biệt tôi dùng câu lệnh `htop` kiểm tra trước khi dùng câu lệnh `stress`

![](/Monitoring/images/stress/1.png)

Sau đó tôi sử dụng lệnh `stress` ở terminal còn lại

```
[root@test2 ~]# stress -c 1
stress: info: [4362] dispatching hogs: 1 cpu, 0 io, 0 vm, 0 hdd
```

Ở câu lệnh này câu lệnh `stress` sẽ sinh ra một tiến trình với hiệu suất cao để kiểm tra CPU. 

Theo dõi ta thấy như sau

![](/Monitoring/images/stress/2.png)

Ta tiếp tục tăng số process lên để kiểm tra

```
[root@test2 ~]# stress -c 2
stress: info: [4414] dispatching hogs: 2 cpu, 0 io, 0 vm, 0 hdd
```

Ta sẽ thấy như sau

![](/Monitoring/images/stress/3.png)

CPU lúc này đã được sử dụng hết công suất

Nếu ta tiếp tục tăng số process lớn hơn số core của CPU có thể thấy

```
[root@test2 ~]# stress -c 4
stress: info: [4434] dispatching hogs: 4 cpu, 0 io, 0 vm, 0 hdd
```

![](/Monitoring/images/stress/4.png)

Lúc này mỗi process chỉ còn sử dụng 50% CPU nên tốc độ sẽ giảm đi tương ứng

#### Test RAM

Để test hiệu năng của RAM ta dùng option `-m`

```
[root@test2 ~]# stress -m 2
stress: info: [4515] dispatching hogs: 0 cpu, 0 io, 2 vm, 0 hdd
```

Với câu lệnh này stress tạo ra 2 process mỗi process sẽ sử dụng `256M` RAM để kiểm tra.

![](/Monitoring/images/stress/5.png)

Nêú không muốn dùng số RAM mặc định cho mỗi process là `256M` ta có thể chi ra bằng cách dùng thêm option `--vm-bytes`. Bạn cũng có thể đặt lệnh test được chạy trong khoảng thời gian bao lâu bằng cách thêm option `-t`

```
[root@test2 ~]# stress -m 2 --vm-bytes 500M -t 60
stress: info: [4639] dispatching hogs: 0 cpu, 0 io, 2 vm, 0 hdd
```

Câu lệnh này sẽ sinh ra 2 tiến trình và mỗi tiến trình sử dụng `500M` RAM và chạy trong 60s

![](/Monitoring/images/stress/6.png)

#### Test disk

Để test disk ta dùng option `-d` 

VD câu lệnh

```
stress -d 1 --hdd-bytes 2G -t 1m
```

Câu lệnh này sẽ ghi một file có dung lượng 2G và disk và thực hiện trong vòng 1 phút

Kết quả trả về như sau

```
[root@test2 ~]# stress -d 1 --hdd-bytes 2G -t 1m
stress: info: [4951] dispatching hogs: 0 cpu, 0 io, 0 vm, 1 hdd
stress: info: [4951] successful run completed in 63s
```

Nếu không chỉ ra dung lượng file bằng cách thêm option `--hdd-bytes` thì mặc định file có dung lượng là 1G. Các file này sau lệnh stress nó sẽ tự động được dọn dẹp nên bạn ko các file rác bị tạo ra.

Bạn có thể  tạo ra test I/O của hệ thống bằng option `-io`

```
stress --io 2 -t 30s
```