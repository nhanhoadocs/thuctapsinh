# Định Tuyến Tĩnh

- Ta có mô hình:
![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_14-05.png)

- Với mô hình trên, các router được nối với nhau với cổng phù hợp ta làm như sau:
  - Ta phải gắn cổng serial.

![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_14-08.png)

![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_13-51.png)

![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_14-11.png)

Làm tương tự với các router khác.

- Sau đó ta đặt địa chỉ ip cho router:
  - Router 0:
  
        Router(config)#interface Serial0/0
        Router(config-if)#ip address 172.16.0.1 255.255.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#interface FastEthernet0/0
        Router(config-if)#ip address 192.168.1.1 255.255.255.0
        Router(config-if)#no shutdown 

  - Router 1:

        Router(config)#interface Serial0/0
        Router(config-if)#ip address 172.16.0.2 255.255.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#interface Serial0/1
        Router(config-if)#ip address 10.0.0.1 255.0.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#interface Serial0/2
        Router(config-if)#ip address 160.15.0.254 255.255.0.0
        Router(config-if)#no shutdown
        
  - Router 2:
  
        Router(config)#interface Serial0/0
        Router(config-if)#ip address 10.0.0.2 255.0.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#interface FastEthernet0/0
        Router(config-if)#ip address 192.168.2.1 255.255.255.0
        Router(config-if)#no shutdown

  - Router3:
   
        Router(config)#interface Serial0/0
        Router(config-if)#ip address 160.15.0.1 255.255.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#interface FastEthernet0/0
        Router(config-if)#ip address 192.168.3.1 255.255.255.0
        Router(config-if)#no shutdown

- Tiếp theo ta đặt địa chỉ ip cho pc:
![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_14-35.png)

![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_14-35_1.png)

![img](https://github.com/phungngockma/ngoc/raw/master/images/2019-05-14_14-36.png)

- Bước tiếp theo ta định tuyến cho từng router:
  - Router0:
  
        Router(config)#ip route 192.168.2.0 255.255.255.0 10.0.0.0
        Router(config)#ip route 10.0.0.0 255.0.0.0 172.16.0.0
        Router(config)#ip route 192.168.3.0 255.255.255.0 160.15.0.0
        Router(config)#ip route 160.15.0.0 255.255.0.0 172.16.0.0
  - Router1:
  
        Router(config)#ip route 192.168.2.0 255.255.255.0 10.0.0.0
        Router(config)#ip route 192.168.1.0 255.255.255.0 172.16.0.0
        Router(config)#ip route 192.168.3.0 255.255.255.0 160.15.0.0
  - Router2:
  
        Router(config)#ip route 192.168.1.0 255.255.255.0 172.16.0.0
        Router(config)#ip route 172.16.0.0 255.255.0.0 10.0.0.0
  - Router3:
  
        Router(config)#ip route 192.168.1.0 255.255.255.0 172.16.0.0
        Router(config)#ip route 172.16.0.0 255.255.0.0 160.15.0.0 

- Cuối cùng ta thực hiện **Ping** giữa các PC.

![img](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/61701805_2350051265279606_867924289641250816_n.png?_nc_cat=106&_nc_oc=AQkmH4FynFmxh3XShn5lvEQFjOyatWBkX34z39Nan57OU7kDdsK7Rryj2l_qoq0v7k8&_nc_ht=scontent.fhan5-3.fna&oh=7926a8eaa5fe7dc309cc8230dd2b9345&oe=5D5A17AF)

# END
