# Cấu hình cảnh báo qua email

## Cài đặt và cấu hình postfix trên Centos 7

Thực hiện theo hướng dẫn:

https://news.cloud365.vn/huong-dan-gui-mail-dung-postfix/

## Cấu hình trong file `/etc/smokeping/config`

    vi /etc/smokeping/config

Sửa phần `*** Alerts ***` thành như sau:

Tôi gửi cảnh báo đến dungz1207@gmail.com.

Email dùng để gửi cảnh báo là doanbadungtmt@gmail.com

```
*** Alerts ***
to = dungz1207@gmail.com
from = doanbadungtmt@gmail.com

+someloss
type = loss
# in percent
pattern = >0%,*12*,>0%,*12*,>0%
comment = loss 3 times  in a row

+offlineatstartup
type = rtt
pattern = ==S,==U
comment = offline at startup

+hostdown_with_state
type        = loss
pattern     = >50%
edgetrigger = yes
comment     = host down

+lossdetect
type        = loss
pattern     = ==0%,==0%,==0%,==0%,==0%,>0%,>0%,>0%
comment     = suddenly there is packet loss

+lossdetect_with_state
type        = loss
edgetrigger = yes
pattern     = ==0%,==0%,==0%,==0%,==0%,>0%,>0%,>0%
comment     = sudden packet loss

+rttdetect
type    = rtt
pattern = <100,<100,<100,<100,<100,>100,>100,>100
comment = suddenly latency increased over 100ms

+lost_5_from_20_with_state
type        = matcher
edgetrigger = yes
pattern     = CheckLoss(l => 5,x => 20)
comment     = lost over 5 from 20 samples

+rtt_avg_increased
type        = matcher
pattern     = Avgratio(historic => 20, current => 2, comparator=>'>', percentage => 150)
comment     = average latency from last 2 samples increased over 150% when compared to average from last 20 samples
```

Trên đây là nhiều loại cảnh báo, sử dụng loại cảnh báo nào cho host nào là tùy bạn.

Thêm alert vào các host cần gửi cảnh báo:

Ví dụ:

Trước khi sửa:

```
 + Site2

 menu = Site2
 title = Site2

 ++ Host1-173

 menu = Host1
 title = 10.10.34.173
 host = 10.10.34.173

 ++ Host2-174
 menu = Host2
 title = 10.10.34.174
 host = 10.10.34.174

++ Host2-171
 menu = Host3
 title = 10.10.34.171
 host = 10.10.34.171
```

Sau khi sửa:

```
 + Site2

 menu = Site2
 title = Site2

 ++ Host1-173

 menu = Host1
 title = 10.10.34.173
 host = 10.10.34.173
 alerts = someloss,offlineatstartup,hostdown_with_state,rttdetect,rtt_avg_increased,lossdetect

 ++ Host2-174
 menu = Host2
 title = 10.10.34.174
 host = 10.10.34.174
 alerts = someloss,offlineatstartup,hostdown_with_state,rttdetect,rtt_avg_increased,lossdetect

++ Host2-171
 menu = Host3
 title = 10.10.34.171
 host = 10.10.34.171
 alerts = someloss,offlineatstartup,hostdown_with_state,rttdetect,rtt_avg_increased,lossdetect
```

Thử tắt host 10.10.10.173 thử xem có nhận được cảnh báo không.

**Kết quả:**

![Imgur](https://i.imgur.com/5xPLhSF.png)

![Imgur](https://i.imgur.com/gJ0o0cU.png)

Nhận được cảnh báo không ping được đến host 10.10.10.173 (lost 100%, host down)

Tham khảo: https://blog.sleeplessbeastie.eu/2017/09/11/how-to-keep-track-of-network-latency/