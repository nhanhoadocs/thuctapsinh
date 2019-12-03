# Update dữ liệu vào bảng
- Có thể update nội dung của hàng ( hay **record** ) bằng cách sử dụng công thức `UPDATE` .
- **VD :**
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "UPDATE new_table SET name = %s WHERE name = %s"
    val = ("Nguyen Van Anh", "Nguyen Van An")
    mycursor.execute(sql, val)

    mydb.commit()

    print(mycursor.rowcount, "record(s) affected.")
    ```
    => Output :
    ```
    1 record(s) affected.
    ```
    => Show table :

    <img src=https://i.imgur.com/JQi3UpQ.png>

> Chú ý : Sử dụng phương thức `commit()` để thực hiện thay đổi .