#  HTML Block, Inline, ID, Class và Iframes Elements

## 1.  HTML Block và Inline Elements

Mỗi phần tử HTML có giá trị thể hiện mặc định dựa trên loại của nó. Có hai kiểu thể hiện trên trang web html đó là: block và inline.

- HTML block level Elements:
    
    Một phần tử HTML “block-level element” luôn luôn bắt đầu từ một dòng mới và kéo dài đến hết chiều rộng của trang web.

Các HTML Block level elements như sau:



|address|article|aside|blockquote|canvas|dd|div|
|-------|-------|-----|----------|------|--|---|
|dl|dt|fieldset|figcaption|figure|footer|form|
|h1-h6|header|hr|li|main|nav|video|
|ol|p|pre|section|table|tfoot|ul|


## 2. Thẻ `<div>` Element

Thẻ <div> là một HTML block-level element 
    
## 3. Inline Elements 

Một “inline element” không cần bắt đầu từ một dòng mới và chỉ kéo dài trong phần tử.

Các Inline elements trong HTML:


|a|abbr|acronym|b|bdo|big|br|
|---|------|---------|---|-----|-----|----|    
|button|cite|code|dfn|em|i|img|
|input|kbd|label|map|object|output|q|
|samp|script|select|small|span|strong|sub|
|sup|textarea|time|tt|var|		


## 4. `<Span`> là một inline element 

<span> thường được dùng để chứa các đoạn text và thiết lập định dạng của các đoạn text này bằng các thuộc tính CSS.

Một số thuộc tính (attribute) thường được dùng trong <span> element như: style, class và id.

# HTML id Attribute 

## 1. Sử dụng thuộc tính id 
Thuộc tính id thường được dùng trong CSS và JavaScript để thực hiện các tác vụ liên quan đến các elements có giá trị id đó.

Trong CSS, để chọn 1 element có giá trị id nào đó, ta thêm dấu thăng (#) theo sau là tên id của element đó

## 2. Sự khác nhau giữa class và id 

Một HTML element chỉ có thể có duy nhất một id và id này thuộc sở hữu duy nhất bởi element này mà thôi. Trong khi đó class name có thể được chia sẻ bởi nhiều elements khác nhau

# HTML Iframes

Iframe sử dụng để hiển thị một trang web khác trong 1 vùng cố định của trang web đang được truy cập 

## 1. Ifame Syntax
Một HTML iframe  được định nghĩa bằng thẻ <iframe>:

`<iframe src="URL"></iframe>`

Thuộc tính src của iframe cho phép cài đặt địa chỉ URL (web address) của trang inline frame page.
## 2. Iframe – Set Height and Width

Sử dụng thuộc tính height và width để thiết lập kích cỡ của iframe.

Đơn vị của height and width mặc định là pixels


## 3. Iframe - Target for a Link 
Một iframe có thể được dùng như một target frame for a link.

Thuộc tính target của đường link cần phải cài đặt bằng với giá trị thuộc tính name của iframe



























