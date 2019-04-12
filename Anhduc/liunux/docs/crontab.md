# 1. Tìm hiểu về crontab
a) Khái niệm 
- Là một tiện ích cho phép thực hiện các lệnh một cách tự động theo định kỳ.
b) Cách thức hoạt động
- Một cron schedule đơn giản là một text file. Mỗi người dùng có một cron riêng. 
- Crontab không cho phép bạn sửa hoặc tạo  trực tiếp với các tình soạn thảo nào trừ khi dùng lệnh crontab 
- Ví dụng như: 
    - crontab -e: Chỉnh sửa file crontab
    - crontab -l:hiển thị file crontab
    - crontab -r: sóa file crontab 
c) Cấu trúc của crontab
- Một crontab file có 5 trường xác định thời gian và có cấu trúc như sau: 
![](https://github.com/duckmak14/linux/blob/master/Crontab/Screenshot%20from%202018-11-22%2013-47-12.png)
- nhìn ảnh thì ta thấy 5 dấu sao đầu tiên sẽ là đại lượng thời gian 
- từ trái qua phải theo thứ tự sẽ là: phút, giờ, ngày, tháng và tuần
- Một số ví dụ minh họa về cách hiểu của các dấu sao 
    - 0 0 * * *: Vào 0 giờ 0 phút hằng ngày sẽ thực hiện 
    - 0 1 23 * *: và 1 giờ 0 phút ngày 23 hằng tháng 
    - 5 1 * * 1: vào một giờ 5 phút thứ 2 mỗi tuân 
    - 30 * * * *: 30 phút một lần 
d) Cài đặt crontab 
- Khi dùng centos thì crontab sẽ không có sẵn nên ta sẽ cài bằng lệnh `yum install cronie`
![](https://github.com/duckmak14/linux/blob/master/Crontab/Screenshot%20from%202018-11-22%2014-30-20.png)
- Sau đó khởi động nó và để nó tự động chạy mõi khi reboot bằng cách sử dụng các lệnh sau:
service crond start
chkconfig crond on
# 2 Thực hành 
- Ta sẽ làm một ví dụ là sao chép file .bashrc vào /sbin lúc 6h mỗi ngày
![](https://github.com/duckmak14/linux/blob/master/Crontab/Screenshot%20from%202018-11-22%2015-00-06.png)

