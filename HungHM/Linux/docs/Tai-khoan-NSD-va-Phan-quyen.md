<a name ="">

# Tài khoản NSD và phân quyền truy cập tệp

# I.Nội dung
- [1. Khái niệm NSD và nhóm NSD](#1) 
-  [2. Quản lý NSD và nhóm NSD](#2) 
- [3. Quyền truy cập của file,thư mục](#3) 
- [4. Quản lý quyền truy cập](#6)

<a name="1"></a>
## 1.Khái niệm NSD và nhóm NSD
- NSD thông thường 
- Quản trị 
- Nhóm NSD 
-  Tạo một người sử dụng 
    -  Tên, Mật khẩu, home của người sử dụng (/home/tên) 
    -  Nhóm (một người sử dụng có thể thuộc một hoặc nhiều nhóm, tuy nhiên cần phải xác định một nhóm chính) 
    - Tất cả các thông tin về người sử dụng được lưu trong file: /etc/passwd

<a name="2"></a>
 2. Quản lý NSD và nhóm NSD
- Nhóm người sử dụng
  - Mỗi người sử dụng có thể thuộc về một hoặc nhiều nhóm 
    - Một nhóm = tên nhóm + danh sách các thành viên 
    - Khả năng chia sẻ các file giữa những người sử dụng trong cùng một nhóm. 
    - Danh sách các nhóm được lưu trữ trong file: /etc/group 
    - root có khả năng tạo ra các nhóm bổ xung, ngoài các nhóm mà hệ điều hành đã ngầm định

2.1 Công cụ
- useradd/mod/del 
- passwd 
- groupadd/mod/del 
- gpasswd 
- sg/newgrp 
- su 
- users/groups 
- id

<a name="3"></a>
3. Quyền truy cập của file

3.1 Các quyền
- Mỗi file luôn thuộc về một người sử dụng và một nhóm xác định 
    - Người tạo ra file hoặc thư mục sẽ là người sở hữu, nhóm chứa người tạo ra file hoặc thư mục sẽ là nhóm sở hữu đối với file/thư mục. 
 - Sự phân quyền cho phép xác định rõ các quyền mà người sử dụng có đối với một file hoặc một thư mục.

3.2 Quyền truy cập
- `r` : đọc 
    - Cho phép hiển thị nội dung của file hoặc thư mục 
- `w` : ghi 
    - Cho phép thay đổi nội dung của file 
    - Cho phép thêm hoặc xóa các file trong một thư mục 
- `x` : thực thi 
    - Cho phép thực thi file dưới dạng một chương trình 
    - Cho phép chuyển đến thư mục cần truy cập

3.3 Các nhóm người sử dụng
- Có 3 nhóm người sử dụng đối với 1 file/ thư mục: 
    - u (người sở hữu) : người sở hữu duy nhất của file 
    - g (groupe) : những người sử dụng thuộc nhóm chứa file  
    - o (others) : những người sử dụng khác, không phải là người sở hữu file cũng như không thuộc nhóm chứa file. 
- Mỗi nhóm người sử dụng sẽ có một tập các quyền (r, w, x) xác định.

<a name="4"></a>
4. Quản lý quyền truy cập

4.1. Thay đổi quyền truy cập
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