# Bắt gói tin với SSH
### **Mô hình**
<img src=https://i.imgur.com/TS6iQi2.png>

| | **IP** | **Ethernet**  |
|-|--------|---------------|
| **Client** | `192.168.5.30` | `ens33` |
| **Server** | `192.168.5.40` | `ens33` |

- Trên Client thực hiện SSH vào Server :
    ```
    # ssh root@192.168.5.40
    ```
- Thực hiện đồng thời bắt gói tin trên Client :
    ```
    # tcpdump -n -i ens33 -w ssh.pcap
    ```
- Copy file `ssh.pcap` vào máy Windows 10 và mở bằng **Wireshark** :

    <img src=https://i.imgur.com/o8JWrF6.png>

- Thêm điều kiện lọc `(ip.src == 192.168.5.30 && ip.dst == 192.168.5.40) || (ip.src == 192.168.5.40 && ip.dst == 192.168.5.30)` :

    <img src=https://i.imgur.com/XrtPedt.png>

- Giải thích quá trình SSH giữa Client và Server :
    - `1` : Client gửi gói tin TCP với cờ `SYN` với `seq=0`
    - `2` : Server nhận được và gửi trả lại gói tin TCP gắn cờ `SYN,ACK` với `seq=0` , `ack=1`
    - `3` : Client gửi gói tin TCP xác nhận với cờ `ACK` có `seq=1` , `ack=1`<br>=> Quá trình bắt tay 3 bước
    - `4` : Client khởi chạy giao thức **OpenSSH** qua port `54616`
    - `5` : Client gửi yêu cầu SSH tới Server
    - `6` : Server nhận được yêu cầu và khởi tạo giao thức **OpenSSH**
    - `7` : Server phản hồi lại Client chấp nhận SSH
    - `8` : Client khởi tạo giao thức `Key Exchange Init`
    - `9` : Client gửi k