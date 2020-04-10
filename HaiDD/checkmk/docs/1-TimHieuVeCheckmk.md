# **Tìm hiểu về checkmk**

# 1. Tổng quan về Checkmk
## 1.1. OMD là gì ?
Các sự cố gián đoạn hệ thống mạng, máy chủ không hoạt động, các dịch vụ và ứng dụng gặp vấn đề… đều gây ảnh hưởng nghiêm trọng đến hoạt động doanh nghiệp. Tổn thất có thể lên đến hàng ngàn, thậm chí hàng triệu USD tùy theo doanh thu và lĩnh vực hoạt động. Để giảm thiểu thiệt hại đến mức tối thiểu hoặc ngăn chặn những sự cố đáng tiếc xả ra thì sẽ cần sự giúp đỡ rất nhiều từ các hệ thống giám sát

Bộ giải pháp OMD - Checkmk một giải pháp giám sát mã nguồn mở có khả năng giám sát, cảnh báo và hiển thị các biểu đồ khá tốt đối với những hệ thống tầm trung không sẵn sàng chi nhiều kinh phí cho việc giám sát hệ thống, mạng.

- OMD - Open Monitoring Distribution là một dự án được phát triển từ năm 2010 bởi Mathias Kettner. OMD sử dụng nhân là Nagios Core, kết hợp với các phần mềm mã nguồn mở khác để đóng gói thành một sản phẩm phục vụ cho nhu cầu giám sát, cảnh báo và hiển thị.

## 1.2. Lịch sử hình thành
- Năm 2010 dự án OMD (Open Monitoring Distribution) được khởi động bởi Mathias Kettner, là sự kết hợp của Nagios, Checkmk, NagVis, PNP4Nagios, DocuWiki, ...tạo nên sự linh hoạt trong giám sát. Các distro của OMD đang là OMD-LABS và Checkmk RAW.

- Năm 2015, phiên bản đơn giản của OMD ra đời gọi là Checkmk, Checkmk có 2 phiên bản là **Checkmk Raw Edition** (CRE) và **Checkmk Enterprise Edition** (CEE). Hiện nay có thêm một phiên bản mới phiên bản này dựa trên phiên bản CEE được gọi là **Checkmk Managed Services Edition**


## 1.3. Phân biệt OMD-LABS và CHECKMK RAW
OMD-LABS chứa tất cả các thành phần nguyên bản của OMD và một số addons thêm vào như Grafana, InfluxDB, Naemon, Icinga 2. Checkmk RAW edition tập trung vào Checkmk, đây là một gói nhỏ hơn chứa các thành phần để chạy Checkmk.

Trong bài tóm tắt này tôi sẽ tóm tắt về OMD. Gồm 2 phiên bản là OMD-LABS và OMD thường hay còn gọi là Checkmk RAW

### 1.3.1. OMD-LABS
OMD Labs-Edition là một nền tảng giám sát và một khái niệm mới về cài đặt, duy trì và cập nhật một hệ thống giám sát được xây dựng trên Nagios. Không được tích hợp sẵn trong các bản phân phối Linux mà tích hợp vào hệ thống dưới dạng các Package rpm và deb.

Phiên bản stable là 3.20, thường thì 6 tháng sẽ có một phiên bản stable được phát hành. Tính từ thời điểm hiện tại thì đến tháng 4 năm 2020, một phiên bản stable mới sẽ được phát hành.

<img src="https://i.imgur.com/xZvkIdb.png">


### Một số điểm khác của OMD-LABS với OMD thường (Checkmk):
Các thành phần phần mềm bổ sung: OMD-Labs chỉ bổ sung các thành phần phần mềm mới và không loại bỏ bất kì phần mềm nào, làm cho OMD-Labs trở nên hoàn hảo hơn, và có thể chuyển sang các phiên bản khác bằng omd update

- Lõi giám sát: Bên cạnh Nagios 3, OMD-Labs còn chứa hai Cores mới là Naemon và Icinga2. Trong khi Naemon hoàn toàn tương thích với định dạng Nagios 3 config thì Icinga2 sử dụng định dạng cấu hình mới. Tuy nhiên, từ phiên bản OMD-LABS 3.0 trở đi đã bỏ đi một số phần mềm là: Nagios3, Icinga 2, Checkmk, Nagvis

- Biểu đồ Grafana/Influxdb: Bên cạnh PNP4Nagios OMD có đồ thị Grafana dựa trên Influxdb. Để tạo mẫu đồ thị dựa trên mẫu, đã có histou (Histou được thiết kế để thêm các mẫu vào Grafana từ dữ liệu của Nagios). Giao diện giữa core giám sát và Influxdb được thực hiện trong thành phần Nagflux.

- Hệ thống con Prometheus: Bên cạnh việc giám sát truyền thống, OMD-Labs đi kèm với prometheus bao gồm quản lý cảnh báo, pushgateway và blackbox exporter

- Livestatus Multitool Daemon

- Giao diện Web: Thruk là trang web mặc định trong OMD-Labs

### 1.3.2. CHECKMK RAW
- Checkmk là phần mềm giám sát được phát triển bằng Python và C++. Nó được sử dụng để giám sát các máy chủ, ứng dụng, mạng, hạ tầng cloud, containers, storage, databases và cảm biến môi trường.

- Dự án Checkmk được phát triển từ năm 2008 như là một plugin của Nagios Core.

- Checkmk được tạo ra với mục đích giải bài toán hiệu năng cho nagios. Giúp cho việc mở rộng hệ thống giám sát dễ dàng hơn

- Checkmk đang có sẵn 4 phiên bản là :
    - **Checkmk Raw Edition – CRE** : Phiên bản nguồn mở miễn phí

    - **Checkmk Enterprise - Free Edition - CFE** : là phiên bản miễn phí của sản phẩm thương mại của checkmk giới hạn ở hai trang web, mỗi trang web có tối đa 10 máy chủ có thể được theo dõi.

    - **Checkmk Enterprise - Standard Edition – CEE** : Phiên bản thương mại cho doanh nghiệp. Bao gồm nhiều tính năng bổ sung có liên quan trong bối cảnh chuyên nghiệp, cung cấp khả năng mở rộng lớn hơn và cung cấp cơ hội nhận được hỗ trợ cấp doanh nghiệp thông qua nhà cung cấp hoặc mạng lưới đối tác của mình.

    - **Checkmk Enterprise - Managed Services Edition – CME** : Phiên bản thương mại cho các nhà cung cấp quản lí dịch vụ. Dựa trên Enterprise - Standard Edition và cung cấp các tính năng đặc biệt nhắm vào các công ty muốn cung cấp Checkmk dưới dạng dịch vụ được quản lý.

So sánh tính năng cũng như giá thành các phiên bản của Checkmk. Xem thêm tại [link](https://checkmk.com/editions.html).


# 2. Tính năng nổi bật của Checkmk
### Giám sát toàn diện
- Máy chủ, thiết bị mạng, tường lửa, SAN…
- Các nền tảng ảo hóa : VMWare, HyperV, OpenStack, XEN.
- Ứng dụng : Web, Database, Mail…

### Giao diện trực quan
- Overview host và service, event và cảnh báo trên 1 dashboard.
- Cung cấp network topology tự động.

### Giám sát phân tán Multi-site
- Tạo site giám sát theo vùng địa lý
- Quản lý tập trung các site trên Web

### Mutitenancy
- Tạo nhiều tenant độc lập trên một hạ tầng
- Quản lý tenant theo multi-user

### GUI cấu hình giám sát client
- Giao diện web WATO : khai báo và cấu hình cho host giám sát
- Quản trị và điều khiển việc giám sát trên Web.

### Cảnh báo linh hoạt
- Gửi cảnh báo bằng nhiều hình thức : SMS, Email, Slack
- Cảnh báo phân cấp theo mức độ người dùng.

### Hỗ trợ
- Có được sự hỗ trợ của cộng đồng sử dụng
- Hơn 1800 plugins được hỗ trợ chính thức
- Được hỗ trợ qua email và cổng hỗ trợ nếu sử dụng bản Enterprise

### **Lưu ý:** So sánh tính năng cũng như giá thành các phiên bản của Checkmk. Xem thêm tại [link](https://checkmk.com/editions.html).

## So sánh với các giải pháp khác

<img src="https://i.imgur.com/aaJ7h6L.png">


# 3. Kiến trúc của Checkmk
OMD được xây dựng từ những đóng góp của cộng đồng về những khó khăn hay khuyết điểm mà Nagios gặp phải, từ đó đưa ra quyết định cần tích hợp thêm những sản phẩm gì để cải thiện.

Việc cài đặt trở nên vô cùng đơn giản. OMD được đóng gói hoàn chỉnh trong một package, việc cài đặt và cấu hình chỉ mất khoảng 10 phút với chỉ một câu lệnh

<img src="https://i.imgur.com/uzCKqqD.png">

- **Lõi giám sát**  
    - Nagios Core
    - Livecheck
    - Livestatus
- **Input** 
    - Máy chủ
    - Thiết bị mạng
    - Dịch vụ
- **Output** 
    - Web
    - Mobile
    - Dashboard

**Quá trình thực hiện:**
- Các lõi sẽ gọi xuống checkmk để thực hiện chức năng kiểm tra của nó
- Sau khi check thì livestatus sẽ hiển thị thông tin của mk lên website
- PNP4nagios: được sử dụng để xử lý dữ liệu để chuyển sang dạng biểu đồ
- Nagvis : được sử dụng để vẽ lại mô hình giám sát giúp người dùng có thể nhìn một cách dễ dàng hiểu hơn
- Dữ liệu sẽ được lưu vào trong RRD(Round Robin Database)

### Các phương thức Checkmk sử dụng

<img src="https://i.imgur.com/soRkzva.png">

# 4. Một số khái niệm trong Checkmk
## 4.1. Checkmk
Checkmk ra đời để giải quyết bài toán về hiệu năng mà Nagios gặp phải trong quá khứ. Cơ chế mới của Checkmk cho phép việc mở rộng hệ thống trở nên dễ dàng hơn, có thể giám sát nhiều hệ thống chỉ từ một máy chủ Nagios server.

<img src="https://i.imgur.com/DnJpwtZ.png">

Có 2 mô đun mà Checkmk sử dụng để cải thiện đáng kể hiệu năng là **Livestatus** và **Livecheck**.

## 4.2. Livestatus
- Livestatus là một giao diện được tích hợp vào lõi giám sát cho phép các chương trình bên ngoài khác truy vấn dữ liệu trạng thái và thực thi các lệnh.
- Livestatus có thể được cung cấp qua mạng để có thể truy cập bằng ví dụ Checkmk từ xa.
- Checkmk sử dụng Livestatus để kết hợp các trường hợp vào một tổng quan chung.
- Livestatus sẽ sử dụng socket để lấy dữ liệu để trả lời truy vấn dó đó tốc độ truy vấn của nó không còn phụ thuộc vào tốc độ I/O như là lưu dữ liệu trong file
- Khi truy xuất dữ liệu bằng command line thì livestatus sẽ phân biệt chữ hoa và chữ thường
- Livestatus sẽ sử dụng socket để check dữ liệu do đó công việc được phân đều cho các CPU

**Trước khi có Livestatus**
- Kết quả giám sát được sẽ lưu trong file status.dat gây nên hiện tượng nút thắt cổ chai cho CPU và Disk I/O
- Trạng thái của file status không phải là real-time mà update ít nhất là mỗi 10s
- NDOUtils sử dụng database để theo dõi kết quả (MySQL hoặc PostgreSQL), nhưng vẫn còn một số thiếu sót quan trọng.
- Việc cài đặt NDOUtils khá phức tạp
- NDOUtils cần một database cho việc lưu trữ dữ liệu. Hơn nữa, việc dữ liệu lưu trong database này tăng lên một cách nhanh chóng khiến cho bạn phải tiêu tốn nhiều CPU chỉ để cập nhập database.
- Một số dự án tương tự vẫn sử dụng NDOUtils: Centreon và Opsview
- Việc dọn dẹp database có thể khiến Nagios bị treo trong một khoảng thời gian nhất định


**Livestatus** có những thay đổi để cải thiện hiệu năng đó là:
- Livestatus cũng sử dụng Nagios Event Broker API như NDO, nhưng nó sẽ không chủ động ghi dữ liệu ra. Thay vào đó, nó sẽ mở ra một socket để dữ liệu có thể được lấy ra theo yêu cầu.
- Livestatus tiêu tốn ít CPU.
- Livestatus không làm cho Disk I/O thay đổi khi truy vấn trạng thái dữ liệu.
- Không cần cấu hình. Không cần cơ sở dữ liệu. Không cần quản lý.

## 4.3. Livecheck
Trước Nagios 4.0, ngay cả một hệ thống hoàn hảo hiếm khi quản lý để thực hiện hơn một vài nghìn lần kiểm tra mỗi phút.

Trong khi hệ thống càng lớn, tỷ lệ check tối đa sẽ trở nên rất tệ. Càng nhiều máy chủ và dịch vụ thì đồng nghĩa với việc khoảng thời gian check cần phải tăng lên. Tại sao lại như vậy?

**Các vấn đề tồn tại trong Nagios (trước Nagios 4.0)**
- Mỗi lần check tạo ra một bản fork. Quá trình fork rất tốn kém ngay cả khi kernel được tối ưu hóa
- Quá trình fork trong Nagios Core (trước phiên bản Nagios 4.0) không phân tán ra nhiều CPU mà thực hiện trên chỉ một CPU đơn. Điều này dẫn tới việc giới hạn số lần check mỗi giây, trong khi phần lớn các CPU khác rảnh rỗi.

**Làm thế nào để Livecheck giải quyết được vấn đề nút thắt cổ chai**
- Livecheck sử dụng các helper process, các core giao tiếp với helper thông qua Unix socket (điều này không xảy ra trên file system)
- Chỉ có một một helper program được fork thay vì toàn bộ Nagios Core.
- Các tiến trình fork được phân tán trên tất cả các CPU thay vì chỉ một như trước
- Process VM size tổng chỉ khoảng 100KB
- Việc thực hiện check_icmp sẽ cho một con số cải tiến cụ thể. Giả sử nếu sử dụng CPU dual core 2800 MHz CPU:
    - Trước đây sẽ là 300 ICMP check/second
    - Sau khi cải tiến là 2600 ICMP check/second

## 4.4. Site
- Để có thể thực hiện việc giám sát thì cần tạo ra một site để có thể sử dụng
- Một server có thể tạo ra được nhiều site
- Để đăng nhập được vào site thì cần có user để đăng nhập và user được phân thành 3 loại user: Administrator; Guest; Normal monitoring
- Có 2 user mặc định có quyền Administrator là omdadmin và cmkadmin
- Site là cách gọi của sản phẩm được tạo ra từ Multisite

## 4.5. Multisite – Giao diện web
- Multisite là một giao diện web được checkmk áp dụng để thay thế cho nagios web.
- Nó được sử dụng để xem thông tin và kiểm soát hệ thống giám sát.
- Kết hợp WATO để có thể hỗ trợ việc cấu hình bằng website
- WATO là tập hợp nhiều modules được sử dụng để cấu hình cho checkmk server
- Mỗi khi có thay đổi cần chọn cập nhật thay đổi
- Có sẵn các agent giám sát được lưu trữ và hiển thị sẵn trên web
- Nó có phiên bản tối ưu hóa cho điện thoại

## 4.6. WATO (Web Administration Tool)
- WATO là công cụ cấu hình Checkmk thông qua GUI
- WATO duy trì tất cả các cấu hình ở định dạng dữ liệu văn bản thông thường mà người dùng có kinh nghiệm có thể chỉnh sửa thủ công hoặc thậm chí tạo bằng các tập lệnh

    <img src="https://i.imgur.com/S0KXFM2.png">

## 4.7. EVENT CONSOLE
- Ngoài việc giám sát theo khoảng thời gian check bình thường còn có một loại giám sát theo sự kiện
- Event console là hệ thống tích hợp theo dõi sự kiên từ các nguồn như syslog; SNMP traps; Windows event logs …
- Những sự kiện xảy ra không được xử lý bằng lõi của checkmk mà được xử lý bằng một dịch vụ riêng biệt

## 4.8. Round Robin Database(RRD)

<img src="https://i.imgur.com/sFh45WF.png">

- Đây là dạng DB mặc định mà checkmk dùng để lưu trữ thông tin
- Thông tin của DB được lưu trữ dưới dạng bảng và cột để lưu trữ dữ liệu
- Có thể hợp nhất được dữ liệu của một khoảng thời gian lại vào làm một
- Có thể truy vấn được dữ liệu trong RRD bằng live status language
- Lưu ý ngôn ngữ truy vấn này phân biệt chữ hoa và chữ thường
- Có thể sử dụng các headers để lọc thông tin hiển thị từ các truy vấn được sử dụng
- Khi muốn truy vấn thống kê thì có các giá trị và các toán tử được định nghĩa sẵn để sử dụng
- Khi dữ liệu được lưu đầy thì nó sẽ ghi đè lên dữ liệu cũ

## 4.9. BI (Business Intelligence)
**Link** : https://checkmk.com/cms_bi.html

- Nó là tất cả những gì về việc tạo ra trạng thái tổng thể của các ứng dụng kinh doanh quan trọng (business-critical applications) từ nhiều giá trị trạng thái đơn lẻ và trình bày chúng rõ ràng.

- Checkmk BI cho phép bạn rút ra một bản tóm tắt về sức khỏe tổng thể của một ứng dụng từ trạng thái hiện tại của các máy chủ và dịch vụ riêng lẻ

- Ngoài ra, còn có khả năng sử dụng biểu diễn cây trong BI cho chế độ xem chi tiết về trạng thái của máy chủ và tất cả các dịch vụ của nó.

## 4.10. Host
- Trong Checkmk một host thường là máy chủ, VM, thiết bị mạng, thiết bị hoặc bất cứ thứ gì khác có địa chỉ IP đang được Checkmk theo dõi

- Mỗi máy chủ luôn có một trong các trạng thái UP, DOWN hoặc UNREACH. 

- Ngoài ra còn có các máy chủ không có địa chỉ IP, chẳng hạn như các container Docker.

## 4.11. Service
- Trên mỗi máy chủ có một số service được theo dõi. 
- Một dịch vụ có thể là bất cứ thứ gì - ví dụ: hệ thống tệp, quy trình, cảm biến phần cứng, tổng đài - nhưng nó cũng có thể là một số liệu cụ thể như mức sử dụng CPU hoặc mức sử dụng RAM
- Mỗi dịch vụ có một trong các trạng thái OK, WARN, CRIT hoặc UNKNOWN.

## 4.12. Agent
- Là một chương trình được cài đặt trên máy chủ cần theo dõi
- Các nhà sản xuất thiết bị mạng và nhiều thiết bị thường bao gồm một tác nhân được cài đặt sẵn mà Checkmk có thể dễ dàng truy vấn bằng giao thức SNMP được tiêu chuẩn hóa
- Các dịch vụ đám mây như AWS hoặc Azure cũng có các tính năng tương tự như các đại lý, nhưng chúng được gọi là ‘APIs và được Checkmk truy vấn thông qua HTTP.
- Máy chủ chạy Windows, Linux hoặc Unix chỉ có thể được giám sát bởi Checkmk nếu bạn cài đặt một trong các tác nhân CMK 