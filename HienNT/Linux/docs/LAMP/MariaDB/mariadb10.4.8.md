- Cài đặt mặc định:
  ```sh
    # yum install -y mariadb-server
  ```
- Cài đặt qua repo
  ```sh
    #tee /etc/yum.repos.d/MariaDB.repo<<EOF
    # mariadb.repo 10.4.8
    [mariadb]
    name=mariadb repo
    baseurl=https://yum.mariadb.org/10.4.8/centos7-amd64/
    gpgcheck=0
    enabled=1
  ```

    >Lỗi: File contains parsing errors:   
    Nguyên nhân: sai cú pháp 
    Fix: chú ý khoảng trắng ở đầu các dòng trong file `/etc/yum.repos.d/MariaDB.repo`

  - Kiểm tra:
    ```sh
      # yum info mariadb-server
    ```
  - Gỡ cài đặt version cũ:
    ```sh
      # yum erase mysql
      # rm -rf /var/lib/mysql
      # rm -rf /etc/my.cnf
    ```
  - Cài đặt MariaDB 10.4.8
    ```sh
      # yum -y install MariaDB-server
    ```

- Thiết lập cấu hình bảo mật cơ bản
  ```sh
    #mysql_secure_installation
  ```
  >Lỗi: ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2) 

  *Nguyên nhân:* MariaDB không hoạt động hoặc /var/lib/mysql/mysql.sock không tồn tại.  
  *Fix:*   
    - Chỉnh sửa file `/etc/my.cnf` và thêm vào:
      ```sh
        [mysqld]
        socket=/var/lib/mysql/mysql.sock
        [client]
        socket=/var/lib/mysql/mysql.sock
      ```
    - restart:
      ```sh
        # systemctl restart mariadb
      ```
    Trong 1 vài trường hợp file mysql.socket có thể nằm ở 1 thư mục khác, bạn có thể tìm kiếm file này bằng câu lệnh:
    ```sh
      # find / -name mysql.sock
    ```
    Sau đó, symlink nó:
    ```sh
      #ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock  #ví dụ tìm thấy file mysql.sock trong thư mục /tmp 
    ```







