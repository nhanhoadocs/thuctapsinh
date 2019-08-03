# Policy mặc định

## Policy là gì

khi không match rule nào, thì Policy mặc định sẽ quyết định hành động được thực hiện với gói tin

## Policy trên Ubuntu

***Ở đây, tôi thực hành trên máy cài Ubuntu 19.04***

Trên các bản Ubuntu, firewall mặc định sẽ là UFW, nhưng ban đầu mặc định UFW sẽ bị tắt.
Do đó, tất cả gói tin sẽ được nhận, và gửi đi mà ko có bất cứ rào cản nào 

```
sudo iptables -L -v
[sudo] password for imkifu: 
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination        
```

kiểm tra `UFW` đã được bật chưa:
```
sudo ufw status
[sudo] password for imkifu: 
Status: inactive
```

hoặc bằng câu lệnh sau, cũng ra output tương tự: 
```
sudo ufw status verbose
Status: inactive
```


Tôi sẽ bật UFW lên và xem Policy mặc định của nó là gì

1. Bật `UFW`

```
sudo ufw enable
Firewall is active and enabled on system startup
```

2. Kiểm tra xem đã bật thành công
```
sudo ufw verbose
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere                  
22/tcp (v6)                ALLOW       Anywhere (v6)       
```

3. Kiểm tra Policy mặc định
```
sudo iptables -L -n -v
Chain INPUT (policy DROP 82 packets, 2976 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 5918   11M ufw-before-logging-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 5918   11M ufw-before-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  290 28577 ufw-after-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
   82  2976 ufw-after-logging-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
   82  2976 ufw-reject-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
   82  2976 ufw-track-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ufw-before-logging-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-before-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-after-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-after-logging-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-reject-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 ufw-track-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
 4817  731K ufw-before-logging-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 4817  731K ufw-before-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  158 22049 ufw-after-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  158 22049 ufw-after-logging-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  158 22049 ufw-reject-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  158 22049 ufw-track-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-after-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-after-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
  135 10746 ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:137
   40  9085 ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:138
    0     0 ufw-skip-to-policy-input  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:139
    0     0 ufw-skip-to-policy-input  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:445
    4  1312 ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:67
    0     0 ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:68
   29  4458 ufw-skip-to-policy-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST

Chain ufw-after-logging-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW BLOCK] "

Chain ufw-after-logging-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
   17   588 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW BLOCK] "

Chain ufw-after-logging-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-after-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 3
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 11
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 12
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 8
    0     0 ufw-user-forward  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-before-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
  444 45426 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0           
 4900   11M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    1    76 ufw-logging-deny  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    1    76 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 3
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 11
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 12
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            icmptype 8
    3   988 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp spt:67 dpt:68
  570 69399 ufw-not-local  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
  280 40822 ACCEPT     udp  --  *      *       0.0.0.0/0            224.0.0.251          udp dpt:5353
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            239.255.255.250      udp dpt:1900
  290 28577 ufw-user-input  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-before-logging-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-logging-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-logging-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-before-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         
  444 45426 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0           
 4215  664K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
  158 22049 ufw-user-output  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-logging-allow (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW ALLOW] "

Chain ufw-logging-deny (2 references)
 pkts bytes target     prot opt in     out     source               destination         
    1    76 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID limit: avg 3/min burst 10
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10 LOG flags 0 level 4 prefix "[UFW BLOCK] "

Chain ufw-not-local (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    8   608 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL
  354 43190 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type MULTICAST
  208 25601 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type BROADCAST
    0     0 ufw-logging-deny  all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 10
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-reject-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-reject-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-reject-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-skip-to-policy-forward (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-skip-to-policy-input (7 references)
 pkts bytes target     prot opt in     out     source               destination         
  208 25601 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-skip-to-policy-output (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-track-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-track-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-track-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         
  148 21289 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate NEW
   10   760 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate NEW

Chain ufw-user-forward (1 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-input (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22

Chain ufw-user-limit (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 3/min burst 5 LOG flags 0 level 4 prefix "[UFW LIMIT BLOCK] "
    0     0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain ufw-user-limit-accept (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain ufw-user-logging-forward (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-logging-input (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-logging-output (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain ufw-user-output (1 references)
 pkts bytes target     prot opt in     out     source               destination         
```

Vậy là Policy mặc định của UFW cho phép `ACCEPT` tất cả gói tin từ OUTPUT table, `DROP` tất cả gói tin từ INPUT và FORWARD table.

4. Kiểm tra ứng dụng được UFW cho phép sử dụng firewall
```
sudo ufw app list
Available applications:
  CUPS
  OpenSSH
```

Mặc định, UFW chỉ cho phép 2 ứng dụng này có quyền sử dụng tường lửa.

## Policy mặc định trên Centos 

***Ở đây, tôi thực hành trên máy cài Centos 7***

Khác với Ubuntu, Centos tự động bật firewall, và firewall mặc định của Centos 7 là `Firewalld`

Ở đây, khác với Ubuntu, Centos không dùng Policy, mà dùng `Default zone`. 

Trong FirewallD, zone là một nhóm các quy tắc nhằm chỉ ra những luồng dữ liệu được cho phép, dựa trên mức độ tin tưởng của điểm xuất phát luồng dữ liệu đó trong hệ thống mạng. Để sử dụng, bạn có thể lựa chọn zone mặc đinh, thiết lập các quy tắc trong zone hay chỉ định giao diện mạng(Network Interface) để quy định hành vi được cho phép

Tôi sẽ nói về `Zone` của Firewalld trong bài viết tiếp theo.

1. Liệt kê các danh sách dịch vụ được Firewalld cho phép:
```
firewall-cmd --list-all
```

output :
```
firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens33
  sources: 
  services: ssh dhcpv6-client samba
  ports: 137/tcp 138/tcp 139/tcp 445/tcp 901/tcp
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

Ở đây, Firewalld mặc định cho phép hai dịch vụ là ssh và dhcpv6-client (dịch vụ samba là tôi cài vào)

2. Nếu như không cài Firewalld, policy mặc định của Centos là :
```
iptables --list 
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
INPUT_direct  all  --  anywhere             anywhere            
INPUT_ZONES_SOURCE  all  --  anywhere             anywhere            
INPUT_ZONES  all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere             ctstate INVALID
REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
FORWARD_direct  all  --  anywhere             anywhere            
FORWARD_IN_ZONES_SOURCE  all  --  anywhere             anywhere            
FORWARD_IN_ZONES  all  --  anywhere             anywhere            
FORWARD_OUT_ZONES_SOURCE  all  --  anywhere             anywhere            
FORWARD_OUT_ZONES  all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere             ctstate INVALID
REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
OUTPUT_direct  all  --  anywhere             anywhere            

Chain FORWARD_IN_ZONES (1 references)
target     prot opt source               destination         
FWDI_public  all  --  anywhere             anywhere            [goto] 
FWDI_public  all  --  anywhere             anywhere            [goto] 

Chain FORWARD_IN_ZONES_SOURCE (1 references)
target     prot opt source               destination         

Chain FORWARD_OUT_ZONES (1 references)
target     prot opt source               destination         
FWDO_public  all  --  anywhere             anywhere            [goto] 
FWDO_public  all  --  anywhere             anywhere            [goto] 

Chain FORWARD_OUT_ZONES_SOURCE (1 references)
target     prot opt source               destination         

Chain FORWARD_direct (1 references)
target     prot opt source               destination         

Chain FWDI_public (2 references)
target     prot opt source               destination         
FWDI_public_log  all  --  anywhere             anywhere            
FWDI_public_deny  all  --  anywhere             anywhere            
FWDI_public_allow  all  --  anywhere             anywhere            
ACCEPT     icmp --  anywhere             anywhere            

Chain FWDI_public_allow (1 references)
target     prot opt source               destination         

Chain FWDI_public_deny (1 references)
target     prot opt source               destination         

Chain FWDI_public_log (1 references)
target     prot opt source               destination         

Chain FWDO_public (2 references)
target     prot opt source               destination         
FWDO_public_log  all  --  anywhere             anywhere            
FWDO_public_deny  all  --  anywhere             anywhere            
FWDO_public_allow  all  --  anywhere             anywhere            

Chain FWDO_public_allow (1 references)
target     prot opt source               destination         

Chain FWDO_public_deny (1 references)
target     prot opt source               destination         

Chain FWDO_public_log (1 references)
target     prot opt source               destination         

Chain INPUT_ZONES (1 references)
target     prot opt source               destination         
IN_public  all  --  anywhere             anywhere            [goto] 
IN_public  all  --  anywhere             anywhere            [goto] 

Chain INPUT_ZONES_SOURCE (1 references)
target     prot opt source               destination         

Chain INPUT_direct (1 references)
target     prot opt source               destination         

Chain IN_public (2 references)
target     prot opt source               destination         
IN_public_log  all  --  anywhere             anywhere            
IN_public_deny  all  --  anywhere             anywhere            
IN_public_allow  all  --  anywhere             anywhere            
ACCEPT     icmp --  anywhere             anywhere            

Chain IN_public_allow (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh ctstate NEW
ACCEPT     udp  --  anywhere             anywhere             udp dpt:netbios-ns ctstate NEW
ACCEPT     udp  --  anywhere             anywhere             udp dpt:netbios-dgm ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:netbios-ssn ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:microsoft-ds ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:netbios-ns ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:netbios-dgm ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:netbios-ssn ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:microsoft-ds ctstate NEW
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:swat ctstate NEW

Chain IN_public_deny (1 references)
target     prot opt source               destination         

Chain IN_public_log (1 references)
target     prot opt source               destination         

Chain OUTPUT_direct (1 references)
target     prot opt source               destination         
[root@localhost services]# 
```

# Tổng kết

Nếu không cài firewall nào, thì policy mặc định trên Ubuntu và Centos là như nhau, cho phép tất cẩ các gói tin ra/vào mạng.

- Khi cài UFW trên Ubuntu : 

UFW cho phép `ACCEPT` tất cả gói tin từ OUTPUT table, `DROP` tất cả gói tin từ INPUT và FORWARD table.

- Khi cài Firewalld trên Centos :

Firewalld sử dụng default zone, tôi sẽ nói chi tiết ở bài viết tiếp theo. 

The default trust level of this zone is to not trust the other servers on the network. Only chosen incoming connections are accepted.

[Link tham khảo default zone](https://www.liquidweb.com/kb/find-view-default-zone-for-firewalld-on-centos-7/)























