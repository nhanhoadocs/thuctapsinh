# Hướng dẫn viết script bắn tin Telegram khi ssh thành công

Để quản lý việc đăng nhập vào hệ thống, ta cần có những cảnh báo khi có người đăng nhập thành công vào hệ thống.

Giải pháp là ta sẽ sử dụng bot của Telegram để gửi cảnh báo qua một kênh Telegram.

## Chuẩn bị
- Máy chủ với IP public (hoặc IP private có thể ra ngoài internet)
- Có kết nối internet
- Đã có tài khoản Telegram

## Thực hiện
### 1. Tạo bot telegram
Nếu bạn đã có bot Telegram thì có thể sử dụng luôn.

[Tham khảo cách tạo bot telegram tại đây.](https://blog.cloud365.vn/linux/tao-canh-bao-su-dung-telegram-python/)

Sau khi tạo bot xong, ta sẽ để ý 2 thông số sau:

- Bot API token.
- ID kênh cảnh báo.

### 2. Cài đặt `jq`
`jq` là ứng dụng để đọc thông tin file JSON trên Linux.

Xem thêm cách `jq` tại : https://stedolan.github.io/jq/

- Trên Ubuntu
    ```
    apt-get -y install jq
    ```

- Trên CentOS 7
    ```
    yum install epel-release -y

    yum install jq -y
    ```

### 3. Tạo file script
Ta sẽ tạo file script tại thư mục `/etc/profile.d/`. Để khi đăng nhập vào hệ thống thì script sẽ thực hiện ngay lập tức.
- Tạo file script `ssh-telegram.sh`:
    ```
    vi /etc/profile.d/ssh-telegram.sh
    ```

- Nội dung script:
    ```sh
    # ID chat Telegram
    USERID="<target_user_id>"
    
    # API Token bot
    TOKEN="<bot_private_TOKEN>"

    TIMEOUT="10"

    # URL gửi tin nhắn của bot
    URL="https://api.telegram.org/bot$TOKEN/sendMessage"

    # Thời gian hệ thống
    DATE_EXEC="$(date "+%d %b %Y %H:%M")"

    # File temp
    TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'

    if [ -n "$SSH_CLIENT" ]; then
        IP=$(echo $SSH_CLIENT | awk '{print $1}')
        PORT=$(echo $SSH_CLIENT | awk '{print $3}')
        HOSTNAME=$(hostname -f)
        IPADDR=$(hostname -I | awk '{print $1}')

        # Lấy các thông tin từ IP người truy cập theo trang ipinfo.io
        curl http://ipinfo.io/$IP -s -o $TMPFILE
        CITY=$(cat $TMPFILE | jq '.city' | sed 's/"//g')
        REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
        COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
        ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')

        # Nội dung cảnh báo
        TEXT=$(echo -e "Thời gian: $DATE_EXEC\nUser: ${USER} logged in to $HOSTNAME($IPADDR) \nFrom $IP - $ORG - $CITY, $REGION, $COUNTRY on port $PORT")

        # Gửi cảnh báo
        curl -s -X POST --max-time $TIMEOUT $URL -d "chat_id=$USERID" -d text="$TEXT" > /dev/null

        # Xóa file temp khi script thực hiện xong
        rm $TMPFILE
    fi

    ```

## Kiểm tra
Tiến hành ssh vào server. Ta sẽ thấy cảnh báo từ Telegram tương tự như sau:

<img src="https://i.imgur.com/wOKABzw.png">