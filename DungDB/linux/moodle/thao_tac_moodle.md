# Các thao tác cơ bản trên Moodle

## Các role cơ bản trong Moodle

- Admin: Người quản trị. Có thể thực hiện tất cả các thao tác
- Teacher: Giáo viên trong 1 khóa học
- Student: Học sinh trong một khóa học

Các role khác: Quản lý, Người tạo khóa học, Khách, Người dùng đã xác thực.

**Lưu ý:** Một giáo viên trong khóa này có thể là một học sinh trong một khóa khác và ngược lại.

## Các thao tác cơ bản

### Tạo User mới

Để tạo 1 User mới, click chuột vào

Site administration > User > Accounts > Add new user

![Imgur](https://i.imgur.com/VuAp8Bo.png)

Nhập các thông tin của của user:

- User name: Không nhập trùng các user name đã có.
- Choose an authentication method: Chọn phương pháp xác thực tài khoản (ví dụ như xác thực qua email, xác thực qua các dịch vụ web, không xác thực, vv...)
- Password: Tối thiểu 8 ký tự, có chữ hoa, chữ thường, số, ký tự đặc biệt
- Force password change: Trong lần đăng nhập tiếp theo của user sẽ bắt buộc phải đổi mật khẩu
- Buộc phải nhập các thông tin Tên, Họ và Email. Các thông tin khác có thể thêm hoặc không vẫn có thể tạo được và để user tự thêm vào.
- Click vào Create user để tạo.

### Thêm nhiều user 1 lúc

Site administration > User > Accounts > Upload user

![Imgur](https://i.imgur.com/OiQxvvR.png)

Thông tin của các user được thêm lưu ở một file có đuôi `.csv`. Có thể tải file example.csv để tham khảo.

Dưới đây là một ví dụ về file thông tin user để tải lên. 

![Imgur](https://i.imgur.com/TuKmhrS.png)

Có 4 trường chính là username, firstname, lastname, email.
Click Choose a file để chọ file tải lên.

![Imgur](https://i.imgur.com/wCoML7B.png)

Chọn Choose file ở phần Upload a file 

![Imgur](https://i.imgur.com/tuC6Qfj.png)

Chọn file có đuôi `.csv` đã lưu thông tin user để tải lên

![Imgur](https://i.imgur.com/OeCd4ry.png)

Click Upload this file để tải lên

![Imgur](https://i.imgur.com/OYMKejE.png)

Sau đó click Upload user

![Imgur](https://i.imgur.com/cL3CdZg.png)

Nội dung file đã được tải lên

![Imgur](https://i.imgur.com/9yMxJ4i.png)

Ở phần Setting mục Upload type có thể chọn kiểu upload. Như chỉ thêm user mới, bỏ qua user bị trùng; Thêm tất cả, nếu tên user bị trùng sẽ thêm số vào đằng sau để phân biệt; Thêm user mới và upadte thông tin user cũ; Chỉ upadte user cũ.

![Imgur](https://i.imgur.com/xDW4Yut.png)

Phần New user password nên chọn gửi mật khẩu qua email. Cũng có thể chọn thêm trường trong file `.csv`. Việc này tốn thời gian hơn.

![Imgur](https://i.imgur.com/1qZcxmZ.png)

Chọn chuẩn hóa username `Yes` ở phần Standardise usernames.

Trong mục Default values. Có thể chọn cách hiển thị email đối với người học; Tự đăng ký vào các cuộc thảo luận; Và thêm các thông tin cá nhân khác.

![Imgur](https://i.imgur.com/oinWjzP.png)

Sau đó nhấn vào Upload users.

Kết quả

![Imgur](https://i.imgur.com/vxbkVcf.png)

### Tạo khóa học mới

Để tạo 1 khóa học mới, click chuột vào

Site administration > Courses > Add a new course

![Imgur](https://i.imgur.com/rMxqSIi.png)

- Điền các thông tin của khóa học

![Imgur](https://i.imgur.com/8NBTsQt.png)

- Thêm mô tả tóm tắt và hình ảnh cho khóa học ở mục Description. 

![Imgur](https://i.imgur.com/IzaPHm0.png)

- Chọn format cho khóa học ở mục Course format. Ví dụ như khóa học này là chỉ có một hoạt động, có một hoặc nhiều hoạt động hàng tuần (nên chọn), theo các chủ đề, hay là theo dạng cộng đồng. 

![Imgur](https://i.imgur.com/QYo4c6b.png)

- Ở mục Appearance, có thể chọn theme, ngôn ngữ, số lượng thông báo, hiện bảng điểm cho học viên, hiện báo cáo hoạt động. 

![Imgur](https://i.imgur.com/0qyQd5m.png)

- Chọn giới hạn file tải lên ở mục Files and uploads.

![Imgur](https://i.imgur.com/i9pQM6T.png)

- Bật theo dõi khóa khọc ở mục Completion tracking.

![Imgur](https://i.imgur.com/kMTR8JX.png)

- Tùy chỉnh nhóm ở mục Groups.

![Imgur](https://i.imgur.com/ZVlmzsK.png)

- Đổi tên các role (vai trò) của các user trong khóa học này. 

![Imgur](https://i.imgur.com/OtC7Gvp.png)

- Chọn tags để dễ theo dõi ở mục Tags. Có thể nhấn vào nút Manage standard tags để thêm, xóa, sửa Tags.

![Imgur](https://i.imgur.com/2quNve9.png)

- Nhấn Save and display hoặc Save and return để tạo.

### Phân quyền cho user trong khóa học

Phân quyền cho 1 user chính làm giáo viên quản lý trong khóa học này, giáo viên đó có thể thêm các trợ giảng (đóng vai trò giáo viên nhưng không có quyền chỉnh sửa khóa học), các học viên của khóa học.

Particitants > Enrol Users > Tìm tên user và phân cho họ vai trò trong khóa học

![Imgur](https://i.imgur.com/9YSTFfr.png)

![Imgur](https://i.imgur.com/lG2yNY5.png)

![Imgur](https://i.imgur.com/uEbOanG.png)

Thông tin của các user đã thêm ở bên dưới. Có thể quản lý các user đó ở đây.

![Imgur](https://i.imgur.com/nY0FYf8.png)

## Thao tác của Admin

Tại giao diện của User Admin có Phần Site Admministration. Các user khác sẽ không có phần này. Vào đây để quản lý site.

![Imgur](https://i.imgur.com/FxzOPKd.png)

Ngay bên dưới là ô Add a block. Click vào đây để thêm các block trên trang chủ. Ví dụ như thêm block các thông báo gần nhât, hiển thị các user đang online, thêm thanh điều hướng, vv...

![Imgur](https://i.imgur.com/cn7vvIg.png)

### Site Administration

Trong mục Site Administration sẽ có các mục Site Administration, Users, Courses, Grades, Plugins, Appearance, Server, Reports, Development

![Imgur](https://i.imgur.com/8TWu7j8.png)

Trong mục Site Administration


(đang làm dở)





Trong mục Users có các mục nhỏ là Accounts, Permission, Privacy and policies

![Imgur](https://i.imgur.com/ooFnMTr.png)

- Browse list of users: Xem danh sách các user đã tạo.
- 

(đang làm dở)









#### Thêm ngôn ngữ

Click vào Site adminstration, kéo xuống dưới và tìm mục Language. Chọn Langguage pack

![Imgur](https://i.imgur.com/57ub1Xw.png)

Ví dụ muốn thêm Tiếng Việt. Tìm dòng Vietnamese trong khung bên phải và nhấn Install selected language pack

![Imgur](https://i.imgur.com/0HLGJMd.png)

Ngôn ngữ Tiếng Việt được thêm thành công.

![Imgur](https://i.imgur.com/ZjpeqGh.png)

Có thể đổi ngôn ngữ bằng cách Refresh lại trang và click chọn Tiếng Việt ở Khung ngôn ngữ tại góc trên bên trái màn hình

![Imgur](https://i.imgur.com/cvbhPpV.png)






## Các thao tác trong khóa học

Các User có quyền cao hơn trong khóa học có thể thay đổi role của bản thân thành các role khác có quyền thấp hơn. Ví dụ giáo viên sau khi tạo một bài học có thể thay đổi role thành học sinh để test thử bài học đó. Sau khi test xong có thể đổi lại role thành giáo viên như cũ.

Xem các khóa học hiện có ở Site home

![Imgur](https://i.imgur.com/bUMTGdR.png)

Ví dụ chọn khóa học Kinh tế vi mô để xem. Chọn biểu tượng bánh răng, Turn editing on. Sau khi Turn editing on User admin hoặc các giáo viên có quyền chỉnh sửa có thể tùy ý chỉnh sửa khóa học. 

![Imgur](https://i.imgur.com/YI8KWCm.png)

Để đổi tên chủ đề. Click vào biểu cây bút. Sau khi đổi nhấn Enter.

Ở chủ đề Tuần 1, thêm 1 hoạt động bằng cách nhấn vào Add an activity or resource.

![Imgur](https://i.imgur.com/xwG4QHK.png)

Xuất hiện giao diện để ta chọn các hoạt động để giáo viên có thể thêm vào khóa học của mình như tạo phòng học, tạo phòng chat, tạo forum, upload tài liệu, vv...

![Imgur](https://i.imgur.com/UnCdnRp.png)

![Imgur](https://i.imgur.com/p6OtnQp.png)

### Tạo phòng học online với BigBlueButton plugins

Đầu tiên cần phải cài plugins bigbluebuttonBN. 

Site administration > Plugins > Install plugins

![Imgur](https://i.imgur.com/Vnf5k7y.png)

Click Install plugins from Moodle plugins directory

![Imgur](https://i.imgur.com/CnWn6vG.png)

Trình duyệt sẽ chuyển ta tới website của Moodle. Tại đây tiến hành tạo tài khoản để đăng nhập. Có thể đăng nhập bằng tài khoản google, facebook, microsoft (nhớ check email). 

![Imgur](https://i.imgur.com/YBhHiCl.png)

Nhập bigbluebuttonBN vào ô tìm kiếm. Kết quả sẽ xuất hiện bên dưới.

![Imgur](https://i.imgur.com/lJ6ltEv.png)

Click vào plugins BigBlueButtonBN. Chọn Install now.

![Imgur](https://i.imgur.com/F0N5Uc0.png)

Chọn Install now để cài đặt ngay. Có thể chọn biểu tượng bánh răng để xem cái tùy chỉnh.

![Imgur](https://i.imgur.com/hRGo1x9.png)

Xem các khóa học hiện có ở Site home

![Imgur](https://i.imgur.com/bUMTGdR.png)

Ở ví dụ này, tôi sẽ tạo một lớp ở Khóa học Kinh tế vi mô.

![Imgur](https://i.imgur.com/YI8KWCm.png)

Ở mục Tuần 1, thêm 1 hoạt động bằng cách nhấn vào Add an activity or resource.

![Imgur](https://i.imgur.com/xwG4QHK.png)

Chọn hoạt động BigBlueButtonBN, nhấn Add

![Imgur](https://i.imgur.com/aZQOU4V.png)

Đặt tên cho room và tùy chỉnh các thông tin khác cho room.

![Imgur](https://i.imgur.com/vKob5GP.png)

Chọn Save and display để tạo room và hiển thị ngay. Chọn Save and return để Tạo room và quay lại. Cancel để hủy.

![Imgur](https://i.imgur.com/g2tYvFD.png)

Lúc này tại Khóa học Kinh tế vi mô sẽ xuất hiện một room bigbluebutton. Thử kiểm tra bằng một user sinh viên ở đây là Đặng Đỗ Hải thì thấy: 

![Imgur](https://i.imgur.com/q8iYcqb.png)

Sinh viên Hải có thể nhấn vào room này để tham gia học trực tuyến.

Tiếp tục thực hiện ở tài khoản của giảng viên

Chọn biểu tượng bánh răng để tùy chỉnh. Chọn Join session để tham gia phòng.

![Imgur](https://i.imgur.com/PNDaTXo.png)

Trình duyệt sẽ nhảy lên một cửa sổ mới. Chọn Microphone. 

![Imgur](https://i.imgur.com/Unxoymp.png)

Nhấn Allow để trình duyệt được quyền dùng Microphone của bạn

![Imgur](https://i.imgur.com/wZQp3n8.png)

Giao diện sau khi set up xong: Có khung người dùng, khung chat và khung trình bày

![Imgur](https://i.imgur.com/TI3YSNy.png)

- Khung người dùng hiển thị các người tham gia room này. Ở đây có Admin user là giảng viên của room và Đặng Đỗ Hải là sinh viên.
- Khung chat để giảng viên và sinh viên có thể dễ đặt câu hỏi mà không chen ngang phần trình bày của giảng viên.
- Khung trình bày để giảng viên giảng dạy bài học.

Giảng viên có thể tải slide giảng dạy lên bằng cách click vào biểu tượng dấu `+`, chọn upload a presentation. 

Chọn Browse for a file để tìm file để tải lên, hoặc kéo thả file càn tải lên vào khung bên dưới và nhấn Upload.

![Imgur](https://i.imgur.com/xfI8Ty2.png)

Sau khi upload, tài liệu sẽ xuât hiện ở khung trình bày. 

![Imgur](https://i.imgur.com/p6qrgM7.png)

Có thể sử dụng các công cụ bên tay phải để thao tác với tài liệu. Quay video buổi học bằng cách nhấn vào nút Record phía trên màn hình. Các nút ở phía dưới màn hình dùng để bật tắt micro, camera.

Các user có thể set status như có mặt, tạm vắng, thích, vui vẻ, vv.. tại khung User. Click vào tên tài khoản bản thân, set status.

![Imgur](https://i.imgur.com/jr7Iugo.png)

Phần Shared note có thể sử dụng để làm việc nhóm. Tất cả user trong room có thể tham gia thêm, xóa, sửa nội dung của phần này.

![Imgur](https://i.imgur.com/mgx9MLC.png)

Khung user của giảng viên có một biểu tượng răng cưa mà các sinh viên không có. Click vào đây để thực hiện xóa các status hiện có. Tắt micro tất cả user khác, vv 

![Imgur](https://i.imgur.com/TkaCeo2.png)

Biểu tượng 3 chấm ở góc phải phía trên màn hình dùng để mở toàn màn hình và một số cài đặt khác. 

### Tải lên file tài liệu

Click vào Add an activity or resourse tại chủ đề mong muốn.

![Imgur](https://i.imgur.com/2SiFa9t.png)

Kéo xuống phần Resourses. Tùy ý chọn mục mà ta mong muốn để tải lên. Nên chọn file để tải lên file tài liệu đã được nén ở dạng `.rar` hay `.zip` để tiết kiệm thời gian và dung lượng. Chọn Folder để tải lên cả thư mục. Chọn URL để thêm một đường link hữu ích. 

Ở đây tôi chọn thêm File. Nhấn Add.

Đặt tên, thêm mô tả cho file. Click vào ô với dấu mũi tên để chọn file tải lên.

![Imgur](https://i.imgur.com/B9rvMCR.png)

Chọn Choose file ở mục Upload a file

![Imgur](https://i.imgur.com/yxe7vSq.png)

Chọn file muốn tải lên. Sau đó click open.

![Imgur](https://i.imgur.com/QcUnZuF.png)

Click Upload this file để tải file lên.

![Imgur](https://i.imgur.com/H0SPbH0.png)

Ta có thể thấy file đã sẵn sàng được tải lên. Tiếp tục thêm các cài đặt khác nếu thấy cần thiết. Hoặc có thể tải file lên ngay bằng cách click vào Save and return to course hoặc Save and display.

![Imgur](https://i.imgur.com/edwFpQH.png)

Ví dụ: Ở mục Appearance, có thể chọn hiển thị dung lượng file, loại file, ngày chỉnh sửa, mô tả, sử dụng bộ lọc vào nội dung file.

![Imgur](https://i.imgur.com/pZJG7eb.png)

Ở mục Common module settings, có thể chọn hiển thị ở trang khóa học hoặc không hiển thị đối với sinh viên, thêm ID cho file.

![Imgur](https://i.imgur.com/d4Un8oE.png)

Thêm giới hạn truy cập ở Restrict access

![Imgur](https://i.imgur.com/sQuiTxK.png)

Thêm điều kiện ở Activity completion. Thêm tag ở mục Tags. 

![Imgur](https://i.imgur.com/XuB93Ab.png)

Sau khi cài đặt xong. Chọn Save and return to course hoặc Save and display.

![Imgur](https://i.imgur.com/R7lvdr2.png)

### Tạo bài kiểm tra (Quiz)



### Tạo forum thảo luận

### Tạo phòng chat

### Tạo khảo sát




## Thao tác của người dùng

### Đăng nhập

Sau khi nhận được tên đăng nhập và mật khẩu. Truy cập vào trang Moodle của nhà trường. Sẽ thấy giao diện tương tự như sau:

![Imgur](https://i.imgur.com/SwbxodQ.png)

Nhấn vào nút **Login** tại góc phải phía trên màn hình. Sẽ thấy giao diện như sau:

![Imgur](https://i.imgur.com/ClAkvb2.png)

Điền tên đăng nhập và mật khẩu rồi nhấn **Log in**.

### Giao diện người dùng

Giao diện sau khi đăng nhập

![Imgur](https://i.imgur.com/EX4KwBq.png)

Giao diện hiển thị có thể khác nhau tùy theo theme được cài đặt nhưng thông thường sẽ có kết cấu như sau:

Bên phía tay trái có thể sử dụng để xem Dashboard, trang chính, lịch, file cá nhân và thông tin các khóa học của bản thân. 

![Imgur](https://i.imgur.com/WEPjXeF.png)

Ngay trung tâm sẽ là những thông tin được hiển thị trên Dashboard: Các khóa học đã được thêm gần đây và Tổng quan các khóa học.

![Imgur](https://i.imgur.com/A3QcXJK.png)

Phía tay phải sẽ có hiển thị các block với các thông tin như: Các công việc cần hoàn thành trong thời gian sắp tới, File cá nhân, số lượng người dùng đang online, lịch, các sự kiện sắp diễn ra, v.v...

Các block này được người quản trị quản lý (thêm vào hoặc gỡ bỏ).

![Imgur](https://i.imgur.com/QdlWBIX.png)

### Hướng dẫn đổi mật khẩu 

Nếu muốn đuổi mật khẩu, ta thực hiện theo các bước sau đây.

Click vào profile ở góc phải màn hình > Preferences > Change password trong phần User account.

![Imgur](https://i.imgur.com/AGxTkcU.png)

Xác nhận mật khẩu cũ, nhập mật khẩu mới 2 lần và nhấn **Saves change**.

**Lưu ý:** Mật khẩu cần có ít nhất 8 ký tự, có chữ hoa, chữ thường, số, ký tự đặc biệt.

![Imgur](https://i.imgur.com/7Fr1vM7.png)

### Thao tác trong khóa học

Các khóa học mà sinh viên đã theo học sẽ xuất hiện tại Site home (Trang chính).

![Imgur](https://i.imgur.com/bPI3H67.png)

Chọn vào khóa học mong muốn để xem các hoạt động bên trong khóa học đó, ở đây tôi chọn khóa Lập trình cơ sở.

Giao diện sẽ tương tự như sau

![Imgur](https://i.imgur.com/swxyULu.png)

Các hoạt động của khóa học (do giảng viên biên soạn) sẽ hiển thị rõ ràng trong khóa học.

![Imgur](https://i.imgur.com/Tf7TELF.png)

Có rất nhiều hoạt động trong khóa học mà giáo viên có thể thêm. Ví dụ ở khóa học này có một số hoạt động cơ bản như: Tải giáo trình, diễn đàn để sinh viên trao đổi, bài học Hello world, kiểm tra tuần 1, khảo sát sau khi học 1 tuần.

- Click vào mục thông báo để xem thông báo của khóa học này.

![Imgur](https://i.imgur.com/5mXngHj.png)

- Click vào Giáo trình, trình duyệt của bạn sẽ tự động tải file giáo trình về máy.

- Click vào diễn đàn để trao đổi với các sinh viên khác và giảng viên. Giao diện diễn đàn như sau:

![Imgur](https://i.imgur.com/7Kin1uz.png)

#### Thao tác trong bài học

- Click vào bài học Hello word để xem bài học. Thông báo của giáo viên đối với bài học hiển thị bên dưới, giáo viên có thể post thêm một file hướng dẫn sinh viên.

![Imgur](https://i.imgur.com/N6WWzXE.png)


- Thông tin về thời hạn nộp bài hiển thị bên dưới. Ở ví dụ này, sinh viên này vẫn chưa nộp bài, chưa được chấm điểm, và còn hơn 6 ngày để hoàn thành và nộp bài tập. Có thể nộp bài theo yêu cầu cụ thể của giáo viên hoặc click vào nút **Add submission** để nộp bài.

![Imgur](https://i.imgur.com/UsKcAWN.png)

- Click vào ô với biểu tượng mũi tên hướng xuống để chọn file bài tập và tải lên, sau đó click **Save changes**.

![Imgur](https://i.imgur.com/zFytjzI.png)

- Thao tác chọn file như mô tả trong hình bên dưới

![Imgur](https://i.imgur.com/GYYPjWm.png)

#### Làm bài kiểm tra

- Click vào Kiểm tra tuần 1 để làm bài kiểm tra tuần 1. Click vào **Attempt quiz** để thực hiện bài kiểm tra. 

![Imgur](https://i.imgur.com/S4e0J6d.png)

**Lưu ý:** Đến thời điểm giảng viên chỉ định sinh viên mới có thể tham gia làm bài kiểm tra. Chú ý vào thời gian làm bài và số lần có thể làm bài kiểm tra.

- Ở ví dụ này. Sau khi click vào **Attempt quiz**. Xuất hiện thông báo bạn có 15 phút để làm bài. Click **Start attempt** để bắt đẩu làm bài kiểm tra.

![Imgur](https://i.imgur.com/qpn5uvL.png)

- Giao diện làm bài kiểm tra sẽ tương tự như sau:

![Imgur](https://i.imgur.com/YFhm4gj.png)

- Sau khi làm hết các câu hỏi mà vẫn còn thời gian sẽ thấy giao diện sau:

![Imgur](https://i.imgur.com/NjfkoXH.png)

- Click vào **Return to attempt** để sửa đổi câu trả lời. Hoặc Click **Submit all and finish** để nộp bài.

- Cảnh báo nhận được khi bạn nộp bài

![Imgur](https://i.imgur.com/J13Gfdv.png)

- Sau khi nộp bài, bạn có thể thấy số điểm của mình. Đáp án các câu trả lời.

![Imgur](https://i.imgur.com/VJbgMIl.png)