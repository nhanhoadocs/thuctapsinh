# Bộ lọc Where
### **Hiển thị bảng sử dụng bộ lọc**
- Để lọc ra 1 dòng ( 1 **record** ) , có thể sử dụng công thức `SELECT` kết hợp với `WHERE` .
- **VD :**
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM new_table WHERE name = 'Ngo Quoc Cuong'")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    (49, 'Ngo Quoc Cuong')
    ```
### **Bộ lọc sử dụng wildcard**
- Có thể lọc kết quả bắt đầu , kết thúc hoặc bao gồm 1 ký tự hoặc 1 cụm từ cho trước .
- Sử dụng `%` để biểu diễn ký tự wildcard ( là phần ký tự không biết trước ) cùng với `LIKE` để lọc kết quả .
- **VD :**
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM new_table WHERE name LIKE '%Van%'")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    (1, 'Nguyen Van An')
    (159, 'Tran Van Hieu')
    (453, 'Nguyen Van Tuyen')
    ```
### **Phòng chống SQL Injection**
- Khi thực hiện truy vấn dữ liệu , nên tách riêng phần giá trị ra .
- Việc này là để phòng chống kỹ thuật **SQL Injection** , một công nghệ web hacking để lấy dữ liệu trong database .
- Module `mysql.connector` cung cấp phương thức để tách riêng phần giá trị :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "SELECT * FROM new_table WHERE name LIKE %s"
    val = ('%Van%', )
    mycursor.execute(sql, val)

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output :
    ```
    (1, 'Nguyen Van An')
    (159, 'Tran Van Hieu')
    (453, 'Nguyen Van Tuyen')
    ```