# Tìm hiểu CronTab
## Crontab là gì?
`Crontab` là nơi lưu trữ tất cả các dòng lệnh đã lập lịch sẵn. Nó sẽ tự động chạy các lệnh đó khi đến thời gian đã định trước hoặc theo đúng chu khì đã định.
## Cấu trúc của crontab
Một crontab file có 5 trường xác định thời gian và cuối cùng là câu lệnh để thực hiện

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/cron1.gif)

Nếu một cột được gán ký tự `*` điều đó có nghĩa là câu lệnh sẽ chạy ở mọi giá trị ứng với cột đó.
### Ví dụ:
 * Chạy một câu lệnh 20 phút một lần
     * `0,20,40 * * * * command` hoặc `*/20 * * * * command` với cách thứ nhất nó sẽ chạy vào đúng phút thứ 0 20 và 40 còn với cách thứ 2 khi hoàn thành lệnh nó sẽ bắt đầu chạy với 20 phút một lần.
 * Chạy một câu lệnh vào đúng 5h chiều các ngày từ thứ 2 đến thứ 6
     * `0 17 * * 1,2,3,4,5 command`
*Chú ý* khi thêm câu lệnh `@reboot command` thì câu lệnh `command` sẽ được thực hiện ngay khi hệ thống khởi động.
## Một số lệnh thường dùng
 * `crontab -e` tạo hoặc chỉnh sửa file crontab

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/cron2.png)

Với lệnh `crontab -e` ta tiến hành ghi vào đó như ta ghi vào 1 file khi sử dụng trình soạn thảo `vi` hoặc `vim`
 * `crontab -l` hiển thị file crontab
 * `crontab -r` xóa file crontab

Thông thường các máy đã đều được cài sẵn `crontab` tuy nhiên vẫn có trường hợp không có. Nếu dùng lệnh `crontab -l` mà được trả lại `-bash: crontab: command not found` thì ta cần cài `crontab` thủ công. Ta cũng có thể kiểm tra xem nó đã được cài chưa bằng cách dùng lệnh `yum list installed | grep crontab` nếu nó đã được cài thì ta sẽ thấy kết quả trả về. Nếu chưa được cài sẵn ta dùng lệnh sau để cài:
 * `yum install cronie`
Sau đó khởi động nó và để nó tự động chạy mõi khi reboot bằng cách nhaaoj vào các lệnh sau:
 * `service crond start`
 * `chkconfig crond on`

### Chỉ định user chạy một câu lệnh 
Vào file `/etc/crontab` và thêm thông tin vào file này. Thông tin trong đây có dạng
`# m h dom mon dow user      command`
Nhưng thông thường sẽ không làm theo cách này vì ko may sẽ sửa nhầm gây ảnh hưởng tới toàn hệ thống. Ta có một các khác. Ta vào thư mục `/etc/cron.d` ta có thể thoải mái thêm các file trong này và các câu lệnh thời gian và user thực hiện cũng giống như trong file `/etc/crontab`
