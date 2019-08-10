# Sử dụng SCP để chuyển file/folder giữa các hệ thống   

<img src ="../../../images\25 bai linux\How-to-Use-SCP-Command-to-Transfer-Files-Folders-in-Linux.jpg">

## Contents  
- [Chuẩn bị](/1)
- [Mô hình](/2)  
- [Nội dung](/3)  
  - [SCP là gì?](/4)
  - [Cài đặt SCP trên CentOS 7](/5)  
  - [Lệnh cơ bản](/6)  
  - [Một số tùy chọn khác](/7)  
  - [Khôi phục dữ liệu được backup qua SSH ](/8)


<a name ="1"></a>

## Chuẩn bị 
- 2 máy ảo sử dụng OS - CentOS 7. Trên mỗi máy cài đặt MySQL/MariaDB Server.  
- Tài khoản root hoặc tài khoản có quyền sudo để thực hiện việc chuyển file/folder.  
- Các thông số liên quan:  

<img src ="../../../images/25 bai linux/chuanbi2.png">  
<a name ="2"></a>

## Mô hình  

<img src ="../../../images/25 bai linux/scp.png">  

<a name ="3"></a>

## Nội dung  

<a name ="4"></a>

### SCP là gì?  
SCP là viết tắt của `Secure Copy` là một ứng dụng sử dụng giao thức SSH thường dùng để sao chép dữ liệu từ máy linux này sang máy linux khác.  

<a name ="5"></a>

### Cài đặt SCP trên Centos 7  
Thường thì SCP được cài đặt sẵn trên linux, nếu chưa có sử dụng lệnh dưới để cài:  
```sh
yum install scp
```  

<a name ="6"></a>

### Lệnh cơ bản  
- Cú pháp:  

  ```sh
  scp source_file username@destination_host:/destination_folder
  ```  

- ***Ví dụ:*** 

  - Chuyển file `b.txt` từ máy Client sang máy Server

    ```sh
    scp b.txt root@192.168.136.133:/root/testscp
    ```  

  - Chuyển nhiều file cùng lúc: 
    - Tạo 1 thư mục chứa các file được chuyển đến:  

      ```sh
      mkdir test
      ```

    - Sao chép file b.txt và file1 sang thư mục test vừa tạo ở máy Server: 

      ```sh
      thuyhien ~]# scp b.txt file1 root@192.168.136.133:/root/test
      ```  

  - Chuyển cả một thư mục, sử dụng tham số `-r` 

    ```sh
    scp -r /var/lib root@192.168.136.133:/root/test
    ```  

- Từ Client lấy dữ liệu từ Server về:  

  ```sh
  scp root@192.168.136.132:/var/test1.txt a.txt
  ```  

  Ý nghĩa: Lấy file test1.txt trên server 192.168.136.133 về và lưu lại trong file a.txt
  
- Tăng tốc độ truyền file  
  
  Sử dụng tùy chọn `c` để tăng tốc độ truyền để tiết kiệm thời gian và băng thông. Các tập tin được nén khi truyền và giải nén ở đích. 

  > Phương pháp nén sẽ không hoạt động khi tệp nguồn đã được nén. File có đuôi như .zip, .rar, pictures, và .iso sẽ không bị ảnh hưởng bởi tuỳ chọn C.

<a name ="7"></a>

### Một số tùy chọn khác:  

  `-p` - Cung cấp thời gian ước tính và tốc độ kết nối  
  `-l` - Hạn chế sử dụng băng thông tránh trường hợp scp chiếm toàn bộ băng thông có sẵn.  

  `-c` - Chọn một mật mã để mã hóa tập tin. heo mặc định scp sử dụng AES-128 để mã hóa tập tin. Cú pháp: 
  ```sh
  scp -c [loai_ma_ban_muon_dung] ....
  ```  
  `-P` - Chỉ định cổng cụ thể để sử dụng với SCP. Mặc định scp sử dụng cổng 22.  

  `-q` -  Vô hiệu hóa đồng hồ đo tiến độ và thông báo

<a name ="8"></a>

### Khôi phục dữ liệu được backup qua SSH  
- Câu lệnh:  
  ```sh
  mysql -u user -p -h host database_name < backupfile.sql
  ```

  - `user` - tên tài khoản bạn dùng để khôi phục dữ liệu  
  - `host` - phần hostname của tài khoản(%, localhost, IP)  
  - `database_name` - tên cơ cở dữ liệu bạn muốn khôi phục vào  
  - `backupfile.sql` - file dữ liệu đã sao lưu bạn dùng để khôi  phục.  

> Tài khoản dùng để khôi phục dữ liệu(user) phải có sẵn cơ sở dữ liệu (database_name) để khôi phục dữ liệu. Nếu trong database dùng để chứa database khôi phục thì dữ liệu sẽ được ghi tiếp chứ không ghi đè.  



