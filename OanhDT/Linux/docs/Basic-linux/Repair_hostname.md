# Thiết lập hostname cho CentOS7

* Hostname là tên được dùng để xác định ra địa chỉ của host trong mạng máy tính.
* Hiểu đơn giản, Hostname là một cụm ký tự chỉ tên của máy chủ.
* Để kiểm tra hostname của máy ta dùng lệnh sau :

```
[root@oanhdt  ~]# hostname
oanhdt
[root@oanhdt  ~]#

```


* File chứa hostname của máy 
``` 
/etc/hostname
```

 ## Các cách sửa hostname của máy 

 ### Cách 1

 Dùng câu lệnh 
 ```
 hostnamectl set-hostname new_name
 ```
- Ví dụ muốn đổi hostname của máy từ `duydm` sang thanh `oanh` ta thực hiện như sau : 
```
[root@duydm ~]# hostnamectl set-hostname oanh
```
- Sau đó bạn có thể gõ lệnh `bash` để máy nhận tên mới.
- Hoặc bạn đăng nhập vào phiên mới thì máy sẽ nhận tên mới như hình dưới.

![](../../images/disk/bash.png)


## Cách 2 

- Chúng ta chỉnh sửa file chứa hostname của máy.Ở đây mình sử dụng trình soạn thảo văn bản `vi` để chỉnh sửa . 

```
vi /etc/hostname 
```
- Sau khi vi vào file chúng ta chỉnh sửa tên và sau đó `reboot` lại sẽ có kết quả như hình trên. 
