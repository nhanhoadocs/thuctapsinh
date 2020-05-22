# Document Type 

#### Khái niệm:

Khai báo <!DOCTYPE> đề cập đến DTD(Document Type definition)- Định nghĩa kiểu tài liệu

DTD chỉ định quy tắc cho ngôn ngữ đánh dấu, để các trình duyệt hiển thị chính xác. 

`<DOCTYPE>` Thông báo cho trình duyệt web về loại tài liệu và phiên bản của HTML được sử dụng để xây dựng tài liệu web. 



#### Có 3 loại tài liệu HTML:

- Transitional : Đối với tài liệu HTML sử dụng các yếu tố hoặc thuộc tính không dùng nữa

- Frameset : Đối với tài liệu sử dụng khung ( cũng có thể bao gồm các yếu tố hoặc thuộc tính không dùng nữa như (Transitional document type)) 

- Strict : Đối với tài liệu HTML không bao gồm các thành phần hoặc thuộc tính không dùng nữa và không có khung 

#### Khai báo tài liệu HTML 

Dòng đầu tiên trong mỗi tài liệu HTML nên có 1 khai báo `<!DOCTYPE>`. Khai báo `<!DOCTYPE html>` trong HTML5 là đơn giản nhất và ngắn nhất so với các phiên bản trước. 


Nếu không khai báo `<!DOCTYPE>`, trang web sẽ hoạt động ở chế độ quirks còn được gọi là chế độ tương thích. Các trang web hiện nay có thể vẫn hoạt động bình thường, nhưng một số trang web phiên bản cũ hơn như: IE5/MAC, IE6/Win có thể khiến CSS, DOM chạy không đúng. 
Một số thẻ như `<article>`, `<footer>`, `<header>`, `<nav>`, `<section>` .. có thể không được hỗ trợ nếu <!DOCTYPE> không được khai báo. 

> **Note**: HTMLDOM: Các phần tử, thuộc tính, đối tượng 