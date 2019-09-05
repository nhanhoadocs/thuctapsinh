# Lệnh nmap

**nmap** (Network Mapper) là một tool open source đươc sử dụng để quét các cổng và phát hiện các lỗ hổng mạng. Nmap được sử dụng để xác định các thiết bị đang chạy trên hệ thống, cũng như kiểm tra các máy chủ có sẵn và các dịch vụ đang chạy trên các máy chủ này, đồng thời dò tìm các port đang mở và từ đó phát hiện ra các nguy cơ về bảo mật.

## Một số tính năng của nmap

* Lập bản đồ mạng(Network mapping): Nmap được sử dụng để xác định các thiết bị đang hoạt động như server, bộ định tuyến và cách chúng được kết nối vật lý với nhau như thế nào.
* Phát hiện hệ điều hành (OS detection): Nmap xác định được OS của các thiết bị đang chạy trên mạng, đồng thời cung cấp thông tin về nhà cung cấp, hệ điều hành cơ sở, phiên bản phần mềm và thậm chí có thể ước tính được thời gian họat động của thiết bị.
* Dò tìm dịch vụ(Service discovery): Nó có thể xác định các service đang được hoạt động trên một server(ví dụ mail, web ,...) cũng như có thể các ứng dụng và các phiên bản cụ thể của những phần mềm liên quan mà chúng đang chạy.
* Kiểm tra bảo mật(Security auditing): Nmap có thể tìm ra các phiên bản của hệ điều hành và các ứng dụng nào đang chạy trên server, từ đó cho phép người quản trị có thể xác định được những lỗ hổng cụ thể. (Ví dụ nhà sản xuất thông báo một hệ điều hành đang có một lỗ hổng từ đó kẻ tấn công có thể scan ra được các server đang chạy HĐH này mà chưa kịp nâng cấp từ đó có thể tấn công thông qua đây).

## Một số option

Một kết qủa trả về của lệnh `nmap` sẽ như sau

```
nmap 192.168.84.231

Starting Nmap 7.60 ( https://nmap.org ) at 2019-09-04 10:23 +07
Nmap scan report for 192.168.84.231
Host is up (0.017s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
3306/tcp open  mysql

Nmap done: 1 IP address (1 host up) scanned in 0.37 seconds
```

Nmap có thể scan được các địa chỉ như hostname, địa chỉ IP hay một dải mạng.

* `-F` Sử dụng để scan nhanh các port(sẽ scan ít port hơn khi sử dụng default)
* `-d <port ranges>` Chỉ scan các port được chỉ định.
Ví dụ 

```
nmap -p 22,80 192.168.84.231
```

Hoặc 

```
nmap -p 22-30 192.168.84.231
```

Hoặc chỉ định rõ TCP hoặc UDP(U: cho UDP, T: để chỉ định TCP)

```
nmap -p T:22,23 192.168.84.231
```

* `-sV` xác định port đang mở, các dịch vụ đang chạy trên các port và version của service đó.

```
nmap -sV 192.168.84.231

Starting Nmap 7.60 ( https://nmap.org ) at 2019-09-04 10:37 +07
Nmap scan report for 192.168.84.231
Host is up (0.016s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 7.4 (protocol 2.0)
3306/tcp open  mysql   MySQL 5.6.44
```

* `-sA` để thực hiện scan khi host/network được bảo vệ bởi firewall

* `-sP` nêú chỉ muốn ping để kiểm tra xem thiết bị có up hay không.

* `--reason` để hiển thị lý do nó kết luận trạng thái của port

```
nmap --reason 192.168.84.231

Starting Nmap 7.60 ( https://nmap.org ) at 2019-09-04 14:06 +07
Nmap scan report for 192.168.84.231
Host is up, received conn-refused (0.029s latency).
Not shown: 998 closed ports
Reason: 998 conn-refused
PORT     STATE SERVICE REASON
22/tcp   open  ssh     syn-ack
3306/tcp open  mysql   syn-ack

```

Ta thấy như ví dụ trên nó dựa vào gói tin với cờ `syn` và nhận lại gói tin `ack`

* `--traceroute` để hiển thị những địa chỉ mà nó phải đi qua để đến được target

* `-O` xác định hệ điều hành của máy đích.

Trong một số trường hợp firewall sẽ chặn các gói tin ICMP ping, trong trường hợp này ta có thể thử cách khác

```
nmap -PS 192.168.84.231
nmap -PA 192.168.84.231
```

* `-PU` sử dụng UDP ping