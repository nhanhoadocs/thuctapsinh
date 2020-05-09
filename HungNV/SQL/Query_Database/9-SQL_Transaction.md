# 9. SQL Transaction

Mysql transaction là 1 đơn vị logic có chứa 1 hoặc nhiều câu lệnh SQL. Khi transaction thực hiện nhiều thay đổi đối với cơ sở dữ liệu, tất cả các thay đổi thành công nếu tất cả các hoạt động trong nhóm hoàn thành, nếu bất kỳ hoạt động nào trong transaction không thành công thì toàn bộ sẽ thất bại. 

Thực tế, ta sẽ ghép nhiều truy vấn SQL thành một nhóm và bạn sẽ thực hiện tất cả chúng cùng nhau như một phần của giao dịch.

**Thuộc tính**

Thuộc tính có 4 đặc điểm và được viết tắt là `ACID`: 

- `Atomicity` (bảo toàn) : Điều này đảm bảo rằng tất cả các hoạt động trong đơn vị công việc được hoàn thành thành công; mặt khác, giao dịch bị hủy bỏ tại thời điểm thất bại và các hoạt động trước đó được đưa trở lại trạng thái cũ.

- `Consistency` (nhất quán) : Điều này đảm bảo rằng cơ sở dữ liệu thay đổi chính xác trạng thái khi giao dịch được cam kết thành công

- `Isolation` (độc lập) : Điều này cho phép các giao dịch hoạt động độc lập và minh bạch với nhau

- `Durability` (bền bỉ) : Điều này đảm bảo rằng kết quả hoặc hiệu quả của giao dịch đã cam kết vẫn tồn tại trong trường hợp lỗi hệ thống

Trong MySQL, các giao dịch bắt đầu bằng câu lệnh BEGIN WORK và kết thúc bằng câu lệnh COMMIT hoặc ROLLBACK . Các lệnh SQL giữa các câu lệnh bắt đầu và kết thúc tạo thành phần lớn của giao dịch.

MySQL tự động cam kết các thay đổi vĩnh viễn cho cơ sở dữ liệu. Để buộc MySQL không tự động thay đổi, ta sử dụng câu lệnh sau:

```
SET autocommit = 0;
```
hoặc 
```
SET autocommit = OFF
```

Sử dụng câu lệnh sau để kích hoạt chế độ tự động :

```
SET autocommit = 1;
```
hoặc 

```
SET autocommit = ON;
```


**Ví dụ sử dụng transaction:**

ví dụ ta xóa đi bảng orderdetails và sử dụng rollback để khôi phục dữ liệu đã xóa trước đó. 

![Imgur](https://i.imgur.com/CsKWdRV.png)

![Imgur](https://i.imgur.com/GD1D2fI.png)

sau khi sử dụng câu lệnh 

```
ROLLBACK;
```

dữ liệu đã được khôi phục lại. 


**Trường hợp 2:**

Ta có 2 bảng là t1 và t2: 

![Imgur](https://i.imgur.com/g4x4JKv.png)

![Imgur](https://i.imgur.com/xdwqwGg.png)

khi ta thực hiện 1 chuỗi 2 câu lệnh, 1 trong 2 câu lệnh sai, dữ liệu sẽ không được lưu: 

```
-- 1. start a new transaction
START TRANSACTION;
 
-- 2. insert t1

update t1 set id =7
        
-- 4. Insert t2

INSERT INTO t2(id,ref) VALUES('D',4);

-- 5. commit changes    
COMMIT;
```

1 lỗi sẽ được thông báo: 

![Imgur](https://i.imgur.com/4QXudkr.png)

còn nếu cả 2 câu lệnh không sai, dữ liệu sẽ được lưu vào hệ thống. 

```
-- 1. start a new transaction
START TRANSACTION;
 
-- 3. insert a new order for customer 145

INSERT INTO t1 VALUES (14);
        
-- 4. Insert order line items

INSERT INTO t2(id,ref) VALUES('D',4);

-- 5. commit changes    
COMMIT;
```

![Imgur](https://i.imgur.com/8182P2s.png)

![Imgur](https://i.imgur.com/KNgbNGk.png)

ta thấy ở đây dữ liệu đã thay đổi. 




