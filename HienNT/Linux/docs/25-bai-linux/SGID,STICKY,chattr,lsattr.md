**<h2>SUID/SGID trong Linux</h2>**
<h2>SUID là gì?</h2>

"**SUID** - **S**et owner **U**ser **ID**" up on execution là một loại file permission đặc biệt. SUID sẽ cấp quyền "tạm thời" cho user đang chạy file quyền của user tạo ra file(owner). Nói cách khác, user đang chạy sẽ có UID và GID của user tạo ra khi chạy một file hoặc command. 

<h4>Một vài ví dụ về SUID</h4> 

- ### **ping command**  
  Khi thực hiện lệnh `ping`, các tệp socket và cổng sẽ được mở để gửi các gói IP đến máy chủ từ xa. Người dùng bình thường không có quyền mở tệp socket và mở cổng. Nhưng các user thường vẫn có thể thực hiện lệnh `ping` vì đã được set thêm `SUID`  
  Câu lệnh kiểm tra:  
  ```sh
   [sale1@hiennt ~]$ ls -ll /usr/bin/ping
  ```  

  <img src = "../../images/25 bai linux/ping.png">  

- ### **passwd command**  
   `passwd` được tạo bởi root và được thực thi bởi root. Ngoài root thì không user nào  quyền thực thi với lệnh `passwd`. Nhưng vì được set `SUID` trên `passwd` nên các user vẫn có thể thay đổi password của mình.  
   Kiểm tra:  
   ```sh
   [sale1@hiennt ~]$ ls -ll /usr/bin/passwd  
   ```

   <img src = "../../images/25 bai linux/passwd2.png">  

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
chmod 5740 /home/sale
```
Trong đó: 3 số sau(740) thể hiện quyền truy cập và sở hữu file với 3 quyền `read`,`write` và `excecute` của owner,group và những người dùng khác. Số đầu tiên(5) thể hiện SUID/SGID,Sticky có được thiết lập hay không. 5 được tạo thành từ các bit nhị phân(0-không được thiết lập; 1 -  được thiết lập). Các bit nhị phân theo thứ tự thể hiện `SUID-SGID-STICKY`. Ở ví dụ trên 5=101 nghĩa là SUID và STICKY đã được thiết lập.  

### Thay đổi SUID/SGID, STICKY bằng kí tự  

<img src = "../../images/25 bai linux/chmodst.png"> 

***Câu lệnh gỡ bỏ `SGID` với file a2.txt:***
```sh
[root@hiennt Test]# chmod g-s a2.txt
```
***Câu lệnh gỡ bỏ `SUID` và `Sticky` với file a5.txt***  
```sh
[root@hiennt Test]# chmod u-s,-t a5.txt
```

> #### Bảng quy đổi kí tự và số  

<center><img src ="../../images/25 bai linux/table.png"></center>


### Phân biệt SUID/SGID, Sticky theo màu   

<img src = "../../images/25 bai linux/suidsgidt.png">  

*Trong đó:*  

\- Những file/thư mục có cài `SUID` sẽ có màu hồng. 
\- Những file/thư mục chỉ cài `SGID` hoặc cài `SGID` và `Sticky` có màu vàng  
\- Những file/thư mục chỉ cài `Sticky` sẽ không đổi màu. 

***Ngoài ra:*** `S` thể hiện user/group chưa có quyền thực thi(x), khi được cài thêm quyền thực thi thì `S` sẽ chuyển thành `s`.  

> ### SUID/SGID được sử dụng ở đâu?   
- Trường hợp các lệnh/chương trình/tập lệnh chỉ tài khoản root mới có quyền thực thi. Dùng `SUID` và `SGID` để cấp quyền thực thi cho các user thường.  
- Trường hợp không muốn cung cấp thông tin đăng nhập của người dùng cụ thể nhưng muốn chạy một chương trình dưới quyền là chủ sở hữu(nhận các giá trị từ 2 đến 7).  
- Trường hợp không muốn dùng lệnh `sudo` nhưng muốn cấp quyền thực thi cho lệnh/tập lệnh(nhận các giá trị từ 2 đến 7)  



# Lệnh chattr và lsattr của Linux  
> ### Tác dụng: 
- Lệnh `chattr` và `lsattr` được dùng để thay đổi đặc tính cho file và thư mục dưới cấp độ của người quản trị hệ thống. 
- Lệnh `chattr` được dùng để gỡ bỏ hoặc gán quyền hạn sở hữu cho file.  
- Lệnh `lsattr` được dùng để liệt kê chúng. 

> ### Cách dùng: 

<img src ="../../images/25 bai linux/table2.png">  

> ### Chi tiết:  
- Cho phép người dùng thêm nội dung mới vào file nhưng thông tin hiện tại không được xóa hoặc chỉnh sửa. 
```sh
chattr +a <file>
[root@hiennt Test]# chattr +a a.txt
```
   Để bỏ quyền hạn chế chỉnh sửa file
   ```sh
     chattr -a <file
   ```
- Không cho người dùng chỉnh sửa file, bao gồm cả root  

```sh
[root@hiennt Test]# chattr +i a.txt
```
- Đảm bảo tập tin được thay đổi thì các thay đổi cũng được đồng bộ.  
```sh
[root@hiennt ~]# chattr +S /opt/Test/a.txt
```




## TÀI LIỆU THAM KHẢO  
- [https://kipalog.com/](https://kipalog.com/posts/SUID-trong-linux)
- [https://forum.gocit.vn/](https://forum.gocit.vn/threads/suid-sgid-sticky.567/)