# Script ssh tele

Để script trong thư mục `/etc/profile.d` 

Nội dung:

`ssh-telegram.sh`

```SH
# save it as /etc/profile.d/ssh-telegram.sh
# use jq to parse JSON from ipinfo.io
# get jq from here http://stedolan.github.io/jq/
USERID="<target_user_id>"
KEY="<bot_private_key>"
TIMEOUT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'
if [ -n "$SSH_CLIENT" ]; then
	IP=$(echo $SSH_CLIENT | awk '{print $1}')
	PORT=$(echo $SSH_CLIENT | awk '{print $3}')
	HOSTNAME=$(hostname -f)
	IPADDR=$(hostname -I | awk '{print $1}')
	curl http://ipinfo.io/$IP -s -o $TMPFILE
	CITY=$(cat $TMPFILE | jq '.city' | sed 's/"//g')
	REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
	COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
	ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')
	TEXT="$DATE_EXEC: ${USER} logged in to $HOSTNAME ($IPADDR) from $IP - $ORG - $CITY, $REGION, $COUNTRY on port $PORT"
	curl -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
	rm $TMPFILE
fi
```

`USERID`: Là chat ID của bot

Lấy chat ID tại đây: https://api.telegram.org/bot[Token]/getUpdates

`KEY`: Token của bot telegram

Lấy tại Botfarther Telegram

![Imgur](https://i.imgur.com/ImJCSNJ.png)

Kết quả chạy script

![Imgur](https://i.imgur.com/f7Zw7EP.png)

Nếu là IP private thì sẽ không hiển thị các thông tin như đia chỉ, nhà mạng,... IP public thì sẽ hiển thị được.