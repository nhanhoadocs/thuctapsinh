# Cấu hình authen đăng nhập trước khi truy cập trang web 

Các bước thực hiện trên nginx reverse proxy 

### 1. Cài đặt gói 

```
yum install -y httpd-tools
```

### 2. Tạo userr và mật khẩu để đăng nhập 

Tại đây ta tạo user có tên là addmin, sau đó nhập vào mật khẩu. User và mật khẩu sẽ được lưu tại file `/etc/nginx/.htpasswd`

```
htpasswd -c /etc/nginx/.htpasswd admin
```
### 3. Thêm vào file đoạn cấu hình như sau: 

Phần cấu hình được thêm tại vị trí trong ô màu đỏ :

![Imgur](https://i.imgur.com/bvPsWBS.jpg)

### Kiểm tra 

Truy cập vào web và kiểm tra, hiển thị như sau là đã thành công : 


![Imgur](https://i.imgur.com/Eq2rdzG.jpg)