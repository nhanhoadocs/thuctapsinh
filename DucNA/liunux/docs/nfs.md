# 1. Khái niệm 
- NFS: là network file system là dịch vụ chia sẻ file trong một môi trường mạng giữa các máy tính linux với nhau 
- Cần làm được việc này thì sẽ phải có hai máy chạy hệ điều hành linux một máy đóng vai trò là server một máy đóng vai trò client 
# 2. Cách cài đặt 
- Đối với hệ thống centos thì ta dùng lệnh 
```
yum install nfs-utils nfs-utils-lib
```
# 3. Thực hành
- Ví dụ: ở đây sẽ thực hiện ví dụ là hai máy sử dụng hệ điều hành linux và dùng chung một mạng ở đây sẽ cài đặt một máy là server và một máy là client
    - IP server: 192.168.54.129/24
    - IP client: 172.16.2.124/20
    - Kiểm tra hai máy đã cài đặt xong gói NFS
- Trên máy tính server 
    - Kiểm tra và xác định những thư mục ta muốn chia sẻ với client. Rồi ta chia sẻ bằng cách sửa file `/etc/exports` bằng trình soạn thảo vi 
    ```
    [root@localhost ~]# vi /etc/exports
    ```
    - Cấu trúc để cài đặt thư mục và file chia sẻ là 
    ```
    (đường dẫn tuyệt đối đến thư mục)   (IP-client)(quyền)
    ```
    - Để có thể sử dụng được dịch vụ NFS có thể gửi và nhận yêu cầu từ phía client và server ta cần khởi động dịnh vụ `nfs`.
    - Khởi động dịch vụ nsf
    ```
    [root@localhost ~]# service nfs start
    Redirecting to /bin/systemctl start nfs.service
    ```
    - Để có thể để các client cùng truy cập vào server thì máy server cần tắt tường lửa
    ```
    [root@localhost ~]# systemctl stop firewalld 
    [root@localhost ~]# systemctl status firewalld
    firewalld.service - firewalld - dynamic firewall daemon
    Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
    Active: inactive (dead) since T2 2018-11-26 11:49:43 +07; 14s ago
     Docs: man:firewalld(1)
    Process: 676 ExecStart=/usr/sbin/firewalld --nofork --nopid $FIREWALLD_ARGS (code=exited, status=0/SUCCESS)
    Main PID: 676 (code=exited, status=0/SUCCESS)

    Th11 26 08:31:36 localhost.localdomain systemd[1]: Starting firewalld...
    Th11 26 08:31:38 localhost.localdomain systemd[1]: Started firewalld ...
    Th11 26 11:49:43 localhost.localdomain systemd[1]: Stopping firewalld...
    Th11 26 11:49:43 localhost.localdomain systemd[1]: Stopped firewalld ...
    Hint: Some lines were ellipsized, use -l to show in full.
    ```
- Trên máy client 
    - Sau khi cài dịch vụ nfs trên máy client thì ta cần kiểm tra file được chia sẻ cho các client ở trên server 
    - Cấu trúc lệnh 
    ```
    anhduc@anhduc:~$ showmount -e 192.168.54.129
    Export list for 192.168.54.129:
    /root/test 172.16.2.124/20
    ```
    - Bây giờ để có thể vào được thư mục được chia sẻ và sử dụng thì máy client cần `mount` nó vào trong hệ thống thư mục của bản thân. Ta cần tạo thư mục để `mount` thư mục được chia sẻ vào 
    ```
    anhduc@anhduc:~$ mkdir nfs
    ```
    - Sử dụng lệnh mount
    ```
    mount 192.168.54.129:/root/test nfs
    ```
    - Sau khi mount xong ta đã có thể sử dụng được thư mục mà được server chia sẻ 



    