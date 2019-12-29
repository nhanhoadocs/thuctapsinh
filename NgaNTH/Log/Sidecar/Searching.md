# Kỹ thuật Search trong graylog  

## 1. Search query language  
### Cú pháp  
Cú pháp Search rất gần với cú pháp Lucene. Theo mặc định, tất cả các trường messages đều có trong Search nếu bạn không chỉ định một trường message để tìm kiếm.  
- Các message chứa `ssh`  
```
ssh
```  
- Các message chứa `ssh` hoặc `login`  
```
ssh login
```  
- Các message chứa chính xác cụm từ `ssh login`:  
```
"ssh login"
```  
- Các message, trong đó trường type có chứa `ssh`  
```
type:ssh
```  
- Các message, trong đó trường type có chứa `ssh` hoặc `login`  
```
type:(ssh OR login)
```  
- Các message, nơi mà trường type chứa chính xác cụm từ `ssh login`  
```
type:"ssh login"
```  
- Các message có chứa trường `type`  
```
_exists_:type
```  
- Các message không chứa trường `type`  
```
NOT _exists_:type
```  
- Message phù hợp với biểu thức thông thường (regular expresstion) `opened`  
```
/opened/
```

### Các toán tử Boolean  
- AND
- OR
- NOT  
**Một số ví dụ**  

```
"ssh login" AND source:example.org
("ssh login" AND (source:example.org OR source:another.example.org)) OR _exists_:always_find_me
```
```
"ssh login" AND NOT source:example.org
NOT example.org
```
> Lưu ý: Các toán tử Boolean `AND`, `OR` và `NOT` phải được viết hoa.  

- Sử dụng `?` để thay thế 1 ký tự hoặc `*` để thay thế không hoặc nhiều ký tự  
```
application_name:ssh?
```
```
nga* AND ssh?
```
```
system*
```

