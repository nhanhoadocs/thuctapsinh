# File Permissions

## Tại sao cần phải có phân quyền
Ngày này hầu hết các hệ điều hành phổ biến đều hỗ trợ nhiều người cùng sử dụng đồng thời. Có thể sẽ có người thắc mắc rằng tại sao lại cần hỗ trợ tính năng này khi máy tính của họ chỉ có một người sử dụng. Lý do là vì một hệ điều hành được tạo ra với mục đích càng có nhiều người sử dụng càng tốt. Do vậy có thể một người nào đó không cần hệ điều hành phải hỗ trợ nhiều người sử dụng nhưng những người khác lại cần đến. Tính năng phân quyền được tạo ra là để hỗ trợ cho việc sử dụng đồng thời của hệ điều hành.

## Nhóm phân quyền

Trong Linux có ba nhóm phân quyền chính không bao nhau: 

    - Owner: chỉ cấp quyền cho người sở hữu của file
    - Group: chỉ cấp quyền cho nhóm sở hữu của file.
    - Other: cấp quyền cho những người dùng và nhóm không thuộc 2 nhóm trên.

Tuy nhiên vẫn có 1 ngoại lệ, đó là người dùng ***root*** (siêu người dùng). Người dùng này có mọi quyền hạn trên mọi file trong hệ thống, không bị ràng buộc bởi bất cứ sự phân quyền nào. Như mình đã nói trong phần mở đầu, hệ thống phân quyền sẽ rất nguy hiểm nếu bạn không hiểu về nó. VD câu lệnh sau sẽ xóa tất cả file trên hệ thống nếu người thực thi là ***root***

```
rm -rf /
```

## Loại phân quyền
 
| Tên Quyền | Kí Hiệu | Dạng số | Mô Tả |
|-----------|---------|---------|-------|
| Read | r | 4 | Quyền đọc file |
| Write | w | 2 | Quyền ghi file |
| Execute | x | 1 | Quyền thực thi file |
| Setuid/Setguid | s | 1 | Nếu file được thực thi, người thực thi sẽ là chủ sở hữu |
| Sticky bit | t | 1 | Chỉ chủ sở hữu mới được xóa hoặc thay đổi tên file kể cả khi Other có toàn quyền với file đó |



## Cách xem phân quyền của một file
Trong Linux, cách đơn giản nhất để xem phân quyền của một file là sử dụng lệnh `ls -l`
Output của câu lệnh trên sẽ có dạng như sau: 
```
-rwxr-xr-x 1 user group
```

- Kí tự `-` đầu tiên là một cờ đặc biệt để chỉ loại file, `-` với file thông thường, `d` với thư mục, `c` với thiết bị, `l` với liên kết (liên kết tới một file khác).
- 3 kí tự `rwx` đầu tiên là quyền hạn của **Owner**, ở đây **Owner** sẽ có mọi quyền với file
- 3 kí tự `r-x` ở giữa là quyền hạn của **Group**, ở đây **Group** sẽ có quyền đọc và quyền dùng lệnh `cd`
- 3 kí tự `r-x` cuối cùng là quyền hạn của **Other**, tương tự như **Group** ở trên sẽ có quyền đọc và dùng lệnh `cd`
- Số nguyên đi sau quyền hạn để chỉ số lượng liên kết tới file, ở đây `1` có nghĩa là file này không có liên kết tượng trưng mà chỉ có một liên kết cứng duy nhất trỏ tới chính nó.
- Cuối cùng là 2 thông tin nói về chủ sở hữu và nhóm sở hữu, ở đây là người dùng `user` và nhóm `group`

## Quyền hạn mặc định
Do Linux được tạo ra nhằm mục đích cho nhiều người sử dụng nên cũng sẽ có các thiết lập mặc định dành cho người dùng bình thường, những người mà không quan tâm hoặc ít quan tâm đến vấn đề cài đặt hoặc cấu hình. Không nằm ngoài quy luật này, với các file được tạo ra bởi người dùng thì luôn có những giá trị mặc định được thiết lập sẵn. Cụ thể trong bảng dưới đây:

| Type | Owner | Group | Other |
|------|-------|-------|-------|
| File | rw- (đọc và ghi) | r-- (chỉ đọc) | r-- (chỉ đọc) |
| Directory | rwx (đọc, ghi và truy cập)| r-x (đọc và truy cập) | r-x (đọc và truy cập) |


Như vậy, khi tạo một file mới, quyền cao nhất luôn luôn thuộc về người tạo ra nó, bao gồm đọc, sửa, xóa ..., nhóm và người dùng khác chỉ có quyền xem. Với thư mục, mặc dù vẫn dùng chung các kí hiệu r, w, x như file thông thường nhưng quyền hạn thì có một chút khác biệt, cụ thể là:

- r (read): quyền xem danh sách file và thư mục con (dùng lệnh ls)
- w (write): quyền tạo file và thư mục con (dùng lệnh touch và mkdir)
- x (execute): quyền chuyển vào thư mục (dùng lệnh cd)

## Phân quyền truy cập file bằng Chmod

Đầu tiên, ta liệt kê các thuộc tính của một file bằng câu lệnh 
```
ls -l
```

Ta có bảng giá trị sau:

| Dạng số | Kí hiệu | Quyền |
|---------|---------|-------|
| 0 | --- | Không làm gì cả |
| 1 | --x | Thực thi ( Execute )|
| 2 | -w- | Viết ( Write )|
| 3 | -wx | Viết và Thực thi ( Write and Execute )|
| 4 | r-- | Đọc ( Read )|
| 5 | r-x | Đọc và Thực thi ( Read and Execute )|
| 6 | rw- | Đọc và Viết ( Read ant Write )|
| 7 | rwx | Đọc, Viết và Thực thi ( Read, Write and Execute )|


### Lệnh chmod thường dùng

- chmod 777 filename: Cấp quyền truy cập đầy đủ cho mọi đối tượng người dùng.
- chmod 775 filename: Cấp quyền truy cập đầy đủ cho chủ hệ thống và nhóm quản trị, đối tượng người dùng chỉ có quyền đọc (read) và chạy (execute) file.
- chmod 755 dirname: Cấp quyền truy cập đầy đủ cho chủ hệ thống, chỉ cho phép nhóm quản trị và đối tượng người dùng đọc và chạy các file trong thư mục.
- chmod 700 filename: Chỉ cấp quyền truy cập đầy đủ cho chủ hệ thống và chặn truy cập với mọi đối tượng khác.
- chmod 500 dirname: Không cho phép nhóm quản trị và người dùng truy cập vào file trong thư mục, đồng thời giới hạn quyền chủ hệ thống chỉ đọc và chạy để tránh xóa và thay đổi các file trong thư mục này.
- chmod 660 filename: Cho phép chủ hệ thống và nhóm quản trị đọc, sửa, xóa và ghi dữ liệu vào file, nhưng không phân quyền truy cập cho những người dùng khác.