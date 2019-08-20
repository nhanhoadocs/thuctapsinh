# Git và Github

1. Git :
Git là công cụ quản lý phiên bản do Linus Torvalds tạo ra năm 2005 , chạy trên nhiều hệ điều hành .Là tên gọi một hệ thống quản lý phiên bản phân tán ( DVCS - Distributed Version Control System) .Là hệ thống giúp mỗi máy tính có thể lưu trữ nhiều phiên bản khác nhau của một mã nguồn được nhân bản **(Clone)** từ một khó chứa mã nguồn **( repository)**, mỗi thay đổi được ủy thác **(commit)** rồi đưa lên máy chủ .  
Cơ chế lưu trữ phiên bản của Git là nó sẽ tạo ra một “ảnh chụp” **(snapshot)** trên mỗi tập tin và thư mục sau khi commit, từ đó nó có thể cho phép bạn tái sử dụng lại một ảnh chụp nào đó mà bạn có thể hiểu đó là một phiên bản. Đây cũng chính là lợi thế của Git so với các DVCS khác khi nó không “lưu cứng” dữ liệu mà sẽ lưu với dạng snapshot.

2. GitHub :

Nếu Git là phần mềm quản lý phiên bản trên một máy tính cục bộ thì Github là một server quản lý phiên bản của các repository .  


 # Thao tác với Git và Github
 1. Repository :  
 Trạng thái hoạt động của Repository : 
 <img src="https://i.imgur.com/XNVPD6X.png">  
 

    Working dir: đây là nơi bạn thực hiện các thao tác chỉnh sửa với file mã nguồn của mình, nó có thể là eclipse, netbean, notepad++,...

    Stagging area: những sự thay đổi của bạn với file mã nguồn được lưu lại, giống như bạn ấn Save trong một file notepad.

    Git directory: nơi lưu trữ mã nguồn của bạn (ở đây là github)
2. Thao tác trên windows : 
* Clone : 
    Ấn File -> Clone Repository ->Chọn Path muốn lưu   
    (có thể nhấn tổ hợp phím Crt+Shift+O)     
    <img src="https://i.imgur.com/Q59dEtv.png">  

 * Push và Commit :  
 Khi đã có Repository hoặc Clone , nếu muốn thêm các file , project ta lưu vào thư mục chứa repo hoặc clone đó . Sau khi chỉnh sửa xong ta cần commit lại để xác thực 
   <img src= https://i.imgur.com/gwdg0XZ.png>
Sau khi commit đã xác thực các thay đổi ta có thể push lên repository trên github bằng cách nhấn vào Push origin
<img src = "https://i.imgur.com/rffT5Di.png">

 * Pull :
Khi clone được repo muốn lấy dữ liệu trong repo đấy về máy , ta nhấn Repository -> Pull  
(Tổ hợp phím Crt+ Shift + P)

* Pull request : 
Khi có nhiều branch , khi cần so sánh , nhập các nhánh lại với nhau thành chương trình hoàn chỉnh ta tạo các pull request  
<img src ="https://i.imgur.com/jq7mXPS.png">
Sau khi pull request thành công có thể merge vào nhánh chính 
<img src = "https://i.imgur.com/raSOGzr.png">

 