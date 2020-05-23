# Cài đặt Guacamole để truy cập máy chủ từ xa bằng trình duyệt trên Ubuntu 18.04 

Guacamole hỗ trợ các giao thức chuẩn như VNC, RDP và SSH 

Trong hướng dẫn này, ta sẽ tìm hiểu cách thiết lập công cụ truy cập máy tính từ xa bằng trình duyệt web trên Ubuntu server 18.04 

## Cài đặt các phụ thuộc cần thiết 

```
apt install -y  gcc-6 g++-6 libcairo2-dev libjpeg-turbo8-dev libpng-dev libossp-uuid-dev libavcodec-dev libavutil-dev libswscale-dev libfreerdp-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libssl-dev libvorbis-dev libwebp-dev
```


## Cài đặt Tomcat 
Apache Tomcat được sử dụng để phục vụ nội dung máy khách guacamole cho người dùng kết nối với máy chủ guacamole thông qua trình duyệt web. 
Cài đặt apache tomcat bằng lệnh dưới đây:

```
apt install tomcat8 tomcat8-admin tomcat8-common tomcat8-user -y
```

Nếu tường lửa đang chạy, sửa dụng lệnh sau để mở port:

```
ufw allow 8080
ufw reload
```


## Tải về guacamole-server

Để tải về phiên bản mới nhất hoặc tải về các phiên bản khác, hãy truy cập [guacamole](https://guacamole.apache.org/releases/) để tải về.

Tại đây mình tải về phiên bản 0.9.14 được phát hành năm 2018. 

```
wget http://archive.apache.org/dist/guacamole/0.9.14/source/guacamole-server-0.9.14.tar.gz
```

Sau khi tải xuống, ta tiến hành giải nén và điều hướng đến thư mục mã nguồn. 

```
tar xzf guacamole-server-0.9.14.tar.gz 
cd guacamole-server-0.9.14
```

Chạy tập lệnh configure : 

```
./configure --with-init-dir=/etc/init.d
```


Tiếp tục sử dụng gcc để biên dịch mã như sau: 

```
make CC=gcc-6
```

Sau khi quá trình biên dịch xong, ta cài đặt các thành phần đã được xây dựng

```
make install
```

Tạo các liên kết và bộ đệm cần thiết đến các thư viện 

```
ldconfig
```

Khởi động guacamole

```
systemctl enable guacd
systemctl start guacd
```


## Tải về guacamole client 

Lưu ý phần cấu hình `guacamole-server` và `guacamole-lient` đều cấu hình trên cùng 1 máy. 

guacamole-client chứa tất cả các thành phần Java và JavaScript của Guacamole. 

Để tải về các phiên bản dựng sẵn của ứng dụng web thay vì xây dựng nó từ mã nguồn, ta tải về file `.war` 

```
wget http://archive.apache.org/dist/guacamole/0.9.14/binary/guacamole-0.9.14.war
```

Tạo thư mục cấu hình guacamole: 

```
mkdir /etc/guacamole
```

Di chuyển tệp nhị phân đến tệp cấu hình được tạo ở trên :

```
mv guacamole-0.9.14.war /etc/guacamole/guacamole.war
```

Tao 1 liên kết tượng trưng của máy khách guacamole đến thư mục ứng dụng web tomcat: 

```
ln -s /etc/guacamole/guacamole.war /var/lib/tomcat8/webapps/
```

Khởi động lại tomcat và guacd

```
systemctl restart tomcat8
systemctl restart guacd
```

## Cấu hình guacamole 
Guacamole các thực bằng cách đọc tất cả người dùng và kết nối từ 1 tệp là `user-mapping.xml`

Guacamole có 2 tệp cấu hình chính, `/etc/guacamole` được tham chiếu bởi  biến môi trường `GUACAMOLE_HOME` và `/etc/guacamole/guacamole.properties` là tệp cấu hình chính được sử dụng bởi Guacamole và các thành phần mở rộng của nó. 

Các tệp cấu hình khác nằm trong `/etc/guacamole/extentions` và `/etc/guacamole/lib/`. Do đó, ta tạo ra 2 thư mục này :

```
mkdir /etc/guacamole/{extensions,lib}
```

Thêm biến môi trường của guacamole vào tập tin cấu hình tomcat8: 

```
echo "GUACAMOLE_HOME=/etc/guacamole" >> /etc/default/tomcat8
```

Tạo file   `guacamole.properties` trong `/etc/guacamole` và thêm vào file nội dung sau : 

```
vim /etc/guacamole/guacamole.properties
```
```
guacd-hostname: localhost
guacd-port:    4822
user-mapping:    /etc/guacamole/user-mapping.xml
auth-provider:    net.sourceforge.guacamole.net.basic.BasicFileAuthenticationProvider
basic-user-mapping:    /etc/guacamole/user-mapping.xml
```

Sau đó, lưu tệp cấu hình và liên kết các cấu hình guacamole với Tomcat servlet như sau: 

```
ln -s /etc/guacamole /usr/share/tomcat8/.guacamole
```

Sau đây ta sẽ cấu hình xác thực mặc định guacamole bằng cách tạo file `user-mapping.xml`. Nhưng trước tiên ta cần tạo mật khẩu mã hóa md5. 

```
printf '%s' "password" | md5sum
```
Thay `password` bằng mật khẩu sử dụng khi login vào guacamole 

Tạo file `user-mapping.xml`

```
vim /etc/guacamole/user-mapping.xml
```

Thêm vào file nội dung như sau : 

```
<user-mapping>
        
    <!-- Per-user authentication and config information -->

    <!-- A user using md5 to hash the password
         amos user and its md5 hashed password below is used to 
             login to Guacamole Web UI-->
    <authorize 
            username="admin"
            password="<password đã được mã hóa>"
            encoding="md5">

        <!-- First authorized connection -->
        <connection name="CentOS 7">
            <protocol>ssh</protocol>
            <param name="hostname">10.10.34.162</param>
            <param name="port">22</param>
            <param name="username">thuctap</param>
        </connection>

        <!-- Second authorized connection -->
        <connection name="Ubuntu Desktop 20.04">
            <protocol>rdp</protocol>
            <param name="hostname">10.10.34.196</param>
            <param name="port">3389</param>
            <param name="username">thuctap</param>
        </connection>

    </authorize>

</user-mapping>
```

Trong thẻ mở `authorize` : 

- Thay đổi `username` bằng user muốn sử dụng khi đăng nhập vào guacamole trên web 
- Thay đổi password bằng password được mã hóa ở câu lệnh trước. 

Trong các thẻ chỉ định connection thì mình đã tạo 2 thẻ. 1 thẻ sử dụng để kết nối tới centos7 bằng ssh với user là `thuctap`. Thẻ còn lại để chỉ định kết nối tới Ubuntu bằng cách sử dụng remote desktop cũng với user `thuctap`. 

Hãy thay user `thuctap` bằng user được cấp quyền trên máy chủ của bạn. Có thể là user `root`. 

Khởi động lại Tomcat và guacd

```
systemctl restart tomcat8
systemctl restart guacd
```

## Truy cập trình duyệt Web để xác minh cài đặt 

Bây giờ hãy truy cập trình duyệt web và điều hướng đến url có định dạng sau: `http://server-ip:8080/guacamole` . Với máy Ubuntu của mình có địa chỉ là `10.10.35.193` nên url của mình là `http://10.10.35.193:8080/guacamole`. 

Nếu đã cấu hình theo các bước trên và thành công sẽ có giao diện như sau : 

![Imgur](https://i.imgur.com/HBsDX6U.png)

Hãy nhập vào username và password đã khai báo trong file `user-mapping.xml`. Và sẽ được điều hướng đến giao diện điều khiển của guacamole. 

![Imgur](https://i.imgur.com/7i3OHug.png)
