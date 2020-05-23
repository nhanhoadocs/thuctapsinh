# 6. Subqueries

### 1. Subquery

Chỉ ra cách lồng 1 truy vấn vào 1 truy vấn khác  và sử dụng kết quả của truy vấn con cho truy vấn bên ngoài. 

Truy vấn sau trả về các nhân viên làm việc trong các văn phòng ở Hoa Kỳ : 

![Imgur](https://i.imgur.com/RiibJY2.png)

![Imgur](https://i.imgur.com/ifv9aVS.png)

Sử dụng truy vấn với các toán tử so sánh :
ví dụ :  truy vấn sau trả về kết quả là các khách hàng có khoản thanh toán tối đa. 

![Imgur](https://i.imgur.com/HuSGW7s.png)

![Imgur](https://i.imgur.com/0DZyIcC.png)

Hoặc hiển thị những khách hàng có khoản thanh toán lớn hơn khoản thanh toán trung bình. 

![Imgur](https://i.imgur.com/Whx94lE.png)

![Imgur](https://i.imgur.com/DmsKGZb.png)

Đầu tiên, truy vấn con sử dụng `AVG` để hiển thị khoản thanh toán trung bình.   
Sau đó, truy vấn các khoản thanh toán lớn hơn khoản thanh toán trung bình được trả về bởi truy vấn con trong truy vấn bên ngoài.

**Sử dụng truy vấn với `IN` và `Not In`**.

Sử dụng `Not In` để tìm khách hàng chưa có bất kỳ đơn đặt hàng nào. 

![Imgur](https://i.imgur.com/b3icZyH.png) 

![Imgur](https://i.imgur.com/nrat0Hk.png)

**Truy vấn con trong mệnh đề `From`**

Truy vấn sau hiển thị số lượng mặt hàng tối đa, tối thiểu và trung bình trong các đơn đặt hàng. 

![Imgur](https://i.imgur.com/oOtlFdx.png)

![Imgur](https://i.imgur.com/FJddXQx.png)

`Floor()` sử dụng để xóa giá trị thập phân đằng sau số lượng mặt hàng trung bình. 

**Truy vấn con tương quan MYSQL**.

Truy vấn sau đây chọn các sản phẩm có giá mua lớn hơn giá mua trung bình của tất cả các sản phẩm trong mỗi dòng sản phẩm.

![Imgur](https://i.imgur.com/9PHNUPo.png)

![Imgur](https://i.imgur.com/4hw5LTA.png)

**Sử dụng `EXISTS` và `NOT EXISTS` để truy vấn dữ liệu**

EXISTS sử dụng để kiểm tra bất kỳ bản ghi nào tồn tại trong truy vấn con. 
EXISTS trả về true nếu truy vấn trả về 1 hoặc nhiều bản ghi. 

**Cú pháp:**

```
SELECT 
    select_list
FROM
    a_table
WHERE
    [NOT] EXISTS(subquery);
```

Ví dụ: truy vấn sau sẽ trả về kết quả các khách hàng đã đặt ít nhất một đơn đặt hàng với tổng giá trị lớn hơn 60K bằng cách sử dụng toán tử `EXISTS`:

![Imgur](https://i.imgur.com/cT6l6Cb.png)

![Imgur](https://i.imgur.com/psl4YJ1.png)

>truy vấn sau cũng sẽ hiển thị kết quả tương tự. 

>![Imgur](https://i.imgur.com/g0YAMSm.png)

![Imgur](https://i.imgur.com/mJ9Y8Jy.png)

