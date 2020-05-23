# Filtering data trong SQL

## WHERE

WHERE cho phép bạn chỉ định một điều kiện tìm kiếm cho các hàng được trả về bởi một truy vấn.

Cú pháp:

        select_list
    FROM
        table_name
    WHERE
        search_condition;

Search_condition là sự kết hợp của một hoặc nhiều vị từ bằng cách sử dụng toán tử logic `AND`, `OR` và `NOT`.

Trong MySQL, một vị từ là một biểu thức Boolean đánh giá thành TRUE, FALSE hoặc UNKNOWN.
Bất kỳ hàng nào từ tên_bảng khiến search_condition đánh giá thành TRUE sẽ được list ra trong tập kết quả cuối cùng.

Ví dụ

Đây là bảng employees

    select * from employees

![Imgur](https://i.imgur.com/NzIh4Ab.png)

Thực hiện câu lệnh WHERE để lọc ra những hàng có cột jobTitle là Sales Rep

    select * from employees where jobTitle = "Sales Rep";

![Imgur](https://i.imgur.com/DJi87nr.png)

Thực hiện câu lệnh WHERE để lọc ra những hàng có cột jobTitle là Sales Rep và có officeCode là 1

    select * from employees where jobTitle = "Sales Rep" and officeCode = "1";

![Imgur](https://i.imgur.com/iVQgEzc.png)

Thực hiện câu lệnh WHERE để lọc ra những hàng có cột jobTitle là Sales Rep hoặc có officeCode là 1 kết hợp sắp xếp kết quả theo cột officeCode giảm dần. Có thể sử dụng toán tử OR trong câu lệnh Where, với toán tử OR thì chỉ cần trúng một trong số các điều kiện là được tính.

    select * from employees where jobTitle = "Sales Rep" or officeCode = 1 order by officeCode desc;

![Imgur](https://i.imgur.com/aVsT6aX.png)

## Câu lệnh WHERE với toán tử BETWEEN

Cú pháp

    BETWEEN low AND high

Lọc ra các kết quả trong khoảng chỉ định officeCode từ 1 đến 3

    select * from employees where officeCode between 1 and 3 order by officeCode desc;

![Imgur](https://i.imgur.com/sWya1w3.png)

## Câu lệnh WHERE với toán tử LIKE

Tìm các nhân viên có họ kết thúc bằng son sắp xếp theo tên.

    select firstName, lastName from employees where lastName like '%son' order by firstname;

![Imgur](https://i.imgur.com/VlogOmS.png)

## Câu lệnh WHERE với toán tử IN

Toán tử IN trả về TRUE nếu một giá trị khớp với bất kỳ giá trị nào trong danh sách.

Lọc ra các kết quả trong khoảng chỉ định officeCode là 1, 2 và 3.

![Imgur](https://i.imgur.com/wBzwcD0.png)

## Câu lệnh WHERE với toán tử IS NULL

Kiểm tra null

![Imgur](https://i.imgur.com/aHdUnUN.png)

## Câu lệnh WHERE với toán tử so sánh

`=` Equal to. You can use it with almost any data types.

`<>` or `!=` Not equal to

`<` Less than. You typically use it with numeric and date/time data types.

`>` Greater than.

`<=` Less than or equal to

`>=` Greater than or equal to

Lọc ra các kết quả có jobtitle không phải là Sales Rep

    select firstName, lastName, officeCode from employees where jobTitle <> 'Sales Rep';

![Imgur](https://i.imgur.com/ru81Spa.png)

Lọc các kết quả có office code lớn hơn 5

![Imgur](https://i.imgur.com/EbxoURi.png)

## Câu lệnh WHERE với toán tử limit

Dùng để hạn chế số lượng kết quả trả về bởi một truy vấn.

Dùng bảng customers 

Lấy một số lượng nhất định có giá trị cao nhất hoặc thấp nhất Lấy ra 5 khách hàng có mức tín dụng cao nhất

    SELECT 
        customerNumber, 
        customerName, 
        creditLimit
    FROM
        customers
    ORDER BY creditLimit DESC
    LIMIT 5;

![Imgur](https://i.imgur.com/A0fBBel.png)

Truy vấn này sử dụng mệnh đề LIMIT để lấy các hàng của trang 1 chứa 10 khách hàng đầu tiên được sắp xếp theo tên khách hàng:

    SELECT 
        customerNumber, 
        customerName
    FROM
        customers
    ORDER BY customerName    
    LIMIT 10;

![Imgur](https://i.imgur.com/lRMSYcE.png)

Truy vấn này sử dụng mệnh đề LIMIT để lấy các hàng của trang thứ hai bao gồm hàng 11 - 20:

    SELECT 
        customerNumber, 
        customerName
    FROM
        customers
    ORDER BY customerName    
    LIMIT 10, 10;

![Imgur](https://i.imgur.com/2KAg5Uj.png)

Lấy giá trị cao thứ 3 tín dụng:

    SELECT 
        customerName, 
        creditLimit
    FROM
        customers
    ORDER BY 
        creditLimit DESC    
    LIMIT 2,1;

![Imgur](https://i.imgur.com/GztIaBs.png)

Kiểm tra lại danh sách đầy đủ:

    SELECT 
        customerName, 
        creditLimit
    FROM
        customers
    ORDER BY 
        creditLimit DESC;

![Imgur](https://i.imgur.com/zJy6vU1.png)
