# SSH Logs
- Có thể thực hiện kiểm tra **logs** đăng nhập **SSH** trong file `/var/log/secure`
    ```
    # cat /var/log/secure
    ```
    <img src=https://i.imgur.com/rb9YAxN.png>

- Lọc **logs SSH** :
    ```
    # cat /var/log/secure | grep sshd
    ```
    <img src=https://i.imgur.com/imZeSUQ.png>

- Lọc **logs SSH** đăng nhập thất bại :
    ```
    # cat /var/log/secure | grep sshd | grep Failed
    ```
    <img src=https://i.imgur.com/CsL6OUa.png>