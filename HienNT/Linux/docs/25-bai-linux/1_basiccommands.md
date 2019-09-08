# CÁC LỆNH CƠ BẢN 
## Locating Applications  
- Các thư mục chứa các chương trình thực thi:  
  ```
  /bin  
  /usr/bin
  /sbin
  /usr/sbin
  /opt  
  ```  
### Chương trình lệnh `"Which"`   
- Xác định đường dẫn các file chương trình thực thi.   
"Which" chỉ tìm đường dẫn các file chương trình nào nằm trong thư mục được liệt kê ở biến môi trường $PATH

  <img src ="../../images/25 bai linux/echo path.png">    

- Cấu trúc lệnh  
  ```  
    # which [-option] [command]
  ```

  Ví dụ:
  - Hiển thị cơ bản: 

    <img src = "../../images/25 bai linux/which co ban.png">  

  - Hiển thị toàn bộ đường dẫn của chương trình  
    Trong ví dụ trên, `which` mặc định chỉ xuất ra đường dẫn đầu tiên mà chương trình tìm kiếm được trong các thư mục của biến môi trường $PATH dẫn đến việc bỏ sót các thông tin đường dẫn khác hay các chương trình cùng loại nhưng khác phiên bản trên cùng hệ thống. Để hiển thị toàn bộ các đường dẫn file chương trình được tìm thấy, thêm option `-a`  

### Chương trình lệnh `"Whereis"`  
- Cấu trúc lệnh  
  ```
  # whereis [options] program/command
  # whereis -BMS /directory -f command/program
  ```

- Mục đích: Tìm ra 3 thông tin dưới đây về một chương trình hoặc một lệnh trên Linux: 
  - Đường dẫn vị trí file binary
  - Đường dẫn vị trí source code
  - Đường dẫn vị trí trang manual dành cho chương trình hay lệnh đó.  
`Whereis` sẽ tìm kiếm thông tin trong các thư mục mặc định, ngoài các thư mục có sẵn có thể dùng các option để tìm kiếm.  
Một số options:  
  `-b` - chỉ tìm file binaries  
  `-m` - chỉ tim file manual  
  `-s` - chỉ tìm source code    
  `B /path/dir` : giới hạn tìm kiếm file binary ở thư mục được chỉ định.    
  `M /path/dir` : giới hạn tìm kiếm file manual ở thư mục được chỉ định.  
  `S /path/dir` : giới hạn tìm kiếm file binary ở thư mục được chỉ định.
  `-f` - chỉ định chương trình/lệnh cần tìm kiếm khi kết hợp với 3 option quy định thư mục ở trên.    

## Accessing Directories - Truy cập các thư mục  
Các lệnh điều hướng thư mục:  
- `cd` - trở về thư mục home  

  <img src ="../../images/25 bai linux/cd.png">  

- `cd ..` - trở về thư mục cha 

  <img src ="../../images/25 bai linux/cd...png">  

- `cd -` - trở về thư mục mẹ  

  <img src ="../../images/25 bai linux/cd -.png">  

- `cd /` - thay đổi thư mục hiện tại thành thư mục gốc  

  <img src ="../../images/25 bai linux/vethumucgoc.png">  

## Exploring the Filesystem - Khám phá hệ thống tập tin  
- `ls` - liệt kê nội dung của thư mục hiện tại  
- `ls -a`  - liệt kê tất cả các tệp bao gồm các tệp và thư mục ẩn  
- `tree`  - hiển thị chế độ xem dạng cây của hệ thống tệp  
- `tree -d`  - chỉ cần liệt kê các thư mục và loại bỏ tên các tập tin liệt kê.

## Hard and Symbolic Links - Liên kết cứng và biểu tượng  
- `ln` - tạo liên kết biểu tượng link đến file  
*Ví dụ:*  
  ```
    # ln file1.txt file2.txt
  ```
  - Liên kết cứng:  
  
    <img src ="../../images/25 bai linux/lienketcung.png">  

  - Liên kết mềm: 

    <img src ="../../images/25 bai linux/lienketmem.png">  

  `option "-i" in ra cột đầu tiên`

















> ## TÀI LIỆU THAM KHẢO  
- https://cuongquach.com/tim-duong-dan-lenhlinux-bang-whereis-which.html