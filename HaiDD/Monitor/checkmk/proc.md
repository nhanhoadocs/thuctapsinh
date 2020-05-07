# Ghi chép về hệ thống tập tin `proc`

- Thông tin CPU
    ```
    cat /proc/cpuinfo
    ```


- Thông tin RAM
    ```
    cat /proc/meminfo
    ```

- Xem các module kernel được load
    ```
    cat /proc/modules
    ```

- Xem những filesystem nào được hệ thống hỗ trợ
    ```
    cat /proc/filesystems
    ```

- Xem các tệp trên mỗi quy trình. 
    
    Ví dụ: systemd với PID = 1
    ```
    ps aux | grep -i systemd | head -1

    OUTPUT:
    root         1  0.0  0.1 125352  3812 ?        Ss   13:53   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
    ```

## Các tệp quan trọng theo tiến trình
**Lưu ý:** `$pid` là Process ID
- `/proc/$pid/cmdline` : Giữ dòng lệnh hoàn chỉnh cho quá trình

- `/proc/$pid/cwd` : Liên kết tượng trưng (symbolic link) đến các thư mục

- `/proc/$pid/environ` : chứa môi trường khởi tạo khi chương trình bắt đầu

- `/proc/$pid/exe` : Liên kết tượng trưng đến đường dẫn của tệp đã được thực thi

- `/proc/$pid/fd` : Thư mục con chứa danh sách các tệp đã được mở theo tiến trình

- `/proc/$pid/io` : Chứa số liệu thống kê I/O cho tiến trình

- `/proc/$pid/limits`: Hiển thị giới hạn tài nguyên dành cho tiến trình

- `/proc/$pid/maps` : Các vùng bộ nhớ hiện được ánh xạ và quyền truy cập

- `/proc/$pid/stack` : Dấu vết của hàm gọi trong ngăn xếp kernel của tiến trình

- `/proc/$pid/stat` : Thông tin trạng thái về tiến trình

- `/proc/$pid/task/` : Thư mục chứa thông tin thread

## Các tệp hệ thống quan trọng
- `/proc/cmdline` : Các đối số được truyền cho kernel Linux trong thời gian khởi động

- `/proc/cpuinfo` : Thông tin liên quan đến CPU

- `/proc/meminfo` : Thống kê sử dụng RAM

- `/proc/filesystems` : Danh sách các hệ thống tập tin được hỗ trợ bởi kernel

- `/proc/modules` : Các mô-đun Kernel hiện đang được load

- `/proc/partitions` : Thông tin về từng phân vùng trên hệ thống

- `/proc/swaps` : Thông tin về vùng swaps

- `/proc/self` : Thư mục đề cập đến quá trình truy cập hệ thống tập tin `/proc`

- `/proc/slabinfo` : Thông tin về bộ đệm kernel

- `/proc/sys` : Các tập tin và thư mục con khác nhau về các biến kernel