# Git và Github

## I. Git và Github là gì?

### 1. `Git` là gì?
- `Git` là tên gọi của một Hệ thống quản lý phiên bản phân tán (Distributed Version Control System – DVCS) là một trong những hệ thống quản lý phiên bản phân tán phổ biến nhất hiện nay. `DVCS` nghĩa là hệ thống giúp mỗi máy tính có thể lưu trữ nhiều phiên bản khác nhau của một mã nguồn được nhân bản (`clone`) từ một kho chứa mã nguồn (`repository`), mỗi thay đổi vào mã nguồn trên máy tính sẽ có thể ủy thác (`commit`) rồi đưa lên máy chủ nơi đặt kho chứa chính. Và một máy tính khác (nếu họ có quyền truy cập) cũng có thể `clone` lại mã nguồn từ kho chứa hoặc `clone` lại một tập hợp các thay đổi mới nhất trên máy tính kia. Trong `Git`, thư mục làm việc trên máy tính gọi là `Working Tree`.
 
- Tài liệu tham khảo tại [đây](https://git-scm.com/docs/git-credential-store)


### 2. `Github` là gì?
- Mình biết là có rất nhiều bạn khi nghe nói đến `Git` sẽ nghĩ ngay đến [Github](https://github.com/)  và có thể sẽ có một số hiểu lầm với họ. Cũng xin nhắc lại rằng, `Git` là tên gọi của một mô hình hệ thống. Như mình đã giải thích ở trên, **các máy tính có thể clone lại mã nguồn từ một repository** và **Github chính là một dịch vụ máy chủ repository** công cộng, mỗi người có thể tạo tài khoản trên đó để tạo ra các kho chứa của riêng mình để có thể làm việc.
- Tài liệu tham khảo tại [đây](https://www.hostinger.vn/huong-dan/github-la-gi/)


### 3. So sánh `Git` và `Github`

- `Git` là một mô hình hệ thống quản lí phiên bản phân tán
- `Github` là một dịch vụ máy chủ mã nguồn công cộng

![](/images/github.png)
 
## II.Các khái niệm và thuật ngữ cơ bản trong Git
- **Repository (repo)**: Nghĩa gốc là kho lưu trữ. Hiểu đơn giản, repo là các dự án bạn tạo ra, chứa mã nguồn phần mềm của bạn. Có 2 dạng: **Remote repo** (là repo chung được lưu trên server), và **Local repo** (là repo lưu trên máy của người dùng). Ta có thể làm việc và commit trên local reposity ngay cả trong điều kiện offline, khi có mạng chỉ việc đồng bộ lên remote repo để chia sẻ cho người dùng khác.
   - Public
   - Private
- **Fork**: (khái niệm này trên GitHub) là hành động một người dùng khác copy một bản sao của repo về kho của họ. Trước khi tham gia vào một dự án của người khác thì bạn sẽ fork repo của họ và kho của mình nếu như người khác chưa cho phép bạn trở thành thành viên.
- **Clone**: là hành động tạo bản sao của remote repo từ máy chủ về máy mình để có thể lập trình và phát triển. Local repo được clone về cũng có lịch sử thay đổi giống hệt như remote repo. Vì vậy bạn có thể commit lên local repo này.
- **Commit**: là hành động xác nhận sự thay đổi của repo, lưu lại một trạng thái của repo. Khi thực hiện commit, trong repo sẽ tạo ra commit (hoặc revision) ghi lại sự khác biệt của tất cả các file trong repo từ trạng thái đã commit lần trước đó đến trạng thái hiện tại. Bằng việc xem các commit bạn có thể biết được file đã được sửa đổi như thế nào. Khi code một tính năng phải được hoàn thiện cơ bản và chạy được thì mới nên commit.
- **Pull request hay Merge request**: Khi người dùng khác tham gia phát triển phần mềm và đã phát triển xong một tính năng, họ muốn merge tính năng của họ vào phần mềm của bạn thì lúc này họ sẽ gửi một Pull request/Merge request để bạn chọn chấp nhận hay không.
- **Branch**: là các nhánh phát triển của repo. Ví dụ: bạn muốn thêm một tính năng mới cho phần mềm, bạn có thể tạo một branch khác để phát triển tiếp. Nếu sau này có muốn hủy bỏ tính năng đó thì cũng sẽ được thực hiện một cách dễ dàng mà không ảnh hưởng đến branch chính. Mỗi repo sẽ có một branch chính là master, các thành viên trong nhóm sẽ tạo các branch khác nhau để làm việc. Có nhiều cách chia branch khác nhau tùy mục đích và bạn cần phải học cách chia branch. Mỗi branch giống như một ngữ cảnh khác nhau, branch có thể được chia tách cũng như sát nhập dễ dàng.
- **Issue** là một hành vi không mong muốn hoặc trục trặc trong chức năng hoặc thiết kế của sản phẩm, cũng có thể là một lỗ hổng trong thiết kế hoặc bố cục của trang và nó cũng có thể là một lỗi trong nội dung của nó.
                               
## III. Thao tác trên Github destop

   **Bước 1. Khởi tạo repo**

**Đăng kí tài khoản Github tại [đây](https://github.com/)**

- Điền username, mail, password 

![](/images/dki.png) 

- Chọn verify 

![](/images/dki2.png)

- Xếp cho con vật đứng thẳng 

![](/images/dki3.png)

- Chọn create để đăng kí tài khoản

![](/images/dki4.png)

- Chọn continue để tiếp tục sử dụng Github miễn phí

![](/images/dki5.png)

- Điền vào ô trống rồi submit

![](/images/dk6.png)

- Tài khoản đã được tạo 

![](/images/kq.png)


**Bước 2: Fork repo**

Chọn Fork để lấy dữ liệu về

![](/images/fork.png)


**Bước 3: Clone repo**

- Chọn clone or download

![](/images/clone.png)

- Chọn open in destop 

![](/images/open.png)


**Bước 4: Commit repo**

Chọn commit để thay đổi

![](/images/commit.png)


**Bước 5: Push repo**

Chọn push để cập nhật dữ liệu trên mã nguồn


![](/images/push.png)


**Bước 6: Pull repo** 

Gửi xác nhận để đồng bộ dữ liệu 
 
- Chọn new pull request

![](/images/pull1.png)

- Chọn create pull request

![](/images/pull2.png)

Điền title và comment 

![](/images/pull3.png)

- Chọn create pull request để hoàn thành

![](/images/pull4.png)


**Bước 7: Merge repo**

Phản hồi chấp nhận hay không 


![](/images/end.png)





