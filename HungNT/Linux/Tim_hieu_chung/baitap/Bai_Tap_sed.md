
Lời giải  
1. 
 ```
 sed -i "s,http://127.0.0.1:8086,http://192.168.69.69:8086,g" filethuchanh.conf    
 sed -i "/192.168.69.69/s/^  #//" filethuchanh.conf
```  

2.  
```
sed -i "/inputs.net/s/^# //" filethuchanh.conf
```
3. 
```
sed -i "/username/s/telegraf/nguoidung@hocchudong.com/" filethuchanh.conf  
sed -i "/username/s/^  # //" filethuchanh.conf
```  

4. 
```
 sed -i "/password/s/metricsmetricsmetricsmetrics/Matkhau@ok$#/" filethuchanh.conf
sed -i "/password/s/^  # //" filethuchanh.conf
```
