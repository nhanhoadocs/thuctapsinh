# Lab restore ổ cứng trên portal

Hướng dẫn: https://kb.nhanhoa.com/pages/viewpage.action?pageId=37453910

VPS cần restore: 103.124.94.51

SSH vào VPS tắt dịch vụ httpd

![Imgur](https://i.imgur.com/8V1a056.png)

Lấy volume ID

![Imgur](https://i.imgur.com/CIrsexC.png)

![Imgur](https://i.imgur.com/190uZaO.png)

Tìm file backup

![Imgur](https://i.imgur.com/kcjL7os.png)

Có 2 bản backup có sẵn ở đây.

![Imgur](https://i.imgur.com/d1604hG.png)

![Imgur](https://i.imgur.com/AjqS8ZK.png)

Khi restore mà không tắt máy sẽ fail

![Imgur](https://i.imgur.com/EoJeP5C.png)

![Imgur](https://i.imgur.com/l3eqcf8.png)

Tắt máy ảo và làm lại

Hoàn thành

![Imgur](https://i.imgur.com/EN4SytV.png)

Danh sách job

![Imgur](https://i.imgur.com/Sa7IZuF.png)