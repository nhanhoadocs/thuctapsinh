# Chương 1
## 1.1 Mạng truyền thông và công nghệ mạng
## 1.1.1 Giới Thiệu Chung
Truyền thông mạng máy tính ( computer communications ) là quá trình truyền dữ liệu từ thiết bị này sang thiết bị khác, trước đây chúng ta thường hiểu thiết bị là máy tính, nhưng ngày nay thiết bị ( end-system, decive ) không chỉ đơn thuần là máy tính mà bao gồm nhiều chủng loại thiết bị khác, ví dụ điện thoại, máy tính PAM
- Networking: chỉ khái niệm kết nối các thiết bị lại với nhau nhằm mục đích chia sẻ thông tin.
  - networking liên quan đến nhiều vấn đề, gồm:
  - giao thức truyền thông ( protocol ): mô tả những nguyên tắc mà tất cả các thành phần mạng cần tuân thủ để
có thể trao đổi với nhau được
  - Topo ( mô hình ghép nối mạng/hình trạng mạng ): mô tả cách thức nối các thiết bị với nhau.
  - Địa Chỉ: mô tả các thức định vị 1 đối tượng trên mạng.
  - định tuyến ( routing ): mô tả cách thức dữ liệu truyền từ thiết bị này sang thiết bị khác trên mạng.
  - Tính tin cậy ( reliability ): giải quyết tính toàn vẹn của dữ liệu, đảm bảo dữ liệu nhận được chính
xác như dữ liệu gửi đi.
  - khả năng liên tác ( interoperability): chỉ mức đọ các sản phẩm phần mềm và phần cứng của các hãng sản
xuất khác nhau có thể làm việc được với nhau.
  - an ninh (security): đảm bảo an toàn hoặc bảo vệ tất cả các thành phần của mạng.
  - Chuẩn (Standard): Thiết lập các quy tắc và luật lệ cụ thể cần phải tuân theo
- Trên thực tế, khái niệm mạng xuất hiện ở nhiều kiểu ứng dụng khác nhau. ví dụ, trong công nghiệp giải trí, các công ty truyền thanh, truyền hình và công ty cáp đều có những mạng độc lập của riêng mình với nhiều trạm phát, thông qua những mạng này, các chương trình tin tức, thể thao, điện ảnh, phim truyện...được dùng chung giữa các trạm phát. Mạng truyền thông ra đời sớm nhất và phổ biến nhất là mạng điện thoại. Khi nói đến mạng điện thoại, người ta muôn nhắc đên hệ thống mạng điện thoại kiểu cũ ( plain old telephone system - POTS ) hoặc mạng điện thoại chuyển mạch công cộng ( public switched telephone network - PSTN ). Mạng PSTN mô tả hệ thống điện thoại truyền thống đựa trên tín hiệu tương tự đươc sử dụng để truyền tiếng nói. Một mạng truyền thông khá quen thuộc ngày nay là mạng máy tính Internet - là tập hợp các mạng, hay mạng mạng.

## 1.1.2 Mạng Máy Tính
- Mạng bao gồm nhiều thành phần, các thành phần được nối với nhau theo một cách thức nào đó và sử dụng chung ngôn ngữ:
- Các thiết bị đầu cuối (end system) kết nối với nhau tạo thành mạng có thể là các máy tính (computer) hoặc các thiết bị khác. Ngày càng có nhiều loại thiết bị có khả năng kết nối vào mạng máy tính như điện thoại đi động,( PDA- Thiết bị hỗ trợ kỹ thuật số), Tivi,...
- Môi trường truyền (media) thực hiện việc truyền dẫn các tín hiệu vật lý. Môi trường truyền có thể là các loại dây dẫn ( cáp), sóng (đối với các mạng không dây)
- Giao thức (protolcol) là quy tắc quy định cách thức trao đổi dữ liệu giữa các thực thể.
- Nói chung, ba khái niệm trên đưa đến một định nghĩa chuẩn về mạng máy tính như sau:
 Mạng máy tính (Networking computer) là tập hớp các máy tính và các thiệt bị phụ trợ khác sử dụng chung 1 nhóm
giao thức để chia sẻ tài nguyên thông qua các phương tiện truyền thông mạng.
### Các thành phần mạng: thiết bị, nút, máy tính
   - thiết bị ( device ): thuật ngữ divice chỉ bất cứ một thực thể phần cứng nào, chẳng hạn các thiết bị đầu cuối,
,máy in, máy tinh, hoặc 1 thiết bị phần cứng đặc biệt liên quan đến mạng, ví dụ máy chủ ( server ),
repeater (bộ lặp), bridge (cầu), switch, router (bộ định tuyến), và rất nhiều các thiết bị khác. 
 - có nhiều phương pháp gán cho thiết bị mạng một định danh duy nhất, thường thiết bị được chính hãng sản xuất
gắn một số bộ nhận dạng duy nhất. việc này tương tụ như việc in số seri trên tivi hoặc các đồ dùng điện tử
 	- Ví dụ: card Ethernet được hãng sản xuất gán cho một địa chỉ duy nhât - địa chỉ này không trùng với bất
		kỳ card Ethernet nào khác.
- Khi mô tả các thành phần mạng, cần phân biệt giữa khái niệm thiết bị (device) và máy tính (computer). Nếu xét ở khía cạnh thiết bị máy tính thường được gọi là host ( hoặc server ) hay trạm làm việc (workstation) (cũng còn được gọi là desktop hay
 client ). Thuật ngữ này thường dùng để chỉ những hệ thống máy tính có cài đặt hệ điều hành riêng của minh (ví dụ windows, Unix). Vì vậy workstation có thể là máy tính cá nhân như máy apple Macintosh, hoặc bất cứ máy tính họ Intel nào
( thường được gọi là IBM-PC); cũng có thể là 1 workstation đồ họa ( ví dụ các workstation đồ họa được sản
xuất bởi Sun Microsystem, Silicon Graphics, IBM, Hewlett - parkard, compaq Computer Corpration), một
supperminicomputer như Compaq's Vax hay một hệ thống IBM AS/400, một super-microcomputer như Compaq's Alpha;
hoặc có thể là một máy tính lớn (mainframe) như IBM ES-9000.
### phương tiện và các giao thức truyền thông mạng
  - để share và sử dụng network sercive, các thành phần của mạng phải có khả năng truyền thông được với nhau. Để đáp ứng được yêu cầu này ta phải xét tới 2 tiêu chí cụ thể của mạng:
	1. khả năng liên kết: chỉ đường truyền hoặc kết nối vật lý giữ các thành phần.
	2. Ngôn ngữ: chỉ một bảng từ vựng cùng các quy tắc truyền thông mà các thành phần phải tuân thủ.
### Môi trường truyền thông ( medium, media )
- Môi trường truyền thông sử dụng 2 loại cable
    + cap (cable), có thể là cáp xoắn đôi (twisted-pair), cáp đồng trục (coaxial), và cáp sợi quan (fiber-optic cable)...
    + không dây ( wireless ), có thể là sóng radio (gồm sóng cực ngắn hay chỉ truyền thông qua vệ tinh), bức xạ hồng ngoại
    + Bạn có thể tham khảo để tìm hiểu kỹ hơn về 2 môi trường truyền thông này ở các link dưới đây:
	[link 1](https://quantrimang.com/phan-biet-cap-utp-s-utp-ftp-stp-va-cap-sftp-143224)
	[link 2](https://vienthongxanh.vn/cac-loai-day-cap-mang-internet-pho-bien-nhat-hien-nay/)
- Giao thức (protocol). Ngôn ngữ được sử dụng bởi các thực thể mạng gọi là giao thức truyền thông mạng. Các bên "hiểu nhau" do giao thức định nghĩa 1 ngôn ngữ chung giữa các thành phần mạng. Từ ý nghĩa khái quát này có thể hiểu giao thức truyền thông mạng là các thủ tục, quy tắc hoặc các đặc tả chính thức đã được chấp nhận nhằm xác định hình vi và ngôn ngữ trao đổi giữa các bên. Nói chung trong cuộc sống hàng ngày, chúng ta cũng áp dụng những quy tắc nào đó.
- Không có môi trường truyền thì không thể trao đổi giữa các thực thể mạng; không có ngôn ngữ chung, không thể hiểu được nhau. Vì vậy, đường truyền cần cung cấp môi trường để thực truyền thông, trong khi đó ngôn ngữ chung đảm bảo 2 bên truyền thông có thể hiểu được nhau.
  - Không có môi trường truyền thì không thể trao đổi thông tin giữa các thực thể mạng; không có ngôn ngữ chung thì không
	thể hiểu được nhau.
- VD: TCP/IP là 1 giao thức quen thuộc ( Transmission control protocol / internet protocol ) là 1 trong những bộ giao thức
	của của bộ giao thức TCP/IP. TCP/IP là xương sống của Internet. Tên gọi TCP/IP chỉ gồm hai giao thức cụ thể là TCP và IP
	nhưng thường được use để chỉ nhóm gồm nhiều giao thức ngoài khác TCP và IP. Tập hợp các giao thức lại được gọi là bộ
	giao thức TCP/IP. 
  - có thể kể đến 1 số trong bộ TCP/IP như: FTP ( file transfer protocol ) - định nghĩa cách chuyển file.
  - ( HTTP - Hypertext Transfer protocol ) được dùng cho world wide web ( WWW ), định nghĩa cách các server cần phải
truyền các tài liệu ( trang web ) tới các client ( web browser ) như thế nào. 
  - Ngoài ra cũng phải kể đến bộ ba giao thức được sử dụng cho thư điện từ ( email ) là (POP-Post Office Protocol),
(SMTP - Simple Mail Transfer Protocol) và (IMAP-Internet Mail Access Protocol).
  - Một số bộ giao thức khác có thể kể đến là AppleTalk - Bộ giao thức mạng của công ty Apple Computer. ( bạn có thể tìm hiểu thêm )
### Lời kết
- Qua những khái niệm mình đã vừa nói ở trên sẽ giúp bạn hiểu được một phần về mạng máy tính các cách thức hoạt động của chúng. Ở phần sau mình sẽ giới thiệu sâu hơn về mạng máy tính. Xin cảm ơn. 
	   
	   
		
  

