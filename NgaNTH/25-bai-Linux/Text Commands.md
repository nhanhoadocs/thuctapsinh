### Các lệnh làm việc với tệp  
Linux cung cấp những tiện ích để ta thao tác với các tập tin và văn bản.  
- Hiển thị nội dung sử dụng `cat` và `echo`.  
- Chỉnh sửa nội dung tệp sử dụng `sed` và `awk`.  
- Tìm kiếm chuỗi sử dụng `grep`.  

### I. Hiển thị nội dung tệp  

**1. echo**
Lệnh `echo` để hiển thị một đoạn văn bản lên màn hình.  
Cú pháp: `echo [option] [kí tự]`  
- Để hiện thị một đoạn text lên màn hình, ta chỉ cần gõ lệnh:   
```
[root@server ~]#echo Xin chao toi la Nga
Xin chao toi la Nga
```  
- Ta cũng có thể gán một giá trị và dùng lênh echo để gọi giá trị đó ra.  
```
[root@server ~]#x=20
[root@server ~]#echo She is $x years old.
She is 20 years old.
```  
Chú ý: option -e cho phép hệ thống hiểu được các option sau dấu \  
- `\b` sẽ bỏ dấu cách trước nó.
- `\n` sẽ xuống dòng từ chỗ có option \n  
- `\t` sẽ cách ra một khoảng rộng như ta bấm Tab khi nhập liệu.  
- `\v`    

```
[root@server ~]#echo -e 'chao \bcac \bban'
chaocacban
[root@server ~]#echo -e 'chao \ncac \nban'
chao
cac
ban
[root@server ~]#echo -e 'chao \tcac \tban'
chao    cac     ban
[root@server ~]#echo -e 'chao \vcac \vban'
chao
     cac
         ban
[root@server ~]#

```  
- Dùng lệnh echo để in ra tất cả các file và thư mục như với lệnh ls 
```
[root@server test]#echo *
filedemo filetext
```  
- Ghi nội dung vào file
```
[root@server test]#echo "Day la file demo" > filedemo
[root@server test]#cat filedemo
Day la file demo
```
**2. Export**  
`export` là một trong các lệnh bash shell. Lệnh `export` đánh dấu một biến môi trường được export với bất kỳ quy trình con mới được chia nhỏ và do đó nó cho phép một tiến trình con kế thừa tất cả các biến được đánh dấu.  
Option  
- `-p` hiển thị danh sách tên được export trong shell hiện tại`.  
- `-n` remove tên từ danh sách export.  
- `-f` tên được export dưới dạng hàm.
<img src="https://i.imgur.com/xc5qERL.png">  

**3. cat**  
`cat`là viết tắt của concatenate và thường được sử dụng để đọc và in các tệp cũng như chỉ đơn giản là xem nội dung tệp, trong khi lệnh `tac` in các dòng của tệp theo thứ tự ngược lại.
```
[root@server test]#cat filetext
Huong oi
Bong nhan ra huong oi
Pha vao trong gio se
Suong chung chinh qua ngo
Hinh nhu thu da ve

[root@server test]#tac filetext

Hinh nhu thu da ve
Suong chung chinh qua ngo
Pha vao trong gio se
Bong nhan ra huong oi
Huong oi
```  

### Chỉnh sửa nội dung tệp  
Lệnh `sed` là một công cụ xử lý văn bản mạnh mẽ. Tên của nó là viết tắt cho trình soạn thảo luồng (stream editor). Nó lọc văn bản cũng như thực hiện thay thế trong luồng dữ liệu. Dữ liệu từ một nguồn / tệp đầu vào (hoặc luồng) được lấy và di chuyển đến một không gian làm việc. Toàn bộ danh sách các thao tác / sửa đổi được áp dụng trên dữ liệu trong không gian làm việc và nội dung cuối cùng được chuyển đến không gian đầu ra tiêu chuẩn (hoặc luồng stream).  
`sed` là một trong những công cụ mạnh mẽ trong Linux giúp ta có thể thực hiện các theo tác với văn bản như tìm kiếm, chỉnh sửa, xóa,...Khác với các trình soạn thảo thông thường, sed chấp nhận văn bản đầu vào có thể là một file trên hệ thống hoặc từ standard input hay stdin. Chính vì vậy sed còn được gọi là `stream editor`.  
