# Giám sát Volume group và Logical Volume

Hướng dẫn:

https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep_checkmk/docs/07.Giam-sat-disk-lvm.md

## Thêm giám sát IO trên từng disk vật lý và Logical Volume

Kết quả:

![Imgur](https://i.imgur.com/cWzp5Sx.png)

## Kiểm tra dung lượng của Volume Group

Trên checkmk server copy plugin lvm trong đường dẫn `/opt/omd/versions/1.6.0p13.cre/share/check_mk/agents/plugins/lvm` sang thư mục `/usr/lib/check_mk_agent/plugins` bên phía agent

    scp /opt/omd/versions/1.6.0p13.cre/share/check_mk/agents/plugins/lvm root@10.10.10.115:/usr/lib/check_mk_agent/plugins

Kết quả:

![Imgur](https://i.imgur.com/MLjaDos.png)