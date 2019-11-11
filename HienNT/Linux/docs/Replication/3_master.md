# Hướng dẫn cấu hình MariaDB Replication 3 Master

## Kế hoạch IP  

## Trên Master-1  

- Sử dụng root user đăng nhập vào MariaDB để tạo datataojta tạo user và gán quyền cho user.

  ```sh
    create database replica_db;
    create user 'slave'@'10.10.22.104' identified by 'abc@123';
    create user 'slave'@'10.10.22.105' identified by 'abc@123';
    grant replication slave on *.* to 'slave'@'10.10.22.104' identified by 'abc@123';
    grant replication slave on *.* to 'slave'@'10.10.22.105' identified by 'abc@123';
  ```

- Chỉnh sửa file `/etc/my.cnf.d/mariadb-server.cnf`

  ```sh
    vi /etc/my.cnf.d/mariadb-server.cnf
  ```

  Và thêm vào đoạn dưới

  ```sh
    [mariadb]
    server-id=1
    log_bin=master
    binlog_format=row
    binlog_do_db=replica_db
  ```

- Restart lại MariaDB để nhận cấu hình mới

  ```sh
    systemctl restart mariadb
  ```

- Dump csdl và chuyển csdl ddwwojc dump sang server 2 và server 3.

  ```sh
    mysqldump --all-databases --user=root --password --master-data > masterdatabase.sql
    scp masterdatabase.sql root@10.10.22.104:/root/masterdatabase.sql
    scp masterdatabase.sql root@10.10.22.105:/root/masterdatabase.sql
  ```

- Kiểm tra trạng thái của Master 1

  ```sh
    show master status;
  ```

## Trên Master-2

- Sử dụng root user đăng nhập vào MariaDB để tạo datataojta tạo user và gán quyền cho user.
  
  ```sh
    create database test;
    create user 'slave'@'10.10.22.103' identified by 'abc@123';
    create user 'slave'@'10.10.22.105' identified by 'abc@123';
    grant replication slave on *.* to 'slave'@'10.10.22.103' identified by 'abc@123';
    grant replication slave on *.* to 'slave'@'10.10.22.105' identified by 'abc@123';
  ```

- Chỉnh sửa file `/etc/my.cnf.d/mariadb-server.cnf`

  ```sh
    vi /etc/my.cnf.d/mariadb-server.cnf
  ```

  Và thêm vào đoạn dưới

  ```sh
    [mariadb]
    server-id=2
    log_bin=master
    binlog_format=row
    binlog_do_db=test
  ```

- Restart lại MariaDB để nhận cấu hình mới

  ```sh
    systemctl restart mariadb
  ```

- Dump csdl và chuyển csdl ddwwojc dump sang server 2 và server 3.

  ```sh
    mysqldump --all-databases --user=root --password --master-data > masterdatabase.sql2
    scp masterdatabase.sql2 root@10.10.22.103:/root/masterdatabase.sql2
    scp masterdatabase.sql2 root@10.10.22.105:/root/masterdatabase.sql2
  ```

- Kiểm tra trạng thái của Master 1

  ```sh
    show master status;
  ```

## Trên Master-3

  ```sh
    create database demo;
    create user 'slave'@'10.10.22.103' identified by 'abc@123';
    create user 'slave'@'10.10.22.104' identified by 'abc@123';
    grant replication slave on *.* to 'slave'@'10.10.22.103' identified by 'abc@123';
    grant replication slave on *.* to 'slave'@'10.10.22.104' identified by 'abc@123';
  ```

  ```sh
    vi /etc/my.cnf.d/mariadb-server.cnf
    [mariadb]
    server-id=3
    log_bin=master
    binlog_format=row
    binlog_do_db=demo
  ```

  ```sh
    systemctl restart mariadb
    mysqldump --all-databases --user=root --password --master-data > masterdatabase.sql3
    scp masterdatabase.sql3 root@10.10.22.103:/root/masterdatabase.sql3
    scp masterdatabase.sql3 root@10.10.22.104:/root/masterdatabase.sql3
  ```

  ```sh
    show master status;
  ```

## Trên Master-1

  ```sh
    change master 'master-2' to master_host='10.10.22.104', master_user='slave', master_password='abc@123', master_log_file='master.000001', master_log_pos=325;

    change master 'master-3' to master_host='10.10.22.105', master_user='slave', master_password='abc@123', master_log_file='master.000001', master_log_pos=325;
  ```  

## Trên Master-2

  ```sh
    change master 'master-1' to master_host='10.10.22.103', master_user='slave', master_password='abc@123', master_log_file='master.000001', master_log_pos=325;

    change master 'master-3' to master_host='10.10.22.105', master_user='slave', master_password='abc@123', master_log_file='master.000001', master_log_pos=325;
  ```

## Trên Master-3

  ```sh
    change master 'master-1' to master_host='10.10.22.103', master_user='slave', master_password='abc@123', master_log_file='master.000001', master_log_pos=325;

    change master 'master-2' to master_host='10.10.22.104', master_user='slave', master_password='abc@123', master_log_file='master.000001', master_log_pos=325;
  ```

## Trên Master-1

  ```sh
    mysql -u root -p < /root/masterdatabase.sql2
    mysql -u root -p < /root/masterdatabase.sql3
  ```

  ```sh
    start slave 'master-2';
    start slave 'master-3';
  ```

## Trên Master-2

  ```sh
    mysql -u root -p < /root/masterdatabase.sql
    mysql -u root -p < /root/masterdatabase.sql3
  ```

  ```sh
    start slave 'master-1';
    start slave 'master-3';
  ```

## Trên Master-3

  ```sh
    mysql -u root -p < /root/masterdatabase.sql
    mysql -u root -p < /root/masterdatabase.sql2
  ```

  ```sh
    start slave 'master-1';
    start slave 'master-2';
  ```



