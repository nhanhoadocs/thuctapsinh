# Inode
- **Inode** ( ***index node*** ) là 1 cấu trúc dữ liệu chứa các **metadata**của file , thư mục trong các hệ thống file trong Linux .
- Trong 1 **inode** có các metadata sau :
    - Dung lượng file tính bằng `byte` 
    - **Device ID** : mã số thiết bị lưu file
    - **User ID** : mã số owner của file
    - **Group ID** : mã số group sở hữu file
    - **File mode** : gồm kiểu file và permission
    - Hệ thống phụ và các cờ hạn chế quyền truy cập file
    - **Timestamps** : các mốc thời gian khi : bản thân inode bị thay đổi ( **ctime** ) , nội dung file bị thay đổi ( **mtime** ) và lần truy cập mới nhất ( **atime** )
    - **Link count** : số lượng ***hard link*** trỏ đến **inode** .
    - Các con trỏ ( từ `11` đến `15` con trỏ ) chỉ đến các block trên ổ cứng dùng để lưu nội dung file . Theo các con trỏ này mới biết file nằm ở đâu để đọc nội dung .
> ***Chú ý*** :<br> - **Inode** không chứa tên file / thư mục<br>- Các con trỏ là thành phần quan trọng nhất : nó cho biết địa chỉ các **block** lưu nội dung file và tìm đến các **block** đó để có thể truy cập vào nội dung file .
- Các lệnh kiểm tra **inode** :
    - Show **số inode** :
        ```
        # ls -i <path/file_name>
        ```
        <img src=https://i.imgur.com/RrCS3KG.png width=80%>
    - Cho biết chi tiết nội dung **inode**
        ```
        # stat <path/file_name>
        ```

        <img src=https://i.imgur.com/ARDE0th.png>
