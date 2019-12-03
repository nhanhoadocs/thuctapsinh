# Cluster Basics

1 cluster là 2 hay nhiều máy tính(là các cluster member) làm việc cùng nhau để thực hiện 1 nhiệm vụ

	Cung cấp tính sẵn sàng cao của 1 dịch vụ nhất định

	Loại bỏ các điểm lỗi đơn, chuyển dịch vụ từ cluster member này sang cluster member khác khi 1 node bị lỗi/không hoạt động

	Duy trì tính toàn vẹn dữ liệu khi 1 member lấy quyền kiểm soát từ 1 mem khác

	1 node bị lỗi không thể bị nhìn thấy từ bên ngoài

Có nhiều cluster tools trên Linux - > được sử dụng dụng nhiều:  Pacemaker

1 Cluster được config với Pacemaker bao gồm các trình nền (daemon) riêng biệt giúp monitor các cluster member,script – những thứ quản lý services,hệ thống con – monitor các tài nguyên

Các thành phần sau đây tạo thành kiến trúc Pacemaker:

1.	Cluster Information Base: Thông tin các Pacemaker daemon phân phối và đồng bộ hóa cấu hình cluster(cluster) và thông tin trạng thái từ Designated Coordinator (Điều phối viên được chỉ định) (DC) của cluster cho đến tất cả các thành viên khác của cluster 

2.	Cluster Resource Management Daemon (CRMD): Tài nguyên cluster được quản lý bởi thành phần này có thể được truy vấn bởi các hệ thống máy khách, di chuyển, khởi tạo và thay đổi khi cần.
Mỗi node cũng bao gồm trình nền quản lý tài nguyên mức cục bộ hoạt động như là interface giữa CRMD và chính tài nguyền đó

3.	Fencing Manager: thường được deploy cùng các switch, hoạt động như 1 tài nguyên cluster trong Pacemaker nhằm xử lý các fence request,tắt nguồn node và gỡ bỏ chúng khỏi cluster nhằm đảm bảo tính toàn vẹn dữ liệu

->sử dụng kỹ thuật fencing  nhằm ngăn việc corrupt data bởi các node lỗi( không phản hồi nhưng vẫn truy vấn dữ liệu ứng dụng)


## Install a simple Cluster
Pacemaker yêu cầu 1 lớp nhắn tin chạy nền – trên Corosync- nó sẽ cung cấp 1 thành viên cluster và mô hinh giao tiếp khép kín cho việc tạo các máy replicate ( máy có trạng thái tương tự) -> trên đó Pacemaker có thể chạy

Corosync được xem như hệ thống kết nối các node của cluster lại với nhau . Trong khi Pacemaker thực hiện việc monitor cluster và thực hiện các hành động trong trường hợp xảy ra lỗi

Ngoài ra. sử dụng thêm PCS – giao diện dòng lệnh tương tác với cả Corosync và Pacemaker
 
Vì Corosync là một phụ thuộc vào Pacemaker, nên thường chỉ nên cài đặt Pacemaker và để hệ thống quyết định phiên bản Corosync nào sẽ được cài đặt.

Cài đặt, khởi động và kích hoạt Pacemaker và PCS trên cả hai node

[root@holly ~]# yum -y install pacemaker

[root@holly ~]# yum -y install pcs

[root@holly ~]# systemctl start pcsd

[root@holly ~]# systemctl enable pcsd


[root@benji ~]# yum -y install pacemaker

[root@benji ~]# yum -y install pcs

[root@benji ~]# systemctl start pcsd

[root@benji ~]# systemctl enable pcsd


Pacemaker cần giao tiếp giữa các node, enable port tường lửa trên mỗi node, theo mặc định là 2224 thông qua TCP. Nếu không, hãy tắt tường lửa nếu bạn đang làm việc trong một thiết lập an toàn.

[root@holly ~]# systemctl stop firewalld

[root@holly ~]# systemctl disable firewalld

[root@benji ~]# systemctl stop firewalld

[root@benji ~]# systemctl disable firewalld

 


Tiện ích PCS tạo người dùng trong quá trình cài đặt, được đặt tên là hacluster, với mật khẩu bị disabled. Cần define mật khẩu cho người dùng này trên cả hai máy chủ. Điều này sẽ cho phép PCS thực hiện các tác vụ như đồng bộ hóa cấu hình Corosync trên nhiều node, cũng như bắt đầu và dừng cluster.

[root@holly ~]# passwd hacluster

Changing password for user hacluster

[root@benji ~]# passwd hacluster

Changing password for user hacluster



Sử dụng cùng một mật khẩu trên cả hai máy chủ.password này sẽ được sử dụng để config cluster ở các bước bên dưới

User này không hề có shell hay home dir được liên kết với tài khoản của nó  không đăng nhập được vào server thông qua user này-> Chỉ dùng xác thực các node cluster

Chỉ Thực hiện trên 1 node

[root@holly ~]# pcs cluster auth holly benji

Username: hacluster

Password:

holly: Authorized

benji: Authorized



Trên cùng node đó, config Corosync

[root@holly ~]# pcs cluster setup --name mycluster holly benji

Shutting down pacemaker/corosync services...

Redirecting to /bin/systemctl stop  pacemaker.service

Redirecting to /bin/systemctl stop  corosync.service

Killing any remaining services...

Removing all cluster configuration files...

holly: Succeeded

benji: Succeeded

Synchronizing pcsd certificates on nodes holly, benji...

benji: Success

holly: Success

Restaring pcsd on the nodes in order to reload the certificates...

benji: Success

holly: Success





Một file cấu hình cluster (tức là cơ sở thông tin cluster) sẽ được tạo /etc/corosync/corosync.conf dựa trên các tham số được cung cấp cho lệnh thiết lập cluster:

[root@holly ~]# cat /etc/corosync/corosync.conf

totem {

    version: 2
    
    secauth: off
    
    cluster_name: mycluster
    
    transport: udpu
    
}

nodelist {

    node {
    
        ring0_addr: holly
        
        nodeid: 1
        
    }
    
    node {
    
        ring0_addr: benji
        
        nodeid: 2
        
    }
    
}

quorum {

    provider: corosync_votequorum
    
    two_node: 1
    
}

logging {

    to_logfile: yes
    
    logfile: /var/log/cluster/corosync.log
    
    to_syslog: yes
    
}






Start và Enable Cluster:

[root@holly ~]# pcs cluster start --all

benji: Starting Cluster...

holly: Starting Cluster...

[root@holly ~]# pcs cluster enable --all

holly: Cluster Enabled

benji: Cluster Enabled





Kiểm tra trạng thái cluster

[root@holly ~]# pcs status

Cluster name: mycluster

WARNING: no stonith devices and stonith-enabled is not false

Last updated: Sat Jul 16 17:20:14 2016

Stack: corosync

Current DC: holly (version 1.1.13-10.el7_2.2-44eb2dd) - partition with quorum

2 nodes and 0 resources configured

Online: [ benji holly ]

Full list of resources: -

PCSD Status:

    holly: Online
    
    benji: Online
    
Daemon Status:

    corosync: active/enabled
    
    pacemaker: active/enabled
    
    pcsd: active/enabled



1 vài thông tin có thể thấy được:

1.	The Designated Coordinator (DC) chính là node holly – nơi mà ta config cluster

2.	Chỉ có 2 nodes duy nhất và no resurces (không hồi sinh)

3.	Tên cluster là "mycluster"

4.	Tất cả các trình nền: corosync, pacemaker and pcsd đã được active và enabled

5.	Fencing (stonith) đã đuwocj enabled nhưng no fencing devices được configured



Xác nhận rằng cả hai node đã tham gia cluster bằng cách chạy lệnh sau trên bất kỳ máy chủ nào

[root@holly ~]# pcs status corosync

Membership information

----------------------

    Nodeid      Votes Name
    
         1          1 holly (local)
         
         2          1 benji
         
[root@holly ~]#



Vì cluster hiện tại không quản lý các tài nguyên dữ liệu được chia sẻ nên ta có thể disable fencing :

[root@holly ~]# pcs property set stonith-enabled=false


Để xem bản tóm tắt các thuộc tính Cluster

[root@benji ~]# pcs property list

Cluster Properties:

 cluster-infrastructure: corosync
 
 cluster-name: mycluster
 
 dc-version: 1.1.13-10.el7_2.2-44eb2dd
 
 have-watchdog: false
 
 no-quorum-policy: ignore
 
 stonith-enabled: false


Các node của cluster không nên bị dừng đột ngột như các node thông thường khác. Ta nên  dừng cluster trước sau đó shutdown hệ thống


Để dừng cluster trên một node đơn

[root@benji ~]# pcs cluster stop

Stopping Cluster (pacemaker)... Stopping Cluster (corosync)...

[root@benji ~]# pcs cluster status

Error: cluster is not currently running on this node


Hoặc trên tất cả các node của cluster

[root@holly ~]# pcs cluster stop --all

holly: Stopping Cluster (pacemaker)...

benji: Stopping Cluster (pacemaker)...

benji: Stopping Cluster (corosync)...

holly: Stopping Cluster (corosync)...

[root@holly ~]#


##Add a resource to the Cluster

(test nên ta chọn service ít phải config là http )


Install và config HTTP Server trên cả 2 nodes :

(chú ý : không cần thiết phải start/enable dịch vụ)

[root@benji ~]# yum install -y httpd

[root@benji ~]# echo "Hello Benji" > /var/www/html/index.html

[root@holly ~]# yum install -y httpd

[root@holly ~]# echo "Hello Holly" > /var/www/html/index.html


Thêm HTTP Server như tài nguyên của cluster (Chú ý: ocf: heartbeat:apache -> bỏ dấu space giữa ": heartbeat" thì mới chạy.cách ra do bị lỗi ký hiệu github)

[root@benji ~]# pcs resource create HTTPServer ocf: heartbeat:apache \

> configfile=/etc/httpd/conf/httpd.conf \

> op monitor interval=1min


Tên của resource là HTTPServer .Type là ocf:heartbeat:apache

Type sẽ define  1 resource -> sẽ nói với cluster xem script và standards phù hợp nào được sử dụng cho resource này . Trong trường hợp này, standard là Open Cluster Framework.

Câu lệnh trên cũng nói với Pacemaker check heath của service này 60s 1 lần bằng việc gọi các hành động monitor của agent


Thêm một địa chỉ IP ảo làm tài nguyên thứ hai của cluster. Địa chỉ IP này sẽ được sử dụng bởi các máy khách của cluster để truy cập HTTP Server resource

[root@benji ~]# pcs resource create VirtualIP ocf: heartbeat:IPaddr2 \

> ip=10.10.10.23 \

> cidr_netmask=24 \

> op monitor interval=30s



Tên resource là VirtualIP . Type là ocf: heartbeat:IPaddr2

Mỗi 30s check heath service 1 lần

IP này sẽ chuyển từ node này qua node khác tùy thuộc vào trạng thái node

[root@benji ~]# ip addr show ens32

2: ens32: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000

    link/ether 00:0c:29:20:d2:dd brd ff:ff:ff:ff:ff:ff
    
    inet 10.10.10.24/24 brd 10.10.10.255 scope global ens32
    
       valid_lft forever preferred_lft forever
       
    inet 10.10.10.23/24 brd 10.10.10.255 scope global secondary ens32
    
       valid_lft forever preferred_lft forever
       
[root@holly ~]# ip addr show ens32

2: ens32: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000

    link/ether 00:0c:29:77:68:56 brd ff:ff:ff:ff:ff:ff
    
    inet 10.10.10.22/24 brd 10.10.10.255 scope global ens32
    
       valid_lft forever preferred_lft forever
       



Đặt HTTPServer và VirtualIP luôn nằm trên cùng một node

[root@benji ~]# pcs constraint colocation add HTTPServer with VirtualIP


Đặt thứ tự bắt đầu là VirtualIP trước rồi đến HTTPServer. Điều này là bắt buộc để đảm bảo luôn có Địa chỉ IP để gửi yêu cầu của khách hàng

[root@holly ~]# pcs constraint order VirtualIP then HTTPServer

Adding VirtualIP HTTPServer (kind: Mandatory) (Options: first-action=start then-action=start)


Xem trạng thái của cả hai tài nguyên

[root@benji ~]# pcs status resources

 VirtualIP      (ocf::heartbeat:IPaddr2):       Started by benji
 
 HTTPServer     (ocf::heartbeat:apache):        Started by holly


và resources constraints ( hiểu như thứ tự bắt buộc)

[root@holly ~]# pcs constraint

Location Constraints:

Ordering Constraints:

  start VirtualIP then start HTTPServer (kind:Mandatory)
  
Colocation Constraints:

  HTTPServer with VirtualIP (score:INFINITY)



Bây giờ ta có thể truy cập HTTP Server từ máy khách web bằng cách trỏ đến Địa chỉ IP ảo 10.10.10.23

[stack@director ~]$ curl http://10.10.10.23

Hello Benji


Để kiểm tra chuyển đổi dự phòng cluster (failover), dừng thủ công node hiện tại

[root@benji html]# pcs cluster stop

Stopping Cluster (pacemaker)... Stopping Cluster (corosync)...


Thực hiện lại -> chuyển đổi node

[stack@director ~]$ curl http://10.10.10.23

Hello Holly

## Accessing the cluster management form a Web GUI

Quản lý cluster cũng có thể thông qua GUI Web. Trỏ trình duyệt đến primary member node và đăng nhập với tư cách là người dùng hacluster

https://<primary_node_ip>:2224


# Advanced Clustering

Với ví dụ trên  thì 2 node hoạt động ở cơ chế Active/Standby

 Tức là 1 node hoạt động còn 1 node gần như không làm gì cả cho đến khi có 1 sự kiện gì đó xảy ra và nó được gọi lên thay (ví dụ failover)

	Ta có thể cấu hình để 2 node cùng hoạt động nhằm tăng tính sẵn sàng,cân bằng tải 

	Tức là 2 node cùng hoạt động, các request được di chuyển giữa các node
 
Tham khảo thêm tại : https://github.com/PhamKhahn/Linux-Tutorial/blob/master/content/cluster-adv.md
