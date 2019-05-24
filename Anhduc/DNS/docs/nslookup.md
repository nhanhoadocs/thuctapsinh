Định nghĩa: nslookup là một lệnh có tác dụng quản trị mạng. Một số option và chức năng của lệnh
# 1. Kiểm tra bản ghi A của một trang web
Cú pháp 
```
nslookup <tên trang web>
```
![](../images/command/nslookup/screenshot_6.png)

# 2. Kiểm tra bản ghi NS 
Cú pháp 
```
nslookup -type=ns <tên trang web>
```

![](../images/command/nslookup/screenshot.png)

# 3. Kiểm tra bản ghi SOA
Cú pháp 
```
nslookup -type=soa <tên trang web>
```

![](../images/command/nslookup/screenshot_1.png)

# 4. Kiểm tra bản ghi MX 
Cú pháp 
```
nslookup -query=mx <tên trang web>
```

![](../images/command/nslookup/screenshot_2.png)

# 5.Kiểm tra tất cả bản ghi có sẵn 

Cú pháp 
```
nslookup -type=any <tên trang web>
```

![](../images/command/nslookup/screenshot_3.png)

# 6.Tra cứu ngược 

![](../images/command/nslookup/screenshot_4.png)

# 7. Interactive mode

![](../images/command/dig/screenshot_6.png)

