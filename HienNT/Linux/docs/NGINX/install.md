# Cài đặt Nginx Server trên Centos 8  

<img src ="images/nginx_install.png">  

- Cài đặt kho lưu trữ gói nginx. Sau đó, bạn có thể cài đặt và cập nhật nginx từ kho lưu trữ.  

  ```sh
    yum install -y yum-utils
  ```  

- Để set up yum repository, tạo 1 file với tên `/etc/yum.repos.d/nginx.repo` và thêm vào file:  

  ```sh
    [nginx-stable]
    name=nginx stable repo  
    baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
    gpgcheck=1
    enabled=1
    gpgkey=https://nginx.org/keys/nginx_signing.key
    module_hotfixes=true

    [nginx-mainline]
    name=nginx mainline repo  
    baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
    gpgcheck=1
    enabled=0
    gpgkey=https://nginx.org/keys/nginx_signing.key
    module_hotfixes=true
  ```  

- Theo mặc định, kho lưu trữ sẽ sử dụng các nginx package ổn định. Nếu bạn muốn sử dụng mainline nginx packages, sử dụng câu lệnh sau:  

  ```sh
    yum-config-manager --enable nginx-mainline
  ```

- Install nginx, chạy câu lệnh:  

  ```sh
    yum install -y nginx
  ```  

- Sau khi install xong, start và enable service `nginx`

  ```sh
    systemctl start nginx
    systemctl enable nginx
  ```  

- Cấu hình firewall  

  ```sh
    firewall-cmd --permanent --zone=public --add-service=http
    firewall-cmd --permanent --zone=public --add-service=https
    firewall-cmd --reload
  ```  

- Kiểm tra hoạt động của Nginx server bằng cách truy cập trên trình duyệt bằng địa chỉ IP của server: ***http://IP***  
  Nếu thành công, màn hình sẽ hiển thị như hình:  

  <img src="images/test.png">

## Cấu trúc và cách sử dụng tập tin cấu hình nginx
- Tất cả file cấu hình của nginx nằm trong thư mục `/etc/nginx`  
- File cấu hình chính của nginx là `/etc/nginx/nginx.conf`  
- Tạo 1 file cấu hình riêng cho mỗi tên miền sẽ giúp server dễ quản lý và hiệu quả hơn.
- NGINX không có Virtual host, thay vào đó là [`Server Blocks`](https://www.nginx.com/resources/wiki/start/topics/examples/server_blocks/) sử dụng `server_name` và nghe các chỉ thị để liên kết với các tcp sockets. Tất cả các file server block phải có định dạng là `.conf` và được lưu trong thư mục `/etc/nginx/conf.d`  
- Nếu bạn có 1 domain là `mydomain.com` thì bạn nên đặt tên file cấu hình là `mydomain.com.cnf`. 
- Nếu bạn sử dụng các phân đoạn cấu hình có thể lặp lại trong các khối máy chủ tên miền của mình, bạn nên cấu trúc lại các phân đoạn đó thành các đoạn.
- Các file nhật ký Nginx (`access.log` và `error.log`) được đặt trong thư mục `/var/log/nginx/`. Nên có một tệp nhật ký `access` và `error` khác nhau cho mỗi server block.
- Bạn có thể đặt document root directory của tên miền của bạn đến bất kỳ vị trí nào bạn muốn. Một số vị trí thường được dùng cho webroot bao gồm:
    - /home/<user_name>/<site_name>
    - /var/www/<site_name>
    - /var/www/html/<site_name>
    - /opt/<site_name>
    - /usr/share/nginx/html

## TÀI LIỆU THAM KHẢO
- https://linuxize.com/post/how-to-install-nginx-on-centos-8/#nginx-configuration-files-structure-and-best-practices
- https://www.nginx.com/resources/wiki/start/topics/examples/server_blocks/
- https://nginx.org/en/
