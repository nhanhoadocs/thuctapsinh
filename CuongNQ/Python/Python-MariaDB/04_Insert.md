# Insert into Table
### **Insert dữ liệu vào bảng**
- Để insert dữ liệu vào bảng , sử dụng cấu trúc `INSERT INTO` .
- **VD :** Insert dữ liệu vào bảng `new_table` trong database `new_database` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()

    sql = "INSERT INTO new_table (id, name) VALUES (%s, %s)"
    val = ("049", "Ngo Quoc Cuong")
    mycursor.execute(sql, val)

    mydb.commit()

    print(mycursor.rowcount, "record inserted.")
    ```
    => Output :
    ```
    1 record inserted.
    ```
    => Show bảng :

    <img src=https://i.imgur.com/nJLez1f.png>

>  Hàm `commit()` là bắt buộc để thực hiện thay đổi với bảng .

> Phương thức `rowcount` để đếm số hàng được thêm vào .

### **Insert nhiều dòng dữ liệu vào bảng**
- Để insert nhiều dòng dữ liệu vào bảng , sử dụng phương thức `executemany()` .
- Tham số thứ 2 được đưa vào phương thức `executemany()` là **list** hoặc **tuple** , chứa dữ liệu cần insert :
- **VD :** Insert nhiều dòng dữ liệu vào bảng `new_table` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()

    sql = "INSERT INTO new_table (id, name) VALUES (%s, %s)"
    val = [
        ('471', 'Dinh Cong Hung'),
        ('159', 'Tran Van Hieu'),
        ('01', 'Nguyen Van An'),
        ('453', 'Nguyen Van Tuyen')
    ]

    mycursor.executemany(sql, val)

    mydb.commit()

    print(mycursor.rowcount, "was inserted.")
    ```
    => Output :
    ```
    4 was inserted.
    ```
    => Show bảng :

    <img src=https://i.imgur.com/C3NNEhN.png>

### **Lấy ID của dòng vừa thêm vào**
- Có thể lấy ID của dòng vừa insert bằng phương thức `lastrowid` .
- Nếu insert nhiều dòng , phương thức `lastrowid` cũng chỉ trả về ID của dòng được insert cuối cùng .
- **VD :**
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()

    sql = "INSERT INTO new_table (id, name) VALUES (%s, %s)"
    val = ("03", "Bui Thi Binh")

    mycursor.execute(sql, val)

    mydb.commit()

    print("1 record inserted, ID:", mycursor.lastrowid)
    ```
    => Output :
    ```
    1 record inserted, ID: 3
    ```