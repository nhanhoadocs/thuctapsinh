## The file streams - Các luồng tệp tin   
- Các chương trình trong Linux sẽ tự động được kết nối với 3 luồng dữ liệu khi chúng được thực thi:   
\- `standard input(stdin):` luồng sẽ đưa dữ liệu vào chương trình để xử lý  
\- `standard output(stdout):` luồng dùng để xuất dữ liệu ra màn hình sau khi quá trình thực thi hoàn tất mà không gặp lỗi.   
\- `standard error(stderr):` chức năng tương tự stdout nhưng chỉ dùng để in ra các thông báo lỗi và khi đó tín hiệu lỗi cũng sẽ được gửi tới hệ điều hành.  

<img src ="../../images/25 bai linux/st.png">  
 
- Các dạng chuyển hướng:   
  - Chuyển hướng tới file: là 1 trong 2 cách chuyển hướng đơn giản nhất, bằng cách này dữ liệu sẽ được lưu vào file thay vì in ra màn hình. 
  - Cú pháp sử dụng:  
    \- **"<"** --> ghi nội dung ra file từ điểm bắt đầu, nếu file đã có nội dung thì sẽ ghi đè lên file.  
    \- **"<<"** --> tương tự như "<" nhưng thay vì ghi đè lên file cũ thì sẽ ghi tiếp từ điểm kết thúc của nội dung cũ.  
    

