# Detect Strange Files Script - Phát hiện các file lạ

Một máy chủ đang chạy dịch vụ bị hacker xâm nhập và thêm file mã độc vào trong thư mục chạy dịch vụ.

Ta sẽ giám sát việc các file lạ được thêm vào thư mục dịch vụ bằng cách kiểm tra danh sách các file trong thư mục với danh sách các file chuẩn tồn tại trong thư mục chạy dịch vụ.

Nếu có file lạ hay mất file sẽ gửi cảnh báo qua email hoặc telegram.

## Mô hình
Máy chạy dịch vụ wordpress:
- IP : 10.10.34.163/24
- OS : CentOS-7
- Thư mục root của wordpress: `/var/www/html/`
- Đã cài dịch vụ gửi mail ssmtp (Nếu sử dụng mail để cảnh báo)

## Kịch bản của script
1. Ban đầu, ta sẽ tạo 1 file `/opt/listPHP` để lưu danh sách các file ban đầu của dịch vụ.

2. Thêm 1 hoặc nhiều file vào thư mục `/var/www/html/`

3. Khi script chạy sẽ lấy danh sách các file vào thời điểm đó lưu vào `/opt/listPHP.temp` và so sánh với danh sách file trước đó. 
    - 3.1. Nếu danh sách các file không thay đổi thì dừng lại. Đồng thời ghi log `/var/log/listPHP.log`

    - 3.2. Nếu danh sách các file có sự khác nhau thì sẽ gửi cảnh báo về mail hoặc Telegram với tên các file khác nhau. Đồng thời ghi log vào `/var/log/listPHP.log`

4. Sau khi kiểm tra và gửi cảnh báo (Nếu có khác nhau), script sẽ tiến hành lưu lại danh sách file hiện tại vào file `/opt/listPHP` và xóa file `/opt/listPHP.temp`.

## Script
Tạo file script tại thư mục `/opt`
```
vi /opt/detect_strange_files.sh
```

Nội dung script:
```sh
#!/bin/bash

#~~~ SCRIPT DETECT STRANGE FILES ~~~#

DATE=$(date)
IP=$(hostname -I)
HOSTNAME=$(hostname -f)
MAIL='youremail@mail.com'

DIR='/var/www/html/'
FILE_LIST='/opt/listPHP'
TEMP_FILE='/opt/listPHP.temp'
FILE_CHANGE=''

#-----------------------------------#

# Hàm kiểm tra thay đổi danh sách file
f_check_change(){
    ls $DIR > $TEMP_FILE

    if diff $FILE_LIST $TEMP_FILE ; then
        return 1
    else
        return 0
    fi
}

# Lấy danh sách file thay đổi
f_get_file_change(){
    cat $FILE_LIST >> $TEMP_FILE
    FILE_CHANGE=$(sort $TEMP_FILE | uniq -u)
}

# Gửi cảnh báo
f_send_alert(){
    # Nội dung cảnh báo
    MESS=$(echo -e "Subject: Detect_Strange_File\n\nThời gian: $DATE\nHostname: $HOSTNAME  IP:  $IP\nDanh sách các file bị mất hoặc mới được thêm vào:\n-------\n$FILE_CHANGE")
    
    echo "$MESS" | /usr/sbin/ssmtp $MAIL
}

# Xóa bỏ file temp
f_remove_temp(){
    rm -f $TEMP_FILE
}

#-----------------MAIN-----------------#
main(){
    if f_check_change; then
        echo "$DATE error : Have strange file !!!!" >> /var/log/listPHP.log
        f_get_file_change
        f_send_alert
        ls $DIR > $FILE_LIST
    else
        echo "$DATE OK" >> /var/log/listPHP.log
    fi

    f_remove_temp
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

main
exit
```

Bạn có thể tùy chỉnh gửi cảnh báo qua Telegram.

## Set Crontab
Đặt crontab 30 phút kiểm tra một lần:
```
crontab -e
```

Thêm dòng sau:
```
*/30 * * * * /opt/detect_strange_files.sh 
```

Bạn có thể đặt thời gian ngắn để kiểm tra trước khi cho hoạt động chính thức.