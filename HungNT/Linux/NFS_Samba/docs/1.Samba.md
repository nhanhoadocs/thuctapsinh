# SAMBA 
Samba là một ứng dụng chạy trên Unix cố gắng mô phỏng một hệ thống Windows. Samba cho phép một hệ thống Unix gia nhập vào hệ thống “Network Neighborhood” và người dùng Windows có thể truy nhập tài nguyên trên Unix (Tệp và Printer) mà không hề biết đó là các dịch vụ do Unix cung cấp.

Điều này thực hiện được nhờ sự mô phỏng giao thức Windows "Common Internet File System", hay CIFS và giao thức truyền tin Server Message Block (SMB). SMB dựa trên giao diện NetBIOS để truyển thông tin giữa các máy tính trong một mạng LAN. Theo giao diện do NetBIOS quy định, các máy tính được đánh tên theo một sơ đồ, trong đó các máy tính trong mạng LAN có tên duy nhất (còn gọi là tên NetBIOS) và việc truyền dữ liệu giữa các máy tính thực hiện thông qua tên này. Giao thức NetBEUI được dùng khá phổ biến hiện nay được xây dựng với mục đích chính là chuyển các gói tin NetBIOS trong mạng LAN sử dụng các chuẩn TokenRing và Ethernet. 
## Cài đặt
### **Cài đặt Folder Share ở máy Linux**   

**Bước 1: Cài đặt Samba và tạo thư mục chia sẽ:**  

- Cài đặt Samba bằng lệnh yum: 

yum install samba

- Sau khi cài xong ta enable service samba để có thể chạy qua firewalld : 
   ```sh
   #firewall-cmd --permanent --zone=public --add-service=samba  

   #firewall-cmd --reload
```
- Tạo một thư mục để thực hiện share dữ liệu. Ví dụ tạo thư mục có tên là “share”:  

`mkdir home/username/Share`  

Trong thư mục share, tạo tệp có tên file  

`touch home/username/share/file`

Phân quyền thư mục Share:  
`chmod 777 –R /home/username/Share`  

**Bước 2: Cấu hình Samba:**

Ta cấu hình file smb.conf. Gõ lệnh: vi /etc/samba/smb.conf

Thay passdb backend = tdbsam thành passdb backend = smbpasswd

<img src="https://i.imgur.com/GUrudd6.png">  


Xuống dưới cùng cùng của file smb.conf, thêm vào đoạn sau:

```sh
[Share]
path = /home/username/Share
available = yes 
read only = no
browsable = yes
public = yes
writable = yes
valid users = username
```
<img src="https://i.imgur.com/9Qnh1AR.png">      

Lưu lại file smb.conf và khởi động dịch vụ smb lên:  
` service smb start`  

**Bước 3: Thiết lập thông tin user**


Thiết lập tài khoản mật khẩu cho người dùng samba:
Gõ lệnh: smbpasswd –a username

Tiến hành nhập mật khẩu. Mật khẩu này dùng để truy cập vào máy chứa thư mục chia sẽ.


**Bước 4: Kiểm tra**

Trên Client, vào RUN gõ đường máy chủ chia sẽ dữ liệu điền địa chỉ IP của máy Linux vào :  
<img src="https://i.imgur.com/Rm6mUy2.png">  


Khi truy cập thành công ta có thể vào folder Share và chia sẻ file  
<img src="https://i.imgur.com/FuP28jd.png">  

**Lưu ý**  
Nếu không thể truy cập từ window vào folder share của linux ta tắt firewalld và SElinux của CentOS đi  

- Tắt firewalld  
#systemctl disable firewalld

- Tắt SeLinux  
Sửa file /etc/selinux/config , thay đổi giá trị SELINUX=disabled    

`vi /etc/selinux/config`

<img src="https://i.imgur.com/1eA4coM.png"> 
Sau đó reboot lại , kiểm tra trạng thái bằng sestatus  
<img src="https://i.imgur.com/Ex04uf4.png">  
  
