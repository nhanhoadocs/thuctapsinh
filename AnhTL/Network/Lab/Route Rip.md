# Định tuyến RIP

- Ta có mô hình 
![img](https://scontent.fhan5-1.fna.fbcdn.net/v/t1.15752-9/61174699_2379724052313649_7832024343457562624_n.png?_nc_cat=109&_nc_oc=AQnE1jrdv7yDVbeddmOxzkBhvSq7w3QqdmjE1y3III4E_3OBYKbUC6eH7qpDORYZ1d8&_nc_ht=scontent.fhan5-1.fna&oh=f9d9880594861c2c7ef94a3783a4da01&oe=5D998512)

- Đầu tiên ta gán địa chỉ ip cho các router :
  - Route0:
  
        Router(config)#int fa0/0 
        Router(config-if)#ip add 192.168.20.254 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#int se0/2/0
        Router(config-if)#ip add 192.168.11.1 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#int se0/2/1
        Router(config-if)#ip add 192.168.10.1 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit

  - Router2:

        Router(config)#int se0/2/0
        Router(config-if)#ip add 192.168.11.2 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#int se0/2/1
        Router(config-if)#ip add 192.168.12.1 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#int fa0/0
        Router(config-if)#ip add 172.17.0.254 255.255.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        
  - Router3:

        Router(config)#int se0/2/0
        Router(config-if)#ip add 192.168.12.1 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#int se0/2/1
        Router(config-if)#ip add 192.168.10.2 255.255.255.0
        Router(config-if)#no shutdown
        Router(config-if)#exit
        Router(config)#int fa0/0
        Router(config-if)#ip add 172.16.0.254 255.255.0.0
        Router(config-if)#no shutdown
        Router(config-if)#exit

- Ta cấu hình địa chỉ IP cho PC:

![img](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/61250235_389376095007249_4258207680230850560_n.png?_nc_cat=111&_nc_oc=AQlZzNlLsEqfK2Ri55ekok02FWIonxf4lBIeN_G-430daku-1NyJHFp66VlHvbPpYa4&_nc_ht=scontent.fhan5-3.fna&oh=b06e24e107b8e5dc4a136d63df1f4fd4&oe=5D5FAA82)

![img](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/61386231_447860792668397_1970998833307451392_n.png?_nc_cat=102&_nc_oc=AQlnOnwQKT15NG3Sry8S2dzvQLnrzQYO9bC5CGavLNCmBMAIfRhVMhrignQ0iLn0KPg&_nc_ht=scontent.fhan5-2.fna&oh=3ce99dfe553919f9039381a437f00d29&oe=5D556B9D)

![img](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/61191564_2810387848990537_4164199199832801280_n.png?_nc_cat=110&_nc_oc=AQmH0rUg3Lmz87PuzLOa28HWfWBQ-ZCx4KUv82jwlAZMxKVyfK7hdzHYv1BJ_DP3tMM&_nc_ht=scontent.fhan5-2.fna&oh=60fa2b5cbf107adffef780cc981b570e&oe=5D5D73D2)

- Tiếp theo, ta cấu hình giao thức RIPv2 trên các router:

  - Router0:

        Router(config)#router rip
        Router(config-router)#version 2
        Router(config-router)#network 192.168.20.0
        Router(config-router)#network 192.168.11.0
        Router(config-router)#network 192.168.10.0
        Router(config-router)#no auto-summary
        Router(config-router)#exit

  - Router2:

        Router(config)#router rip
        Router(config-router)#version 2
        Router(config-router)#network 192.168.11.0
        Router(config-router)#network 192.168.12.0
        Router(config-router)#network 172.17.0.0
        Router(config-router)#no auto-summary 
        Router(config-router)#exit
    
  - Router3:

        Router(config)#router rip
        Router(config-router)#version 2
        Router(config-router)#network 192.168.10.0
        Router(config-router)#network 192.168.12.0
        Router(config-router)#network 172.16.0.0
        Router(config-router)#no auto-summary 
        Router(config-router)#exit

- Cuối cùng ta thực hiện ping:
![img](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.15752-9/61403468_714120098990874_6115262800701947904_n.png?_nc_cat=111&_nc_oc=AQnqrIXeDDyTwisLo4drLObUx--_37HsPS1kkA-BWeYHBTLxjfH2OBpM6-MiamrwQ98&_nc_ht=scontent.fhan5-3.fna&oh=d02cb22214341a62b8f5a12ed2772965&oe=5D9DED85)

# END