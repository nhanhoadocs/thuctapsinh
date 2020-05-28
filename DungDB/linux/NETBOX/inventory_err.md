# Sửa lỗi không xem được inventory

![Imgur](https://i.imgur.com/GNe5evK.png)

https://github.com/netbox-community/netbox/issues/4634

Cài đặt ack

    yum -y install ack

Tìm cụm từ cần sửa

```
[root@netbox ~]# ack 'accessor=Accessor' /opt/netbox
/opt/netbox/netbox/circuits/tables.py
31:        accessor=Accessor('count_circuits'),

/opt/netbox/netbox/dcim/tables.py
388:        accessor=Accessor('rack.site'),
724:        accessor=Accessor('devices.count'),
730:        accessor=Accessor('virtual_machines.count'),
758:        accessor=Accessor('devices.count'),
764:        accessor=Accessor('virtual_machines.count'),
1061:        accessor=Accessor('termination_a'),
1066:        accessor=Accessor('termination_a'),
1072:        accessor=Accessor('termination_b'),
1077:        accessor=Accessor('termination_b'),
1109:        accessor=Accessor('connected_endpoint.device'),
1132:        accessor=Accessor('connected_endpoint.device'),
1138:        accessor=Accessor('_connected_poweroutlet'),
1157:        accessor=Accessor('device'),
1163:        accessor=Accessor('name'),
1169:        accessor=Accessor('_connected_interface.device'),
1175:        accessor=Accessor('_connected_interface'),
1198:        accessor=Accessor('manufacturer.name')
1217:        accessor=Accessor('master__name'),

/opt/netbox/netbox/ipam/tables.py
322:        accessor=Accessor('prefixes.count'),
328:        accessor=Accessor('vlans.count'),
636:        accessor=Accessor('group.name'),

/opt/netbox/netbox/virtualization/tables.py
102:        accessor=Accessor('devices.count'),
107:        accessor=Accessor('virtual_machines.count'),
```

Sửa file `/opt/netbox/netbox/dcim/tables.py`

Sửa phần
```
manufacturer = tables.Column(
    accessor=Accessor('manufacturer.name')
)
```
thành
```
manufacturer = tables.Column(
    accessor=Accessor('manufacturer__name')
)
```

Khởi động lại dịch vụ

    systemctl restart netbox netbox-jq

Kết quả:

![Imgur](https://i.imgur.com/GIHNBGo.png)