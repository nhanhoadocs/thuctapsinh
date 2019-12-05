File config : /etc/rsyslog.conf

Folder	: /etc/rsyslog.d/

Có 3 kiểu config được hỗ trợ: basic , advanced , obsolete legacy
-	basic : cấu hình cơ bản, trên 1 dòng
-	advanced: khi việc cấu hình cần nhiều hơn 1 dòng
-	obsolete legacy: cũ,đã lỗi thời, ít được khuyến khích sử dụng vì khó khan khi cấu hình các usecase khó -> sử dụng advanced

        Viết trên 1 dòng duy nhất, bắt đầu bằng $
        obsolete legacy được khuyến khích thay thế bằng basic và advanced

# 1. Which Format should  we use?
Nên sử dụng basic và advanced
## 1.1. basic 
hay được sử dụng cho việc ghi log vào tệp (hoặc chuyển tiếp).

Format như sau:

    mail.info /var/log/mail.log
    mail.err @@server.example.net

@ : khi dùng udp
@@ : khi dùng tcp
## 1.2. advanced 
được sử dụng cho những cấu hình phức tạp khác.

ưu điểm: 

    - kiểm soát tốt các hoạt động rsyslog thông qua các tham số nâng cao 
    - dễ theo dõi cấu trúc khối 
    - dễ viết 
    - an toàn để sử dụng với các tập tin đi kèm
    
VD: mail.err action(type="omfwd" protocol="tcp" queue.type="linkedList")

advanced cho phép chỉ định các parameter bổ sung để chỉnh hành vi (basic không cung cấp)

## 1.3. obsolete legacy 
(không khuyến khích được sử dung)

chỉ sử dụng để không phá vỡ những thiết lập,cấu hình cũ trước đó

### Note: 
ta có chuyển đổi cấu hình basic,legacy thành cấu hình bằng cách viết advanced
# 2. Basic Structure
Message
-> rsyslog thông qua các input module

-> chuyển tới ruleset để áp rule. Rule khớp 

-> chuyển đến action (nơi mà xác định hành động sẽ làm với mess ( viết vào file,db hay forward đến remote host) 

- dùng basic cấu hình đơn giản
- dùng advanced khi cần cấu hình gồm nhiều điều kiện đi kèm
## 2.1 Inputs
Mỗi đầu vào đều yêu cầu 1 input module được load và 1 listener được xác định cho nó

Sau khi load thì ta define bằng đối tượng input()
## 2.2 Outputs 
hay còn gọi là “actions”

1 tập hợp nhỏ action sẽ được tải sẵn (như ghi tệp đầu ra)

Các action khác phải được load như với input

## 2.3 Rulesets và Rule
cách xử lý vs 1 thông điệp cụ thể. 

Có 1 loại bộ lọc (if-statement).Có thể lồng vào nhau như vs ngôn ngữ lập trình

https://www.rsyslog.com/doc/v8-stable/concepts/multi_ruleset.html

    ruleset(name="rulesetname") {
        action(type="omfile" file="/path/to/file")
        action(type="..." ...)
        /* and so on... */
    }
 
# 3. Templates
1 tính năng của rsyslog

-> tạo định dạng mong muốn 

-> áp vào log 

Nếu không dùng template riêng -> template mặc định sẽ được sử dụng

chỉ định bởi $template()

cú pháp: template(parameters) { list-descriptions }

parameter name : duy nhất

parameter type	: chỉ định type. các type khác nhau cho phép chỉ định kiểu content bên trong của template theo các cách khác nhau :
•	list
•	subtree
•	string
•	plugin
https://www.rsyslog.com/doc/v8-stable/configuration/templates.html

    template(name="tpl1" type="list") {
        constant(value="Syslog MSG is: '")
        property(name="msg")
        constant(value="', ")
        property(name="timereported" dateFormat="rfc3339" caseConversion="lower")
        constant(value="\n")
        }

Có khá nhiều loại Template Names được load sẵn cho ta chỉ định

# 4. Rsyslog Properties
Là các mục dữ liệu trong rsyslog

->muốn access đến các dữ liệu này 

->cần chỉ định property tương ứng

Sử dụng trong :
-	templates
-	conditional statements

## 4.1 Message Properties
rsyslog phân tích original message(OM) thành các phần

Các property hay sử dụng:

    msg 	:phần thân MSG của OM
    hostname :hostname từ OM
    source : bí danh cho HOSTNAME
    fromhost  : hostname của máy giữ log ngay trước máy nhận (có thể là relay,không nhất thiết là ng gửi ban đầu)
    fromhost-ip	: tương tự fromhost nhưng thay vì hostname thì sẽ là IP address
    syslogtag	: tag từ OM
    programname	:phần static của tag.ví dụ :TAG là “named[12345] thì programname là “named”
    pri	:PRI của OM  chưa được giải mã
    pri-text	: phần PRI của OM ở dạng văn bản với PRI số được nối trong ngoặc (ví dụ: local local0.err <133>)
    syslogfacility		:facility OM dạng số
    syslogfacility-text	: facility OM dạng text
    syslogseverity	:severity dạng số
    syslogseverity-text	:severity dạng text
    timereported		: timestamp của OM
    timestamp		:alias cho timereported
    inputname		:Tên input module đã tạo ra mess(imuxsock,imudp,..)

Note: Ngoài ra còn có các property về System hay Time-Related System Properties
https://www.rsyslog.com/doc/v8-stable/configuration/properties.html
 
# 5. The Property Replacer
Là 1 thành phần cốt lõi của hệ thống template string của rsyslogd

Giúp ta thao tác với các property được đề cập phía bên trên
## 5.1 Accessing Properties
Các syslog message property được sử dụng trong template. Access đến chúng bằng cách đặt trong các dấu %  
-> Lúc này ta có thể modify chúng thông qua property replacer

Cú pháp:

    %property:fromChar:toChar:options%
### Available Properties
Property replacer có thể sử dụng tất cả rsyslog properties
### Character Positions
FromChar và toChar 

chỉ định phần string con cần được sao chép

Sẽ đếm offset từ 1-> cần lấy 2 ký tự đầu, ta sử dụng( ví dụ “%msg:1:2%”)

Nếu chỉ muốn chỉ định tùy chọn sử dụng (ví dụ: “msg:::lowercase%”)

-> vẫn cần dấu : dù không chỉ định chuỗi con

### Ví dụ: extract từ 1vị trí đến cuối -> sử dụng $

“%msg:10:$%” 	-> extract từ vị trí 10 đến cuối

### Property Options
    uppercase	:convert qua chữ hoa
    lowercase	:convert qua chữ thường
    fixed-width	: thay đổi hành vi của toChar ->đệm các khoảng trắng vào chuỗi nguồn cho đến khi đạt giá trị của toChar nếu chuỗi nguồn ngắn hơn

tham khảo thêm tại
https://www.rsyslog.com/doc/v8-stable/configuration/property_replacer.html
# 6 . Filter Conditions
4 kiểu filter:

    -	dựa trên mức severity và facility (thường sử dụng nhất)
    -	dựa trên property
    -	dựa trên biểu thức
    -	BDS-style block ( không dùng)
## Selectors
2 phần,không phần biệt hoa thường ngăn cách nhau bởi dấu chấm .

    bên trái .	: chỉ định nguồn sinh log
    bên phải .	: chỉ định mức cảnh báo bắt đầu tạo log
VD : mail.warning  	: bắt đầu ghi log mail khi mức cảnh báo đạt warning

có thể viết thành 3.4	(không khuyến khích viết thông qua số đại diện)

1 số syntax hữu dụng đi kèm

    *.*		: ghi log tất cả nguồn, tất cả mức cảnh báo
    mail,user.*		: ghi tất cả log của mail,user 
    mail.=error		:chỉ ghi log error của mail


Chủ yếu sử dụng facility và severity 
Xem thêm tại

https://www.rsyslog.com/doc/v8-stable/configuration/filters.html

    *.* /var/log/file1 # the traditional way
    if $msg contains 'error' then /var/log/errlog #the expression-based way