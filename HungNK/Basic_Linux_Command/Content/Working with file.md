## Dòng chảy của file ( file steams )

Khi mà những câu lệnh được thực thi, có ba kiểu file cơ bản và tiêu chuẩn luôn được mở:
1. Tiêu chuẩn cho đầu vào ( stdin )
2. Tiêu chuẩn cho đầu ra ( stdout )
3. Tiêu chuẩn cho lỗi ( stderr )

Thông thường, stdin từ bàn phím của bạn, stdout và stderr được in trên terminal của bạn. Thường thì stderr sẽ chuyển hướng đến file `error logging`. *stdin* thì thường được cung cấp bởi input trực tiếp từ file hoặc output của một câu lệnh trước thông qua `pipe` ( dấu '|' ). *stdout* thường được chuyển hướng trực tiếp đến file. Vì *stderr* là nơi các thông báo lỗi được viết, thường sẽ không có gì đi tới ở đó.

Trong Linux, tất cả các file mở đều đại diện nội bộ bởi cái được gọi là file miêu tả. Đơn giản là chúng được biểu diễn bởi các số bắt đầu từ 0.
- *stdin* được biểu diễn bằng số 0
- *stdout* được biểu diễn bằng số 1
- *stderr* được biểu diễn bầng số hai

Thông thường, nếu các tệp khác được mở ngoài ba tệp này, được mở theo mặc định, chúng sẽ bắt đầu biểu diễn từ số 3 và tăng từ đó.

Ta có thể chuyển hướng 3 tiêu chuẩn filesteams để chúng ta có thể lấy cả input từ pile hay command thay vì từ bàn phím. và ta cũng có thể viết output và errors vào một file nhưu là input của một command tiếp theo.

Ví dụ: có một chương trình gọi là do_s Something đọc từ stdin và ghi vào stdout và stderr, chúng ta có thể thay đổi nguồn đầu vào của nó:
```
$ do_something < input-file
```
Nếu ta muốn output ra đến một tệp:
```
$ do_something > output-file
```
Chúng ta có thể chuyển đầu ra của một lệnh hoặc chương trình sang một lệnh khác làm đầu vào của nó.
```
$ command1 | command2 | command3
```
Ví dụ trên là cái chúng ta gọi là pipeline và cho phép Linux kết hợp nhiều hành động của vài command vào làm một

## Tìm kiếm files

- dùng câu lệnh locate để tìm kiếm một file trong toàn bộ hệ thống. để thu hẹp kết quả tìm kiếm thì dùng lệnh grep + từ khóa

- ngoài ra còn có câu lệnh find để tìm kiếm trong một thư mục











