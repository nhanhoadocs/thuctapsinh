# Những định nghĩa về kỹ thuật trong SQL Injection
SQL injection được sử dụng theo nhiều cách khác nhau để gây ra các vấn đề. hacker có thể tận dụng SQL injection để có thể bỏ qua quyền truy cập để tạo sửa xóa dữ liệu trong cơ sở dữ liệu đó. 

Nếu tận dụng tốt còn có thể leo thang lên nữa và gây ra thiệt hại nhiều hơn đến nội bộ mạng nằm sau tường lửa 
## In-band SQLi (Classic SQLi)
Đây là kiểu tấn công phổ biến và dễ dàng nhất. Attackersẽ tận dụng một kênh liên lạc để có thể đọc được dữ liệu 

Hai loại phổ biến theo kiểu này là
- Error-based SQLi
- Union-based SQLi

1. Error-based SQLi
- Là dựa vào các lỗi mà SQL báo lên để có thể truy vấn được các dữ liệu trong DB 
- Mỗi lỗi được thông báo lên đều rất hữu ích để có thể truy vấn tiếp theo 

2. Union-based SQLi
- Là Kỹ thuật sử dụng thêm option `union` trong câu lệnh truy vấn để có thể lấy được nhiều thông tin trong DB 

## Inferential SQLi (Blind SQLi)
Tấn công theo kiểu này tốn nhiều thời gian hơn so với kiểu trên. Nhưng nó sẽ đem lại được nhiều mức độ nguy hiểm hơn so với kiểu tấn công trên 

Các cuộc tấn công này có mục đích là xây dựng lại cấu trúc của DB chứ không phải là truy xuất dữ liệu ở trong DB đó. Và có 2 loại theo kiểu tấn công này:
- Boolean-based (content-based) Blind SQLi
- Time-based Blind SQLi

1. Boolean-based (content-based) Blind SQLi
- Nó dựa vào việc truy vấn. Ta sẽ đặt câu lệnh truy vấn sao cho bắt kết quả của câu lệnh đó ra được các loại dữ liệu khác mà ta muốn 
- Cuộc tấn công lọai này chậm bởi vì attacker cần phải liệu kê DB ra 

2. Time-based Blind SQLi
- Mục đích của cuộc tấn công này cũng giống như boolean và attacker cần phải liệt kê DB nên mất thời gian 
- Nó sẽ dựa vào câu truy vấn và độ trễ trả lời truy vấn từ DB. 

## NOTE của bản thân: 

Một URL được viết ra tương ứng với một câu truy vấn, Chúng ta sẽ đoán câu truy vấn đấy và viết tiếp vào câu truy vấn đó làm sao để biết được thêm thông tin của DB đó 

VÍ dụ 
```
http://192.168.80.225/sqli-labs/Less-1/?id=1
```
nó sẽ tương đương 
```
select * from table_name where id=1; 
```
Dựa vào đây ta sẽ phải biết thêm vào truy vấn để làm sao biết được thêm nhiều thứ như là:
- Tên của  các database
- Tên của các tables
- cấu trúc của dữ liệu trong tables: bao nhiêu cột; bao nhiêu dữ liệu trong đó 
- Liệt kê dữ liệu ra và cấu trúc lại nó. 