#!/bin/bash

#~~~ SCRIPT DETECT STRANGE FILES WITH MAIL~~~#

DATE=$(date)
IP=$(hostname -I)
HOSTNAME=$(hostname -f)
MAIL='yourmail@gmail.com'

DIR='/var/www/html/'
FILE_LIST='/opt/listPHP'
TEMP_FILE='/opt/listPHP.temp'
FILE_CHANGE=''

#-----------------------------------#

f_check_change(){
    ls $DIR > $TEMP_FILE

    if diff $FILE_LIST $TEMP_FILE ; then
        return 1
    else
        return 0
    fi
}

f_get_file_change(){
    cat $FILE_LIST >> $TEMP_FILE
    FILE_CHANGE=$(sort $TEMP_FILE | uniq -u)
}

f_send_alert(){
    # Nội dung cảnh báo
    MESS=$(echo -e "Subject: Detect_Strange_File\n\nThời gian: $DATE\nHostname: $HOSTNAME  IP:  $IP\nDanh sách các file bị mất hoặc mới được thêm vào:\n-------\n$FILE_CHANGE")
    
    echo "$MESS" | /usr/sbin/ssmtp $MAIL
}

f_remove_temp(){
    rm -f $TEMP_FILE
}

#-----------------------------------#
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

main
exit