<a name="rình Soạn Thảo Vi">


# Trình Soạn Thảo Vi
## 1. Có rất nhiều cách để chỉnh sửa các file trong Unix và đối với tôi, một trong những cách tốt nhất là sử dụng Bộ (Trình) soạn thảo hướng màn hình vi. Bộ soạn thảo này cho bạn có thể chỉnh sửa các dòng trong nội dung với các dòng khác trong file.

- Ấn phím lệnh i hoặc a từ chế độ command mode để chuyển sang insert mode. i để thêm ký tự trước con trỏ, a để thêm ký tự sau con trỏ.
- Sử dụng lệnh h j k l hoặc các phím mũi tên tương ứng để di chuyển con trỏ sang trái, xuống, lên, sang phải.
- Sử dụng x xóa 1 ký tự, dw xóa 1 từ, dd xóa cả 1 dòng.
- Sử dụng số N đi trước phím lệnh để lặp lại N lần tác dụng của lệnh. Ví dụ, 3dw sẽ xóa 3 từ tính từ vị trí con trỏ.
- Sử dụng u ( = undo )để khôi phục lại những thay đổi trước đó.
- Sử dụng ZZ hay :wq lưu lại tất cả thay đổi và thoát.
- Sử dụng :q! thoát ra không lưu lại bất kỳ thay đổi nào.
## 2. Cắt và dán
- yy sao chép dòng hiện tại vào buffer, Nyy sao chép N dòng.
- p ( P ) dán nội dung từ buffer vào dưới ( trên ) dòng hiện tại
## 3. Các lệnh colon ( đi sau dấu : )
```
:set nu :Hiển thị số dòng
:set nonu :Bổ hiển thị số dòng 
:1 : đế dồng thứ 1 :2 :3.....:n
:$ : Nhảy xuống dòng cuối
:dd :Xóa 1 dòng văn bản
:%d xóa cả đoạn văn bản
:d0 : Xóa từ chỗ con trỏ đứng ra đằng trước 
:d$ :Xóa hêt từ chỗ con trỏ đứng đến cuối
:d5k :Xóa 5 dòng bên trên
:j5k :Xóa 5 dòng bên dưới 

```
