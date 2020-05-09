# 1. Truy vấn dữ liệu (Querying data)

Tìm hiểu về cách truy vấn dữ liệu từ máy chủ cơ sở dữ liệu mysql

### Mysql Select 

Select cho phép ta đọc dữ liệu từ 1 hoặc nhiều bảng. Để sử dụng select trong mysql ta dử dụng cú pháp như sau: 

```
SELECT select_list FROM table_name; 
```

Sau mỗi câu lệnh sẽ kết thúc bằng dấu `;` . 
 
#### Ví dụ về sử dụng select trong mysql

1. Xem toàn bộ thông tin bảng : 

```
select * from orders;
```

![Imgur](https://i.imgur.com/BQWRBpX.png)

Khi sử dụng * nó sẽ hiển thị toàn bộ thông tin của bảng `orders` .  

2. Để xem dữ liệu của từng cột trong bảng 

![Imgur](https://i.imgur.com/KXJZ3vY.png)

Thao tác này sẽ hiển thị dữ liệu cột `orderDate` trong bảng `orders` : 

![Imgur](https://i.imgur.com/oMcd3uY.png)


3. Xem dữ liệu nhiều cột trong 1 bảng cùng 1 lúc . 

![Imgur](https://i.imgur.com/huc9xtG.png)
  
Thao tác này hiển thị cùng lúc dữ liệu các cột `orderDate`, `requiredDate` và `shippedDate` trong bảng `orders`. 

![Imgur](https://i.imgur.com/2ZIxxSD.png)



