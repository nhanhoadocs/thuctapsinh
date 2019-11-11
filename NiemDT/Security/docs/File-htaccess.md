## File .htaccess là gì?

.htacess (HyperText Access) là một file dùng để cấu hình máy chủ web apache. Nó được server chấp nhận như một thành phần và cho phép chúng ta thực hiện điều hướng và bật các tính năng một cách linh hoạt hoặc bảo vệ một phần nào đó của trang web.

File .htaccess không được viết nên bởi bất kỳ ngôn ngữ lập trình nào, nó được viết bởi những quy tắc Regular Expression. Nếu sửa file này không đúng có thể dẫn đến lỗi **500** khi truy cập web server.

File .htaccess sẽ có tác dụng với thư mục hiện tại và các thư mục con của thư mục hiện tại.

## Restrict method POST và GET 

Ta có thể sử dụng file `.htaccess` để hạn chế những method được thao tác với website của bạn. Dưới đây là một số các để chặn các method `GET` và `POST` tới website

```
<LimitExcept GET POST>
	Order Allow,Deny
	Deny from all
</LimitExcept>
```

Hoặc ta có thể khai báo các method được phép truy cập

```
RewriteCond %{REQUEST_METHOD} !^(GET|HEAD) [NC]
RewriteRule .* - [F,L]
```

Như ví dụ trên thì chỉ có method `GET` và `HEAD` được phép thao tác.