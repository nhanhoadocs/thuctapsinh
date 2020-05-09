# 2. Sắp xếp dữ liệu truy vấn (Sorting data)

Sắp xếp kết quả đầu ra lệnh. 

### Mysql Order by 

Khi ta sử dụng Select để truy vấn, dữ liệu đầu ra sẽ không được sắp xếp theo thứ tự nhất định, vậy nên ta sử dụng `order by` để sắp xếp dữ liệu theo thứ tự chỉ định. 

Cú pháp sử dụng như sau : 

```
SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;
```

#### Ví dụ về sử dụng `Order by` trong mysql .

1. Để sắp xếp dữ liệu đầu ra theo thứ tự tăng dần. 

![Imgur](https://i.imgur.com/jMRwQLR.png)

Dữ liệu đầu ra hiển thị cột `contactLastname` tăng dần theo thứ tự bảng chữ cái. 

![Imgur](https://i.imgur.com/ex2YrqH.png)

2. Sắp xếp dữ liệu theo thứ tự giảm dần ta sử dụng `Desc`.

![Imgur](https://i.imgur.com/2b83oOb.png)

Dữ liệu đầu ra hiển thị cột `contactLastname` giảm theo thứ tự bảng chữ cái.

![Imgur](https://i.imgur.com/oYS6PhO.png)

3. Sắp xếp dữ liệu 2 cột . 

![Imgur](https://i.imgur.com/2lmKomr.png)

Sử dụng `Desc` và `ASC` để sắp xếp dữ liệu 2 cột : Cột `contactLastname` sắp xếp theo thứ tự giảm dần, dữ liệu ở cột `contactFirstname` sẽ sắp xếp theo thứ tự giảm dần. 

![Imgur](https://i.imgur.com/qrJ0SQ5.png)

4. Sắp xếp dữ liệu bằng danh sách tùy chỉnh . 

Ta có thể sử dụng `order by` để sắp xếp dữ liệu tùy chỉnh bằng cách sử dụng `FIELD()`  

![Imgur](https://i.imgur.com/EayWQWN.png)

Thao tác này ta có thể sắp xếp dữ liệu muốn hiển thị theo ý muốn trong cột `orderNumber`

![Imgur](https://i.imgur.com/ciVGFHu.png)

