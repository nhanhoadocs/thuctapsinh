# Drop Table
### **Xóa bảng**
- Có thể xóa bảng bằng cách sử dụng công thức `DROP TABLE` .
- **VD :** Xóa bảng `new_table` của database `new_database` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "DROP TABLE new_table"
    mycursor.execute(sql)
    ```
### **Xóa bảng chỉ khi bảng tồn tại**
- Nếu bảng muốn xóa đã bị xóa rồi , hoặc vì lí do nào đó mà nó không tồn tại , có thể sử dụng từ khóa `IF EXISTS` để tránh gây ra lỗi "bảng không tồn tại" .
- **VD :** Xóa bảng `new_table` của database `new_database` :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "DROP TABLE IF EXISTS new_table"
    mycursor.execute(sql)
    ```