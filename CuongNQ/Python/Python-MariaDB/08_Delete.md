# Xóa bản ghi
- Có thể xóa bản ghi trong bảng bằng cách sử dụng công thức `DELETE FROM` .
- **VD :** Xóa dòng trong cột `name` có giá trị là "`Nguyen Van Tuyen`"
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    sql = "DELETE FROM new_table WHERE name = 'Nguyen Van Tuyen'"
    mycursor.execute(sql)

    mydb.commit()

    print(mycursor.rowcount, "record(s) deleted.")
    ```
    => Output :
    ```
    1 record(s) deleted.
    ```
    => Show bảng :

    <img src=https://i.imgur.com/TbZ2x2x.png>
> Chú ý : Cần có phương thức `commit()` để thực hiện thay đổi
