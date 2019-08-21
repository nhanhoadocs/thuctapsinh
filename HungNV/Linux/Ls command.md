# Ls command

## Ls là gì?
**ls là lệnh liệt kê thông tin các tệp và thư mục. Liệt kê các quyền,tên của user group sở hữu, ngày giờ sửa đổi của tệp/thư mục.  Được sử dụng phổ biến và thường xuyên trong linux .**

## Cú pháp
**ls [Tùy chọn] [tập tin]**

## Các tùy chọn
 **-a, --all :  liệt kê các mục bắt đầu bằng .**  
<img src="https://i.imgur.com/CVUH5JU.png">  

**ls -x : sắp xếp đầu ra tệp theo thứ tự bảng chữ cái**
<img src="https://i.imgur.com/WuU6Erz.png">

**ls -t : sắp xếp tệp mới sửa đổi theo thời gian**
<img src="https://i.imgur.com/deC5of5.png">

**ls -l : hiển thị các file và thư mục, các phân quyền, kich thước( file/forder), ngày sửa đổi, chủ sở hữu, tên file hoặc thư mục**
<img src="https://i.imgur.com/5CZi683.png">

**ls -F : chỉ ra loại tệp:**  
-  @ : là 1 symbol link     
*  (*) : là 1 thực thi    
-  | : chỉ ra 1 đường ống được đặt tên    
-   / : là 1 thư mục        

<img src="https://i.imgur.com/W4ACnRH.png">

**ls --format=text**   
* text = across -x = commas -m = horizotal -x = log -l = siggle-colum -1 = verbose -l = vertical -c.  
   *  -1 : liệt kê các mục ra 1 cột duy nhất  
   *  -C : liệt kê các mục theo cột ( nhiều cột )  
   
<img src="https://i.imgur.com/mSJcyXv.png">

**ls --hide=*.mbr : ẩn 1 loại tệp cụ thể ở đầu ra , cụ thể ở đây là mbr**
<img src="https://i.imgur.com/5132MOk.png">

**ls -l -author : hiển thị tên tác giả mỗi tập tin**
<img src="https://i.imgur.com/QXVk3An.png">

**ls -lt : hiển thị các file và thư mục, các phân quyền, chủ sở hữu, kích thước(file/forder), sắp xếp theo thứ tự ngày giờ sửa đổi**
<img src="https://i.imgur.com/KgijdYF.png">

**ls -n : hiển thị số UID (định danh người dùng)  và GID (định danh nhóm).** Có thể hiểu về UID và GID trong đường link sau: [UID and GID](https://geek-university.com/linux/uid-user-identifier-gid-group-identifier/)
<img src="https://i.imgur.com/UMjxurq.png">

**ls -li : hiển thị số inode thành định dạng danh sách dài**
<img src="https://i.imgur.com/oRm9cwg.png">

**ls -R : liệt kê danh sách các cây thư mục, chỉ ra đường dẫn từng thư mục**
<img src="https://i.imgur.com/QXBdHzV.png">

**ls -l [thư mục] : hiển thị danh sách thông tin thư mục được trỏ đến**
<img src="https://i.imgur.com/oLOJEDV.png">

**ls -l -h : hiển thị	danh sách dài ở dạng kich thước con người có thể hiểu**
<img src="https://i.imgur.com/U826J0k.png">

**ls --version : kiểm tra phiên bản của lệnh**
<img src="https://i.imgur.com/HXU1qmy.png">

### Ẩn danh cho 1 lệnh : 
**alias [tên ẩn danh="lệnh cần ẩn danh"]**
<img src="https://i.imgur.com/d3U1l69.png">

**xóa ẩn danh** **:**  
  - **unalias [tên ẩn danh]**  
<img src="https://i.imgur.com/pCgc7cQ.png">

**alias : kiểm tra các lệnh ẩn danh**
<img src="https://i.imgur.com/KzdF5jm.png">