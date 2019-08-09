 <div id='id-section1'/>
 # Cấu hình RIP :  
 <img src="https://i.imgur.com/mhSrP79.png">  
 Các router chạy RIP version 2 , từ các PC và các Router có thể ping đến các mạng khác .


- Cấu hình Router 0 :  
```
  #int f0/0
  #ip add 192.168.0.1 255.255.255.0
  #int f0/1 
  #ip add 10.0.0.1 255.255.255.252 
  #int f1/0
  #ip add 11.0.0.1 255.255.255.252
  #int eth0/3/0
  #ip add 14.0.0.1 255.255.255.252 
  #router rip
  #ver 2
  #network 192.168.0.0
  #network 10.0.0.0
  #network 11.0.0.0
  #network 14.0.0.0


``` 

- Cấu hình Router 1 :  
```
  #int f0/0
  #ip add 172.168.0.1 255.255.255.0
  #int f0/1 
  #ip add 11.0.0.2 255.255.255.252 
  #int f1/0
  #ip add 12.0.0.1 255.255.255.252
  #int eth0/3/0
  #ip add 15.0.0.1 255.255.255.252 
  #router rip
  #ver 2
  #network 172.168.0.0
  #network 12.0.0.0
  #network 11.0.0.0
  #network 15.0.0.0
```
- Cấu hình Router 2 : 
```
  #int f0/0
  #ip add 172.16.0.1 255.255.255.0
  #int f0/1 
  #ip add 10.0.0.2 255.255.255.252 
  #int f1/0
  #ip add 12.0.0.2 255.255.255.252
  #int eth0/3/0
  #ip add 13.0.0.2  255.255.255.252 
  #router rip
  #ver 2
  #network 172.16.0.0
  #network 10.0.0.0
  #network 12.0.0.0
  #network 13.0.0.0
```

- Cấu hình Router 3: 
```
  #int f0/0
  #ip add 14.0.0.2 255.255.255.252
  #int f0/1 
  #ip add 15.0.0.2 255.255.255.252 
  #int f1/0
  #ip add 13.0.0.2 255.255.255.252
  #int eth0/3/0
  #ip add 192.16.0.1  255.255.255.0 
  #router rip
  #ver 2
  #network 192.16.0.0
  #network 14.0.0.0
  #network 15.0.0.0
  #network 13.0.0.0
```

- Kiểm tra :   
Từ PC 0 mạng 192.168.0.0/24 ping đến 172.168.0.0/24
<img src="https://i.imgur.com/rXaCpID.png">


# Cấu hình OSPF :   
<img src="https://i.imgur.com/eIzwGaw.png">  
Các router chạy ospf , các router và mạng của router R0,R1,R2 thuộc area 0 , còn router 2 với mạng 13.0.0.0/24 và mạng của router 3 thuộc area 1
Từ PC và router có thể ping đến các mạng khác .

