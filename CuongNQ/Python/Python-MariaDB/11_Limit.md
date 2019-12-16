# Giới hạn các kết quả trả về
- Có thể giới hạn số kết quả trả về từ lệnh truy vấn bằng công thức `LIMIT` .
- **VD1 :** Show 3 dòng đầu tiên của bảng :
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM new_table LIMIT 3")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output :
    ```sh
    (1, 'Nguyen Van Anh')       #1
    (3, 'Bui Thi Binh')         #2
    (49, 'Ngo Quoc Cuong')      #3
    ```
- Mặc định , sử dụng `LIMIT` sẽ trả về `n` dòng đầu tiên của bảng . Tuy nhiên , nếu muốn trả về `n` dòng tính từ sau dòng cụ thể nào đó , có thể sử dụng thêm từ khóa `OFFSET` .
- **VD2 :** Show 3 dòng của bảng tính từ dòng thứ 3 :   
    ```py
    import mysql.connector as mariadb

    mydb = mariadb.connect(host='localhost', user='mariadb-user', password='P@ssw0rd', database='new_database')

    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM new_table LIMIT 3 OFFSET 2")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    ```
    => Output : kết quả sẽ hiển thị từ dòng sau dòng thứ 2 :
    ```sh
    (49, 'Ngo Quoc Cuong')      #3
    (159, 'Tran Van Hieu')      #4
    (471, 'Dinh Cong Hung')     #5
    ```