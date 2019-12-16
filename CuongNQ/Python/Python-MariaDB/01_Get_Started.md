# Python MariaDB
- **Python** có thể được sử dụng trong các ứng dụng cơ sở dữ liệu .
- Một trong những cơ sở dữ liệu phổ biến nhất là **MariaDB** .
- Để kết nối được **Python** với **MariaDB** , trước hết cần :
    - Cài đặt **MariaDB** :

        <img src=https://i.imgur.com/eESiBGz.png>

    - Cài đặt **Python** :

        <img src=https://i.imgur.com/fJTukiy.png>

    - Cài đặt `pip` :

        <img src=https://i.imgur.com/v0OwTuA.png>

### **Cài đặt MySQL Driver**
- **Python** cần cài đặt **MySQL driver** để truy cập cơ sở dữ liệu **MariaDB** .
    ```sh
    $ pip3 install mysql-connector-python
    ```
- Kiểm tra :
    ```
    >>> import mysql.connector
    ```
    => Nếu thực hiện lệnh này trong pyshell mà không bị lỗi thì đã cài đặt thành công 

### **Tạo kết nối với MariaDB**
- Sử dụng username và password có quyền truy cập Databases để tạo kết nối .
- **VD :**
    ```py
    # demo_mariadb_connection
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='root', password='P@ssw0rd')

    print(mydb)
    ```
    => Output
    ```
    <mysql.connector.connection_cext.CMySQLConnection object at 0x7f52f73c56d8>
    ```