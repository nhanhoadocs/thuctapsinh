# Tái hiện lỗi kết nối DB trên Wordpress

Lỗi này xảy ra là do hết RAM dẫn đến process mysqld bị kill. Để tái hiện lại cần 1 máy cài wordpress (website có nội dung) có tài nguyên nhỏ (1 core 512M RAM và bỏ swap)

Thực hiện tạo một lượng truy cập lớn đến website. Nên tìm những trang phải query nhiều xuống DB. Lúc này Mysql sẽ sử dụng nhiều tài nguyên RAM dẫn đến hết tài nguyên.

Bạn có thể dùng các tool để benchmark. Hoặc có thể sử dụng tool python sau

```
import threading
import requests
import time

# Thoi gian timeout
timeout = 120

timeout_start = time.time()
def benchmark():
    while time.time() < timeout_start + timeout:
        a = requests.get('your_url')

# Neu web van hoat dong thi tang gia tri trong range len
for i in range(100):
    a = 'a_{}'.format(i)
    a = threading.Thread(target=benchmark)
    a.start()
```

