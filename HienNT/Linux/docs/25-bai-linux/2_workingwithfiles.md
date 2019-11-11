## The file streams - Các luồng tệp tin   
- Các chương trình trong Linux sẽ tự động được kết nối với 3 luồng dữ liệu khi chúng được thực thi:   
  - `standard input(stdin):` luồng sẽ đưa dữ liệu vào chương trình để xử lý  
  - `standard output(stdout):` luồng dùng để xuất dữ liệu ra màn hình sau khi quá trình thực thi hoàn tất mà không gặp lỗi.   
  - `standard error(stderr):` chức năng tương tự stdout nhưng chỉ dùng để in ra các thông báo lỗi và khi đó tín hiệu lỗi cũng sẽ được gửi tới hệ điều hành.  

  <img src ="../../images/25 bai linux/st.png">  
 
- Các dạng chuyển hướng:   
  - Chuyển hướng tới file: dữ liệu sẽ được lưu vào file thay vì in ra màn hình. 
   - Cú pháp sử dụng:  
     - `>` - ghi nội dung ra file từ điểm bắt đầu, nếu file đã có nội dung thì sẽ ghi đè lên file.  
     - `>>` - tương tự như "<" nhưng thay vì ghi đè lên file cũ thì sẽ ghi tiếp từ điểm kết thúc của nội dung cũ.   
  - Chuyển hướng tới câu lệnh khác: ``"|"``  
  Ví dụ:  

    <img src ="../../images/25 bai linux/chuyenhuongtoicaulenhkhac.png">  

## Search for files  
Tìm kiếm ở thư mục đang đứng và thư mục con.   

- Tìm kiếm theo tên file đầy đủ   
Cú pháp: 
  ```sh
    # find . [tên file]
  ```  
  Dấu "." đại diện cho thư mục đang đứng hiện tại hoặc thư mục muốn tìm kiếm.   

- Tìm kiếm file theo tên không đầy đủ  
Cú pháp:
  ```sh
    #find / -name [tên file]
  ```  
  Ví dụ: 
  ```sh
    #find / -name hien
  ```
  Lệnh này sẽ tìm kiếm trên toàn bộ hệ thống file có tên là `hien` 

- Tìm kiếm file với phần mở rộng  
Cú pháp: 
  ```
    #find [thư mục] -name `[phần mở rộng]
  ```
  Ví dụ:
  ```sh 
    # find /usr -name .txt 
  ```
  Lệnh này sẽ tìm kiếm trong thư mục /usr các file có phần mở rộng là `.txt`

- Tìm kiếm file ẩn  
Cú pháp: 
  ```sh
    # find / -type f -name "."
  ```

- Chỉ tìm kiếm thư mục:  
Cú pháp: 
  ```  
    #find [thư mục] -type d -name [tên thư mục cần tìm kiếm]  
  ```
  Ví dụ: Tìm kiếm thư mục abc trong thư mục /usr  
  ```sh
    #find /usr -type d -name abc  
  ```    


- Chỉ tìm kiếm tệp tin:  
Cú pháp: 
  ```  
    #find [thư mục] -type f -name [tên tệp tin cần tìm kiếm]  
  ```
  Ví dụ: Tìm kiếm tệp tin abc trong thư mục /usr  
  ```sh
    # find /usr -type f -name abc  
  ```  
- Tìm kiếm file được chỉnh sửa trong vòng 50 ngày  
  ```sh
    # find / -mtime 50
  ```  

- Tìm kiếm file được chỉnh sửa trong vòng 50 -100 ngày  
  ```sh
    # find / -mtime +50 -mtime -100
  ```  

- Tìm kiếm file được tạo ra trong vòng 1 giờ  
  ```sh
    # find / -cmin -60
  ```  

- Tìm kiếm file có dung lượng 50M  
  ```sh
    # find / -size 50M
  ```  

- Tìm kiếm file có dung lượng lớn hơn 50M nhưng nhỏ hơn 100M  
  ```sh
    # find / -size +50M -size -100M
  ```  

- Tìm và xóa:  
  ```sh
    #find -name "tệp tin/thư mục cần xóa" -exec rm {}';' 
  ```   
  hoặc     
  ```sh
   #find -name "tệp tin/thư mục cần xóa" -exec rm {}\;
  ```

## Tạo, sửa, xóa  
- Tạo file:
  ```sh
   #touch [tên file cần tạo]  
  ```
   Option:
   `-t` - đặt dấu thời gian cụ thể cho file  
   Ngoài ra: tạo file gián tiếp bằng các lệnh `vi`,`cp` 

- Tạo thư mục: 
  ```sh
    # mkdir [tên thư mục cần tạo]  
  ```
   Opton:   
     `-p` - tạo 1 cây thư mục nhưng không thông báo kết quả.  
     `-v` - tạo 1 cây thư mục và báo kết quả ra màn hình.

- Sửa file: sử dụng lệnh `vi/vim` để bắt đầu vào chỉnh sửa.   
- Xóa file/thư mục: sử dụng lệnh `rm`  
- Đọc file: 
  `cat` - đọc từ trên xuống  
  `tac` - đọc từ dưới lên  
  `less/more` - đọc những văn bản có dung lượng lớn, hiển thị theo từng trang văn bản  

## wc - word count  
- `-l` - Đếm số lượng dòng 
- `-w` - Đếm số lượng từ   
- `-c` hoặc `#du -sh` - Tổng dung lượng file  
- `-m` - Số lượng kí tự xuất hiện trong 1 file  
- `-L` - Hiển thị dòng text dài nhất  

## tail - liệt kê các dòng cuối cùng trong 1 file(mặc định là 10 dòng)  
```sh
  # tail -n(số dòng muốn in ra)`  
```

## head - liệt kê các dòng đầu tiên trong 1 file(mặc định là 10 dòng)  
```sh
  # head -n(số dòng muốn in ra)
```  

##  diff - so sánh các tập tin và thư mục  

## sed - thay thế văn bản không cần vào trong file  
```sh
   # sed "s/pattern/replace_string/" file     
``` 
hoặc      
```sh
   # cat file /sed 's/patter/replace_string/"   
```
  Option:  
  `-i` - lưu các thay đổi vào cùng 1 tập tin  
  - Mặc định sed chỉ thay thế lần xuất hiện đầu tiên của mẫu trong mỗi file. Để thay thế tất cả các lần xuất hiện: 
    ```sh
      # sed "s/pattern/replace_string/g" file
    ```  
  - Thay thế từ xuất hiện thứ N của mẫu đến cuối văn bản: 
    ```sh
      # sed "s/pattern/replace_string/Ng" file
    ```  
  - Thay thế lần xuất hiện thứ N: 
    ```sh
      # sed "s/pattern/replace_string/N" file
    ```   
  - Các kí tự phân cách: / , | , :  
  - In kết quả ra màn hình:  `sed 'p' [file cần in]`  
    Option: `-n` - hủy bỏ việc tự in kết quả ra màn hình của sed  
  - Một số cú pháp khác:  
    - Chỉ in ra dòng đầu tiên: 
      ```sh
        # sed '1p' [file]
      ```  
    - In các dòng từ x tới y: 
      ```sh
        # sed 'x,yp' [file]
      ```  
    - In ra các dòng với số thứ tự lẻ: 
      ```sh
        # sed '1,2p' [file]
      ```  
    - In ra các dòng với số thứ tự chẵn: 
      ```sh
        # sed '2,2p' [file]
      ```  
- Đối với các chuỗi trong văn bản có chứa các kí tự đặc biệt(`/,:,@,=,[]`) khi dùng câu lệnh thay thế cần thêm kí tự `\` trước những kí tự đặc biệt để tránh bị nhầm lẫn với các kí tự phân cách.  
Ví dụ:   
   ```sh
   [root@thuyhien ~]# sed 's/# urls = ["udp://127.0.0.1:8089"]/urls = ["udp://192.168.69.69:8086"]/g' filethuchanh.conf
   ```

## Xem dung lượng file  
Cấu trúc lệnh 
```sh
  # du -hs /path/ | sort -rh | head -n N
```   
Chú thích:   
  `du` - dung lượng ổ cứng mà file đang chiếm dụng   
  `/path/` - đường dẫn thư mục muốn kiểm tra  
  `-h` - in ra dung lượng file/thư mục theo định dạng người dùng dẽ dàng đọc(KB,MB,...)     
  `-s` - in ra tổng dung lượng file/thư mục  
  `sort` - lệnh dùng để sắp xếp kí tự, sắp xếp thư mục/file theo dung lượng  
  `-h` - sắp xếp dung lượng theo thứ tự từ thấp đến cao  
  `-r` - đảo ngược chiều output của lệnh sort(sắp xếp dung lượng từ cao xuống thấp)  
  `head -n N` - lấy ra N dòng đầu tiên của lệnh

-  Kiểm tra dung lượng từng file trong thư mục hiện tại và tổng dung lượng của thư mục sử dụng câu lệnh 
  ```sh
    # du -ah
  ```



## TÀI LIỆU THAM KHẢO  
- https://viblo.asia/p/tim-hieu-sed-co-ban-maGK78qAZj2

- https://secure.vinahost.vn/ac/knowledgebase/220/Hng-dn-s-dng-lnh-find-tren-Linux.html  
- https://wiki.matbao.net/kb/lenh-command-line-xem-dung-luong-tren-may-chu-linux/