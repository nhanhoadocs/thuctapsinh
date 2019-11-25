# Color Text in Python
- Để làm cho những đoạn text output dễ đọc hơn , có thể sử dụng mã `ANSI` để thay đổi màu text output . Rất hữu ích cho việc highlight các lỗi .
- Cú pháp :
    ```py
    \033[<text_style>;<text_color>;<background_color><text>
    ```
- Bảng màu `ANSI` Code cơ bản :

    | Text Colors | Code | Text Style | Code(`off`) | Background Color | Code |
    |-------------|------|------------|------|------------------|------|
    | Black | `30m` | No effect | `0` | Black | `40m` |
    | Red | `31m` | Bold | `1`(`22`) | Red | `41m` |
    | Green | `32m` | Negative | `2` | Green | `42m` |
    | Yellow | `33m` | Italic | `3`(`23`) | Yellow | `43m` |
    | Blue | `34m` | Underline | `4`(`24`) | Blue | `44m` |
    | Purple | `35m` | | | Purple | `45m` |
    | Cyan | `36m` | | | Cyan | `46m` |
    | White | `37m` | | | White | `47m` |
    | Reset All | `0m` | | | Default | `39m` |

- **VD :** In ra chữ có màu xanh lá đậm và không làm thay đổi màu phông chữ của terminal :
    ```py
    print("\033[1;32mBold Green", "\033[0m")
    ```
    <img src=https://i.imgur.com/BLDzRHS.png>
