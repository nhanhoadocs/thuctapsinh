# Giám sát apache

Hướng dẫn:

https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep_checkmk/docs/06.Giam-sat-apache.md

Copy file plugin từ checkmk server `/omd/versions/1.6.0p10.cre/share/check_mk/agents/plugins/apache_status` sang thư mục `/usr/lib/check_mk_agent/plugins` trên agent.

    scp /omd/versions/1.6.0p13.cre/share/check_mk/agents/plugins/apache_status root@10.10.10.115:/usr/lib/check_mk_agent/plugins

Kết quả:

![Imgur](https://i.imgur.com/WwRzRXy.png)