# HTTP Status Code
## **1) Các phiên bản HTTP**
### **1.1) HTTP `1.1`**
- 
### **1.2) HTTP `2.0`**
## **2) Quá trình HTTP**
<img src=https://i.imgur.com/E4P03Qn.png>

## **3) Các trạng thái HTTP ( HTTP status code )**
- **Status code** ( *mã trạng thái* ) là một số nguyên `3` ký tự , trong đó ký tự đầu tiên của **Status Code** định nghĩa loại **Response** và hai ký tự cuối không có bất cứ vai trò phân loại nào . Có `5` giá trị của ký tự đầu tiên :
    - `1xx` : **Information** ( *Thông tin* ) : khi nhận được những mã như vậy tức là request đã được server tiếp nhận và quá trình xử lý request đang được tiếp tục .
    - `2xx` : **Success** ( *Thành công* ) : khi nhận được những mã như vậy tức là request đã được server tiếp nhận , hiểu và xử lý thành công .
    - `3xx` : **Redirection** ( *Chuyển hướng* ) : mã trạng thái này cho biết client cần có thêm action để hoàn thành request .
    - `4xx` : **Client Error** ( *Lỗi Client* ) : nó nghĩa là request chứa cú pháp không chính xác hoặc không được thực hiện .
    - `5xx` : **Server Error** ( *Lỗi Server* ) : nó nghĩa là Server thất bại với việc thực hiện một request nhìn như có vẻ khả thi .
### **3.1) `1xx Information` ( *Thông tin* )**
- `100 Continue` : chỉ một phần của Request được nhận bởi Server ( có thể là header và Client cần gửi tiếp body ) , nhưng miễn là nó không bị loại bỏ , Client nên tiếp tục với Request .
- `101 Switching Protocols` : requester đã hỏi Server về việc thay đổi Protocol và Server đã chấp nhận điều đó .
### **3.2) `2xx Success` ( *Thành công* )**
- `200 OK` : Request đã được tiếp nhận và xử lý thành công . Các Response thực tế trả về sẽ phụ thuộc vào phương thức HTTP của Request . Trong một GET Request , Response sẽ chứa một thực thể tương ứng với các tài nguyên yêu cầu , trong một POST Request , Response sẽ chứa một thực thể mô tả hoặc chứa các kết quả của các action .
- `201 Created` : Request được chấp nhận cho xử lý , nhưng việc xử lý chưa hoàn thành .
- `203 Non-authoritative Information` ( Xuất hiện từ `HTTP/1.1` ) : Server là nơi chuyển đổi proxy ( ví dụ một Web accelerator ) đã nhận được 200 OK nhưng nó trả về một phiên bản thay đổi (có thể là header) của Response nguyên gốc .
- `204 No Content` : Server đã xử lý thành công request nhưng không trả về bất cứ content nào .
- `205 Reset Content` : Server đã xử lý thành công request nhưng không trả về bất cứ content nào . Không giống với `204 No Content` Response này yêu cầu phía Client phải thiết lập lại document view .
- `206 Partial Content` : Server chỉ trả về một phần của resouce( dạng byte ) do một range header được gửi bởi phía Client . Các Range Header được sửa dụng bởi Client để cho phép nối lại các phần của file download bị dán đoạn hoặc chia thành nhiều luồng download .
### **3.3) `3xx Redirection` ( *Chuyển hướng* )**
- `300 Multiple Choices` : Một danh sách các link . Người sử dụng có thể chọn một link và tới vị trí đó . Tối đa 5 địa chỉ .<br>**VD :** List các file video với format khác nhau
- `301 Moved Permanently` : Request hiện tại và các request sau được yêu cầu di chuyển tới một URI mới .
- `302 Found` : Đây là một ví dụ cho thấy sự mâu thuẫn giữa thực tiễn và quy chuẩn . Ở phiên bản `HTTP/1.0` nó có nghĩa là yêu cầu Client chuyển hướng đến một URL tạm thời ( tương tự như là `301 Moved Permanently` ) nhưng phần lớn các browser lại thực hiện nó với ý nghĩa của `303 See Other`(sẽ nói sau đây) . Do đó từ phiên bản `HTTP/1.1` có thêm hai mã `303` và `307` để phân biệt rõ hành vi , nhưng một số ứng dụng web và framework vẫn sử dụng `302` như thể là `303` .
- `303 See Other` ( Xuất hiện từ `HTTP/1.1` ): Response trả về của Request có thể tìm thấy ở một URL khác bằng cách sử dụng phương thức GET .
- `304 Not Modified` : Đây là **Status Code** tới một `If-Modified-Since` hoặc `If-None-Match header` , nơi mà URL không được chỉnh sửa từ ngày cụ thể .
- `305 Use Proxy` : Tài nguyên yêu cầu chỉ có sẵn thông qua một proxy, địa chỉ mà được cung cấp trong các Response . Nhiều HTTP Client ( như Mozilla và Internet Explorer ) không xử lý một cách chính xác phản ứng với mã trạng thái này , chủ yếu là vì các lý do an ninh .
- `306 Switch Proxy` : Mã này hiện không còn được sử dụng, ý nghĩa ban đầu của nó là "Các Request tiếp theo nên sử dụng các proxy được chỉ định" .
- `307 Temporary Redirect` ( xuất hiện từ `HTTP/1.1` ) : Trong trường hợp này, Request hiện tại cần được lặp lại một URL khác nhưng các Request trong tương lai vẫn sử dụng URL gốc .
### **3.4) `4xx Client Error` ( *Lỗi Client* )**
- `400 Bad Request` : Server không thể xử lý hoặc sẽ không xử lý các Request lỗi của phía client ( ví dụ Request có cú pháp sai hoặc Request lừa đảo định tuyến ... )
- `401 Unauthorized` : Tương tự như `403 Forbidden` nhưng được sử dụng khi yêu cầu xác thực là bắt buộc và đã không thành công . Các Response bắt buộc phải có thành phần WWW-Authenticate chứa các thách thức với tài nguyên được yêu cầu. Một số trang web vấn đề `HTTP 401` khi một địa chỉ IP bị cấm từ các trang web (thường là các tên miền trang web) và địa chỉ cụ thể là từ chối quyền truy cập một trang web .
- `402 Payment Required` : Hiện tại mã này chưa được sử dụng và nó được dự trữ cho tương lai . Mục đích ban đầu là mã này có thể được sử dụng như là một phần của đề án tiền mặt hoặc micropayment kỹ thuật số, nhưng điều đó đã không xảy ra, và mã này thường không được sử dụng . Google API sử dụng Status-Code này nếu một nhà phát triển đặc biệt đã vượt quá giới hạn số lần yêu cầu .
- `403 Forbidden` : Request là hợp lệ nhưng server từ chối đáp ứng nó. Nó có nghĩa là trái phép, người dùng không có quyền cần thiết để tiếp cận với các tài nguyên .
- `404 Not Found` : Các tài nguyên hiện tại không được tìm thấy nhưng có thể có trong tương lai . Các request tiếp theo của Client được chấp nhận .
- `405 Method Not Allowed` : Request method không được hỗ trợ cho các tài nguyên được yêu cầu . Ví dụ Một GET request đến một POST resource, PUT Request gọi đến một tài nguyên chỉ đọc .
- `406 Not Acceptable` : Server chỉ có thể tạo một Response mà không được chấp nhận bởi Client .
- `407 Proxy Authentication Required` : Bạn phải xác nhận với một Server ủy quền trước khi Request này được phục vụ .
- `408 Request Timeout` : Request tốn thời gian dài hơn thời gian Server được chuẩn bị để đợi .
- `409 Conflict` : Request không thể được hoàn thành bởi vì sự xung đột , ví dụ như là xung đột giữa nhiều chỉnh sửa đồng thời .
- `410 Gone` : Các resource được yêu cầu không còn nữa và sẽ không có sẵn một lần nữa , khi gặp mã lỗi này Client không nên có gắng tìm kiếm các tài nguyên này ở những lần sau .
- `411 Length Required` : Content-Length không được xác định rõ . Server sẽ không chấp nhận Request nào không có nó .
- `412 Precondition Failed` : Server sẽ không đáp ứng một trong những điều kiện tiên quyết của Client trong Request .
- `413 Payload Too Large` : Server sẽ không chấp nhận yêu cầu , bởi vì đối tượng yêu cầu là quá rộng . Trước đây nó gọi là "`Request Entity Too Large`" .
- `414 URL Too Long` : URL được cung cấp là quá dài để Server xử lý , thường là kết quả của quá nhiều dữ liệu được mã hóa như là một truy vấn chuỗi của một GET Request , trong trường hợp đó nó phải được chuyển đổi sang một POST Request . Trước đây được gọi là "`Request-URL Too Long`"
- `415 Unsupported Media Type` : Server sẽ không chấp nhận Request , bởi vì kiểu phương tiện không được hỗ trợ. Ví dụ khi Client upload một ảnh có định dạng image/svg+xml, nhưng server yêu cầu một định dạng khác .
- `416 Range Not Satisfiable` : Client yêu cầu một phần của tập tin nhưng server không thể cung cấp nó. Trước đây được gọi là "`Requested Range Not Satisfiable`"
- `417 Expectation Failed` : Máy chủ không thể đáp ứng các yêu cầu của trường Expect trong header .
### **3.5) `5xx Server Error` ( *Lỗi Server* )**
- `500 Internal Server Error` : Một thông báo chung chung , được đưa ra khi Server gặp phải một trường hợp bất ngờ , Message cụ thể là không phù hợp .
- `501 Not Implemented` : Server không công nhận các Request method hoặc không có khả năng xử lý nó .
- `502 Bad Gateway` : Server đã hoạt động như một gateway hoặc proxy và nhận được một Response không hợp lệ từ máy chủ nguồn .
- `503 Service Unavailable` : Server hiện tại không có sẵn (Quá tải hoặc được down để bảo trì). Nói chung đây chỉ là trạng thái tạm thời.
- `504 Gateway Timeout` : Server đã hoạt động như một gateway hoặc proxy và không nhận được một Response từ máy chủ nguồn .
- `505 HTTP Version Not Supported` : Server không hỗ trợ phiên bản “giao thức HTTP” .
## **4) Phương thức `GET` và `POST`**
- **`GET`** và **`POST`** là hai phương thức của giao thức HTTP ,  đều là gửi dữ liệu về server xử lí sau khi người dùng nhập thông tin vào form và thực hiện submit . Trước khi gửi thông tin , nó sẽ được mã hóa bằng cách sử dụng một giản đồ gọi là **url encoding** . Giản đồ này là các cặp `name/value` được kết hợp với các kí hiệu `=` và các kí hiệu khác nhau được ngăn cách bởi dấu `&` .
    ```
    name=value1&name1=value2&name2=value3 
    ```
### **4.1) `GET`**
- Phương thức **`GET`** gửi thông tin người dùng đã được mã hóa thêm vào trên yêu cầu trang :
    ```
    http://www.example.com/index.htm?name=value1&name1=value1
    ```
- Chúng ta thấy rằng **`GET`** lộ thông tin trên đường dẫn URL .  Băng thông của nó chỉ khoảng `1024` kí tự vì vây **`GET`** hạn chế về số kí tự được gửi đi . **`GET`** không thể gửi dữ liệu nhị phân , hình ảnh ... Có thể cached được bookmark (đánh dấu trên trình duyệt) . Lưu trong browser history .
### **4.2) `POST`**
- Phương thức **`POST`** truyền thông tin thông qua HTTP header , thông tin này được mã hóa như phương thức **`GET`** . Dữ liệu đươc gửi bởi phương thức **`POST`** rất bảo mật vì dữ liệu được gửi ngầm , không đưa lên URL , bằng việc sử dụng Secure HTTP , bạn có thể chắc chắn rằng thông tin của mình là an toàn . Parameters được truyền trong request body nên có thể truyền dữ liệu lớn , hạn chế tùy thuộc vào cấu hình của Server . Không cache và bookmark được cũng như không được lưu lại trong browser history . **`POST`** không có bất kì hạn chế nào về kích thước dữ liệu sẽ gửi , có thể gửi dữ liệu nhị phân , hình ảnh .
    ```
    http://
    ```
### **4.3) So sánh**

| | **`GET`** | **`POST`** |
|-|-----------|------------|
| **Refresh lại trang** | Với form gửi đi bằng phương thức **`GET`** bạn có thể gửi lại bằng cách bấm phím `F5` hoặc `Ctrl + R` | Trình duyệt sẽ hiển thị một hộp thoại cảnh báo |
| **Back lại trang trước** | Trong trường hợp bạn đã gửi form dữ liệu đi rồi sau đó bấm phím Backspace để quay lại trang trước thì với phương thức **`GET`** bạn sẽ vẫn được cùng một nội dung (chứa form) | Với POST thì sẽ chỉ thấy một trang trống |
| **Bookmark** | Người dùng có thể bookmark lại được trên trình duyệt | Các request gửi bằng **`POST`** sẽ không thể bookmark được |
| **Cache** | Dữ liệu gửi bằng phương thức **`GET`** sẽ được lưu trữ lại trong query string và có thể được xem trong lịch sử trình duyệt | Dữ liệu và địa chỉ URL của các request gửi bằng **`POST`** không được trình duyệt lưu lại |
| **Tốc độ** | Webrowser cached sẽ kiểm tra có kết quả tương ứng đó trong cached chưa , nếu có thì trả về ngay mà không cần đưa tới server => **`GET`** nhanh hơn | Khi dùng phương thức **`POST`** thì server luôn thực thi và trả kết quả cho client => **`POST`** chậm hơn |
| **Bảo mật** | **`GET`** hiển thị lại được các dữ liệu trên URL => Kém bảo mật | **`POST`** bảo mật hơn **`GET`** vì dữ liệu được gửi ngầm , không xuất hiện trên URL , dữ liệu cũng không được lưu lại |
| **Giới hạn dữ liệu** | Bị giới hạn sử dụng các ký tự chữ có trong bộ ký tự `ASCII` | Phương thức **`POST`** không giới hạn dung lượng dữ liệu gửi đi cũng như loại nhữ liệu (văn bản thông thường hay file nhị phân như upload tập tin hay hình ảnh, video...) |
| **Giới hạn số ký tự** | `1024` ký tự | Không giới hạn |

### **4.4) Lựa chọn**
- Khi lấy dữ liệu nên dùng **`GET`** để truy xuất và xử lí nhanh hơn .
- Khi tạo dữ liệu nên dùng **`POST`** để bảo mật dữ liệu hơn . Một ví dụ cụ thể như trong trường hợp bạn cần tạo một form để người dùng upload avatar hay video thì chúng ta thường sẽ sử dụng phương thức **`POST`** . Tuy nhiên khi tải về avatar hoặc video thì bạn lại nên sử dụng phương thức **`GET`** . Ngoài ra khi cần xử lý các thông tin nhạy cảm ví dụ như email, password thì bạn cần sử dụng **`POST`** thay vì **`GET`**.
