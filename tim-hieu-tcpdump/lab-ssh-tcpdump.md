Bài 1: Bắt gói tin khi 2 máy sử dụng 1 kiểu mạng NAT.
Sơ đồ.

![](anhtcp/anh10.png)

ip planning.

![](anhtcp/anh11.png)

Kết quả.

sử dụng card mạng có địa chỉ 192.168.122.218 không sử dung địa chỉ 192.168.122.200.

![](anhtcp/anh12.png)


Bài 2: Bắt gói tin khi 2 máy sử dụng 1 kiểu mạng bridge.

ip planning

![](anhtcp/anh13.png)

kết quả 

![](anhtcp/anh14.png)

Bài 3: bắt gói tin khi máy tính thật có 2 card mạng NAT khác nhau,

![](anhtcp/anh15.png)

bắt gói tin trên interface virbr0 là sử dụng interface nat default.
```
tcpdump -n -q -i virbr0 icmp -c 10
```
![](anhtcp/anh16.png)

bắt gó tin  trên interface eno1 là interface ra ngoài internet.
```
tcpdump -n -q -i eno1 icmp -c 10
```
![](anhtcp/anh17.png)

như vậy ta thấy từ đia chỉ 192.168.122.200 khi qua cơ chế nat thì địa chỉ trên mạng là 172.16.2.159

![](anhtcp/anh18.png)


bắt gó tin ssh trên interface virbr1 
```
tcpdump -n -i virbr1  port 22  -c 10 -q
```

![](anhtcp/anh19.png)


Bài 4: Bắt gói tin khi 2 máy ảo sử dụng kiểu bridge 

![](anhtcp/anh22.png)

bắt gói tin ssh khi thực hiện ssh từ 2 máy ảo.
```
tcpdump -n -q -i thanhbc port 22 -c 10
```

![](anhtcp/anh20.png)

Bắt gói tin trên interface eno1 khi ra mạng.

```
tcpdump -n -q -i eno1 icmp  -c 10
```

![](anhtcp/anh21.png)
