# Lệnh sysbench

https://www.howtoforge.com/how-to-benchmark-your-system-cpu-file-io-mysql-with-sysbench

https://minervadb.com/index.php/2018/03/13/benchmarking-mysql-using-sysbench-1-1/

https://wiki.gentoo.org/wiki/Sysbench#Using_the_memory_workload

## 1. Cài đặt

Trên Ubuntu

    apt-get install sysbench -y

Trên Centos

    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
    yum -y install epel-release
    yum -y update
    yum install sysbench -y

## 2. CPU Benchmark

    sysbench --test=cpu --cpu-max-prime=20000 run

    [root@localhost ~]# sysbench --test=cpu --cpu-max-prime=20000 run
    WARNING: the --test option is deprecated. You can pass a script name or path on the command line without any options.
    sysbench 1.0.17 (using system LuaJIT 2.0.4)

    Running the test with following options:
    Number of threads: 1
    Initializing random number generator from current time


    Prime numbers limit: 20000

    Initializing worker threads...

    Threads started!

    CPU speed:
        events per second:   279.75

    General statistics:
        total time:                          10.0012s
        total number of events:              2799

    Latency (ms):
            min:                                    3.28
            avg:                                    3.57
            max:                                   11.95
            95th percentile:                        3.75
            sum:                                 9993.02

    Threads fairness:
        events (avg/stddev):           2799.0000/0.00
        execution time (avg/stddev):   9.9930/0.00

    [root@localhost ~]#

Bạn chú ý vào dòng `total time: 10.0012s`

## 3. File IO Benchmark

Tạo 1 file lớn hơn nhiều so với RAM

    sysbench --test=fileio --file-total-size=150G prepare

Chạy benchmark

    sysbench --test=fileio --file-total-size=150G --file-test-mode=rndrw --init-rng=on --max-time=300 --max-requests=0 run

Dòng bạn cần quan tâm là `Read 9.375Mb  Written 6.25Mb  Total transferred 15.625Mb  (53.316Kb/sec)`

Xóa file 150 GB đã tạo

    sysbench --test=fileio --file-total-size=150G cleanup

## 4. Mysql Benchmark

Tạo db tên `sysbench` trong mysql

Dùng lệnh sau để tạo 1000000 bản ghi

    sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-host=localhost --mysql-port=3306 --mysql-user=root --mysql-password='thuctap@2020' --mysql-db=sysbench --db-driver=mysql --tables=2 --table-size=1000000  prepare

    [root@localhost ~]# sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-host=localhost --mysql-port=3306 --mysql-user=root --mysql-password='password' --mysql-db=sysbench --db-driver=mysql --tables=2 --table-size=1000000  prepare
    sysbench 1.0.17 (using system LuaJIT 2.0.4)

    Creating table 'sbtest1'...
    Inserting 1000000 records into 'sbtest1'
    Creating a secondary index on 'sbtest1'...
    Creating table 'sbtest2'...
    Inserting 1000000 records into 'sbtest2'
    Creating a secondary index on 'sbtest2'...
    [root@localhost ~]#

Trong đó:

- `--mysql-user` : user sử dụng mysql
- `--mysql-password` : password của user
- `--tables` : Số bảng tạo
- `--table-size` : Số bản ghi trong 1 bảng

Kiểm tra DB vừa tạo

    mysql -u root -p
    > use sysbench;
    > show table status like 'sbtest%' \G;

    mysql> show table status like 'sbtest%' \G;
    *************************** 1. row ***************************
            Name: sbtest1
            Engine: InnoDB
            Version: 10
        Row_format: Compact
            Rows: 987448
    Avg_row_length: 209
        Data_length: 207290368
    Max_data_length: 0
    Index_length: 14172160
        Data_free: 0
    Auto_increment: 1000001
        Create_time: 2020-05-13 16:55:39
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
            Rows: 986400
    Avg_row_length: 228
        Data_length: 225132544
    Max_data_length: 0
    Index_length: 14172160
        Data_free: 0
    Auto_increment: 1000001
        Create_time: 2020-05-13 16:56:06
        Update_time: NULL
        Check_time: NULL
        Collation: latin1_swedish_ci
        Checksum: NULL
    Create_options:
            Comment:
    2 rows in set (0.00 sec)

    ERROR:
    No query specified

Đẩy tải MySQL:

    sysbench /usr/share/sysbench/select_random_points.lua --table-size=2000000 --num-threads=100 --rand-type=uniform --db-driver=mysql --mysql-db=sysbench --mysql-user=root --mysql-password=thuctap@2020 --time=30 run

    [root@localhost ~]# sysbench /usr/share/sysbench/select_random_points.lua --table-size=2000000 --num-threads=100 --rand-type=uniform --db-driver=mysql --mysql-db=sysbench --mysql-user=root --mysql-password=password run
    WARNING: --num-threads is deprecated, use --threads instead
    sysbench 1.0.17 (using system LuaJIT 2.0.4)

    Running the test with following options:
    Number of threads: 100
    Initializing random number generator from current time


    Initializing worker threads...

    Threads started!

    SQL statistics:
        queries performed:
            read:                            82667
            write:                           0
            other:                           0
            total:                           82667
        transactions:                        82667  (8218.14 per sec.)
        queries:                             82667  (8218.14 per sec.)
        ignored errors:                      0      (0.00 per sec.)
        reconnects:                          0      (0.00 per sec.)

    General statistics:
        total time:                          10.0569s
        total number of events:              82667

    Latency (ms):
            min:                                    0.15
            avg:                                   12.11
            max:                                 1714.04
            95th percentile:                       22.69
            sum:                              1001460.17

    Threads fairness:
        events (avg/stddev):           826.6700/277.16
        execution time (avg/stddev):   10.0146/0.01

    [root@localhost ~]#

Thông số bạn cần quan tâm là `transactions: 82667 (8218.14 per sec.)`

Làm sạch DB sau khi test xong

    sysbench /usr/share/sysbench/oltp_read_write.lua --db-driver=mysql --mysql-db=sysbench --mysql-user=root --mysql-password='thuctap@2020' --tables=1 cleanup

Lệnh sysbench chỉ xóa table chứ không xóa database. Để ý xóa các table

## Benchmark RAM

Dùng lệnh:

    sysbench --test=memory --num-threads=4 run

Output mẫu:
```
[root@localhost ~]# sysbench --test=memory --num-threads=4 run
WARNING: the --test option is deprecated. You can pass a script name or path on the command line without any options.
WARNING: --num-threads is deprecated, use --threads instead
sysbench 1.0.17 (using system LuaJIT 2.0.4)

Running the test with following options:
Number of threads: 4
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 1KiB
  total size: 102400MiB
  operation: write
  scope: global

Initializing worker threads...

Threads started!

Total operations: 47007331 (4699425.66 per second)

45905.60 MiB transferred (4589.28 MiB/sec)


General statistics:
    total time:                          10.0006s
    total number of events:              47007331

Latency (ms):
         min:                                    0.00
         avg:                                    0.00
         max:                                   22.02
         95th percentile:                        0.00
         sum:                                19982.18

Threads fairness:
    events (avg/stddev):           11751832.7500/122424.02
    execution time (avg/stddev):   4.9955/0.08

[root@localhost ~]#
```
Bạn cần chú ý đến dòng:

`Total operations: 47007331 (4699425.66 per second)`

`45905.60 MiB transferred (4589.28 MiB/sec)`