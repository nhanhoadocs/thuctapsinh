**<h2>SUID/SGID trong Linux</h2>**
<h2>SUID là gì?</h2>

"**SUID** - **S**et owner **U**ser **ID**" up on execution là một loại file permission đặc biệt. SUID sẽ cấp quyền "tạm thời" cho user đang chạy file quyền của user tạo ra file(owner). Nói cách khác, user đang chạy sẽ có UID và GID của user tạo ra khi chạy một file hoặc command. 

<h4>Một vài ví dụ về SUID</h4> 

- ### **ping command**
- ### **passwd command**

<h4>Cài đặt SUID</h4>  

- Dùng kí tự  

```sh
chmod u+s <tên file/thư mục>
```  

- Dùng số:
```sh
chmod 4750 <tên file/thư mục>
```
Trong đó: 4 là SUID, 7 là quyền đầy đủ của chủ sở hữu, 5 là quyền đọc và thực thi của nhóm, 0 thể hiện các user khác không có quyền gì.  

<h2>SGID</h2>
Câu lệnh sử dụng để thiết lập SGID  

```sh
chmod g+s <tên file/folder>
```

# **Sticky**
- Người dùng chỉ có thể xóa những file do chính họ tạo ra.
- Câu lệnh để bật Sticky  
```sh
chmod +t <stickyfolder>
```
- Thiết lập SUID,SGID,Sticky bằng số.   
Ví dụ câu lệnh thiết lập các quyền truy cập và sở hữu tập tin dùng `chmod`
```sh
chmod 5740 /home/sale`
```
Trong đó: 3 số sau(740) thể hiện quyền truy cập và sở hữu file với 3 quyền `read`,`write` và `excecute` của owner,group và những người dùng khác. Số đầu tiên(5) thể hiện SUID/SGID,Sticky có được thiết lập hay không. 5 được tạo thành từ các bit nhị phân(0-không được thiết lập; 1 -  được thiết lập). Các bit nhị phân theo thứ tự thể hiện `SUID-SGID-STICKY`. Ở ví dụ trên 5=101 nghĩa là SUID và STICKY đã được thiết lập.

# Lệnh chattr và lsattr của Linux  



## TÀI LIỆU THAM KHẢO  
- [https://kipalog.com/](https://kipalog.com/posts/SUID-trong-linux)
- [https://forum.gocit.vn/](https://forum.gocit.vn/threads/suid-sgid-sticky.567/)