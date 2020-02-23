## Cấu hình mirror trên linux bridge

### Cấu hình mirror traffic incoming trên interface

Source port là interface vnet0
Destination port là interface vnet1

```
tc qdisc add dev vnet0 ingress

tc filter add dev vnet0 parent ffff: \
    protocol all \
    u32 match u8 0 0 \
    action mirred egress mirror dev vnet1
```

Ta có thể show khi 1 interface được add

```
tc qdisc show dev vnet0
```

### Cấu hình mirror trafic outgoing trên interface

```
tc qdisc add dev vnet0 handle 1: root prio

tc filter add dev vnet0 parent 1: \
    protocol all \
    u32 match u8 0 0 \
    action mirred egress mirror dev vnet1
```

### Thực hiện up interface vnet1

```
ip link set vnet1 up
```

Có thể kiểm tra lại

```
tcpdump -i vnet1 icmp
```

### Lưu ý

Có thể mirror từ một source đến nhiều destination

```
action mirred egress mirror dev vnet1 \
action mirred egress mirror dev vnetn
```

Nếu muốn mirror nhiều source đến 1 destination ta thực hiện 2 bước đầu như trên với các interface khác

Để xóa mirror trên 1 interface

```
tc qdisc del dev vnet0 ingress
tc qdisc del dev vnet0 root
```