# Lệnh `sysbench`

## Cài đặt
**CentOS:**
```
yum -y install epel-release
yum -y update
yum -y install sysbench
```

**Ubuntu:**
```
apt update
apt -y install sysbench
```

## Bench CPU


## Bench MySQL
- Tạo db : `sysbench`

- Dùng lệnh sau để tạo 1000000 bản ghi
    ```
    sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-host=localhost --mysql-port=3306 --mysql-user=root --mysql-password='thuctap@2020' --mysql-db=sysbench --db-driver=mysql --tables=1 --table-size=1000000  prepare
    ```

    Trong đó:
    - `--mysql-user` : user sử dụng mysql
    - `--mysql-password` : password của user
    - `--tables` : Số bảng tạo
    - `--table-size` : Số bản ghi trong 1 bảng

- Kiểm tra DB vừa tạo
    ```sql
    mysql -u root -p
    > use sysbench
    > show table status like 'sbtest%' \G;
    ```

    OUTPUT
    ```sql
    *************************** 1. row ***************************
            Name: sbtest1
            Engine: InnoDB
            Version: 10
        Row_format: Compact
            Rows: 1000109
    Avg_row_length: 225
        Create_time: 2020-05-13 14:35:11
        Update_time: NULL
        Check_time: NULL
        Collation: latin1_swedish_ci
        Checksum: NULL
    Create_options:
            Comment:
    *************************** 2. row ***************************
            Name: sbtest2
            Engine: InnoDB
            Version: 10
        Row_format: Compact
            Rows: 1000109
    Avg_row_length: 225
        Data_length: 225132544
    Max_data_length: 0
    Index_length: 14172160
        Data_free: 10485760
    Auto_increment: 1000001
        Create_time: 2020-05-13 14:35:35
        Update_time: NULL
        Check_time: NULL
        Collation: latin1_swedish_ci
        Checksum: NULL
    Create_options:
            Comment:
    2 rows in set (0.01 sec)

    ERROR: No query specified
    ```

- Đẩy tải MySQL: 
    ```
    sysbench /usr/share/sysbench/select_random_points.lua --table-size=2000000 --num-threads=100 --rand-type=uniform --db-driver=mysql --mysql-db=sysbench --mysql-user=root --mysql-password=thuctap@2020 --time=30 run
    ```

- Đừng quên làm sạch DB sau khi test xong
    ```
    sysbench /usr/share/sysbench/oltp_read_write.lua --db-driver=mysql --mysql-db=sysbench --mysql-user=root --mysql-password='thuctap@2020' --tables=1 cleanup
    ```

    **Lưu ý:** Lệnh trên chỉ xóa các bảng, muốn xóa db cần thực hiện thủ công.