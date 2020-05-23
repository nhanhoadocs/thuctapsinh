#!/bin/bash

#Script 

# Trước khi chạy phải sửa file /etc/prosody/conf.avail/meeting1.workfromhome.vn.cfg.lua
#VirtualHost "guest.meeting1.workfromhome.vn"
#        authentication = "internal_plain"
#        c2s_require_encryption = false


INPUT_FILE='list.csv'

# Vòng lặp 1
i=0
while read -r line;do #đọc từng dòng 
    username[$i]=$(echo $line | awk -F ',' '{print $1}')
    domain[$i]=$(echo $line | awk -F ',' '{print $2}')
    password[$i]=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
    i=$(($i+1))
done < $INPUT_FILE

echo 'USER,DOMAIN,PASSWORD' > $INPUT_FILE

# Vòng lặp 2
for (( x=1 ; x<i ; x++ ))
do
    echo "${username[$x]},${domain[$x]},${password[$x]}" >> $INPUT_FILE
    sudo prosodyctl register ${username[$x]} ${domain[$x]} ${password[$x]}
done
echo "Đã tạo $(($i-1)) tài khoản"

#file csv co dang
#user, domain, pass
#dung, test.vn, 
#dung1, test.vn, 
#dung2, test.vn,
#con tro chuot dat o duoi
#chua hoan thien