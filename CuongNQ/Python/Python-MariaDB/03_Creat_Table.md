# Working with Table
- Để làm việc với bảng , trước hết phải truy cập database :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')
    ```
### **Tạo bảng**
- Để tạo bảng trong **MariaDB** , sử dụng lệnh `CREATE DATABASE` .
- Khi tạo bảng , nên thêm cột **Primary Key** để đánh số cho các bản ghi . Sử dụng thuộc tính `INT AUTO_INCREMENT PRIMARY KEY` để đánh số cho từng bản ghi . Chúng sẽ bắt đầu từ 1 , và dần tăng lên 1 đơn vị
- **VD :** Tạo bảng `new_table` với 2 cột `id` ( *primary key* ) và `name` :
    ```py
    mycursor = mydb.cursor()

    mycursor.execute('CREATE TABLE new_table (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255))' )
    ```
    => Kết quả :
    
    <img src=https://i.imgur.com/qyVtCD9.png>

### **Show các bảng trong Database**
- Để hiển thị các bảng trong database , sử dụng lệnh `SHOW TABLES` .
- **VD :** Hiển thị các bảng trong database `new_database` :
    ```py
    mycursor = mydb.cursor()

    mycursor.execute('SHOW TABLES')

    for x in mycursor:
        print(x)
    ```
    => Output :
    ```
    ('new_table',)
    ```
### **Đổi tên bảng**
- Để đổi tên bảng trong database , sử dụng lệnh `RENAME TABLE <old_name> TO <new_name>` .
- **VD :** Đổi tên bảng `new_table` thành `NEW_TABLE` :
    ```py
    mycursor = mydb.cursor()

    mycursor.execute('RENAME TABLE new_table TO NEW_TABLE')
    ```
    => Kết quả :

    <img src=https://i.imgur.com/cWJszDR.png>

### **Xóa bảng**
- Để xóa bảng trong database , sử dụng lệnh `DROP TABLE <table_name>` .
- **VD :** Xóa bảng `NEW_TABLE` :
    ```py
    mycursor = mydb.cursor()

    mycursor.execute('DROP TABLE NEW_TABLE')
    ```
    => Kết quả :

    <img src=https://i.imgur.com/zVj8Vwg.png>

