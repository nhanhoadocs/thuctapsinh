# Tìm hiểu về Bash Shell

## 1. Shell script
- Shell là chương trình giao tiếp với người dùng , chấp nhận các lệnh nhập từ keyboard và thực thi nó .
- Nếu muốn sử dụng nhiều lệnh chỉ bằng 1 lệnh , có thể lưu chuỗi lệnh vào file text và bảo shell thực thi chuỗi lệnh thay vì tự nhập vào các lệnh .
- Shell-script là 1 chuỗi các lệnh được viết trong plain-text file ( giống batch trong MS-DOS nhưng mạnh mẽ hơn ) .
- **Ưu điểm** :
    - Shell-script có thể nhận input từ user , file hoặc output từ màn hình .
    - Tiện lợi để tạo nhóm lệnh riêng
    - Tiết kiệm thời gian
    - Tự động làm các công việc đã được lên lịch


## 2. Cách tạo và thực thi shell-script
**Bước 1:** Tạo file shell. File shell có đuôi là `.sh`
- Sử dụng `vi`, `vim`, ... để tạo file
- Dòng đầu tiên luôn là `#!/bin/bash` -> Bắt buộc
- Sau dấu `#` được coi là comment, chú thích của đoạn shell và không có giá trị trong việc thực thi

Ví dụ: file `helloWord.sh`
```bash
#!/bin/bash
echo "Hello World!"
```

**Bước 2:** Cấp quyền thực thi cho file 
```
chmod 755 helloWord.sh
```

**Bước 3:** Thực thi file shell
Có một vài cách để thực thi file shell
- *Cách 1*: 
    ```
    ./<tên_file_sh>
    ```

- *Cách 2*: 
    ```
    bash <tên_file_sh>
    ```

- *Cách 3*:
    ```
    sh <tên_file_sh>
    ```