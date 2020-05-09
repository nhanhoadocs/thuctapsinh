# Find Command

Tìm và xóa nhiều tệp 

```
find -type f -name "*.txt" -exec rm -f {}\
```

Tìm tất cả các file trống tại thư mục tmp 

```
find /tmp -type f -empty
```

Tìm tất cả các thư mục trống tại thư mục tmp 

```
find /tmp -type d -empty
```

Tìm tất cả các file ẩn tại thư mục tmp 

```
find /tmp -type f -name ".*"
```

Tìm tất cả các file thuộc về người dùng thuctap 

```
find /home -user thuctap
```

Tìm tất cả các tập tin đặc biệt của người dùng 

```
find /home -user thuctap -name "*.txt"
```

