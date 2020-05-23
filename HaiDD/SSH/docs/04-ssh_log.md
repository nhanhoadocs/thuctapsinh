# SSH Logs

Ta có thể kiểm tra log của SSH trong file `/var/log/secure`

## Lọc log của ssh
```
cat /var/log/secure | grep sshd
```

<img src="..\images\Screenshot_40.png">

## Lọc logs SSH đăng nhập thất bại :
```
cat /var/log/secure | grep sshd | grep Failed
```