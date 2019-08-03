# Giới thiệu 
Có hai hệ thống được sử dụng rộng rãi là tiêu chuẩn SI ( dựa trên cơ sở 1000 - mũ 10 ) và tiêu chuẩn IEC ( dựa trên cơ sở 1024 - mũ 2 )

## Chuyển đổi theo tiêu chuẩn SI
    Chuyển đổi theo theo tiêu chuẩn SI là sử dụng cơ số 10

### Ví dụ
- 1 KB = 1000 bytes
- 1 MB = 1000 KB = 1000000 bytes
- 1 GiB (Gibibyte) = 1* 8 = 8 Gib (Gibibit)
- 1 GiB (Gibibyte) = 1* 10^3 = 1000 MiB (Mebibyte)
- 1 GiB (Gibibyte) = 1* 8*10^3 = 8000 Mib (Mebibit)
- 1 GiB (Gibibyte) = 1* 10^3*10^3 = 1000000 KiB (Kibibyte)

Tương tự như vậy chúng ta nhân 10^3 lên.

## Chuyển đổi theo tiêu chuẩn IEC
    Chuyển đổi theo theo tiêu chuẩn IEC là sử dụng cơ số 2

Ví dụ

- 1 KiB = 1024 byte
- 1 MiB = 1024 KiB = 1048576 byte
- 1 GB (Gigabyte) = 1* 8 = 8 Gb (Gigabit)
- 1 GB (Gigabyte) = 1* 2^10 = 1024 MB (Megabyte)
- 1 GB (Gigabyte) = 1* 8*2^10 = 8192 Mb (Megabit)
- 1 GB (Gigabyte) = 1* 2^10*2^10 = 1048576 KB (Kilobyte)

Tương tự như vậy chúng ta nhân 2^10 lên.
Đối với đơn vị thể hiện tốc độ như Mbps hay MBps thì ps tương ứng với /s hay per second


## Cách đọc đơn vị dữ liệu

| Kí hiệu | Diễn giải |
|---------|-----------|
|b        |Bit        |
|B        |Byte       |
|Kb       |Kilobit    |
|KB       |Kilobyte   |     
|Mb       |Megabit    |
|MB       |Megabyte   |
|Gb       |Gigabit    |
|GB       |Gigabyte   |





## Công thức để chuyển đổi SI thành IEC: 
    x * (1000 / 1024)^n * 1000^(m - n)
trong đó n là số mũ của đơn vị đích và m là số mũ của bản gốc.

### Ví dụ:
- 4 TB = 4 * (1000 / 1024)^4 * 1000^0 TiB ≈ 3.64 TiB
- 4 TB = 4 * (1000 / 1024)^3 * 1000^1 GiB ≈ 3725 GiB

Các nhà sản xuất lưu trữ sử dụng SI để đo lường và dán nhãn cho thiết bị, trong khi hầu hết các hệ điều hành sử dụng IEC để đo và hiển thị không gian. Do đó, lưu trữ 4 TB sẽ được báo cáo 3725 GiB trong hệ thống.

Tuy nhiên, các đơn vị thường được sử dụng trong mạng ít gây nhầm lẫn hơn nhiều. Nó luôn luôn dựa trên 1000, ví dụ: 1 Mb = 1000/8 MB. Ngược lại, khi nói về RAM, IEC luôn được sử dụng, do đó, RAM 8 GB cho biết dung lượng 8 GiB.

Với sự tăng trưởng nhanh chóng của cường độ dữ liệu, sự khác biệt giữa các phép đo SI và IEC không còn có thể bỏ qua. Để làm cho mọi thứ trở nên phức tạp hơn, một tiêu chuẩn khác của JEDEC B100.01 định nghĩa về kiểu K là 1024, kiểu M là 1024 K và và kiểu G là 1024 M. Hệ thống này được Windows Explorer sử dụng, do đó KB trong Windows Explorer bằng với KiB và MB thực tế là MiB.




<img src="https://i.imgur.com/e4cPX7o.png">


