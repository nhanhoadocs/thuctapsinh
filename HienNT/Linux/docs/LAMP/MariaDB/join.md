## Contents  
- [Mô hình](/1)
- [INNER JOIN](/2)
- [LEFT JOIN](/3)
- [RIGHT JOIN](/4)

<a name ="1"></a>

## Mô hình  
Ta có 2 bảng:  

<img src ="../../../images/25 bai linux/baitoan.png">  

<a name ="2"></a>

## INNER JOIN  

<img src ="../../../images/25 bai linux/innerjoin.png">  

- `INNER JOIN:` trả về kết quả là các bản ghi mà trường được join ở hai bảng khớp nhau, các bản ghi chỉ xuất hiện ở một trong hai bảng sẽ bị loại. [Tham khảo](https://freetuts.net/inner-join-trong-sql-1533.html)        
  
  ```sh
  SELECT table1.column1, table1.column2, table2.column1,...tableN.columnX 
  FROM table1   
  INNER JOIN table2  
  ON table1.column_ID = table2.column_ID;
  ```    
  Trong đó:  
  `table1 , table2` là 2 bảng cần thực hiện join.  
  `table1.column = table2.column` là điều kiện để lọc(là giá trị khóa chính của bảng này và khóa ngoại của bảng kia)

- Nếu có nhiều bảng kết hợp lại:
  ```sh
  SELECT table1.column1, table1.column2, table2.column1,...tableN.columnX 
  ((FROM table1   
  INNER JOIN table2  
  ON table1.column_ID = table2.column_ID)
  INNER JOIN tableN ON tableN.column_ID = tableM.column_ID);
  ```
  
- ***Ví dụ:*** Kết hợp 2 bảng `SVTT` và `Mentor` dùng `INNER JOIN` để lấy thông tin về: họ tên mentor, họ tên SVTT, Giới tính SVTT  
  ```sh
  select Mentor.Hoten, SVTT.Hoten, SVTT.Gioitinh
  from Mentor
  inner join SVTT
  on Mentor.MentorID = SVTT.MentorID;
  ```  
  OUTPUT  

   <img src ="../../../images/25 bai linux/innerjoin2.png">  
  
- Nếu muốn bổ sung thêm điều kiện để lấy dữ liệu, sử dụng `Where`. Ví dụ:  

   ```sh
   select Mentor.Hoten, SVTT.Hoten, SVTT.Gioitinh from Mentor inner join SVTT on Mentor.MentorID = SVTT.MentorID where SVTT.Hoten = "HienNT";
   ```  
<a name ="3"></a>

## LEFT JOIN  

<img src ="../../../images/25 bai linux/image-asset.png">  

- `left join` Lấy tất cả dữ liệu trong bảng nằm phía bên trái, bảng bên phải sẽ lấy những dữ liệu thỏa mãn `ON`  

- Cú pháp:  
  ```sh
  SELECT column_name(s)
  FROM table1
  LEFT JOIN table2
  ON table1.column_name = table2.column_name;
  ```

- ***Ví dụ:*** 
  ```sh
  select Mentor.Hoten, Namsinh, SVTT.Hoten, SVTT.MSSV, SVTT.MentorID
  from Mentor
  left join SVTT
  on Mentor.MentorID = SVTT.MentorID;
  ```  
  OUTPUT  

  <img src ="../../../images/25 bai linux/leftjoin.png">  
<a name ="4"></a>  

## RIGHT JOIN  

  <img src ="../../../images/25 bai linux/right-join.png">    

- `right join` Lấy tất cả dữ liệu trong bảng nằm phía bên phải, bảng bên trái sẽ lấy những dữ liệu thỏa mãn `ON`  

- Cú pháp: 
  ```sh
  SELECT column_name(s)
  FROM table1
  RIGHT JOIN table2
  ON table1.column_name = table2.column_name;
  ```

- ***Ví dụ:*** 

  ```sh
  select Mentor.Hoten, SVTT.Hoten, MSSV, Gioitinh
  from Mentor
  right join SVTT
  on SVTT.MentorID = Mentor.MentorID;
  ```  
  OUTPUT  

  <img src ="../../../images/25 bai linux/rightjoin.png">  


