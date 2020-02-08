# Cài đặt Nginx Server trên Centos 8  

## I - Stable vs. mainline version
Nginx Open Source có sẵn trong hai phiên bản:
- Mainline  – Bao gồm các tính năng mới nhất và sửa lỗi và luôn cập nhật. Nó đáng tin cậy, nhưng nó có thể bao gồm một số mô-đun thử nghiệm và nó cũng có thể có một số lỗi mới.
- Ổn định(Stable)  – Không bao gồm tất cả các tính năng mới nhất, nhưng có các sửa lỗi nghiêm trọng luôn được đưa vào phiên bản chính.

## II - Cài đặt Nginx

- Cài EPEL repository
  ```sh
    yum install epel-release
  ```

- Update the repository:
  ```sh
    yum update
  ```

- Install NGINX Open Source
  ```sh
    yum install nginx
  ```

- Kiểm tra lại version của nginx đã được cài đặt
  ```sh
    nginx -v
  ```

### 2.2. Cài bằng package từ kho lưu trữ của NGINX Inc.’s

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

- Start và enable Nginx service 
  ```sh
    systemctl start nginx
    systemctl enable nginx
  ```

- Stop firewalld
  ```sh
    systemctl stop firewalld
  ```

- Kiểm tra bằng cách nhập địa chỉ IP của server cài Nginx lên trình duyệt. Kết quả sẽ như trong hình dưới

  ![](welcome-screen-e1450116630667.png)
