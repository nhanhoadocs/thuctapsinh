# Hướng dẫn sử dụng Tool Python

Tool Python sử dụng để gửi cảnh báo về Telegram khi có SSH `Accepted` vào hệ thống hoặc khi chuyển từ user `sudo` lên user `root`.

Sử dụng trên 2 hệ điều hành là CentOS 7 và Ubuntu.

Thực hiện bằng user với quyền sudo hoặc người dùng root

## Kiểm tra version Python trên máy

Ta kiểm tra xem đã có version 3 của python được cài trong máy chưa. 
```
python3 --version
```

Nếu chưa có phiên bản python 3 trong máy, thực hiện cài đặt python3 

**Đối với CentOS:** 

```
yum install -y python3
```
Cài đặt Modul request

```
yum install -y python3-requests
```
**Đối với Ubuntu:**

```
apt install -y python3
```

Để sử dụng được chương trình này chạy như 1 tiến trình của hệ thống, ta làm như sau : 

## Bước 1: Tải về source code

```
cd /etc
mkdir sshalert
cd /etc/sshalert
```

### Tải về file `sshalert.py`: 

```
wget https://github.com/hungviet99/thuc_tap/raw/master/Ghi_chep_python/Turn_Python/sshalert.py
```

### Chỉnh sửa file như sau : 

#### Nhập vào file `Token ID` của Bot Telegram

```
sed -i 's/#TOKEN =/TOKEN = "918364925:AAGbl5y7463f8DFFx4RhkeB3_eRhUUNfHHw"/' /etc/sshalert/sshalert.py
```

**Lưu ý:** Thay giá trị `918364925:AAGbl5y7463f8DFFx4RhkeB3_eRhUUNfHHw` bằng token ID của bạn. 

#### Nhập vào message ID của Group trong telegram hoặc ID của bạn 

```
sed -i 's|#CHAT_ID =|CHAT_ID = -468923562|' /etc/sshalert/sshalert.py
```
**Lưu ý:** Thay ID chat `-468923562` bằng ID chat của bạn. 


## Tải về file service

### Tải file 

#### Đối với CentOS

```
cd /usr/lib/systemd/system
```
```
wget https://github.com/hungviet99/thuc_tap/raw/master/Ghi_chep_python/Turn_Python/sshalert.service
```

#### Đối với Ubuntu

```
cd /etc/systemd/system
```

```
wget https://github.com/hungviet99/thuc_tap/raw/master/Ghi_chep_python/Turn_Python/sshalert.service
```

### Chỉnh sửa file `sshalert.service`

Hiển thị đường dẫn tới Python3
```
which python3
```
và sẽ có kết quả tương tự như sau : 

```
/bin/python3
```

Sau khi có được đường dẫn tới python3, ta tiến hành chỉnh sửa file `sshalert.service`

Chỉnh sửa `/bin/python3` và thay bằng đường dẫn hiển thị trên máy bạn

#### Trên CentOS: 
```
sed -i 's|ExecStart=|ExecStart=/bin/python3 /etc/sshalert/sshalert.py|' /usr/lib/systemd/system/sshalert.service
```
#### Trên Ubuntu: 
```
sed -i 's|ExecStart=|ExecStart=/usr/bin/python3 /etc/sshalert/sshalert.py|' /etc/systemd/system/sshalert.service
```

### Khởi động dich vụ sshalert 

```
systemctl start sshalert.service
systemctl status sshalert.service
systemctl enable sshalert.service
```
