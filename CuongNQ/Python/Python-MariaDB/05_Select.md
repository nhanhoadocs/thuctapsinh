# Select from a Table
### **Xem dữ liệu theo bảng**
- Để xem dữ liệu từ bảng trong MariaDB , sử dụng công thức `SELECT` .
- **VD :** Xem dữ liệu từ bảng `new_table` của database `new_database` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM new_table")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    (1, 'Nguyen Van An')
    (3, 'Bui Thi Binh')
    (49, 'Ngo Quoc Cuong')
    (159, 'Tran Van Hieu')
    (453, 'Nguyen Van Tuyen')
    (471, 'Dinh Cong Hung')
    ```
> Phương thức `fetchall()` sẽ lấy về tất cả các dòng của bảng , mỗi dòng được biểu diễn dưới dạng 1 **tuple** .
### **Xem dữ liệu theo cột của bảng**
- Để xem chỉ một vài cột trong bảng , sử dụng cấu trúc `SELECT` đi kem với tên các cột cần xem .
- **VD :** Xem cột `name` của bảng `new_table` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT name FROM new_table")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    ('Nguyen Van An',)
    ('Bui Thi Binh',)
    ('Ngo Quoc Cuong',)
    ('Tran Van Hieu',)
    ('Nguyen Van Tuyen',)
    ('Dinh Cong Hung',)
    ```
### **Phương thức `fetchone()`**
- Để xem hàng trong bảng , sử dụng phương thức `fetchone()` .
- Phương thức `fetchone()` sẽ trả về hàng đầu tiên trong bảng .
- **VD :**
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM new_table")

    myresult = mycursor.fetchone()
    print(myresult)
    ```
    => Output :
    ```
    (1, 'Nguyen Van An')
    ```