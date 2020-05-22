# Cài đặt Server2012 R2 trên WebvirtCloud  
- Tạo disk để gắn máy ảo

<img src="https://i.imgur.com/lQltBvW.png">  

- Tạo mới một Instance  

<img src="https://i.imgur.com/fDGjHDW.png">  

- Điền các thông số cần thiết rồi chọn Create  

<img src="https://i.imgur.com/lqr5EEF.png">  

- Moutn disk hỗ trợ file iso để cài đặt và file virtio để cài máy ảo trên Windows  

<img src="https://i.imgur.com/umhrinn.png">  

- Vào mục Boot để gắn các ổ cần thiết  

<img src="https://i.imgur.com/q8N0gRd.png">  

- Quay trở lại Power chọn Power On  

<img src="https://i.imgur.com/TXiQyUt.png">  

- Vào Access chọn Console  

<img src="https://i.imgur.com/nb2AJmK.png">  

**Bắt đầu quá trình cài đặt**  
- Chọn ngôn ngữ (để mặc định là tiếng Anh) 

<img src="https://i.imgur.com/HoDygD2.png">  

- Chọn `Install now` để cài đặt  

<img src="https://i.imgur.com/F2cR41H.png">  

- Chọn OS phù hợp  

<img src="https://i.imgur.com/hPeiTcL.png">  

<img src="https://i.imgur.com/JLIJHcD.png">  

- Chọn Install Windows only (advanced)

<img src="https://i.imgur.com/hAD24dY.png">  

- Tải driver hỗ trợ ảo hóa  

<img src="https://i.imgur.com/KIwnrKD.png">  
<img src="https://i.imgur.com/2ca1U6T.png">  
<img src="https://i.imgur.com/Kv9AfER.png">

- Đợi một lúc cho máy tự cài các gói cần thiết  

<img src="https://i.imgur.com/TW31Izq.png">  

- Sau khi cài đặt xong máy ảo thì tắt đi (Power Off), quay trở lại Instance trên WebvirtCloud và Umount file cài đặt iso   

<img src="https://i.imgur.com/Cv6VUeS.png">  

- Tiếp tục Power On máy ảo và thiết lập mật khẩu đăng nhập cho Administrator  

<img src="https://i.imgur.com/HvkmULs.png">  

- Cài đặt driver cho card mạng  

<img src="https://i.imgur.com/MBMN2d8.png">  

Sau đó kiểm tra lại ip đã được cấp chưa. Có thể đặt lại IP tĩnh, tắt firewall, bật remote desktop và cài đặt các chương trình, ứng dụng mà bạn muốn.  