# BeautifulSoup - Web Crawling
## **1) Web Crawling**
- **Web crawling** là quá trình tự động trích xuất các thông tin từ các trang web và lưu trữ nó dưới một định dạng phù hợp . Chương trình mà thực hiện công việc này gọi là **web crawler** .
- Thông thường, khi muốn lấy một số thông tin từ các trang web , chúng ta sẽ dùng các **API** mà các trang đó cung cấp . Đây là cách đơn giản , tuy nhiên không phải trang web nào cũng cung cấp sẵn **API** cho chúng ta sử dụng . Do đó chúng ta cần một kĩ thuật để lấy các thông tin từ các trang web đó mà không thông qua **API** .
## **2) BeautifulSoup**
### **2.1) Giới thiệu**
- Thư viện **BeautifulSoup** là một thư viện của **Python** cho phép chúng ta lấy dữ liệu từ **HTML** đơn giản và hiệu quả .
- Phiên bản mới nhất : `4.8.1` ( **BeautifulSoup `4`** )
- Github : https://github.com/waylan/beautifulsoup
### **2.2) Cài đặt BeautifulSoup**
- **B1 :** Kiểm tra thư viện `bs4` đã được cài đặt chưa :
    ```
    $ python3 -c "import bs4; print(bs4.__version__);"
    ```
    => Output nếu chưa được cài đặt :
    ```py
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ModuleNotFoundError: No module named 'bs4'
    ```
    => Output nếu đã được cài đặt :
    ```
    4.8.1
    ```
- **B2 :** Cài đặt `bs4` :
    ```
    $ sudo pip install beautifulsoup4
    ```
### **2.3) Cài đặt các và sử dụng các parser**
- **BeautifulSoup** hỗ trợ thư viện **HTML parser** mặc định của **Python** ( `html.parser` ) và một số thư viện của bên thứ ba ( `lxml` hoặc `html5lib` ) . 
- Cài đặt các parser :
    - **`HTML5lib`** :
        ```
        $ sudo pip install html5lib
        ```
    - **`LXML`** :
        ```
        $ sudo pip install lxml
        ```
- Sử dụng các parser :
    - **Python’s `html.parser`** :
        ```py
        BeautifulSoup(markup, "html.parser")
        ```
    - **`lxml`’s HTML parser** :
        ```py
        BeautifulSoup(markup, "lxml")
        ```
    - **`lxml`’s XML parser** :
        ```py
        BeautifulSoup(markup, "lxml-xml")
        ```
        hoặc
        ```py
        BeautifulSoup(markup, "xml")
        ```
    - **`html5lib`** :
        ```py
        BeautifulSoup(markup, "html5lib")
        ```
## **3) Các loại object của Beautiful Soup**
- **Beautiful Soup** sẽ chuyển đổi văn bản **HTML** sang **Python tree object** . Tuy nhiên , chỉ cần quan tâm 4 loại object là : `Tag` , `NavigableString` , `BeautifulSoup` và `Comment` .
- **VD :** File mẫu `test.html` :
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css.css" type="text/css">
    </head>
    <body>
        <!-- Items list -->
        <div class="items-list">
            <div class="item pull-right-0">
                <p class="title">Item 001</p>
                <p class="price">Price: 01$</p>
                <p><a href="#">Buy</a></p>
            </div>
            <div class="item pull-right-1">
                <p class="title">Item 002</p>
                <p class="price">Price: 02$</p>
                <p><a href="#">Buy</a></p>
            </div>
            <div class="item pull-right-2">
                <p class="title">Item 003</p>
                <p class="price">Price: 03$</p>
                <p><a href="#">Buy</a></p>
            </div>
            <div class="item pull-right-3">
                <p class="title">Item 004</p>
                <p class="price">Price: 04$</p>
                <p><a href="#">Buy</a></p>
            </div>
            <div class="item pull-right-4">
                <p class="title">Item 005</p>
                <p class="price">Price: 05$</p>
                <p><a href="#">Buy</a></p>
            </div>
        </div>
        <!-- End of items list -->
    </body>
    </html>
### **3.1) `Tag`**
- Là một HTML (XML) tag .
- Tìm một tag ( hàm `find()` ) :
    ```py
    from bs4 import BeautifulSoup

    html_dom = BeautifulSoup(open('test.html'), 'html5lib')
    title_tag = html_dom.find('title')
    print(title_tag)
    ```
    => Output :
    ```
    <title>Document</title>
    ```
- Thuộc tính `name` : lấy ra tên của tag :
    ```py
    print(title_tag.name)
    ```
    => Output :
    ```
    title
    ```
- Thuộc tính `attribute` : lấy ra attribute cụ thể của tag :
    ```py
    link_tag = html_dom.find('link')
    print(link_tag['href'])
    ```
    => Output :
    ```
    ['stylesheet']
    ```
    - Có thể chỉnh sửa , xóa , thêm các attribute :
        ```py
        del link_tag['rel']            # Xóa 1 attribute
        link_tag['media'] = 'all'      # Thêm 1 attribute
        ```
        => Output :
        ```
        <link href="lorem.css" media="all" type="text/css"/>
        ```
- Thuộc tính `attrs` : lấy ra toàn bộ attribute của tag ( hiển thị ở dạng `dict` ) :
    ```py
    link_tag = html_dom.find('link')
    print(link_tag.attrs)
    ```
    => Output :
    ```
    {'rel': ['stylesheet'], 'href': 'css.css', 'type': 'text/css'}
    ```
### **3.2) Multi-valued attributes**
- Ở **HTML5** , các attribute được phép nhiều hơn 1 giá trị là `class` , `rel` , `rev` , `accept-charset` , `headers` và `accesskey` .
- Sử dụng hàm `items` để được kết quả trả về là một danh sách các giá trị của attribute đó ( nếu nó thuộc các attribute được liệt kê ở trên ) , hoặc là một string ( nếu attribute đó không thuộc danh sách được liệt kê ở trên ) :
- **VD :**
    ```py
    items = html_dom.select('.items-list .item')     # Công thức bắt buộc
    print(items[0]['class'])
    print(items[1]['class'])
    ```
    => Output :
    ```
    ['item', 'pull-right-0']
    ['item', 'pull-right-1']
    ```
    [Tìm hiểu thêm](https://viblo.asia/p/pymotm-beautiful-soup-4-part-i-DljMbVZZMVZn)
### **3.3) NavigableString**
- Là nội dung text của tag đó .
- **NavigableString** giống như một Python Unicode string ngoại trừ việc nó hỗ trợ một số tính năng như duyệt và tìm kiếm .
- Có thể convert nó sang kiểu Unicode string bằng function `unicode()` .
- **VD :**
    ```py
    from bs4 import BeautifulSoup

    html_dom = BeautifulSoup(open('test.html'), 'html5lib')
    title_tag = html_dom.find('title')
    print(title_tag.string)
    ```
    => Output :
    ```
    Document
    ```
- Không thể sửa nội dung văn bản của 1 tag bằng cách trực tiếp , nhưng có thể thay thế nó thông qua function `replace_with()` :
    ```py
    title_tag.string.replace_with('Tài liệu')
    print(title_tag)
    ```
    => Output :
    ```
    Tài liệu
    ```
### **3.4) Comment và những chuỗi đặc biệt**
## **4) Navigating the tree**
### **4.1) Going up**
- Các thẻ (tag) HTML có thể chứa chuỗi (string) hay các tag con khác bên trong nó . Các tag này được gọi là **children tag** .
- **BeautifulSoup** cung cấp cho chúng ta nhiều cách khác nhau để di chuyển tới và duyệt các thẻ (không phải là string bởi vì string thì không thể có children ) này .
#### **4.1.1) Di chuyển bằng tên tag**
- Để di chuyển tới 1 tag nào đó , sử dụng ngay tên tag của nó .
- **VD :** lấy tag `title` :
    ```py
    print(html_dom.head.title)
    print(html_dom.title)
    ```
    => Output :
    ```
    <title>Document</title>
    <title>Document</title>
    ```
- Nếu tag cần tìm không phải là duy nhất , **BeautifulSoup** sẽ trả về tag khớp gần nhất .
    ```py
    print(html_dom.body.p)
    print(html_dom.p)
    ```
    => Output :
    ```
    <p class="title">Item 001</p>
    <p class="title">Item 001</p>
    ```
#### **4.1.2) `.contents` và `.children`**
- `.contents` chứa danh sách các tag con mà nó có dưới dạng `dict` :
    ```py
    print(html_dom.head.contents)
    print(html_dom.head.title.contents)
    ```
    => Output :
    ```
    ['\n    ', <meta charset="utf-8"/>, '\n    ', <title>Document</title>, '\n    ', <link href="css.css" rel="stylesheet" type="text/css"/>, '\n']
    ['Document']
    ```
- Một string sẽ không thể chứa `.contents` .
- 

https://viblo.asia/p/pymotm-beautiful-soup-4-part-ii-amoG81yOvz8P<br>
https://viblo.asia/p/pymotm-beautiful-soup-4-part-iii-XqaGEBJEeWK<br>
https://beautiful-soup-4.readthedocs.io/en/latest/#<br>
https://www.crummy.com/software/BeautifulSoup/bs3/documentation.html