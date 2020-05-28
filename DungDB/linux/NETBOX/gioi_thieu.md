# Netbox

## Giới thiệu 

Netbox là ứng dụng web mã nguồn mở dùng để quản lý và ghi lại các mạng máy tính. Ban đầu được hình thành bởi đội ngũ kỹ thuật mạng tại DigitalOcean, NetBox được phát triển đặc biệt để giải quyết các nhu cầu của các kỹ sư mạng và cơ sở hạ tầng. Nó bao gồm các khía cạnh sau đây của quản lý mạng:

- IP address management (IPAM): Quản lý địa chỉ IP, mạng, VRF, VLAN
- Trang thiết bị rack: Tổ chức theo group và site
- Các thiết bị: Các loại thiết bị và nơi chúng được cài đặt
- Các kết nối: Mạng, console, kết nối nguồn giữa các thiết bị
- Ảo hóa: Các thiết bị ảo hóa và các cluster
- Mạch dữ liệu (Data circuits): Đường truyền và các nhà cung cấp mạng 
- Mật khẩu: Quản lý mật khẩu dưới dạng mã hóa

Netbox **KHÔNG** cung cấp:

- Giám sát mạng
- DNS server
- RADIUS server 
- Quản lý cấu hình
- Quản lý cơ sở vật chất

**Stack ứng dụng:**

Netbox được dựng trên Framework Django Python và một database PostgreSQL. Nó hoạt động như là một dịch vụ Web Server Gateway Interface đằng sau lựa chọn của bạn về máy chủ HTTP.

|Function	    |Component         |
|:--------------|-----------------:|
|HTTP service   |	nginx or Apache|
|WSGI service   |gunicorn or uWSGI |
|Application    |Django/Python     |
|Database       |PostgreSQL 9.4+   |
|Task queuing   |	Redis/django-rq|
|Live device access|NAPALM         |

**Phiên bản Python được hỗ trợ**

Netbox hỗ trợ phiên bản Python 3.6 và 3.7 (Phiên bản 3.5 đã dừng hỗ trợ từ Netbox v2.8). 

Phiên bản hiện tại là v2.8.3

## Cài đặt

Cài đặt theo thứ tự:

- PostgreSQL database
- Redis
- Các thành phần netbox
- HTTP daemon
- Xác thực LDAP (Optional)

Tổng quan đơn giản về stack ứng dụng của Netbox để tham khảo:

![Imgur](https://i.imgur.com/SagfCxL.png)

https://github.com/netbox-community/netbox

https://netbox.readthedocs.io/en/stable/