# Setup centos7 trong VMware

- Cần chuẩn bị các mục sau 

	- file iso centos7
	
	- tạo một file để lưu trữ máy ảo 
	
- Vào file chọn New machine để tạo một máy ảo mới 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_1.png)

- sau rồi hiện lên một bảng như sau 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_2.png)

	- Dùng để chọn cấu hình mà bạn muốn rồi ấn next

		- Typical: tạo một máy ảo trong một vài bước đơn giản 
	
		- Custom : tạo máy kiểu tùy chọn nâng cao 
	
-	Sau đó sẽ hiện ra bảng để chọn các cài đặt Do đã chuẩn bị file iso nên ta chọn cài đặt bằng file iso 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_3.png)

- sau đó sẽ hiện ra bảng để ta chọn loại máy ảo và nơi lưu trữ máy ảo chính là thư mục mà ta đã tạo ra ở ban đầu.

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_4.png)

- Ta sẽ chọn bộ nhớ cho máy ảo 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_20.png)

	- Ta có 2 mục để chọn ở đây:

		- store virtual: tao một máy ảo bằng 1 file
		
		- split virtual: Tạo máy ảo thành nhiêu file việc này sẽ giúp máy ảo chạy nhanh hơn 

- Rồi ta chọn customize hardware để tùy chọn cài đặt máy ảo 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_5.png)

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_6.png)

- Đây là bảng ta dùng để cài đặt tùy chọn cho máy ảo 

	- memory :Bộ nhớ máy tính (RAM) có thể là 1GB 2 hay 4 tùy thuộc vào chúng ta lựa chọn 
	
	-processors: bộ xử lý 
	
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_13.png)

	- trong mục processors thì ta có
		- Number of processors : số CPU
		
		- Number of cores per processors: số core trong một CPU
		
		- Total processors core:  tổng bộ vi xử lý
		
	- virtualization engine: Công cụ ảo hóa
	
		-

	- CD/DVD: ổ đĩa 
	
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_14.png)

		- Use iso image file: sử dụng file iso nào để tạo máy ảo 
	
	- network mạng 
	
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_15.png)

	- Ở đây có 3 cách chọn kiểu kết nối card mạng cho máy ảo là Bridged NAT và Host-only

		- Bridged máy ảo sẽ được cấp 1 địa chỉ có cùng subnet với máy thật.	

		- NAT sẽ có 1 card mạng ảo cho máy ảo này và nó phải thực hiện kỹ thuật NAT để kết nối ra bên ngoài`

		- Host-only máy ảo chỉ có thể giao tiếp với máy thật đang mà nó đang chạy trên đó chứ ko thể truy cập ra ngoài mạng.
	
	- USB
	
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_16.png)
	
	- souncard
	
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_17.png)
	
	- printer
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_18.png))
	
	- Display
	
![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_19.png)
	
	
- Sau khi cài xong ta bắt đầu cho máy ảo chạy 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_7.png)

- khi chạy xong ta chọn Install centos7

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_8.png)

- Chọn ngôn ngữ và ngôn ngữ hỗ trợ 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_9.png)

- Khi bảng này hiện ra ta cần cài đặt ngày giờ và mạng cho máy ảo 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_10.png) 

- Đến đây ta cài đặt mật khẩu cho root và tạo user cho máy ảo 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_11.png) 

- Sau khi đợi được máy ảo cài đặt xong thì ta ấn reboot  để vào trong máy ảo 

![](https://github.com/duckmak14/anh/blob/master/setup_centos7/Screenshot_12.png)0 

- Ta cần đăng nhập cho máy là có thể sử dụng được máy ảo centos7