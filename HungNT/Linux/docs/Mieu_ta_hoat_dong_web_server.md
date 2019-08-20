**Mô tả :**  
- Trong bài viết sử dụng 2 máy ảo Centos 7 , 1 máy chạy apache web server , 1 máy còn lại làm client  

<img src="https://i.imgur.com/es6n5A4.png">  

- Khi ở client , ta bật browser lên và nhập tên web ta muốn truy cập :  
<img src="https://i.imgur.com/8Gc6oNU.png">  

Tùy vào thuật toán tìm kiếm hoặc lịch sử của browser , nó sẽ gợi ý  web mình cần hoặc các web với tên tương tự .  

- Sau khi nhấn enter , browser sẽ chạy dns lookup :
  - Tại trường hợp này ta truy cập vào website wordpress chạy trên virtual host của server , nên ta cần cấu hình dns tại file hosts của client :  
      
<img src="https://i.imgur.com/gOUDkvP.png">  

  - Tại máy sẽ kiểm tra các file cấu hình dns đầu tiên , tại đây là file hosts .(Do đã cấu hình tại máy client rồi nên sẽ thiết lập kết nối tới server luôn)  

  - Nếu không có sẽ tìm tiếp tại cache (cache của firefox , chrome ....)   
  - Nếu các bước trên không thành công , máy client sẽ gửi bản tin đến dns server(Ví dụ : 8.8.8.8) để tìm địa chỉ website cần truy cập.   
      - Nếu đã kết nối đến dns server từ trước , client sẽ gửi thẳng bản tin đến dns server để tìm địa chỉ và dns server sẽ trả về kết quả . Còn nếu chưa kết nối với dns server sẽ đi qua quá trình sau :    
      - Máy client gửi bản tin broadcast ARP để tìm địa chỉ dns server , khi bản tin đến hub , switch , router ... sẽ được đẩy ra tại các cổng của thiết bị để tìm địa chỉ dns server . Dns server sau khi nhận được bản tin arp sẽ gửi lại thông tin cho client về địa chỉ của mình . Sau đó client gửi bản tin dns để hỏi về địa chỉ của website    
    
<img src="https://i.imgur.com/EnyeBZY.png">   



- Sau khi nhận đủ địa chỉ IP và thông tin cần thiết (địa chỉ các port của các protocols,http là 80 , https là 443), browser thiết lập kết nối TCP đến web server để lấy dữ liệu (TCP-threeway handshake) .   
<img src="https://i.imgur.com/pyZWXxW.png">  
TCP-threeway handshake thiết lập kết nối giữa hai máy với nhau .Với ví dụ ở đây client sẽ gửi bản tin SYN để xác nhận là muốn thiết lập kết nối với server.Server sau khi nhận SYN sẽ gửi lại với bản tin SYN-ACK .Sau khi nhận được bản tin của server  client sẽ gửi lại bản tin ACK để để xác nhận . Sau đó kết nối giữa 2 máy được thiết lập  

<img src="https://i.imgur.com/XtPdo1X.png">  

Ta có thể thấy sau khi bắt gói tin , client với IP 192.168.30.137 đã gửi bản tin SYN để thiết lập kết nối , Server với IP 192.168.30.55 đã gửi lại với SYN_ACK và cuối cùng client gửi lại bản tin ACK Để thiết lập kết nối .      
**Lưu ý : Cổng của giao thức HTTP tại server luôn là 80 , trong khi đó cổng của client là một cổng lớn hơn 1024(để tránh các cổng thông thường)**

Khi thiết lập kết nối thành công , client sẽ gửi HTTP request GET để nhận dữ liệu và giữ kết nối tcp .  
Web server sẽ xử lý các request của client .Sau khi xử lý xong server sẽ gửi lại HTTP response cho client bao gồm các content , các file cần thiết rồi gửi lại cho client.  
<img src="https://i.imgur.com/9m93VAw.png">  
Như ảnh trên, sau khi xong quá trình bắt tay 3 bước tạo kết nối tcp , client gửi http request GET để lấy dữ liệu  ,client gửi lại bản tin HTTP response.  
- Chi tiết khi xem tcp stream :
     - Client sau khi kết nối thành công sẽ có giao thức GET để yêu cầu nhận dữ liệu .Ta thấy web browser sử dụng HTTP/1.1 , với kiểu kết nối keep-alive , nghĩa là kết nối sẽ được duy trì suốt thời gian truy cập website.  

    <img src= "https://i.imgur.com/R3av7mn.png">  

    - Server sẽ xử lý các request của client .  

    <img src="https://i.imgur.com/mbLrt8R.png">  

    - Sau khi nhận lại thông tin từ server client sẽ GET tiếp dữ liệu để hiển thị web.Ở trường hợp này là dữ liệu của wordpress trên apache.  

    <img src="https://i.imgur.com/pjmuDhq.png">  

    - Server xác nhận bằng status 200 OK và phản hồi lại client các dữ liệu ,file html , css , cookie,... cần thiết để hiển thị trên browser của client.Sau đó server có thể đóng kết nối hoặc duy trì kết nối đó.  

    <img src="https://i.imgur.com/jq5BBR9.png">  

    - Ví dụ về dữ liệu html được server phản hồi lại client :  

    <img src="https://i.imgur.com/NMJnx1B.png">  

    - Nếu client đã truy cập website này từ trước và website không có chỉnh sửa gì , có thể sẽ thấy thông số :  
    ```
    304 Not Modified  
    [response headers]  

    ```  
    Khi đấy web browser sẽ tự động nhận các dữ liệu từ cache. 
  
Browser tại client sẽ hiển thị website với các file html , css , php ,javascript ...  
<img src="https://i.imgur.com/sTT4TXs.png">    

-
