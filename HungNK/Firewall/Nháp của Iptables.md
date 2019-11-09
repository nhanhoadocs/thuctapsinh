# tài liệu về log file

https://tecadmin.net/enable-logging-in-iptables-on-linux/

https://unix.stackexchange.com/questions/423778/log-iptables-events-on-centos-7

https://www.centos.org/forums/viewtopic.php?t=44666

https://cuongquach.com/huong-dan-chan-ping-tren-linux.html

https://www.cyberciti.biz/tips/force-iptables-to-log-messages-to-a-different-log-file.html

https://blog.shadypixel.com/log-iptables-messages-to-a-separate-file-with-rsyslog/

https://serverfault.com/questions/752711/iptables-how-to-log-and-set-a-specific-log-file




```
[root@localhost ~]# firewall-cmd  --list-all-zone
block
  target: %%REJECT%%
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

dmz (active)
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 10.10.12.12
  services: ssh
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

drop
  target: DROP
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

external
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: ssh
  ports: 
  protocols: 
  masquerade: yes
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

home
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: ssh mdns samba-client dhcpv6-client
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

internal (active)
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 10.10.11.11
  services: ssh mdns samba-client dhcpv6-client
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

public (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens33 ens36 ens37
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: yes
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

trusted
  target: ACCEPT
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

work (active)
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 10.10.10.1
  services: dhcpv6-client ssh
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

[root@localhost ~]# Connection to 10.10.10.10 closed by remote host.
```


```
[root@firewalld ~]# firewall-cmd --list-all-zone
block
  target: %%REJECT%%
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

dmz (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens36
  sources: 10.10.11.11
  services: 
  ports: 22/tcp
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

drop
  target: DROP
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

external
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: ssh
  ports: 
  protocols: 
  masquerade: yes
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

home
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: ssh mdns samba-client dhcpv6-client
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

internal (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens37
  sources: 10.10.12.12
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

public (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens33
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: yes
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

trusted
  target: ACCEPT
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: 
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

work (active)
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 10.10.10.1
  services: ssh dhcpv6-client
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	

[root@firewalld ~]# 
```


eth0 = ens 37
eth1 = ens 33



firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o ens33 -j MASQUERADE

firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i ens37 -o ens33 -j ACCEPT 
x
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i ens33 -o ens37 -m state --state RELATED,ESTABLISHED -j ACCEPT 