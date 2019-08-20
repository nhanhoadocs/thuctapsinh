Nếu không muốn cài agent trên máy host bạn có thể dùng SSH để lấy thông số từ host. Bằng cách này các script sẽ được chạy trên các host và các dữ liệu trả về sẽ được gửi về zabbix server để có thể monitor host đó

**Cấu hình**

Để cài đặt bạn tạo một item trên host cần monitor. Ở đây chọn kiểu item là `SSH agent`

![](https://raw.githubusercontent.com/niemdinhtrong/thuctapsinh/master/NiemDT/Ghichep-zabbix/images/item-ssh/1.png)

Trong đó:
 * Authencation method: Có 2 kiểu xác thực SSH đó là sử dụng password hoặc sử dụng key.
 * User name: tên user của host cho phép ssh vào để thực hiện câu lệnh.
 * Executed script: câu lệnh để lấy thông tin

Ở ví dụ trên tôi xác thực bằng password. 

![](https://raw.githubusercontent.com/niemdinhtrong/thuctapsinh/master/NiemDT/Ghichep-zabbix/images/item-ssh/3.png)

Item được tạo ra

![](https://raw.githubusercontent.com/niemdinhtrong/thuctapsinh/master/NiemDT/Ghichep-zabbix/images/item-ssh/4.png)

Vào `Monitoring` -> `Latest data` để thấy các thông tin do item vừa tạo gửi về

![](https://raw.githubusercontent.com/niemdinhtrong/thuctapsinh/master/NiemDT/Ghichep-zabbix/images/item-ssh/5.png)

![](https://raw.githubusercontent.com/niemdinhtrong/thuctapsinh/master/NiemDT/Ghichep-zabbix/images/item-ssh/6.png)

**Nếu muốn cấu hình sử dụng key**

Thực hiện gen key

```
cd /var/lib
mkdir zabbix
chown zabbix:zabbix /var/lib/zabbix/
chmod 700 /var/lib/zabbix/
sudo -u zabbix ssh-keygen
```

Khi gen key sẽ hỏi ta muốn đặt key ở đâu. Tôi để mặc định là trong thư mục `/var/lib/zabbix/.ssh`.

Thực hiện send key lên máy client

```
sudo -u zabbix ssh-copy-id root@IP_client
```

Sửa file `/etc/zabbix/zabbix_server.conf`

Tìm dòng 

```
# SSHKeyLocation=
```

Sửa lại thành

```
SSHKeyLocation=/var/lib/zabbix/.ssh
```

Sau đó restart lại zabbix server

```
systemctl restart zabbix-server
```

Thực hiện add item trên web

![image](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/item-ssh/7.png)

Ta chọn `Authentication method` là `Public key`

* `User name`: Tên user trên client thực hiện ssh tới
* `Public key file`: Tên file chứa Public key 
* `Private key file`: Tên file chứa private key 
* `Key passphrase`: password của private key

Public key và private key nếu bạn không sửa thì sẽ là `id_rsa.pub` và `id_rsa`.

**Lưu ý**

Để đảm bảo việc bảo mật thì trên host bạn nên tạo ra một user và chỉ cho phép user này sử dụng một số quyền cần thiết để lấy thông tin gửi về server. Điều này sẽ tránh được việc truy cập những dữ liệu quan trọng trên host.