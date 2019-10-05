# Tìm hiểu lsof command


`lsof` hay còn gọi là `list open files` là một chương trình lệnh dùng để liệt kê các thông tin về các file trên hệ thống đang hoặc đã được mở bởi các tiến trình.



- Liệt kê các file đã mở theo tên tiến trình

```
lsof -c <tên tiến trình>
```

![](../images/lsof/-c.png)

- Liệt kê các tiến trình dang lắng nghe trên port cụ thể

```
lsof -i :<port>
```

![](../images/lsof/-i.png)

- Liệt kê tất cả các kết nối TCP/UDP

```
lsof -i <tcp or udp>

```

![](../images/lsof/tcp.png)

- Liệt kê các file được mở bởi 1 user cụ thể 

```
lsof -u <username>
```

- Liệt kê các file được mở trong một directory 

```
lsof +D 
```

![](../images/lsof/+D.png)

