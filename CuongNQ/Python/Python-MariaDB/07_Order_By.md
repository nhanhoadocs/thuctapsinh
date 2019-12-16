# Order By
### **Sắp xếp kết quả**
- Sử dụng công thức `ORDER BY` để sắp xếp các kết quả theo thứ tự tăng dần hoặc giảm dần .
- Khi sử dụng `ORDER BY` , mặc định thứ tự sắp xếp kết quả là tăng dần . Để sắp xếp theo chiều giảm dần , sử dụng từ khóa `DESC` ( *descendant* ).
- **VD1 :** Sắp xếp kết quả theo chiều tăng dần ( sử dụng `ORDER BY` ) :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "SELECT * FROM new_table ORDER BY name"
    mycursor.execute(sql)

    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    (3, 'Bui Thi Binh')
    (471, 'Dinh Cong Hung')
    (49, 'Ngo Quoc Cuong')
    (1, 'Nguyen Van An')
    (453, 'Nguyen Van Tuyen')
    (159, 'Tran Van Hieu')
    ```
- **VD2 :** Sắp xếp kết quả theo chiều giảm dần ( sử dụng `ORDER BY` - `DESC` ) :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "SELECT * FROM new_table ORDER BY name DESC"
    mycursor.execute(sql)

    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    (159, 'Tran Van Hieu')
    (453, 'Nguyen Van Tuyen')
    (1, 'Nguyen Van An')
    (49, 'Ngo Quoc Cuong')
    (471, 'Dinh Cong Hung')
    (3, 'Bui Thi Binh')
    ```