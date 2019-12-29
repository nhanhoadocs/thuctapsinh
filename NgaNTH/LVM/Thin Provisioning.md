### Thin Provisioning  


**1. Thick Provisioning**
- Là một loại phân bổ lưu trữ trước. 
- KHi ta tạp một đĩa ảo trên máy ảo thì nó sẽ nhận toàn bộ dung lượng của disk cho disk đó mặc dù nó chưa sử dụng hết dung lượng.  

<img src ="https://i.imgur.com/oeSOo7I.png">

**2. Thin Provisioning**  

- Là loại chia ra trước lưu trữ. Nó chỉ tiêu thụ dung lượng bạn đầu và cấp phát theo sự phát triển.   

<img src="https://i.imgur.com/FuHDdiK.png">

- Cơ chế này tránh lãng phí dung lượng ổ cứng so với `thick`. Với cơ chế này thì máy ảo chỉ chiếm bằng đúng dung lượng mà nó lưu trữ. Vì vậy phần dung lượng trống còn lại có thể sử dụng cho việc khác. 
- Sử dụng cơ chế `Thin Provision` ta có thể tận dụng được dụng lượng disk nhưng nhược điểm là khi dung lượng đĩa cứng bị hết thì các VM sẽ bị ảnh hưởng vì không còn dung lượng trống để ghi.  

**3. Tìm hiểu về tính năng Thin Provision của LVM**  

### Chuẩn bị  

Tạo 1 `volume group` từ 2 Physical volume là `/sdd1` và `/sdd2`. 

<img src="https://i.imgur.com/9ahC0Ey.png">

Tạo `volume group` thinVG và `thinpool`  

<img src="https://i.imgur.com/9ypPjVD.png">

Trong đó:  
-L: size của volume  
--thin

