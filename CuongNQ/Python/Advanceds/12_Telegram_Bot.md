# Telegram Bot
## **1) Tạo Channel**
- **B1 :** Trên **Telegram Desktop** , chọn **New Channel** để tạo channel mới :
    
    <img src=https://i.imgur.com/NVCTitS.png>

- **B2 :** Điền thông tin của channel muốn tạo : `Tên channel` , `Mô tả` :
    <p align=center><img src=https://i.imgur.com/K79PjNf.png width=50%></p>
- **B3 :** Điền thông tin của channel muốn tạo : `Link` :
    <p align=center><img src=https://i.imgur.com/6m4DaP5.png width=50%></p>
- **B4 :** Channel được tạo thành công :
    <p align=center><img src=https://i.imgur.com/gja711S.png width=70%></p>

## **2) Tạo Bot**
- **B1 :** Tìm kiếm **BotFather** ở ô Search :

    <img src=https://i.imgur.com/XhBLT5H.png>

- **B2 :** Chat '`/newbot`' với **BotFather** để tạo 1 **bot** :

    <img src=https://i.imgur.com/1XBWjSx.png>

- **B3 :** Nhập tên gọi của **bot** ( có thể nhập bất kỳ mà không lo trùng ) :

    <img src=https://i.imgur.com/GHrGzfO.png>

- **B4 :** Nhập username của **bot** ( không được phép trùng vói bất kỳ username nào của telegram ) :

    <img src=https://i.imgur.com/1m1n5y6.png>

- **B5 :** Sau khi hoàn thành sẽ nhận được 1 dãy **token** như trên . Lưu lại **token** đó .
- **B6 :** Thêm **bot** vừa tạo vào trong **channel** và khởi động :
    <p align=center><img src=https://i.imgur.com/70k58CK.png width=50%></p>

    - Cho phép **bot** trở thành admin :
        <p align=center><img src=https://i.imgur.com/MjQVjrJ.png width=50%></p>
    - Giới hạn quyền của **bot** :
        <p align=center><img src=https://i.imgur.com/q1d00Fq.png width=50%></p>
    - Khởi động **bot** bằng cách chat với **bot** trong **channel** :

        <img src=https://i.imgur.com/0qGp0JV.png>


- **B7 :** Lấy **chat_id** : để lấy được **chat_id** truy cập URL theo công thức sau trên trình duyệt: 
    ```
    https://api.telegram.org/bot[TOKEN]/getUpdates
    ```
    - **VD :**
        ```
        https://api.telegram.org/bot788128271:AAGgK5F33pz4IuLvRDrER3R7mTuKQ0-IpOA/getUpdates
        ```
    - Kết quả trả về là kiểu dữ liệu `json` chứa **chat_id** . Lưu lại **chat_id** :

        <img src=https://i.imgur.com/vh1SuPy.png>
## **3) Cài đặt module Telegram**
- Cài đặt module `python-telegram-bot` :
    ```
    $ sudo pip install python-telegram-bot
    ```
- Thực hiện gửi message telegram bằng một đoạn code đơn giản :
    ```py
    import telegram

    def telegram_message(msg):
        try:
            telegram_notify = telegram.Bot("788128271:AAGgK5F33pz4IuLvRDrER3R7mTuKQ0-IpOA")       # token
            telegram_notify.send_message(chat_id="-1001361662279", text=msg, parse_mode='HTML')   # chat_id
        except:
            print('Failed')
    
    telegram_message('Successfully')
    ```
    - Kết quả : đã có message vào channel :

        <img src=https://i.imgur.com/b5yKxSH.png>