# Trình soạn thảo Vim 
##  Cài đặt Vim
Để cài đặt vim ta dùng lệnh:
```
sudo apt-get install vim
```
##  Tính năng vi cơ bản 
Trong vi bạn có thể sử dụng 3 chế độ:
1. Chế độ lệnh. Bạn bắt đầu trong chế độ này và có nhiều chức năng như sao chép và dán hoặc xóa văn bản. Quay trở lại nó từ các chế độ khác bằng phím ESC
2. Chế độ chèn. Chế độ để thực sự chèn tekst. Bạn có thể vào chế độ này theo nhiều cách khác nhau, thường xuyên nhất thông qua các phím i, a, I hoặc A trong chế độ lệnh
3. Chế độ dòng cuối cùng. Khi bạn nhấn phím: từ chế độ lệnh, bạn sẽ kết thúc ở chế độ dòng cuối cùng. Như với chế độ lệnh, bạn có thể sử dụng điều này theo nhiều cách khác nhau. Đơn giản là bỏ và tiết kiệm chủ yếu được sử dụng ở đây.
## Khởi động Vim
Để sử dụng VIM, các bạn chỉ việc mở Terminal ra và gõ:

```
vim
```
Hoặc nếu bạn muốn mở một file bất kì bằng VIM:
```
vim "tên file"
```
## Di chuyển con trỏ trong file 
- Để dịch chuyển nhanh về đầu hoặc cuối dòng, ta có các phím $ và 0:  
$ -- Nhảy về cuối dòng hiện tại
- Để dịch chuyển nhanh về đầu hoặc cuối file, ta có các phím G và gg:  
gg -- Nhảy lên đầu file  
G  -- Nhảy xuống cuối file
- Để highlight nội dung trong VIM, ta có các phím v hoặc V (Shift + v)  
v   -- highlight một vùng được chọn bằng phím H/J/K/L  
V   -- Chọn nhanh dòng hiện tại  
vap -- Chọn đoạn văn bản hiện tại  
gVG -- Chọn toàn bộ file
- Tìm kiếm nội dung trong file:  
/  -- Tìm trong file từ vị trí con trỏ xuống dưới  
?  -- Tìm trong file từ vị trí con trỏ trở lên
n  -- Tiếp tục tìm kiếm với nội dung hiện tại  
Các lệnh lưu và thoát Vim:  
:q  -- Thoát khỏi Vim  
:q! -- Thoát không cần lưu  
:w  -- Lưu file  
:w! -- Ghi file  
:wq -- Lưu file rồi thoát  
:set nu hiện thị số dòng  
:set nonu bỏ hiện thị số dòng  
Sử dụng phím mũi tên hoặc các phím h,l,j,k để dịch trái, phải. lên, xuống  
:1 để nhảy đến dòng đầu tiên của file  
:n nhảy đến dòng n  
$ nhảy xuống cuối dòng  
:$ nhảy đến dòng cuối của file.  
0 nhảy về đầu dòng  
:0 nhảy về dòng đầu tiên của file.   

## Các lệnh chỉnh sửa
dd  -- Xóa dòng (được lưu trong bộ đệm cục bộ)  
3dd -- Xóa 3 dòng (được lưu trong bộ đệm cục bộ)  
D	-- Xóa nội dung của dòng sau con trỏ  
dw  -- Xóa từ  
x   -- Xóa ký tự tại con trỏ  
X	-- Xóa ký tự trước con trỏ  





