Disk là nơi lưu trữ các thông tin của máy tính. Là nơi lưu trữ kết quả sau quá trình làm việc của người dùng được lưu trữ lại và nó sẽ không bị mất đi khi máy tính tắt. 

# Một số lệnh check disk trong linux 

### Lệnh lsblk 
Đây là lệnh dùng để hiển thị thông tin danh sách các storage  có sẵn ở trong máy hoặc những storage được chỉ định. Lệnh này hiển thị thông tin về các divice, partition và mount point của phân vùng. Nó không hiển thi dung lượng đã được sử dụng và còn trống trên mỗi storage

![](../images/screenshot.png)

Các option của lệnh disk 

| Option | DESCRIPTION|
|---|---|
| -a | Hiển thị tất cả |
| -b | Hiển thị theo byte | 
| -d | Chỉ hiển thị thông tin về disk |
| -m | Hiển thị quyền sở hữu, nhóm và mode của các phân vùng và divice|
| -V | Hiển thị phiên bản của lsklk |
| -h | Hiển thị giúp đỡ các option | 

### Command df
Lệnh df hiển thị các thông tin và các không gian sử dụng  của disk.

![](../images/screenshot_1.png)

Các option của lệnh df 
| option | DESCRIPTION |
|----|----|
| -h | Hiển thị ra size của ổ disk | 
| df --block-size |  chọn size hiển thị disk | 
| -T | Hiển thị kiểu của disk | 
| -t | Chọn kiểu disk để hiển thị |
| -v | Hiển thị phiên bản của lệnh | 
| --help | Hiển thị trợ giúp | 
| -x | Hiển thị disk không của type | 