# NFS  

- NFS – Network File System là dịch vụ chia sẻ file trong môi trường network giữa các server Linux.  Dịch vụ NFS cho phép các NFS client mount một phân vùng của NFS server như  phân vùng cục bộ của nó.  

- Dịch vụ NFS không được security nhiều, vì vậy cần thiết phải tin tưởng các client được permit mount các phân vùng của NFS server.    

- Hiện tại có 3 phiên bản NFS là NFSv2, NFSv3, NFSv4.  


## Cơ chế hoạt động :  
<img src= "https://i.imgur.com/V7aEwkL.png">  

- NFSv2 và v3 dựa trên RPC ( Remote Procedure Call) , RPC được điểu khiển bởi portmap .

- Tất cả các version của NFS sử dụng TCP , nhưng NFSv2 và v3 có thể dùng UDP để thiết lập kết nối stateless giữa client và server .   

- NFSv4 không tương tác với portmapper , rpc.mountd , rpc.lockd , rpc.statd vì những thứ đấy được chuyển vào kernal .NFSv4 listen các request tại well known TCP port 2049  

- Để có thể share file giữa các hệ thống , các service sau phải hoạt động :

   - nfs: khởi động các RPC process để xử lí request  
   - nfslock: cho phép client lock các file trên server  
   - portmap : là một RPC service , trả lời các request của rpc services và thiết lập , duy trì các kết nối .  
- Các RPC service :      
    - rpc.mountd:Nhận các mount request từ client và xác nhận các file system được phép export. 
    - rpc.nfsd : Tương tự nfs service  
    - rpc.lockd : tương tự nfslock service  - rpc.statd : Thông báo cho client biết nfs server restart . Process này được chạy tự động trong nfslock . 
    - rpc.rquotad : cung cấp thông tin cho người dùng .


## Cấu hình NFS server và client  
<img src="https://i.imgur.com/GtQq8OC.jpg">  

- Các client có thể mount được share directory của NFS Server. Server share 2 directory là /home và /var/shared  


1. Cài đặt NFS :  
**Server** :  
`yum install nfs-utils  `
Sau khi cài xong start nfs server service :  
```
systemctl enable nfs-server.service  
systemctl start nfs-server.service  
```  

**Client**  
`yum install nfs-utils` 

2. Cấu hình tường lửa:  
```
firewall-cmd --permanent --zone=public --add-service=ssh  
firewall-cmd --permanent --zone=public --add-service=nfs  
firewall-cmd --reload  
```  

3. Cấu hình export directory : 
  Ta muốn client có quyền truy cập vào 2  directory /home và /var/shared thì cần phải export các directory trên trong server .  
  Directory /var/shared không có sẵn nên ta tạo ra bằng lệnh :  
  ```
  mkdir /var/shared  
  chmod 755 /var/shared
  ```   

  Cấu hình export qua /etc/exports :  
  `vi /etc/exports`  
  ```
 /home 4.4.4.131(rw,sync,no_root_squash,no_subtree_check) 4.4.4.4(rw,sync,no_root_squash,no_subtree_check)  
/var/shared 4.4.4.131(rw,sync,no_root_squash,no_subtree_check) 4.4.4.4(rw,sync,no_root_squash,no_subtree_check)  
  ```    
  Trong đó :    
-  rw : cho phép read , write directory    
- sync :     NFS server đồng bộ tất cả các thay đổi trong share directory.  
 - no_root_squash : yêu cầu truy cập vào share directory phải là root access      
 - no_subtree_check :  disable subtree check  
 
  Sau khi cấu hình ở file exports , chạy lệnh `exportfs -a`  để duy trì  bảng exports của server cũng như add các cấu hình mới từ file /etc/exports và các file trong /etc/exports.d vào /var/lib/nfs/etab .  

4. Mount các share directory bên client :  
  Trước tiên ta tạo các thư mục để mount directory share của server mà ta muốn truy cập  :  
  ```
  mkdir -p /mnt/nfs/home  
  mkdir -p /mnt/nfs/var/shared
  ```  
  sau đó chạy các lệnh sau để mount :  
  ```
  mount 4.4.4.5:/home /mnt/nfs/home  
  mount 4.4.4.5:/var/shared /mnt/nfs/var/shared  
  ```
  ta kiểm tra nfs share bằng các lệnh sau :  
  ```
  #df -h  

  #mount
  ```
  Ta thấy client đã mount được 2 directory share của server . 
  <img src="https://i.imgur.com/8Hwi2ex.png">  
   
5. Kiểm tra :  
- Tạo file ở 1 máy client trong thư mục share /mnt/nfs/var/shared , kiểm tra trên server và 1 máy client cconf lại xem có sự thay đổi chưa  


6. Mount khi khởi động máy :  
- Cấu hình ở trên giúp mount được directory share trên server nhưng chỉ là tạm thời , khi khởi động sẽ bị mất . Do đó nếu muốn directory share luôn luôn được mount trong máy ta cấu hình trong /etc/fstab :  
```
4.4.4.5:/home  /mnt/nfs/home   nfs      rw,sync,hard,intr  0     0
4.4.4.5:/var/shared  /mnt/nfs/var/shared   nfs      rw,sync,hard,intr  0     0
```  
sau đó reboot và kiểm tra kết quả    

