# 3. Lọc dữ liệu (Filtering data)

Tìm hiểu cách sử dụng `WHERE` trong MySQL với câu lệnh `SELECT` để lọc các hàng từ tập kết quả.

### MySQL WHERE 

Cú pháp của mệnh đề `Where` 

```
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
```

- Search_condition là sự kết hợp giữa 1 hoặc nhiều cột sử dụng các toán tử như : and, or, between, like, in, not in, is null, is not null..

hoặc các toán tử như : =, <, >, >=, <=, != tương đương với <>. 

#### Ví dụ sử dụng `where` trong mysql. 

- Truy vấn sau sử dụng `where` để tìm kiếm các `country` có tên là USA : 

![Imgur](https://i.imgur.com/crstl5t.png)

![Imgur](https://i.imgur.com/Pf5lraA.png)

các cột như `city` và `state` sẽ hiển thị dữ liệu theo cột `country`. 

- Ta có thể sử dụng `AND` để kết hợp 2 điều kiện với nhau: 

![Imgur](https://i.imgur.com/lqMPVi4.png)

Ở đây ta kết hợp 2 điều kiện là chỉ hiển thị `Sales Rep` ở cột `jobtitle` và `officeCode` có giá trị là 1.   

![Imgur](https://i.imgur.com/rOtq7KA.png)

- Sử dụng `or` để hiển thị `Sales Rep` ở cột `jobtitle` hoặc hiển thị `officeCode` có giá trị là 1. 

![Imgur](https://i.imgur.com/eS0Z4fi.png)

![Imgur](https://i.imgur.com/BF3qusl.png)

- Sử dụng toán tử `and` 

Ví dụng ta muốn xem `customername` của tại CA, USA ta sử dụng : 

![Imgur](https://i.imgur.com/VgmvZni.png)

![Imgur](https://i.imgur.com/vdRUzKy.png)

Muốn xem thêm 1 cột nữa là khách hàng có giới hạn tín dụng lớn hơn 100000, ta làm như sau :

![Imgur](https://i.imgur.com/CIHoMe9.png)

![Imgur](https://i.imgur.com/IkjAnZJ.png)

- Sử dụng toán tử `OR`

Muốn xem những khách hàng được định vị tại USA hoặc France, ta làm như sau : 

![Imgur](https://i.imgur.com/PLeHvcW.png)

![Imgur](https://i.imgur.com/JXVmygA.png)

Truy vấn sau trả về kết quả là các khách hàng tại USA hoặc France có giới hạn tín dụng lớn hơn 100000.  

![Imgur](https://i.imgur.com/tTRsFKv.png)

![Imgur](https://i.imgur.com/iwQnk22.png)

Khi ta không sử dụng dấu ngoặc đơn như ở trên, thì truy vấn sau sẽ trả về là các khách hàng ở USA hoặc các khách hàng ở France và các khách hàng ở France sẽ phải có `creditlimit` lớn hơn 100000. 

![Imgur](https://i.imgur.com/yLzroFi.png)

![Imgur](https://i.imgur.com/BF7VJjR.png)

- Toán tử `IN`

Muốn tìm các văn phòng có định vị tại USA hoặc France, ta còn có thể sử dụng như sau : 

![Imgur](https://i.imgur.com/q0mI6hB.png)

hoặc tìm những văn phòng không có định vị tại USA hoawcn France : 

![Imgur](https://i.imgur.com/vQwrQq2.png)

- Toán tử  `between`

Ví dụ ta muốn tìm các sản phẩn có giá mua từ 90 -> 100, ta làm như sau : 

![Imgur](https://i.imgur.com/P2mJ4bR.png)

cũng trả về với kết quả như trên, ta có thể sử dụng >= và < = : 

![Imgur](https://i.imgur.com/WoFMT9u.png)

hoặc muốn xem những sản phẩm có giá mua nhỏ hơn 30 và lớn hơn 100 ta có thể làm theo 2 cách sau đây : 

![Imgur](https://i.imgur.com/B8iekPY.png)

![Imgur](https://i.imgur.com/qsVGT0L.png)

- Sử dụng toán tử `Like` 

Truy vấn dữ liệu dựa trên mẫu chỉ định : 

ví dụ ta muốn truy vấn nhân viên có tên kết thúc bằng n : 

![Imgur](https://i.imgur.com/BRtlUsY.png)

hoặc tìm nhân viên có tên bắt đầu bằng a : 

![Imgur](https://i.imgur.com/3w05h5u.png)

Truy vấn sau sẽ trả về kết quả là tên nhân viên bắt đầu bằng D, theo sau là 3 ký tự và kết thúc bằng e. 

![Imgur](https://i.imgur.com/Zxhx3Zg.png)

Truy vấn trả về dữ liệu là tên của nhân viên có chứa Pa.

![Imgur](https://i.imgur.com/8svb14o.png)

