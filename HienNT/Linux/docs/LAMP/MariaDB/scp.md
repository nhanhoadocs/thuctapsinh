# Sử dụng SCP để chuyển file/folder giữa các hệ thống   

<img src ="../../../images/25 bai Linux/How-to-Use-SCP-Command-to-Transfer-Files-Folders-in-Linux.jpg">

## Contents  

## Chuẩn bị 
- 2 máy ảo sử dụng OS - CentOS 7. Trên mỗi máy cài đặt MySQL/MariaDB Server.  
- Tài khoản root hoặc tài khoản có quyền sudo để thực hiện việc chuyển file/folder.  
- Các thông số liên quan:  

<img src ="../../../images/25 bai Linux/chuanbi2.png">  

## Mô hình  

<img src ="../../../images/25 bai Linux/scp.png">  


## Nội dung  
### SCP là gì?  
SCP là viết tắt của `Secure Copy` là một ứng dụng sử dụng giao thức SSH thường dùng để sao chép dữ liệu từ máy Linux này sang máy Linux khác.  

### Cài đặt SCP trên Centos 7  
Thường thì SCP được cài đặt sẵn trên Linux, nếu chưa có sử dụng lệnh dưới để cài:  
```sh
yum install scp
```  

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
- Chuyển ngược lại dữ liệu từ Server về Client  
  ```sh
  scp /root/test.txt root@192.168.136.132:/var/test1.txt
  ```  
  




