# `dd` Command
- Cấu trúc lệnh :
    ```
    # dd if=/dev/zero of=newfile.txt bs=1G count=1
    ```
    - Trong đó :
        - `if` : **input file** . `/dev/zero` là 1 thiết bị đặc biệt , trả về `byte 0 ( \0 )` một cách vô hạn . Nếu tham số `if` không dược chỉ rõ , mặc định lệnh `dd` sẽ đọc dữ liệu từ ***stdin***
        - `of` : **output file** . Nếu tham số `of` không được chỉ rõ , mặc định , lệnh `dd` sẽ dùng ***stdout*** cho dữ liệu trả về .
        - `bs` : số byte cho 1 khối
            - Byte ( `1B` ) - `c`
            - Word ( `2B` ) - `w`
            - Block ( `512B` ) - `b`
            - Kilobyte ( `1024B` ) - `k`
            - Megabyte ( `1024kB` ) - `M`
            - Gigabyte ( `1024MB` ) - `G`
        - `count` - số khối `bs` được chỉ rõ để sao chép
    
    <img src=https://i.imgur.com/HSZFRpi.png>

- Lệnh `dd` tạo ra tập tin có kích thước bằng `count*bs` .
- Lệnh `dd` có thể dùng để đo các tác vụ bộ nhớ .
