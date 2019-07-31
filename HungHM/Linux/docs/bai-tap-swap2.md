#Swap

## 1.Cách Tắt Swap của máy.


- kiểm tra không gian hoán đổi có sẵn sử dụng lệnh này ` swapon -s `  hoặc `free -m`

<img src ="https://imgur.com/PFrn5xR.jpg">

- Sử dụng lệnh

`swapoff -a`

Sau đó command lại trong /etc/fstab

<img src="https://imgur.com/BgkKqGU.jpg">

sau đó reboot lại hệ thống

- kết quả trả về

<img src ="https://imgur.com/Yc5mibP.jpg">

## 2.Tạo một phân vùng Swap 4G

- Các bước để tạo / thêm tệp hoán đổi mới trên Linux

    - Tạo tập tin hoán đổi bổ sung với lệnh dd trong / (root). Bạn có thể chọn bất kỳ phân vùng nào khác nhưng nó phải được gắn (Ví dụ: / opt, / usr, / NewMountedPartition)

    `dd if=/dev/zero of=/swapfile bs=1M count=4048`

<img src="https://imgur.com/ddQFf01.jpg">

<img src="https://imgur.com/iiPpgHG.jpg">

- cấp quyền và định dạng lại swapfile

<img src="https://imgur.com/ASdaSRe.jpg">

- `swapon /swapfile` để bật file lên

<img src ="https://imgur.com/P32e71e.jpg">

<img src="https://imgur.com/LQPOAez.jpg">


```
dd if=/dev/zero of=/swapfile bs=1M count=4048
ls -lah
chmod 600 /swapfile
mkswap /swapfile
free -m 
swapon /swapfile
swapon --show
cp /etc/{fstab,fstab.bk}
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

```