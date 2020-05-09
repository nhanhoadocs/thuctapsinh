# 5. Grouping Data

### 1. Group By

`Group by` xuất hiện sau mệnh đề `From` và `where. `Group by` = `Distinct`+`order by`

**Cú pháp:**
```
SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;
```

Ta có cơ sở giữ liệu mẫu sau: 

![Imgur](https://i.imgur.com/R83Sdbu.png)

Ví dụ về việc sử dụng `Group by` :

![Imgur](https://i.imgur.com/nRLKTTs.png)

![Imgur](https://i.imgur.com/i88VDGW.png)

Đối với truy vấn trên, `Group by` trả về số lần xuất hiện duy nhất của giá  trị `status` và có sự sắp xếp theo thứ tự. 

Ví dụ sau đây ta sử dung count để đếm số lượng đơn đặt hàng cho mỗi trạng thái : 

![Imgur](https://i.imgur.com/I76r2uf.png)

![Imgur](https://i.imgur.com/86sfNr8.png)

Để có được tổng số tiền của tất cả các đơn đặt hàng theo `status`, ta join vào các bảng `orders` với bảng `orderdetails` và sử dụng `SUM` để tính toán tổng số tiền. Ta có truy vấn như sau: 

![Imgur](https://i.imgur.com/67BWQ9o.png)

![Imgur](https://i.imgur.com/ZElbfSb.png)

Tương tự như trên, truy vấn sau sẽ trả về số thứ tự và tổng số tiền của mỗi đơn hàng  :

![Imgur](https://i.imgur.com/QwGre6H.png)

![Imgur](https://i.imgur.com/XngqWFQ.png)

Sử dụng hàm `YEAR` để trích xuất dữ liệu năm từ ngày đặt hàng `( orderDate)`. Chỉ bao gồm các đơn đặt hàng với tình trạng `shipped` trong tổng doanh số. Lưu ý rằng biểu thức xuất hiện trong mệnh đề `SELECT` phải giống với biểu thức trong mệnh đề `GROUP BY`. 

![Imgur](https://i.imgur.com/WspfoKC.png)

![Imgur](https://i.imgur.com/xKt57t4.png)


Ta có thể sử dụng thêm mệnh đề `Having` để lọc các năm đối với truy vấn trên. 

![Imgur](https://i.imgur.com/QTWFMbK.png)

![Imgur](https://i.imgur.com/9070huv.png)

Đối với truy vấn trên, ta lọc những năm lớn hơn 2003. 

### 2. Having

Having để xác định các điều kiện lọc cho 1 nhóm các hàng hoặc tập hợp. 

Mệnh đề `HAVING` thường được sử dụng với mệnh đề `GROUP BY` để lọc các nhóm dựa trên một điều kiện cụ thể. Nếu mệnh đề `GROUP BY` bị bỏ qua, mệnh đề `HAVING` hoạt động giống như mệnh đề `WHERE`. 

**Cú Pháp:** 

```
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
```

Ví dụ ta sử dụng Having để tìm đơn hàng nào có tổng doanh số lớn hơn 1000.

![Imgur](https://i.imgur.com/9pwLcQ3.png)

![Imgur](https://i.imgur.com/HbCyWrA.png)

Ta có thể sử dụng thêm các toán tử `or` hoặc `and` cho mệnh đề `Having` như sau.   
Sử dụng mệnh đề HAVING để tìm các đơn hàng có tổng số tiền lớn hơn 1000 và chứa hơn 600 mặt hàng. 

![Imgur](https://i.imgur.com/cHs3vw8.png)

![Imgur](https://i.imgur.com/3876USv.png)

Tìm tất cả các đơn đặt hàng ở status = Shipped và có tổng số tiền lớn hơn 1500, bạn có thể tham gia bảng `orderdetails` và bảng `orders` bằng cách sử dụng mệnh đề `INNER JOIN` và áp dụng điều kiện trên cột `status` và `total` như trong truy vấn sau đây: 

![Imgur](https://i.imgur.com/0bTNXnp.png)

![Imgur](https://i.imgur.com/wzDjSbY.png)

### 3. Rollup

`Rollup` là 1 phần mở rộng của `Group By`, cho phép ta tạo các tổng phụ cùng với 1 tổng lớn. 

Ở truy vấn sau, hàng tổng phụ được tạo mỗi khi `orderNumber` thay đổi. Và tạo 1 tổng lớn ở cuối kết quả. 

![Imgur](https://i.imgur.com/wEXndej.png)

![Imgur](https://i.imgur.com/nnKnD9g.png)

- Sử dụng chức năng grouping. 

Để kiểm tra xem các hàng có tổng phụ hay tổng lớn không, ta sử dụng `Grouping`. 





