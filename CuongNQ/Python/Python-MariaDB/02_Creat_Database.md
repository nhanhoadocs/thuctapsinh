# Working with Database
### **Tạo Database**
- Để tạo database trong **MariaDB** , sử dụng lệnh `CREATE DATABASE` .
- **VD :** Tạo 1 database mới với tên là `new_database` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd')

    mycursor = mydb.cursor()

    mycursor.execute("CREATE DATABASE new_database")
    ```
    => Kết quả :
    
    <img src=https://i.imgur.com/e7YjAQQ.png>

### **Show các Database**
- Để hiển thị các database đang tồn tại , sử dụng lệnh `SHOW DATABASE` .
- **VD :** Hiển thị các database trong server :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd')

    mycursor = mydb.cursor()

    mycursor.execute("SHOW DATABASE")

    for x in mycursor:
        print(x)
    ```
    => Output :
    ```
    ('information_schema',)
    ('mysql',)
    ('new_database',)
    ('performance_schema',)
    ```
### **Truy cập Database để làm việc**
- **VD1 :** Truy cập database `new_database` vừa tạo :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')
    ```
- **VD2 :** Đồng thời tạo database và truy cập database vừa tạo :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd')

    mycursor = mydb.cursor()

    mycursor.execute("CREATE DATABASE new_database")
    mydb.close()

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')
    ```
### **Đổi tên Database**(`*`)
- Để đổi tên một database , sử dụng lệnh `RENAME DATABASE <old_name> TO <new_name>`
- **VD :** Đổi tên database `new_database` thành `NEW_DATABASE` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd')

    mycursor = mydb.cursor()

    mycursor.execute('RENAME DATABASE new_database TO NEW_DATABASE')
    ```
    => Kết quả :
### **Xóa Database**
- Để xóa một database , sử dụng lệnh `DROP DATABASE <database_name>` .
- **VD :** Xóa database `new_database` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd')

    mycursor = mydb.cursor()

    mycursor.execute('DROP DATABASE new_database')
    ```
    => Kết quả :

    <img src=https://i.imgur.com/kMA9dcU.png>

