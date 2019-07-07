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
\- Tìm kiếm tệp tin và thư mục:  
```
Cú pháp: #find [thư mục] -name [tên tệp tin]
Ví dụ: tìm kiếm tệp tin và thư mục abc trong thư mục /usr  
#find /usr -name abc  
```  

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
- Đọc file: cat(đọc từ trên xuống); tac(đọc từ dưới lên)' less/more(đọc những văn bản có dung lượng lớn, hiển thị theo từng trang văn bản)  

## wc - word count  
\- Đếm số lượng dòng(-l)  
\- Đếm số lượng từ(-w)  
\- Tổng dung lượng file(-c)  
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