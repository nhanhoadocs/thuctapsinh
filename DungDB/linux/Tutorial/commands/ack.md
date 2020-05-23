# ACK

https://quantrimang.com/cach-tim-mot-tu-cu-the-trong-mot-file-tren-linux-164074

## Cài đặt

Cài đặt trên CentOS 7

    yum install -y epel-release 
    yum install ack

Cài đặt trên Ubuntu 18.04

    apt-get install -y
    apt-get install -y ack-grep

## Sử dụng

Cách thông thường 

    ack chuoi_can_tim thu_muc_can_tim

Ví dụ:

Tìm từ Accepted trong thư mục `/var/log`

    ack Accepted /var/log/

## Các option

`-c`: Đếm

Ví dụ:

    ack -c Accepted /var/log/


`-w`: Chỉ chính xác từ cần tìm

    ack -w Authentication /var/log/

