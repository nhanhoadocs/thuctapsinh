
## 1. Tạo REPOSITORY 

`$ git init ( git_example )`

- Ở đoạn trên, nó hiển thị dòng thông báo mình đã khởi tạo một kho Git trống tại đường dẫn như trên. 
Lưu ý rằng thư mục ẩn .git/ là nơi nó sẽ chứa các thiết lập về Git cũng như lưu lại toàn bộ thông tin về kho chứa, bạn không cần đụng chạm gì vào thư mục .git/ này.

-  Nếu kho chứa của bạn đã có sẵn mã nguồn thì bạn cần phải đưa các tập tin về trạng thái Tracked 
nhằm có thể làm việc được với Git. Để làm việc này, bạn sẽ cần sử dụng lệnh `git add tên_file`, có thể 
sử dụng dấu `*` để gom toàn bộ. Sau đó có thể sử dụng lệnh git status để xem danh sách các tập tin đã được tracked.

`$ git add README.txt`
`$ git status ( để xem trạng thái )`

- sau khi tập tin đã được đưa vào trạng thái tracked và nếu một tập tin đã tracked thì nó phải được đưa vào lại `Staging Area `

`$ git commit -m "miêu tả"`

- Bây giờ thì bạn đã hoàn thành việc commit lần đầu tiên các tập tin mà bạn đã đưa vào kho.

- Tiếp theo sẽ đẩy từ Staging area lên local repository.

`$ git push origin master ( origin -  là tên remote || master - là tên (branch - nhánh )`

- như vậy là đã đẩy thành công lên github của bạn, và mọi người có thể xem được.

   // nếu như mình hoặc người khác chỉnh sửa trên github.com. thì bạn dùng lệnh:
   
`$ git pull ( để đồng bộ về máy )`

	
## 2. GIT LOG

-  Để xem lịch sử của các lần commit ( thay đổi ) ban sử dụng lệnh

`$ git log`

- Để xem chi tiết hơn bạn thêm -p

`$ git log -p`

    // nếu log quá dài có thể ấn phím mũi tên để di chuyển hoặc ấn Ctrl + Z để out 
- Để xem log gần nhất bạn thêm tham số -1.

`$ git log -1`

    - bạn còn có thể xem sử dụng thêm 1 số tùy chọn để xem log tối ưu hơn.

           `$ git log --since,  --after : xem các lần commit kể từ ngày nhất định.`

           `$ git log --until : xem các lần commit trước từ ngày nhất định.`

           `$ git log --author : xem các lần commit của người nào đó.`

           `$ git log --grep : lọc ra các chuỗi trong log và in ra.`

- Lọc log với -- pretty

- Tham số -- pretty rất có ích nếu bạn muốn lọc xem một đối tượng nào đó trong lịch sử commit, ví dụ như chỉ xem lời nhắn commit hoặc chỉ xem email của người commit.
- cách sử dụng tham số --pertty là bạn phải viết kèm tag của nó như sau:

`$ git log --pretty = "%tag"`

- Các %tag phải được đặt trong cặp dấu ngoặc kẹp và có thể use nhiều %tag khác nhau.

            + Danh sách các %tag
                %H - Commit hash
                %h - Abbreviated commit hash
                %T - Tree hash
                %t - Abbreviated tree hash
                %P - Parent hashes
                %p -  Abbreviated parent hashes
                %an - Author name
                %ae - Author e-mail   
                %ad - Author date (format respects the –date=option)
                %ar - Author date, relative
                %cn - Committer name
                %ce - Committer email
                %cd - Committer date
                %cr - Committer date, relative
                %s - Subject

## 3. undo Commit

- Nếu cần xóa bỏ lần commit trước và cần (undo-hủy) để commit lại thì có thể sử dụng tham số ``--amend`` trong lệnh git commit

`$ git commit --amend -m "hehe"`

- Nếu bạn đã đưa một tập tin nào đó vào Staging Area nhưng bây giờ muốn loại bỏ ra khỏi đây để không phải bị commit theo thì có thể sử dụng lênh:

`$ git reset HEAD ten_file`


## 4. Đánh dấu commit với Tag
- Nếu bạn commit quá nhiều thì sẽ gây khó khăn cho bạn về sau nếu cần xem lại thông tin của lần commit trước mà bạn có thể gắn thẻ đánh dấu (tag) cho mỗi commit và khi cần xem ta chỉ cần sử dụng lệnh `git show tên_tag` là đã có thông tin rất rõ ràng, ngoài ra nó còn giúp bạn dễ dàng diff (đối chiếu) sau này khi không cần nhớ checksum (dù chỉ cần nhớ vài ký tự đầu tiên) của mỗi commit mà chỉ cần nhớ tag, cũng như có thể tạo thêm branch từ tag để bạn thuận tiện hơn trong việc phân nhánh.
Lightweigh Tag và Annotated Tag

- Trong Git có 2 kiểu tag chính đó là:

  - Lightweigh tag: các tag này chỉ đơn thuần là dánh dấu snapshot của commit.

       - Annotated tag: với tag này, bạn có thể đặt tiêu đề cho tag, và khi xem nó sẽ có thông tin về người tag, ngày tag,...

  - Cách tạo Lightweight Tag

       - Đầu tiên ta gõ git tag để xem danh sách các tag có trong dự án.

`$ git tag`

       -  để tạo 1 git tag ta dùng lệnh

`$ git tag (tên_tag - a1)`

   - bây h có thể xem thông tin của lần commit được gắn tag này bằng lệnh git show tên_tag.

   - Lưu ý lệnh trên nó sẽ đánh dấu lần commit cuối cùng của bạn vào tag a1
`$ git show a1`

   - Cách tạo Annotated Tag.

   - Để tạo Annotated Tag thì ta cũng sử dụng lệnh git tag nhưng sẽ có thêm tham số -a và tham số -m để thiết lập lời nhắn cho tag này.

`$ git tag -a ten_file-an -m "ra mat phiên ban 1.0"`

`$ git show a1-an`

  - cái Annotated tag sẽ có nhiều thông tin hơn so với tag thông thường, nên sử dụng kiểu này.

- Thêm tag cho các commit cũ.

- Ở trên thì bạn chỉ tạo tag cho commit cuối cùng của bạn. còn nếu bạn có rất nhiều mà cần gắn tag thì chỉ cần thêm mã checksum ( hoặc 1 đoạn mã checksum ) của lần commit đó

- để xem mã checksum các lần commit trước thì bạn dùng lệnh:

`$ git log --pretty=oneline`

- Bây giờ mình có thể đặt tag cho những commit trước đó thì sẽ khai báo một đoạn mã checksum của nó vào lệnh git tag như sau:

`$ git log  -a b1 8d1ce36 -m "miêu tả"`

- và dùng lệnh git tag để hiện các tag đã tạo trước đó.

`$ git tag`
                    
- bạn sẽ dùng lệnh git `push --tags` để đẩy toàn bộ tag lên REPO

`$ git push --tags`

## 5. Nhập tag và Branch


- Branch là một phân nhánh trong một cây dự án để để ta có thể sửa toàn bộ mã nguồn mà không ảnh hưởng tới phân nhánh gốc ( master )

- Bây giờ bạn có thể truy cập vào dữ liệu mà bạn đã commit thông qua tag kèm theo việc tạo 1 Branch mới với lệnh `git checkout -b  tên_branch tên_tag` 

  - Ví dụ mình muốn đưa cái tag a1 vào 1 branch mới tên version1 thì sẽ viết như sau:

`$ git check -b version1 a1-an`

- Lúc này bạn đã tự động chuyển qua branch version1 thay vì master ban đầu, kèm theo đó là dữ liệu của commit được gắn tag a1-an

- Bây giờ nếu bạn muốn làm việc thêm với branch này thì cứ làm việc như khi bạn ở nhánh (mặc định(master)) . Để chuyển về lại master, bạn gõ lệnh:

`$ git checkout master`

- Để push cái branch này lên bạn có thể sử dụng lệnh:
`$ git push origin version1` 

// origin chính là tên địa chỉ remote của repository mặc định mà Git tự đặt khi bạn clone.

	
## 6.Sơ lược Remote Repository và Origin

- view lại Github là 1 máy chủ từ REPO từ xa nên mình sẽ gọi nó là Remote Repository, nghĩa là Repository này không nằm trên máy tính của mình.
- ở phần đó bạn đẩy dữ liệu lên Repository bằng cách dùng lệnh git push origin master. master là tên branch - nhánh, nhưng cái oringin trong đoạn đó chính là tên Remote Repository: mặc định khi clone một Repository thì nó tự đặt tên là origin

- Để kiểm tra tên remote repository thì bạn gõ lệnh:
`$ git remote -v`

  - Trong đó bạn có thể thấy cái repository mình đã clone đều được đặt tên là " origin " và mỗi repository bạn có 2 hành động:

` fetch ( lấy dữ liệu về từ server )`
` push ( gửi dữ liệu lên server )`
- Đổi tên remote

- để đổi tên cho dễ quản lý nếu như bạn có nhiều remote repository, bạn dùng lệnh:

`$ git remote rename tên_cũ tên_mới`

- trường hợp bạn muốn thêm 1 remote repo để lấy dữ liệu khi cần có thể sử dụng lệnh:

`$ git remote add ten_remote URL`

- Sau đó nếu bạn muốn lấy dữ liệu từ cái URL vừa thêm kia về chỉ cần sử dụng lệnh:

`$ git fetch ten_remote`

- Lưu ý là lệnh git fetch nó chỉ lấy về và lưu vào database của Git trên máy chứ không được gộp vào repository của bạn. Để gộp vào bạn có thể gõ thêm lệnh git merge inuit, trong đó inuit là tên remote.

- Còn nếu bạn muốn nó lấy về trực tiếp mà không cần gộp thì sử dụng lệnh git pull tên_remote, tuy nhiên mình khuyến khích bạn nên gộp vào branch khi cần và nhớ cẩn thận trong việc gộp, tốt nhất nên tạo thư mục mới trong thư mục làm việc của bạn rồi vào đó mà lấy về.

### Sự khác nhau giữa clone, fetch và pull
- Có thể bây giờ bạn đã biết được 3 lệnh để lấy dữ liệu về từ repository đó là git clone, git fetch và git pull. Nhưng cả ba loại đều là lấy dữ liệu, thế sự khác nhau của nó là gì?

### git clone
- Lệnh này sẽ sao chép toàn bộ dữ liệu trên repository và sao chép luôn các thiết lập về repository, tức là nó sẽ tự động tạo một master branch trên máy tính của bạn. Lệnh này chỉ nên sử dụng khi bạn cần tạo mới một Git mới trên máy tính với toàn bộ dữ liệu và thiết lập của một remote repository.

### git pull
- Lệnh này sẽ tự động lấy toàn bộ dữ liệu từ remote repository và gộp vào cái branch hiện tại bạn đang làm việc.

### git fetch
- Lệnh này sẽ lấy toàn bộ dữ liệu từ remote repository nhưng sẽ cho phép bạn gộp thủ công vào một branch nào đó trên thư mục Git ở máy tính.

### Các loại giao thức của Remote Repository
- Chúng ta không chỉ kết nối với một remote repository qua giao thức HTTP hay HTTPS mà còn có thể chọn nhiều giao thức khác, dưới đây là một vài giao thức remote repository.

### Local Repository
- Giao thức này nghĩa là khi bạn kết nối tới một repository nào đó trên chính máy tính của bạn và URL của giao thức sẽ có dạng /path/repository/.

### HTTP Repository
- Giao thức thông dụng nhất cũng như dễ hiểu nhất, thường được sử dụng nếu bạn dùng các dịch vụ remote repository như Github hay Assembla, nó sẽ bao gồm định dạng http://domain.com/repository.git hoặc https://domain.com/repository.git.

### SSH Repository
- Giao thức này thường được dùng trên các nhu cầu tạo một server repository riêng và kết nối thông qua giao thức SSH. Đường dẫn của giao thức này sẽ có dạng là user@server:/path/repository.git. 
### Lời kết
- Trong bài này em có thể hiểu được 1 số lệnh cơ bản, và cách chúng hoạt động như thế nào. Trong thời gian tới em sẽ tìm hiểu nhiều hơn về các lệnh nâng cao.
