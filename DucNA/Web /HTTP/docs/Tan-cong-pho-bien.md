# Các cách tấn công Web phổ biến 
1. Malware 
- Là phương cách tấn công sử dụng các phần mềm độc hại khác nhau 
- Kẻ tấn công sẽ tìm cách để đưa phần mềm độc hại vào trong máy tính để chiếm quyền kiểm soát 
- Có thể là một file nào đó yêu cầu tải tưởng chừng như vô hại 

2. SQL Injection Attack 
- SQl là ngôn ngữ được sử dụng để giao tiếp với DB của website sử dụng để lưu dữ liệu. Một cuộc tấn công SQL với mục đích truy cập vào DB để lấy thông tin dữ liệu quan trọng ở trong đó 
- Khi hacker đã có được user và password của một user trong DB thì họ sẽ có quyền đọc sửa xóa hoặc là thêm user khác trong DB đó. 
- Một số kiểu tấn công thuộc SQL infection 

3. Cross-Site Scripting (XSS) 
- Nếu như SQL injection là một cuộc tấn công hướng tới dữ liệu trong DB thì đây là một cuộc tấn công hướng tới người sử dụng. 
- Cả 2 đều sử dụng một website làm công cụ tấn công. XSS sẽ sử dụng để truyền mã độc vào trình duyệt của người sử dụng để chiếm quyền kiểm soát các session. 
- Bị chiếm session dẫn đến việc bị lộ các thông tin cookie được lưu trữ trên máy của người dùng 

4. Man-in-the-middle (MitM) attack - Tấn công trung gian 
- Là các cuộc tấn công mà hacker sẽ chèn và giữa các giao tiếp của client-server. Một số loại tấn công trung gian phổ biến là 
    - Session hijacking : Hacker sẽ chiếm quyền kiểm soát client. Sau đó Hacker sẽ thay địa chỉ IP của chúng thành địa chỉ IP client và tiếp tục cuộc hội thoại giữa client-server mà server không hề biết client đã bị chiếm session 
    - IP Spoofing : Hacker sử dung một địa chỉ đáng tin cậy để gửi đi một gói tin đến server đích. Và với địa chỉ đáng tin cậy đó thì server đã chấp nhận gói tin đó 
    - Replay : Là kiểu tấn công mà hacker sẽ chặn và lưu trữ các tin nhắn cũ và truyền tải một đoạn tin nhắn mới lên một cách hợp lệ 

5. Password attack
- Tấn công password là kiểu tấn công tìm ra password của người dùng bằng nhiều cách khác nhau: Có thể thử với các password ngẫu nhiên để tìm kiếm password của người dùng dựa trên các thông tin mà hacker có về nạn nhân. Hoặc có thể dựa vào các website không mã hóa password 
- Tấn công từ điển : hacker sẽ có một file chứa các password có thể xảy ra và rồi sẽ thử file đó bằng các command một cách tự động. 
- Để có thể bảo vệ tài khoản khỏi các cuộc tấn công password hãy tìm và đặt chế độ khóa tài khoản sau một số lần thử sai nào đó 

6. Eavesdropping attack
- Là cuộc tấn công sử dụng chặn lưu lượng mạng để lấy thông tin của người dùng. Kiểu tấn công này có 2 kiểu là 
    - Passive eavesdropping : hacker lấy thông tin bằng cách lấy từ các messges trên network 
    - Active eavesdropping : hacker giả mạo một thành một đơn vị hoặc người nào đó đáng tin cậy để lấy thông tin từ người dùng 
7. Denial-of-service (DoS) and distributed denial-of-service (DDoS) attacks
- DoS là một cuộc tấn công vào tài nguyên của hệ thống để nó không thể đáp ứng các requests. 
- DDoS cũng là một cuộc tấn công tài nguyên hệ thống nhưng nó được khởi chạy tự một hệ thống lớn các host bị nhiễm phần mềm độc do hacker kiểm soát 
- 2 kiểu tấn công này không nhằm mục đích lấy thông tin dữ liệu mà chỉ có mục đích để các hệ thống bị treo. Các kiểu tấn công này chỉ phù hợp với việc kinh doanh bằng website 
- Có rất nhiều loại tấn công DoS và DDos khác nhau phổ biến nhất là cuocj tấn công với TCP SYN flood attack, teardrop attack, smurf attack, ping-of-death attack and botnets.

a)TCP SYN flood attack
- là kiểu tấn công sử dụng bộ nhớ đệm trong quá trình bắt tay 3 bước TCP. Thiết bị của kẻ tấn công liên tục gửi đi các gói tin với cờ SYN được bật trong khi nó không nhận các lại các response từ phía server

b) Teardrop attack
- Các gói tin được truyền đi dưới dạng HTTP/2 thì sẽ được chia nhỏ ra thành các gói tin nhỏ hơn và được đánh dấu. Kiểu tấn công này làm loạn các số thứ tự và kiểu đánh dấu để server tốn tài nguyên hơn để xử lý vấn đề này. 

c) Smurf attack
- Kiểu tấn công này sẽ sử dụng các gói tin ICMP. Đầu tiên nó sẽ giả mạo IP là địa chỉ máy nạn nhân và gửi ICMP request tới broadcast. Sau khi xong thì nạn nhận sẽ nhận được một loạt ICMP rely từ broadcast và rất tốn tài nguyên để xử lý. 

d) Botnets
- Là kiểu tấn công sử dụng môt lượng lớn host bị nhiễm phần mềm độc hại. Hacker sẽ sử dụng chúng để đồng thời tấn công một website khiến cho nó bị sập 

8. Phishing and spear phishing attacks
- Tấn công lừa đảo là sự kết hợp của xã hội và kỹ thuật lừa đảo. Nó có thể là một email và cũng có thể là một liên kết đến một website bất hợp pháp để cho bạn tải phần mềm độc hại xuống cũng có thể là để bàn giao thông tin cá nhân 