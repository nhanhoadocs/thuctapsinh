Check zone mặc định

```
firewall-cmd --get-default-zone
```

Check active zone

```
firewall-cmd --get-active-zones
```

```
firewall-cmd --list-all-zones
```

Thay đổi zone

```
firewall-cmd --set-default-zone=home
```

Check service

```
firewall-cmd --get-services
```

Add service 

```
firewall-cmd --zone=public --add-service=http
```

Muốn thay đổi mà reboot ko mất dùng thêm option `--permanent`

```
firewall-cmd --zone=public --permanent --add-service=http
```

Có thể check những service reboot ko bị mất

```
firewall-cmd --zone=public --permanent --list-services
```

Add port

```
firewall-cmd --zone=public --add-port=5000/tcp

firewall-cmd --zone=public --list-ports
```

Add range port

```
firewall-cmd --zone=public --add-port=4990-4999/udp
```

Nếu muốn reboot ko mất vẫn phải dùng thêm `--permanent`

```
firewall-cmd --zone=public --permanent --add-port=5000/tcp
```

