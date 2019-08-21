# CentOS 6 vs CentOS 7 Comparison
### **1) File System mặc định**
- **CentOS 7 :** `XFS File System`
- **CentOS 6 :** `Ext4 File System`
### **2) Phiên bản kernel**
- **CentOS 7 :** `3.10.x-x kernel`
- **CentOS 6 :** `2.6.x-x kernel`
### **3) Kernel Code Name**
- **CentOS 7 :** `Maipo`
- **CentOS 6 :** `Santiago`
### **4) Tiến trình đầu tiên ( first process )**
- **CentOS 7 :** `systemd` - `process ID 1`
- **CentOS 6 :** `init` - `process ID 1`
### **5) Runlevel**
- **CentOS 7 :** `targets`
    - runlevel`0`.target -> `poweroff`.target
    - runlevel`1`.target -> `rescue`.target
    - runlevel`2`.target -> `multi-user`.target
    - runlevel`3`.target -> `multi-user`.target
    - runlevel`4`.target -> `multi-user`.target
    - runlevel`5`.target -> `graphical`.target
    - runlevel`6`.target -> `reboot`.target
- **CentOS 6 :** `runlevels`
    - runlevel `0` , `1` , `2` , `3` , `4` , `5` , `6`
### **6) Vị trí lưu file cấu hình hostname**
- **CentOS 7 :** `/etc/hostname`
- **CentOS 6 :** `/etc/sysconfig/network`
### **7) Thay đổi trong phân bổ UID**
- **CentOS 7 :** `1000`**&uarr;**
- **CentOS 6 :** `500`**&uarr;**
### **8) File System Check**
- **CentOS 7 :** không tự check file system khi khởi động
    - Công cụ file-system check : `# xfs_repair`
- **CentOS 6 :** tự động check file system khi khởi động
    - Công cụ file-system check : `# e2fsck`
### **9) Hỗ trợ tối đa về kích thước file**
- **CentOS 7 :** 
    - Maximum ( invidual ) file size = `500TB`
    - Maximum filesystem size = `500TB`
- **CentOS 6 :** 
    - Maximum ( invidual ) file size = `16TB`
    - Maximum filesystem size = `16TB`
### **10) Thay đổi cấu trúc file system**
- **CentOS 7 :** các thư mục `/bin` , `sbin` , `/lib` , `/lib64` được xếp phân cấp là thư mục con của thư mục `/usr`
- **CentOS 6 :** các thư mục `/bin` , `sbin` , `/lib` , `/lib64` nằm dưới `/`
### **11) Cluster Resource Manager**
- **CentOS 7 :** `Pacemaker`
- **CentOS 6 :** `Rgmanager`
### **12) Công nghệ Load Balancer**
- **CentOS 7 :** `Keepalived and HAProxy`
- **CentOS 6 :** `Piranha`
### **13) Giao diện Desktop - GUI**
- **CentOS 7 :** `GNOME 3 and KDE 4.10`
- **CentOS 6 :** `GNOME 2`
### **14) Cơ sở dữ liệu mặc định**
- **CentOS 7 :** `MariaDB`
- **CentOS 6 :** `MySQL`
### **15) Dịch vụ tường lửa trên OS**
- **CentOS 7 :** `Firewalld`
    - File cấu hình tích hợp : `/usr/lib/firewalld`
    - File cấu hình tùy chỉnh : `/etc/firewalld`
- **CentOS 6 :** `Iptables`
> ***Chú ý :** Có thể gỡ `Firewalld` để dùng lại `Iptables`*