# 1. Giới thiệu về HTML

Html là ngôn ngữ đánh dấu tiêu chuẩn để tạo ra các trang Web. 

- HTML là viết tắt của Hyper Text Markup Language 
- HTML mô tả cấu trúc của 1 trang web 
- HTML bao gồm một loạt các yếu tố 
- Các phần tử HTML cho trình duyệt biết cách hiển thị nội dung 
- Các yếu tố HTML được thể hiện bằng các thẻ 
- Thẻ HTML gắn nhãn các phần nội dung như "heading", "paragraph", "table", ...
- Các trình duyệt không hiển thị các thẻ HTML, nhưng sử dụng chúng để hiển thị nội dung của trang. 
Ví dụ ta có 1 tài liệu HTML đơn giản như sau: 

```
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body>
</html>
```

- `<!DOCTYPE html>` tuyên bố xác định tài liệu này là HTML5
- Phần tử `<html>` là phần tử gốc của trang HTML 
- phần tử `<head>` chứa thông tin meta về tài liệu 
- phần tử `<title>` chỉ định một tiêu đề cho tài liệu 
- phần tử `<body>` chứa nội dung trang hiển thị 
- phần tử `<h1>` xác định một tiêu đề lớn. 
- phần tử `<p>` định nghĩa 1 đoạn. 

**HTML tags**

- Các thẻ HTML thường đi theo cặp như `<p>`và`</p>`
- Thẻ đầu tiên trong một cặp là thẻ bắt đầu, thẻ thứ hai là thẻ kết thúc
- Thẻ kết thúc được viết giống như thẻ bắt đầu, nhưng với dấu gạch chéo được chèn trước tên thẻ

Thẻ bắt đầu gọi là thẻ mở và thẻ kết thúc là thẻ đóng

**Cấu trúc trang HTML**

![Imgur](https://i.imgur.com/qT8MRfn.png)

**Lưu ý:** Chỉ nội dung bên trong phần `<body>` được hiển thị lên trình duyệt. 

**<! DOCTYPE>**

`<! DOCTYPE>` đại diện cho các loại document type và giúp các trình duyệt để trang web hiển thị một cách chính xác. 

Nó chỉ phải xuất hiện 1 lần ở đầu trang (trước bất kỳ thẻ HTML nào)

Các tuyên bố  `<! DOCTYPE>` cho HTML5 là : 
```
<! DOCTYPE html>
```

**Các phiên bản** 

Có nhiều phiên bản HTML: 

![Imgur](https://i.imgur.com/FXwcKVq.png)  
