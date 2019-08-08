#VLAN


<a name="1"></a>
I. Cấu hình vlan 
Các câu lệnh cấu hình vlan
- Đặt tên cho switch : `Switch(config)#hostname tên switch`
- Đặt tên cho vlan
    ```
    - Switch(config)#vlan 10
    - switch(config)#name name vlan
    ```
- Gán các cổng cho từng vlan 

*Ví dụ : gán cổng từ 1 -9 cho vlan 10*

    - S(config)# integer vlan f0/1-9
    - S(config-if-range)# switchport mode access
    - S(config-if-range)# switchport access vlan 10
- Show vlan : `Switch :#show vlan brief`

![](../images/cauhinhvlan/showvlan.png)

- **Cấu hình Trunk** :

*Ví dụ: cấu hình trunk cho switch có cổng f0/1*
```
- S(config)#inter range f0/1
- S(config-if-range)# switchport mode trunk 
- S(config-if-range)# switchport trunk
```

![](../images/cauhinhvlan/cauhinhtrunk.png)
- Sau khi cấu hình trunking thì pc1 có thể ping được với pc 4 .

![](../images/cauhinhvlan/ping.png)





