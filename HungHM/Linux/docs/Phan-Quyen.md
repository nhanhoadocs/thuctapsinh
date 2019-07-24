


# Phân Quyền

#### Khái niệm.
- Quyền truy cập ``file`` là một phần quan trọng của linux. Tức là ta có thể phân quyền cho file hoặc thư mục được phép làm gì và không được phép làm gì.

**Ba thuộc tính quyền mọi file trên linux đều có**
- ``Quyền của người sở hữu``: quy định quyền người sở hữu được làm những thao tác gì với file. Khi mới tạo file thì người sở hữu chính là người tạo file, sau đó có thể đổi chủ sở hữu cho người khác.
- ``Quyền của nhóm sở hữu``: quy định quyền các thành viên một nhóm có thể thực thi trên file.
- ``Quyền khác``: quy định quyền hạn cho các người dùng khác.
**Các quyền truy cập file**

Lệnh ls -l list ra file với đầy đủ thông tin về quyền truy cập

``1|`` $ls -l /home/user1

``2|`` drwxrwxr-x   7 user1 user1   4096 Jun  8 13:38 .vagrant.d/ 

``3|`` drwxrwxr-x   6 user1 user1   4096 May 13  2013 venv/ 

``4|`` drwxr-xr-x   6 user1 user1   4096 Jul  4 22:34 Videos/ 

``5|`` drwxr-xr-x  11 user1 user1   4096 Jun 25 11:22 .vim/

``6|`` -rw-rw-r--   1 user1 user1   2140 Oct 27  2013 .vimrc

- Dấu (d) và (-). Đây là kiểu file: (d) là directory (thư mục), (-) là file thông thường, l là link …
- 9 ký hiệu tiếp theo ở cột đầu: có dạng rwxrwxrwx hoặc rwxr-xr-x là lặp lại 3 lần của rwx (read-write-execute) = quyền đọc, ghi, thực thi đối với file.
- Chúng ta có 3 đối tượng sở hữu là chủ sở hữu (owner), nhóm sở hữu (group owner)  và other nên quyền này sẽ được thể hiện nối tiếp thành chuỗi 3x3 là 9 ký tự: rwx rwx rwx.

**Ví dụ file .vimrc thì:**

- Quyền cho chủ mang tên user1 là rw- (đọc, ghi), quyền chạy (thực thi) không có nên hiện '-'.
- Quyền với nhóm mang tên user1 cũng là rw- (đọc, ghi).
- Các user khác chỉ có quyền đọc : r--;  (quyền ghi write-w và chạy x-execute không có).

**Các quyền truy cập file**
- Read (r): Quyền đọc file, ví dụ như được xem nội dung của file.
- Write (w): Quyền sửa đổi file hay xóa nội dung của file.
- Execute (x): Có thể chạy file như là một program. Program là một chương trình mà ta có thể chạy ví dụ trên Windows là file .exe, .bat ...

**Các quyền truy cập thư mục**
Quyền truy cập đối với thư mục cũng tương tự như với file. Chỉ có một số khác biệt nhỏ cần lưu ý như sau:

- Read: Quyền đọc thư mục cho phép người dùng có thể xem các nội dung trong mục đó. Người dùng được xem tên các file trong thư mục.
- Write: Được phép thêm hoặc xóa file trong thư mục.
- Execute: thực thi lệnh, chương trình

    - Quyền chạy thư mục không mang nhiều ý nghĩa như với file. Người dùng phải có quyền thực thi đối với mục ``bin`` trong hệ thống thì mới có thể chạy các lệnh cd, ls ... (các lệnh này đặt trong mục bin).

    - Với thư mục cũng vậy, nhưng khác một chút vì nó còn chứa các mục con trong nó.

- Ví Dụ: 
![img](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/62200894_323836978530261_6082137234071355392_n.png?_nc_cat=103&_nc_oc=AQmtJ6j3kVvbKRxSfDjcY6iKaq6E9dJtx-ktXsC1X30ZIdfOIPuVBlmFffCSnA_dpG4&_nc_ht=scontent.fhan5-7.fna&oh=e538af41b9b6b3fcc8dca4825a02911e&oe=5D85D4AF)

- Đầu tiên là đoạn rw-rw-r--, ở đoạn này bạn có thể thấy nó có 1 số dấu gạch ngang (-). điều đó có nghĩa là chưa bật đủ quyền dành cho nó, mỗi quyền sẽ được mô tả bằng một dấu -. Cụ thể:

  - rw-: Đối tượng thứ nhất chính là quyền dành cho ``user sở hữu nó.``
  - rw-: Đối tượng thứ hai chính là quyền dành cho ``CÁC user thuộc group đang sở hữu nó.``
  - r--: Đối tượng thứ ba chính là quyền dành cho ``MỌI user không thuộc quyền sở hữu và không thuộc group sở hữu.``
- Vậy cái đoạn rw-rw-r-- nghĩa là “User van được phép đọc và sửa file, các user thuộc group van có thể đọc và sửa file, còn những người còn lại là chỉ được đọc file“.

**2. Thay đổi quyền truy cập**
- Chúng ta chỉ cần vài lệnh đơn giản để quản lý quyền truy cập. Khi làm việc thực tế vấn đề thường gặp phải là tìm cách gán quyền hạn thế nào và cho ai chứ ít khi là vấn đề về câu lệnh phức tạp. - Trên linux có rất nhiều user vì nó coi một chương trình (phần mềm hay program) cũng là một user riêng.

**Các lệnh để thay đổi quyền truy cập.**

**Chmod**
- Dùng ``chmod`` với quyền biểu diễn dạng ký tự.
- Lệnh ``chmod`` là để đổi quyền truy cập trên file, lệnh sau - chown cho phép ta đổi luôn chủ sở hữu của file hay nhóm nào được sở hữu file.

``chmod [tùy chọn] [biểu diễn phân quyền] [tên file hoặc thư mục]``
- Trong đó, mục [tùy chọn] là không bắt buộc, bao gồm các tùy chọn sau:

  - -v: hiển thị báo cáo sau khi chạy lệnh. Nếu bạn chmod nhiều file/folder cùng lúc thì cứ mỗi lần nó đổi quyền của 1 file/folder xong là sẽ hiện báo cáo.
  - -c: giống như trên, nhưng chỉ hiện khi nó đã làm xong tất cả.
  - -f: Hiểu ngắn gọn là kiểu “kệ nó”, nếu có lỗi xảy ra nó cũng không thông báo.
  - -R: nếu bạn CHMOD một folder thì kèm theo -R nghĩa là áp dụng luôn vào các file/folder nằm bên trong nó.
  - --help: hiển thị thông báo trợ giúp.
- Ở phần [biểu diễn phân quyền], ban có thể biểu diễn bằng 3 kiểu:

  - kiểu ký tự: giống như ở trên (rw-rw-x–).
  - kiểu ugo: kiểu này sẽ phân quyền cho từng đối tượng phân quyền.
  - kiểu số: cũng giống như ở trên (644).
- Một vài ví dụ thêm về kiểu ugo:
  - o+rws: cho phép user sở hữu có full quyền.
  - g+rw: cho phép group sở hữu có quyền đọc và ghi.
  - u+w: cho phép các user còn lại có quyền đọc.
  - a+rws: cho phép toàn bộ user có full quyền (777)
![img](https://scontent.fhan5-6.fna.fbcdn.net/v/t1.15752-9/61856542_314631076117286_5913805534321967104_n.png?_nc_cat=101&_nc_oc=AQl_HyU8ENT2mLaaXtZaUWDavC8qQaxOp98bWrR1heWUDCsPjwaSudZxXK4NqBVre0o&_nc_ht=scontent.fhan5-6.fna&oh=e191763960c54a95083b3eddc3c3ce48&oe=5D552F39)

- VD: Gán quyền thực thi ``file1`` cho các user còn lại
  - ``chmod u+x file1``

![img](https://scontent.fhan5-6.fna.fbcdn.net/v/t1.15752-9/61999114_2248958918492334_3947338028950749184_n.png?_nc_cat=102&_nc_oc=AQmFUKlET09xT3HrglRGOB38QamcLArb3Un8WnRJ-vDvfhY1BncXhbcWdU6Hwx6k_88&_nc_ht=scontent.fhan5-6.fna&oh=52c6be58a4df62c70f4c35ac8790c5d9&oe=5D913A29)

- 755 là quyền mặc định dành cho folder.
- Dùng cách này nhanh và thường dùng hơn cách biểu diễn quyền theo ký tự ở trên. 
  
  - Ví dụ hiện tại quyền của file abc.txt là rw-r-xr-x, nó có thể biểu diễn theo số

``rw- = 4+2 = 6``
``r-x = 4+1 = 5``
``r-x = 4+1 = 5``

- Muốn thêm quyền chạy cho owner và quyền ghi cho group owner thì như sau:

`` chmod 775 tên_file``

## References
https://thachpham.com/linux-webserver/phan-quyen-tap-tin-thu-muc-linux.html
# END 

<a name = "Phân Quyền">