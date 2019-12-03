## I)	Network File System

NFS là dịch vụ chia sẻ tài nguyên.

Dịch vụ NFS cho phép chia sẻ tài nguyên cho nhiều người dùng trên cùng mạng và người dùng có thể thao tác với tập tin như trên chính đĩa cứng của mình

Máy chia sẻ đóng vai trò Server

Máy được chia sẻ đóng vai trò Client

## II)	Cài đặt
###1)	Trên server

B1:  cài đặt NFS

**#yum install nfs-utils nfs-utils-lib**

B2: 
Xác định folder muốn export cho Client -> sửa file /etc/exports

Với cú pháp	<Đường dẫn folder> IP_Client(<quyền của client đối với file>)

Các quyền

•	rw 	cho phép client đọc ghi với thư mục

•	ro 	quyền chỉ đọc với thư mục

•	sync 	đồng bộ hóa thư mục dùng chung

•	root_squash 	disable quyền root (mặc định)

•	no_root_squash 	enable quyền root

•	no_all_squash	 	để root user trên Client có thể write như root user trên Server

B3: Khởi chạy ( chạy sau tường lửa  rpc service)

**#systemctl start rpcbind**

**#systemctl start nfs-server**

**#systemctl enable rpcbind**

**#systemctl enable nfs-server**

**#systemctl status rpcbind**

**#systemctl status nfs-server**

Xem thông tin #rpcinfo -p


Hoặc 


B3:  (Không chạy nfs đằng sau tường lửa)

**#systemctl start nfs**

**#systemctl enable nfs**

**#systemctl stop firewalld**



Note: 

Để chạy NFS phía sau firewall -> cần cấu hình /etc/sysconfig/nfs sau đó enable port trên config của firewall

Dùng rcpbind để gán cổng tự động 

không nên dùng trong product system vì có thể  gây ra lỗi khi cấu hình rule firewall

### 2)	Phía Client

B1: 

**mkdir  -p /mnt/nfs**

B2:Xem thông tin mount của Server

**showmount –e IP_Server**

B3: Mount( ví dụ 192.168.16.136 là IP server)

**mount 192.168.16.136:/Data_share /mnt/nfs**

**$df –h**
