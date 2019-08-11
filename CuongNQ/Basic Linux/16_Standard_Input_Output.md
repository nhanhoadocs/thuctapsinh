# Standard Input - Standard Output
<p align=center><img src=https://i.imgur.com/vqa7OdX.gif width=50%></p>

- **Standard Input ( stdin - 0 ) :** dữ liệu vào chuẩn
- **Standard Output ( stdout - 1 ) :** dữ liệu ra chuẩn
- **Standard Error ( stderr - 2 ) :** dữ liệu ra lỗi
    - Chuyển hướng **stdout** ra file :
        ```
        # [command] > file.txt
        ```

        <img src=https://i.imgur.com/449uoeS.png>

    - Chuyển hướng **stderr** ra file :
        ```
        # [command error] 2> file.txt
        ```

        <img src=https://i.imgur.com/xsa8Bif.png>

    - Chuyển hướng cả dữ liệu ra chuẩn và lỗi ra file :
        ```
        # [command ( error )] &> file.txt
        ```

        <img src=https://i.imgur.com/pUuwFfb.png>