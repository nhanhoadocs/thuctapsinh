Tìm hiểu về Vim
================
# Mục lục
- [1.Tổng quan](#1Tổng-quan)
- [2.Một số câu lênh cơ bản](#2Một-số-câu-lệnh-cơ-bản)
    - [2.1.Nhóm lênh di chuyển con trỏ](#2.1Nhó-lênh-di-chuyển-con-trỏ)
    - [2.2.Nhóm lệnh lưu và thoát](#2.2-Nhóm-lệnh-lưu-và-thoát)
    - [2.3.Nhóm lệnh soạn thảo](#2.3Nhóm-lệnh-soạn-thảo)
        - [2.3.1.Lệnh thay thế](#2.3.1Lệnh-thay-thế)
        - [2.3.2.Lệnh chèn](#2.3.2Lệnh-chèn)
        - [2.3.3.Lệnh xoá](#2.3.3.Lệnh-xoá)
        - [2.3.4.Nhóm lệnh Undo](#2.3.4Nhóm-lệnh-Undo)
        - [2.3.5.Nhóm lệnh paste](#1Tổng-quan)
        - [2.3.6.Nhóm lệnh copy](#2.3.6.Nhóm-lệnh-copy)
        - [2.3.7.Nhóm lệnh tìm kiếm](#2.3.7.Nhóm-lệnh-tìm-kiếm)
- [3.Tài liệu tham khảo](#3.Tài-liệu-tham-khảo)
## 1.Tổng quan
Vim (Vi improve) là một bản sao của trình soạn thảo vi đưọc nâng cấp và bổ sung được phảt hành năm 1991.
Nhìn chung, khá giống với vi, vim không sử dụng menu hay icon mà sử dụng câu lệnh nhưng vẫn đảm bảo đầy đủ chức năng.
![images](images/vim01.png "img01")
## 2.Một số câu lệnh cơ bản
Để khởi động Vim, bạn mở **Terminal** và gõ:

>vim "tên file"

Sau đó **Terminal** của bạn sẽ chuyển sang chế độ edit của Vim.
### 2.1.Nhóm lênh di chuyển con trỏ
Song song với việc sử dụng phím mũi tên quen thuộc, người sử dụng có thể sử dụng các phím di chuyển như sau:

||^||||K||
|---|---|---|---|---|---|---|
|<|v|>||H|J|L|

Để hiển thị số dòng và vị trí dòng ma con trỏ đang đứng, nhấn `Ctrl + G`.

Để di chuyển tới 1 dòng bất kì, nhấn theo cú pháp:
```
[Số] + Shift + G
```
### 2.2.Nhóm lệnh lưu và thoát

Khi chưa chắc chắn về bản ghi của mình, bạn có thể huỷ lưu thay đổi và thoái ra ngoài theo lệnh `:q!`

Nếu muốn lưu bản ghi của mình, gõ lệnh `:w`, 
hoặc có thể vừa lưu và thoát `:wq`
### 2.3.Nhóm lệnh soạn thảo
#### 2.3.1.Lệnh thay thế

Để thay thế một kí tự, ta di chuyển con trỏ tới vị trí cần thay thế rồi nhấn `r`.

Để thay thế nhiều từ một lúc, nhấn `Shift r`.

Nếu muốn thay thế nhiều từ giống nhau cùng lúc, ta dùng lệnh:
```
:s/cũ/mới
```
Khi đó, lệnh sẽ tìm kiếm và thay thế cụm từ đầu tiên mà con trỏ đến.

Muốn thay thế toàn bộ dòng, gõ:
```
:s/cũ/mới/g
```
Muốn thay thế trong đoạn nào đó, gõ
```
:<dòng1>,<dòng2>s/cũ/mới/g
```
Muốn thay thế trên toàn bộ file, gõ:
```
:%s/cũ/mới/g
```
#### 2.3.2.Lệnh chèn

Để thực hiện chèn một đoạn văn bản, ta nhấn phím `i` hoặc `insert` trên bàn phím.

#### 2.3.3.Lệnh xoá

Để xoá một kí tự, ta di chuyển tới vị trí con trỏ rồi nhấn `x`.

Để xoá 1 từ (cả khoảng trắng), ta di chuyển con trỏ tới từ cần xoá rồi nhấn `dw`.

Để xoá một từ nhưng không xoá khoảng trắng, ta nhấn `de`.

Để xoá từ vị trí con trỏ đến hết dòng, ta dùng nhấn `d$`.

Để xoá hẳn một dòng, ta nhấn `dd`.

#### 2.3.4.Nhóm lệnh Undo

Để huỷ bỏ câu lệnh vừa thao tác, ta nhấn `u`.

Để phục hồi trạng thái ban đầu của một dòng, ta nhấn `shift u`.

#### 2.3.5.Nhóm lệnh paste

Để thực thiện thao tác cut, ta thực hiện xoá 1 kí tự, từ hoặc dòng bằng phím `d`.

Khi đó những kí tự vừa xoá sẽ được lưu vào bộ nhớ tạm. Để paste ra cho khác, bạn di chuyển con trỏ tới vị trí cần paste rồi nhấn phím `p`.

#### 2.3.6.Nhóm lệnh copy

Để thực hiện copy ta có thể nhấm phím y với các tuỳ chọn sau:
- `ye`: copy từ vị trí con trỏ đến cuối từ.
- `yw`: copy từ vị trí con trỏ đến cuối từ(cả khoảng trắng).
- `y$`: copy từ vị trí con trỏ đến cuối dòng.
- `yy`: copy cả dòng.

Ngoài ra, ta có thể bôi đen nhưng kí tự bằng cách chọn `v` rồi di chuyển con trỏ. Sau đó nhấn `y`.

Sau khi copy, chọn `p` để paste ra vị trí bạn cần.

#### 2.3.7.Nhóm lệnh tìm kiếm

Để thực hiện câu lệnh tìm kiếm, ta nhấn `/` sau đó nhấn từ tìm kiếm. Sau khi tìm thấy, con trỏ sẽ trỏ tớ đầu cụm từ đó. 

Nếu muốn tiếp tục tìm kiếm từ đó, nhấn phím `n`.

Muốn tìm kiếm ngược lại, nhấn phím `?` thay vì `/`.

## 3.Tài liệu tham khảo
https://vi.wikipedia.org/wiki/Vim_(tr%C3%ACnh_so%E1%BA%A1n_th%E1%BA%A3o)

