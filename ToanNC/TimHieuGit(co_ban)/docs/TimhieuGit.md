# Tìm Hiểu về Git và GitHub
## Mục Lục
**1.Git là gì**

**2.GitHub là gì**

**3.So sánh Git và GitHub**

**4.Tìm hiểu về các thuật ngữ trong Git, GitHub**

**5.Github-Desktop**

**6.Ngôn Ngữ Markdown**


### 1.Git là gì và các thao tác trên Git
- **Khái Niệm**: Git là một phần mềm dùng để quản lý phiên bản của mã nguồn tương tự như SVN nhưng có nhiều ưu điểm hơn, Git đang được sủ dụng rộng rãi hiện nay. 

-  *[tài liệu tham khảo Git](https://csc.edu.vn/lap-trinh-va-csdl/tin-tuc/kien-thuc-lap-trinh/Git-la-gi--Nhung-khai-niem-co-ban-khi-lam-viec-tren-Git-4133)*

### 2.GitHub là gì 
- **Khái Niệm**: GitHub là một dịch vụ lưu trữ trên WED dành cho các dự án có thể sử dụng hệ thống kiểm soát Git Revision.GitHub cung cấp chức năng socical networking như feeds, fllowers và network graph để các lập trình viên học hỏi kinh nghiệm thông qua lịch sử *commit*
- *[tài liệu tham khảo GitHub](https://www.hostinger.vn/huong-dan/github-la-gi/)*

### 3.So sánh giữa Git và GitHub
- **Git** là một mô hình về hệ thống lưu trữ và quản lý mã nguồn phân tán, phân tán ở đây tức là mã nguồn được lưu trữ trên nhiều máy khác nhau, có thể là client, cũng có thể là server với nhiều phiên bản,nó được sinh ra để giải quyết bài toán về quản lí mã nguồn của các developer
  - *Ví Dụ*:mọi người hình dung là 1 ứng dụng nếu code 1 mình thì ko sao, mình có thể dễ dàng control các phiên bản có thể bằng cách là mỗi phiên bản mình sao lưu ra 1 folder và đặt tên khác nhau,nhưng đối với những ứng dụng lớn, đòi hỏi nhiều người cùng code thì sao nếu họ ko có 1 quy chuẩn chung thì sẽ dễ dẫn tới việc dẫm chân lên nhau 
- ![ảnh minh hoạ](https://imgur.com/iCyswXw.png)
- *Github* là một trang web, cho phép bạn lưu source code của mình lên đó,như vậy thì *Github* có thể coi là nơi để ta tạo remote repository và nó cung cấp miễn phí cho người dùng
- ![ảnh minh hoạ](https://imgur.com/62Qs6LC.png)
- Git và GitHub sẽ giúp cho các lập trình viên có thể thuận tiện trong việc chỉnh sửa code tại mọi nơi mọi lúc mà ko sợ bị ghi đè code hay là mât dữ liệu do hỏng hóc do dữ liệu đều đc ghi ở trên wed và máy tính cá nhân , đồng thời bạn cũng có thể khôi phục lại code tại một thời điểm nào đó
- ![ảnh quá mô tả quá trình](https://imgur.com/aHIsQSd.png)
- mọi người cũng có thể vào link dưới đây để tìm hiểu thêm về sự khác nhau giữa Git và Github
  - [Link tham khảo 1](https://thachpham.com/tools/git-git-va-github-la-gi-tai-sao-nen-dung.html)
### 4.Một vài thuật ngữ của Git và GitHub
- `Repository`(repo):hay repo là một thư viện nơi chứa các files của dự án. Nó có thể đặt trong bộ lưu trữ của GitHub hoặc trong repository của máy tính local. Bạn có thể chứa files code, hình ảnh, âm thanh hoặc mọi thứ liên quan đến dự án trong một repository.
- `Pull Request`:Pull request có nghĩa là bạn thông báo với những người khác rằng bạn đã đẩy những thay đổi của Branch lên Repository tổng (master respository). Các cộng tác viên của repository này sẽ có thể chấp nhật hoặc từ chối pull request này. Khi nó được mở ra, bạn có thể thảo luận và xem lại công việc với những người cùng làm khác.
  - Các bước để tạo đc một *Pull Request*
     - 1.Chuyển tới repository và tìm menu branch
     - 2.Trong branch menu, chọn branch chứa thay đổi của bạn
     - 3.Nhấn vào nút **New pull request** bên cạnh menu branch
     - 4.Thêm tiêu đề và mô tả vào **pull request** của bạn
     - 5.Nhấn nút **Create pull request**
- `Fork một Repository`:Fork một repository (forking a repository) có nghĩa là bạn tạo một dự án mới dựa trên dự án cũ. Tức là, sao chép hoàn toàn một repository đã tồn tạo, tạo ra các thay đổi cần thiết, và lưu phiên bản mới này dưới dạng một repository độc lập hoàn toàn mới và gọi nó là dự án của riêng bạn.
  - Các bước thực hiện Fork
    - 1.Tìm repository bạn muốn fork
    - 2.Nhấn vào nút **Fork**
- [link tham khảo thêm cho mọi người](https://blog.duyet.net/2015/04/git-va-cac-khai-niem-co-ban.html)
### 5.GitHub Desktop
- **Người mới làm quen với *Git* thì**: có thể tham khảo trong link tài liệu sau về cách sử dụng GitHub Desktop , sau khi thực hiện được với GitHub Desktop và các thao tác cơ bản như là Pull,Fork,Push,Clone v.v
- [link hướng dẫn sử dụng Git vs GitHub Desktop](https://o7planning.org/vi/10283/huong-dan-su-dung-github-voi-github-desktop)
### 6.Ngôn Ngữ *Markdown*
- Khi các bạn viết bằng *Markdown* trong Github vì nó sẽ mang lại sự tường minh cho bài viết của bạn.
- Việc viết được ngôn ngữ *Markdown* cần có những lưu ý sau
  - 1. Để viết được các **Header** chúng ta dùng dấu `#(kèm theo tên header)`
  - 2. Để viết được chữ in đậm ta dùng `**chỗ cần in đậm**` còn với viết chữ in nghiêng chúng ta sẽ dùng `*phần in nghiêng*`
  - 3. Để viết được Link chúng ta dùng `[mô tả link](link dẫn)`
  - 4. Để chèn được ảnh chúng ta dung`![mô tả ảnh](link ảnh)
  - 5. Một vài hình ảnh minh hoạ về các các viết trên **Markdown**
  - ![ảnh minh hoạ](https://imgur.com/mZP1T5V.png)
  - ![ảnh minh hoạ](https://imgur.com/bUQm3a5.png)
  - 6. Các bạn cũng có thể tập viết **Markdown** trên link sau
    - [Link viết Markdown](https://markdownlivepreview.com/)
