# CHƯƠNG 2: TẦNG ỨNG DỤNG

## Mục lục
[2.1 Giao thức tầng ứng dụng](#1)
 - [2.1.1 Giao thức tầng ứng dụng](#a)
 - [2.1.2 Các yêu cầu của ứng dụng](#aa)
 - [2.1.3 Dịch vụ của các giao thức giao vận Internet](#aaa)
 - [2.1.4 Một số ứng dụng phổ biến](#aaaa)

[2.2 World wide web](#2)
- [2.2.1 Tổng quan về HTTP](#b1)
- [2.2.2 Kết nối liên tục và không liên tục](#b2)
- [2.2.3 Khuân dạng thông điệp HTTP](#b3)
- [2.2.4 Tương tác giữa người dùng và Hrver-server](#b4)
- [2.2.5 Get có điều kiện(conditional Get)](#b5)
- [2.2.6 Web cache](#b6)
- [2.2.7 Web động ](#b7)

[2.3 FTP(File Trasfer Protocol) Giao thức truyền tệp](#3)

[2.4 SMTP (Simple Mail Trasfer Protocol) Giao thưc truyền tải thư tin đơn giản](#4)

[2.5 POP & IMAP (Post Office Protocol & Internet Mail Access Protocol) Giao thức nhân thư điện tử](#5)

[2.6 DNS (Domain Name System) Hệ thống tên miền,giao thức](#6)


 ===========================

<a name ="1"></a>
 2.1 Giao thức tầng ứng dụng

<a name ="a"></a>
2.1.1 Giao thức tầng ứng dụng
    Cân phân biệt ứng dụng mạng và giao thức tầng ứng dụng.Giao thức tầng ứng dụng chỉ là 1 phần của ứng dụng mạng .Giao thưc tầng ứng dụng của web-HTTP(Hyper Text Tranfer Prôtcol) định nghĩa các thức truyền thông điệp giữa webcline và web server.Nhưng vậy HTTP chỉ là 1 phần của ứng dụng web
- Mô hình khác hàng / Người phục vụ (cline/server)
  Giao thức ứng dụng mạng chia thành 2 phần hay 2 phía, phía cline và phía server
- Truuền thông giữa các tiến trình
    Ưng dụng bao gồm 2 tiếng trình trên hai thiêt bị khác nhau,liên lạc với nhau qua mạng.Hai tiếng trình liên lác với nhau bằng cách gửi và nhận thông điệp socker của chúng.
- Địa chỉ tiến trình 
    Để gửi thông điệp cho tiến trình trên máy tính khác thì tiếng trình gửi phải xác định của tiến trình nhận

<a name ="aa"></a>
2.1.2 Các yêu cầu của ứng dụng 
    Socker là giao diện giữa tiếng trình ứng dụng và thực thể giao vận.Ứng dụng gửi thông điệp qua "cửa"ở sau cánh cửa là thực thể giao vận có trách nghiệm là truyền thông điệp qua mạng máy tính tới "cửa" tiến trình nhận
    
- Ứng dụng đòi hỏi dịch vụ gì của giao thức giao vận.Về đại thực thể chúng ta có thể phân loại theo 3 nhóm:
    - Mất mát dữ liệu (Data loss)
    - Băng thông (bandwith)
    - Thời gian (timing)
- Mất mát dữ liệu (Data loss)
    Một số ứng dụng như file, thư điện tử ...và ứng dụng tài chính đòi hỏi truyền chính xác và đầy đủ tức là không mất mát dữ liệu .Nếu mất mát sẽ gây nên hậu quả nghiêm trọng.Tuy nhiên một số ứng dụng khác như đa phương tiện(real time audio video hay stored autio video) chấp nhận mất mát giữ liệu trong giới hạn nào đó dẫn đến chất lượng bị giảm đi trong một giới hạn nào đó

- Băng thông (bandwith)
  Chỉ lưu lượng của tín hiệu được tryền qua thiết bị truyền dẫn trong 1 giây là bao nhiêu.Ta thường gặp với tốc độ cap quang,tốc độ của USB

- Thời gian (timing)
    Những ứng dụng thời gian thực (real-time ) mang tính chất tương tác như Internet telephone, hội thoại qua điên thoại hay chơi trò chơi nhiều người cung 1 lúc yêu caau fnhiều rằng buộc chặt chẽ về thời gian trong việc trao đổi dữ liệu.  
<a name ="aaa"></a>
2.1.3 Dịch vụ của các giao thức giao vận Internet
    Internet cung cấp 2 giao thức giao vận cho tầng ứng dụng: UDP và TCP khi xây dụng ứng dụng cho internet , 1 trong những quyết định đầu tiên của nhà thiết kế phải đưa ra là sử dụng UDP hay TCP mỗi giao thức cung cấp một kiểu phục vụ khác nhau:

  - TCP : Đặc trưng của giao thức TCP là hướng kết nối và cung cấp dịch vị truyền liệu tin cậy .khi sử dụng giao vận TCP ứng dụng sẽ được nhận hai loại dịch vụ này:
      - Dịch vụ hướng nối (connection)
      - Dịch vụ giao vận tin cậy
- UDP:là giao thức giao vận khá đợn giản .Với mô hình phục vụ tối thiểu .UDP không hướng nối nghĩ là không có giai đoạn "bắt tay" trước khi hai tiến trnhf bătts đầu trao đổi tín hiệu .UDP không cung cấp dịch vụ tin cậy khi tiến trình gửi thông diệp thông qua cổng UDP,UDP không đảm bảo thông điệp sẽ đến cổng tiếp nhậnh hươn nữa thông điệp đến đích có thể không theo thứ tự.Mặt khác UDP có cơ chế kiểm soát tác nghẽn ,vì vậy tiếng trình gửi có thể đẩy dữ liệu ra cổng UDP với tốc độ bất kỳ.
<a name ="aaaa"></a>
2.2.4 Một số ứng dụng phổ biến
 -  Web
 - Truyền file
 - Thử điện tử
 - Dịch vụ tên miền
  
<a name ="2"></a>
2.2 World wide web

<a name ="b1"></a>
2.2.1 Tổng quan về HTTP (Hyper Text Tranfer Protocol)
    "Giao thưc truyền tải siêu văn bản" là mọt trong những giao thưc chuẩn về Internet được dùng để liên hệ thông tin giữa máy cung cấp dịch vụ (web server) và máy sử dụng (web cline)

<a name ="b2"></a>
2.2.2 Kết nối liên tục và không liên tục (persistent/nonpersistent)

HTTP hỗ trợ cả hai kết nối liên tục và không liên tục.HTTP 1.0 sử dụng kêt nối không liên tục ,chế độ mạc định của HTTP 1.1 là kết nối liên tục 

<a name ="b3"></a>
2.2.3 Khuân dạng thông điệp HTTP 

Các đặc tả HTTP 1.0(REC 1945) và HTTP 1.1(RFC 2016) đặc tả khuân dạng thông điệp HTTP.Có hai kiểu khuân dạng:
  - Thông điệp yêu cầu 
  - Thông điệp trả lời 

<a name ="b4"></a>
2.2.4 Tương tác giữa người dùng và Hrver-server

HTTP có hai cơ chế để server phân biệt người dùng : Authentication và Cookies
-  Authentication (kiểm chứng)

Nhiêu server yêu cầu người dùng phải cung cấp tên (usename) và mật khẩu (password) để có thẻ truy cập và tài nguyên mấy chủ .yêu cầu này gọi là kiểm trứng.Sau đây là một vài giá trị thông dụng và ý nghĩa của chúng 
    - 200 OK: Yều cầu được đáp ứng dữ liệu được yêu cầu nằm trong thông điệp
    - 301 Moved permanetly: Cho biết đối tượng đã được chuyển và địa chỉ URL mới cảu đói tượng được đặt trong location
    - 400 Bad request: server không hiểu được yêu cầu của clỉe 
    - 404 Not found: Đối tượng không còn được lưu trên server
    - 505 HTTP version not suppost : Server không hỗ chợ gaio thức  của cline
- Cookie

Cookie là một kỹ thuật khác được sử dụng để ghi lại những dấu vết của ngưới truy cập .Nó được đặt trong  set-cookies

<a name ="b5"></a>
2.2.5 Get có điều kiện(conditional Get)
Web cache có thể làm giảm thười gian chờ từ khi gửi yêu cầu đến khi nhận đối tượng và làm giảm lưu lượng truyền trên internet.HTTP có cơ ché cho phép sử dụng cache trong khi vẫn đảm bảo đối tượng trong cache chưa bị "cũ" cơ chế này chính là Get có điều kiện

<a name ="b6"></a>
2.2.6 Web cache

Là ứng dụng công nghệ thông tin cho bộ  nhớ tạm thời của các dữ liệu trang web.
- Web cache hoạt đông như thế nào?

thay vì lúc nào bạn cũng phải bỏ thời gian tối ưu hóa máy tính thì việc sử dụng web cache giúp tăng cường tốc độ load của server.
VD: có rất nhiều khách hàng quan tâm trang web .Web cache sẽ hoath động abừng cách lưu trữ các bản sao của các trang web đó và sẽ đáp ứng những yêu cầu của người dùng bằng những bản sao gióng hoàn toàn với bản chính.
- Cache liên hợp
có thể kết hợp nhiều web cache đặt ởvị trí khác nhau trên mạng nhằm nâng cao hiệu suất tổng thể.

<a name ="b7"></a>
2.2.7 Web động 

Một trang web động không tồn taij dưới dạng một file cố định trên web server .Trang web dộng chỉ được server tạo ra khi nhân được một yêu cầu cụ thể.khi nhân được một yêu cầu ,web server sẽ chạy một ứng dụng để tạo ra nội dung văn bản ,sau đó văn bản này sẽ được trả về cho trình duyệt.

- Web tích cực(active web) là một loai văn bản chưaá chương trình .Chương trình này có khả năng tính toán và hiển thị thông tin

- Chuẩn CGI (Common Gateway Interface)

CGI là một trong những công nghê đã từng được sử dụng rất rộng dãi khi xây dựng web động.chuẩn CGI quy định cách thức chuẩn của web server tương tác với chương trình ứng dụng

- Các kĩ thuật phía Server

Một phương pháp giúp web server tạo nội dung động là công nghệ phía server.Ngày nay có nhiều công nghệ như vậy:
   - ASP(Active Server Pages) là công nghệ của Microsoft có phân mở rộng là .asp
   - PHP(Personal Home Pages) công nghệ mã nguồn mở phần mở rộng là PHP or PHP3
    - JSP(Java Server Pages) dực trên ngôn ngữ lập trình Java có phần mở rộng là .jsp

<a name ="3"></a>
2.3 FTP(File Trasfer Protocol) Giao thức truyền tệp

Là giao thức truyền file giữa các máy tính .Giao thức giúp bạn dễ dàng trao đổi các dữ diệu giữa máy tính của bạn với Host và ngược lại(hình ảnh,vb,nhạc,video),giao thức này xuất hiện những năm 1971 nhưng giờ vẫn được sử dụng rộng dãi cho đến ngày nay.

- mô hình hoạt đọng của FTP 

Không giống như các ứng dụng khác chạy trên TCP ,FTP không cần kết nối TCP mà các mô hình FTP được thiết kế xung quanh hai kênh loogic ,trong quá trính giao tiếp giữa cline FTP và server FTP là control connection và data connection

<a name ="4"></a>
2.4 SMTP (Simple Mail Trasfer Protocol) Giao thưc truyền tải thư tin đơn giản

Là một chuẩn truyền tải thư điện tử qua mạng internet.Máy chủ này sẽ hỗ trợ các phần mềm gửi mail như Goole,yahoo .. có thể gửi thư tín cùng một lúc đến nhiều máy chủ khác .Nghiệm vụ chính là gửi mail,còn việc nhận mail hay truy suất dữ liệu server là các phương thức khác để nhận thư như IMAP hay POP

<a name ="5"></a>
2.5 POP & IMAP (Post Office Protocol & Internet Mail Access Protocol) Giao thức nhân thư điện tử 

- POP (Post Office Protocol )
  - Kết nối đến server
  - Nhân toàn bộ mail
  - Lưu cục bộ mới 
  - Xóa mail khỏi server
  - Ngắt kết nối 
  
  Hành vi mặc định của POP là xóa mail khỏi server

- IMAP (Internet Mail Access Protocol)
  - Kết nối đến server 
  - Lấy nội dung được yêu cầu từ người dùng và lưu đệm cục bộ,chẳng hạn như danh sách mail mở ,tổng kêt tin nhắn hay nôi dung cuae các mail được chọn lựa kí càng 
  - Xử lý các biên tập từ người dùng .VD đánh dấu mail đã đọc hay xóa 
  - ngắt kết nối 

- Ưu điểm của POP
  - Luôn có thể truy cập ngay cả khi không có kết nối Internet 
  - Kết nối internet cỉ đẻ gửi và nhân mail
  - Tiết kiệm không gian lưu trữ trên server
  - Được lựa chọn để lại bản sao mail trên server
  - Hợp nhất nhiều tài khoản email

- Ưu điểm của IMAP
  - Cho phép nhiều máy khác hay người dùng quản lý cùng một hộp thư đến .VÌ vậy bạn có thể nhập từ máy tính ở nhà hay ở công ti thì bạn sẽ luon thấy cùng một mail
  - Mail được lưu trên server đầu xa tức co thể truy cập nhiều địa điểm khác nhau 
  - Cần kết nối internet để truy cập vào mail
  - Xem nhanh hơn khí có tiêu đề mail được tải về đến khi nội dung yêu cầu rõ dàng 
  - Mail được dự phòng tự động trên server
  - Tiết kiệm không gian lưu trữ cụ bộ
  - Vẫn cho phép lưu mail cục bộ.

- Chọn POP nếu:
    - Bạn muốn  đăng nhâp mail từ một thiét bị
    - Bạn cần truy cập mail thường xuyên dù có kết nối internet hay không
    - Không gian lưu trữ trến server hạn chế

- Chọn IMAP nếu:
    - Bạn muốn truy cập mail từ nhiều thiết bị khác 
    - Bạn có kết nối internet thường xuyên và tin cậy
    - Bạn muốn xem nhanh các mail mới 
    - không gian lưu trữ han chế
    - Lo lắng về vấn đề dự phòng dữ liệu 

<a name ="6"></a>
2.6 DNS (Domain Name System) Hệ thống tên miền,giao thức

Là một hệ thống đặt tên theo thứ tự cho máy tính,dịch vụ hoặc bất kì nguồn lực nào tham gia vào internet. Mỗi một trang web đều có một tên (là tên miền hay đường dẫn URL: Universal Resource Locator) và một địa chỉ IP.Khi mở trình duyệt web và nhập tên Website mà không cần pahỉ thông qua việc nhập dại chỉ IP của Web .Qúa trình dịch "tên miền" thành địa chỉ IP để trình duyệt hiểu và truy cập vào website là công việc của DNS

- Nguyên tắc làm việc

Mỗi nhà cung cấp dịch vụ vận hành và duy trì DNS server riêng của mình, gồm các máy bên trong phần riêng của mỗi nhà cung cấp dịch vụ đó trong Internet. Tức là, nếu một trình duyệt tìm kiếm địa chỉ của một website thì DNS server phân giải tên website này phải là DNS server của chính tổ chức quản lý website đó chứ không phải là của một tổ chức (nhà cung cấp dịch vụ) nào khác

INTERNIC (Internet Network Information Center) chịu trách nhiệm theo dõi các tên miền và các DNS server tương ứng. INTERNIC là một tổ chức được thành lập bởi NFS (National Science Foundation), AT&T và Network Solution, chịu trách nhiệm đăng ký các tên miền của Internet. INTERNIC chỉ có nhiệm vụ quản lý tất cả các DNS server trên Internet chứ không có nhiệm vụ phân giải tên cho từng địa chỉ

DNS có khả năng tra vấn các DNS server khác để có được một cái tên đã được phân giải. DNS server của mỗi tên miền thường có hai việc khác biệt. Thứ nhất, chịu trách nhiệm phân giải tên từ các máy bên trong miền về các địa chỉ Internet, cả bên trong lẫn bên ngoài miền nó quản lý. Thứ hai, chúng trả lời các DNS server bên ngoài đang cố gắng phân giải những cái tên bên trong miền nó quản lý. - DNS server có khả năng ghi nhớ lại những tên vừa phân giải. Để dùng cho những yêu cầu phân giải lần sau. Số lượng những tên phân giải được lưu lại tùy thuộc vào quy mô của từng DNS.
