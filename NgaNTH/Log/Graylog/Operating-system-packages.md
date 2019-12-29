## Tìm hiểu về Operating system packages   

Cho đến khi các hệ thống quản lý cấu hình (Configuration Management Systems) tiến vào thị trường rộng lớn hơn và nhiều trung tâm dữ liệu, một trong những cách phổ biến nhất để cài đặt phần mềm trên máy chủ Linux là sử dụng các gói hệ điều hành (Operating System Packages). Debian có `DEB`, Red Hat có `RPM` và nhiều bản phân phối khác dựa trên những bản đó hoặc đi kèm với các định dạng gói riêng của chúng. Kho lưu trữ trực tuyến các gói phần mềm và trình quản lý gói tương ứng làm cho việc cài đặt và định cấu hình phần mềm mới chỉ cần trong một lệnh và thời gian tiêu tốn một vài phút.  
Graylog cung cấp kho lưu trữ gói chính thức là `DEB` và `RPM`.  
### Điều kiện tiên quyết  
- Java (>=8)  
- Elasticsearch (5.x hoặc 6.x)  
- MongoDB (3.6 hoặc 4.0)  
> *Chú ý*: Graylog 3 không làm việc với Elasticsearch 7.x và MongoDB 4.2  

## DEB/APT   
Tải và cài đặt `graylog-3.1-repository_latest.deb` bằng `dpkg` và `apt-transport-https` được cài đặt:  
```
$ sudo apt-get install apt-transport-https
$ wget https://packages.graylog2.org/repo/packages/graylog-3.1-repository_latest.deb
$ sudo dpkg -i graylog-3.1-repository_latest.deb
$ sudo apt-get update
$ sudo apt-get install graylog-server
```  
- Nếu muốn cập nhật bản mới nhất  
```
$ wget https://packages.graylog2.org/repo/packages/graylog-3.1-repository_latest.deb
$ sudo dpkg -i graylog-3.1-repository_latest.deb
$ sudo apt-get update
$ sudo apt-get install graylog-server
```  

## RPM / YUM / DNF  
Tải và cài đặt `graylog-3.1-repository_latest.rpm` bằng `rpm`  
```
$ sudo rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.1-repository_latest.rpm
$ sudo yum install graylog-server
```  
- Lệnh để khởi động trong CentOS 7  
```
sudo systemctl start graylog-server  
systemctl enable graylog-server
```  
- Cập nhật phiên bản mới nhất  
```
$ sudo rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.1-repository_latest.rpm
$ sudo yum clean all
$ sudo yum install graylog-server
```  
> Ta cần chạy `yum clean all` là bắt buộc vì YUM có thể sử dụng bộ đệm cũ và do đó có thể không thể tìm thấy phiên bản mới nhất của gói Graylog server.  

## Manual Repository Installation  
Nếu bạn không thích cài đặt kho chứa rpm để có được cấu hình kho lưu trữ trên hệ thống của mình thì bạn cũng có thể cài đặt thủ công (mặc dù phương pháp này không được khuyến khích)  
- Tạo một file `/etc/yum.repos.d/graylog.repo` và ghi vào nội dung như sau:  
```
[graylog]
name=graylog
baseurl=https://packages.graylog2.org/repo/el/stable/3.1/$basearch/
gpgcheck=1
repo_gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-graylog
```
