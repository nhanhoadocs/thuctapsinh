## Mariabackup Overview
- Mariabackup được phát hành lần đầu tiên trong MariaDB 10.1.23 và MariaDB 10.2.7. Nó được phát hành lần đầu dưới dạng GA trong MariaDB 10.1.26 và MariaDB 10.2.10.

- Mariabackup là một công cụ nguồn mở được cung cấp bởi MariaDB để thực hiện sao lưu trực tuyến vật lý các bảng InnoDB, Aria và MyISAM. Đối với InnoDB, có thể sao lưu "hot online". Mariabackup được fork từ Percona XtraBackup 2.3.8. Nó có sẵn trên Linux và Windows.

## Các tính năng độc quyền hỗ trợ trên Mariabackup

### Các tính năng được hỗ trợ  
- Mariabackup hỗ trợ tất cả các tính năng chính của Percona XtraBackup 2.3.8, cùng với:

  - Sao lưu/khôi phục các bảng sử dụng [Data-at-Rest Encryption](https://mariadb.com/kb/en/library/data-at-rest-encryption-overview/).
  - Sao lưu/khôi phục các bảng sử dụng [InnoDB Page Compression]().
  - [mariabackup SST method](https://mariadb.com/kb/en/mariabackup-sst-method/) với Galera Cluster.
  - Hỗ trợ Microsoft Windows.
  - Sao lưu/khôi phục các bảng sử dụng công cụ lưu trữ [MyRocks](https://mariadb.com/kb/en/library/myrocks/) bắt đầu với MariaDB 10.2.16 và MariaDB 10.3.8.

### Các tính năng hỗ trợ trong MariaDB Enterprise Backup

MariaDB Enterprise Backup hỗ trợ một số tính năng bổ sung, như:

- Giảm thiểu các khóa trong quá trình sao lưu để cho phép đồng thời nhiều hơn và cho phép sao lưu nhanh hơn.

  - Điều này phụ thuộc vào việc sử dụng các lệnh [BACKUP STAGE](https://mariadb.com/kb/en/library/backup-stage/) và ghi nhật ký DDL.

  - Điều này bao gồm không khóa trong giai đoạn sao chép các câu lệnh [ALTER TABLE](https://mariadb.com/kb/en/alter-table/), có xu hướng là giai đoạn dài nhất trong các câu lệnh này.

- Cung cấp hỗ trợ sao lưu tối ưu cho tất cả các công cụ lưu trữ lưu trữ mọi thứ trên local disk.

### Sự khác biệt so với Percona XtraBackup

- Percona XtraBackup sao chép các tệp `InnoDB redo log` của mình vào tệp `xtrabackup_logfile`, trong khi Mariabackup sử dụng tệp `ib_logfile0`.

- Percona XtraBackup [libgcrypt-based encryption of backups](https://www.percona.com/doc/percona-xtrabackup/2.3/backup_scenarios/encrypted_backup.html) không được Mariabackup hỗ trợ.

- Không có liên kết tượng trưng từ Mariabackup đến [innobackupex](https://www.percona.com/doc/percona-xtrabackup/2.3/innobackupex/innobackupex_option_reference.html), như có cho [xtrabackup](https://www.percona.com/doc/percona-xtrabackup/2.3/xtrabackup_bin/xbk_option_reference.html). Thay vào đó, mariabackup có tùy chọn dòng lệnh `--innobackupex` để cho phép các tùy chọn tương thích với innobackupex.

- Các tùy chọn `--compact` và `--rebuild_indexes` không được hỗ trợ.

- Hỗ trợ cho `--stream=tar` bị xóa khỏi Mariabackup từ MariaDB 10.1.24.

- Tiện ích `xbstream` được đổi tên thành `mbstream`. Tuy nhiên, để chọn định dạng đầu ra này khi tạo bản sao lưu, tùy chọn `--stream` của Mariabackup vẫn yêu cầu giá trị `xbstream`.

- Mariabackup không hỗ trợ `lockless binlog`.

### Sự khác nhau trong các phiên bản phát hành  

- Mỗi Percona XtraBackup có 2 version numbers: Percona XtraBackup version number và version number của bản phát hành MySQL Server. Ví dụ:  

  ```sh
    xtrabackup version 2.2.8 based on MySQL server 5.6.22
  ```  

- Mỗi bản phát hành Mariabackup chỉ có một version number và nó giống với version number của bản phát hành MariaDB Server mà nó dựa trên. Ví dụ:

  ```sh
    mariabackup based on MariaDB server 10.2.15-MariaDB Linux (x86_64)
  ```  

### Ưu điểm  

Ưu điểm: Tốc độ backup/restore nhanh

### Nhược điểm


## Cài đặt Mariabackup  

- Cài đặt trên Linux:  

  - Cài đặt cùng `yum/dnf`

    ```sh
      sudo yum install MariaDB-backup -y
    ```

  - Cài đặt cùng `apt-get`

    ```sh
      sudo apt-get install mariadb-backup -y
    ```  

  - Cài đặt cùng `zypper`
    
    ```sh
      sudo zypper install MariaDB-backup
    ```

- [Cài đặt trên Windows](https://mariadb.com/kb/en/library/installing-mariadb-msi-packages-on-windows/)  

## Sử dụng Mariabackup  

Câu lệnh:

  ```sh
    mariabackup <options>
  ```  
  



