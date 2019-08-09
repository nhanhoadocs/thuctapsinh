## The file streams - Các luồng tệp tin   
- Các chương trình trong Linux sẽ tự động được kết nối với 3 luồng dữ liệu khi chúng được thực thi:   
\- `standard input(stdin):` luồng sẽ đưa dữ liệu vào chương trình để xử lý  
\- `standard output(stdout):` luồng dùng để xuất dữ liệu ra màn hình sau khi quá trình thực thi hoàn tất mà không gặp lỗi.   
\- `standard error(stderr):` chức năng tương tự stdout nhưng chỉ dùng để in ra các thông báo lỗi và khi đó tín hiệu lỗi cũng sẽ được gửi tới hệ điều hành.  

<img src ="../../images/25 bai linux/st.png">  
 
- Các dạng chuyển hướng:   
  - Chuyển hướng tới file: dữ liệu sẽ được lưu vào file thay vì in ra màn hình. 
    - Cú pháp sử dụng:  
    \- **">"** --> ghi nội dung ra file từ điểm bắt đầu, nếu file đã có nội dung thì sẽ ghi đè lên file.  
    \- **">>"** --> tương tự như "<" nhưng thay vì ghi đè lên file cũ thì sẽ ghi tiếp từ điểm kết thúc của nội dung cũ.   
  - Chuyển hướng tới câu lệnh khác: **"|"**  
  Ví dụ:  

  <img src ="../../images/25 bai linux/chuyenhuongtoicaulenhkhac.png">  

## Search for files  
Tìm kiếm ở thư mục đang đứng và thư mục con.   

\- Tìm kiếm theo tên file đầy đủ 
```
Cú pháp: #find . [tên file]
Dấu "." đại diện cho thư mục đang đứng hiện tại hoặc thư mục muốn tìm kiếm 
#find /usr -name abc  
```  

\- Tìm kiếm file theo tên không đầy đủ  
```
Cú pháp: #find / -name [tên file]*  
Ví dụ: #find / -name hien* ==> lệnh này sẽ tìm kiếm trên toàn bộ hệ thống file có tên là hien 
```  
\- Tìm kiếm file với phần mở rộng  
```
Cú pháp: #find [thư mục] -name *[phần mở rộng]
Ví dụ: #find /usr -name *.txt ==> tìm kiếm trong thư mục /usr các file có phần mở rộng là .txt
```

\- Tìm kiếm file ẩn  
Cú pháp: **`#find / -type f -name ".*"`**

\- Chỉ tìm kiếm thư mục:  
```  
Cú pháp: #find [thư mục] -type d -name [tên thư mục cần tìm kiếm]  
Ví dụ: Tìm kiếm thư mục abc trong thư mục /usr  
#find /usr -type d -name abc  
```    


\- Chỉ tìm kiếm tệp tin:  
```  
Cú pháp: #find [thư mục] -type f -name [tên tệp tin cần tìm kiếm]  
Ví dụ: Tìm kiếm tệp tin abc trong thư mục /usr  
#find /usr -type f -name abc  
```  

\- Tìm kiếm file được chỉnh sửa trong vòng 50 ngày  
Cú pháp: **`#find / -mtime 50`**  

\- Tìm kiếm file được chỉnh sửa trong vòng 50 -100 ngày  
Cú pháp: **`#find / -mtime +50 -mtime -100`**  

\- Tìm kiếm file được tạo ra trong vòng 1 giờ  
Cú pháp: **`#finđ / -cmin -60`**  

\- Tìm kiếm file có dung lượng 50M  
Cú pháp: **`find / -size 50M`**  

\- Tìm kiếm file có dung lượng lớn hơn 50M nhưng nhỏ hơn 100M  
Cú pháp: **`#find / -size +50M -size -100M`**  

\- Tìm và xóa:  
`#find -name "tệp tin/thư mục cần xóa" -exec rm {}';' `   
hoặc     
`#find -name "tệp tin/thư mục cần xóa" -exec rm {}\;`

## Tạo, sửa, xóa  
- Tạo file: #touch [tên file cần tạo]  
   Option: -t: đặt dấu thời gian cụ thể cho file  
   Ngoài ra: tạo file gián tiếp bằng các lệnh `vi`,`cp` 

- Tạo thư mục: #mkdir [tên thư mục cần tạo]  
   Opton:   
     -p: tạo 1 cây thư mục nhưng không thông báo kết quả.  
     -v: tạo 1 cây thư mục và báo kết quả ra màn hình.

- Sửa file: sử dụng lệnh `vi/vim` để bắt đầu vào chỉnh sửa.   
- Xóa file/thư mục: sử dụng lệnh `rm`  
- Đọc file: cat(đọc từ trên xuống); tac(đọc từ dưới lên)' less/more(đọc những văn bản có dung lượng lớn, hiển thị theo từng trang văn bản); sed '' [tên file];

## wc - word count  
\- Đếm số lượng dòng(-l)  
\- Đếm số lượng từ(-w)  
\- Tổng dung lượng file(-c) hoặc dùng lệnh `#du -sh` 
\- Số lượng kí tự xuất hiện trong 1 file(-m)  
\- Hiển thị dòng text dài nhất(-L)  

## tail - liệt kê các dòng cuối cùng trong 1 file(mặc định là 10 dòng)  
`Cú pháp: #tail -n(số dòng muốn in ra)`  

## head - liệt kê các dòng đầu tiên trong 1 file(mặc định là 10 dòng)  
`Cú pháp: #head -n(số dòng muốn in ra)`  

##  diff - so sánh các tập tin và thư mục  
Ứng dụng: so sánh các file cấu hình.  

## sed - thay thế văn bản không cần vào trong file  
` Cú pháp: 
   #sed "s/pattern/replace_string/" file      
hoặc      
   #cat file /sed 's/patter/replace_string/" `  
- Option: -i: lưu các thay đổi vào cùng 1 tập tin  
- Mặc định sed chỉ thay thế lần xuất hiện đầu tiên của mẫu trong mỗi file.  
\- Để thay thế tất cả các lần xuất hiện: `#sed "s/pattern/replace_string/g" file`  
\- Thay thế từ xuất hiện thứ N của mẫu đến cuối văn bản: `#sed "s/pattern/replace_string/Ng" file`  
\- Thay thế lần xuất hiện thứ N: `#sed "s/pattern/replace_string/N" file`   
- Các kí tự phân cách: / , | , :  
- In kết quả ra màn hình:  `sed 'p' [file cần in]`  
- Option: -n: hủy bỏ việc tự in kết quả ra màn hình của sed  
- Một số cú pháp khác:  
\- Chỉ in ra dòng đầu tiên: `#sed '1p' [file]`  
\- In các dòng từ x tới y: `#sed 'x,yp' [file]`  
\- In ra các dòng với số thứ tự lẻ: `#sed '1,2p' [file]`  
\- In ra các dòng với số thứ tự chẵn: `#sed '2,2p' [file]`  
- Đối với các chuỗi trong văn bản có chứa các kí tự đặc biệt(/,:,@,=,[]) khi dùng câu lệnh thay thế cần thêm kí tự `\` trước những kí tự đặc biệt để tránh bị nhầm lẫn với các kí tự phân cách.  
Ví dụ:   
   ```sh
   [root@thuyhien ~]# sed 's/# urls = ["udp://127.0.0.1:8089"]/urls = ["udp://192.168.69.69:8086"]/g' filethuchanh.conf
   ```

## Xem dung lượng file  
|Cấu trúc lệnh
-  
**`#du -hs /path/ | sort -rh | head -n N`**   
Chú thích: 
\- du: dung lượng ổ cứng mà file đang chiếm dụng 
\- /path/ ==> đường dẫn thư mục muốn kiểm tra  
\- -h: in ra dung lượng file/thư mục theo định dạng người dùng dẽ dàng đọc(KB,MB,...)  
\- -s: in ra tổng dung lượng file/thư mục  
\- sort: lệnh dùng để sắp xếp kí tự, sắp xếp thư mục/file theo dung lượng  
\- -h: sắp xếp dung lượng theo thứ tự từ thấp đến cao  
\- -r: đảo ngược chiều output của lệnh sort(sắp xếp dung lượng từ cao xuống thấp)  
\- head - n N: lấy ra N dòng đầu tiên của lệnh

- Câu lệnh **`#du -ah`** ==> kiểm tra dung lượng từng file trong thư mục hiện tại và tổng dung lượng của thư mục.


## TÀI LIỆU THAM KHẢO  
\- https://viblo.asia/p/tim-hieu-sed-co-ban-maGK78qAZj2

\- https://secure.vinahost.vn/ac/knowledgebase/220/Hng-dn-s-dng-lnh-find-tren-Linux.html  
\- https://wiki.matbao.net/kb/lenh-command-line-xem-dung-luong-tren-may-chu-linux/