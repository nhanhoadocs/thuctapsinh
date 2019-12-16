# Tìm kiếm 1 đối tượng trong hệ thống (file,folder)

## Cú pháp:	find <đường dẫn> <option>
đường dẫn có thể điền nhiều đường dẫn
-name 		: Tìm kiếm theo chuỗi định sẵn

 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/1.png)

Ta thấy là lệnh find còn tìm kiếm cả trong các subfolder

-type			: chỉ định loại đối tượng tìm kiếm(chủ yếu f và d)

		f 	:file
		d	:directory
		b      block (buffered) special
         		c      character (unbuffered) special
              	p      named pipe (FIFO)
              	l      symbolic link; this is never true if the -L option or the -follow option is in effect, unless the symbolic link is broken.
                     If you want to search for symbolic links when -L is in effect, use -xtype.
              	s      socket
              	D      door (Solaris)
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/2.png)

-user		: Tìm kiếm theo chủ sở hữu
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/3.png)

-group 		: Tìm  kiếm theo nhóm sở hữu
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/4.png)
 
-perm			: Tìm kiếm theo mức phân quyền

  ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/5.png)
  ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/6.png)

-empty		: Tìm kiếm đối tượng trống

 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/7.png)

 -mtime		: Tìm kiếm theo khoảng thời gian được sửa đổi (ngày)
Tìm đối tượng được sửa đổi trong khoảng 2 – 6 ngày
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/8.png)

-cmin		:Tìm kiếm các đối tượng được tạo trong 1 khoảng thời gian

![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/9.png)

Tìm kiếm đối tượng được tạo trong khoảng 1 ngày trước và 0.1 ngày trước (2,4 tiếng)
 

## Tìm kiếm nâng cao, kết hợp với lệnh khác (rm, exec, cp, grep,..)
1.Tìm và xoá file có dung lượng trên 100M
### find / -size +100M -exec rm -rf {} \;
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/10.png)

Note: khi xóa cần chú ý lệnh find tìm kiếm trong cả các subfolder nên hay cân nhắc việc xóa file.Tránh trường hợp bị xóa các file quan trọng

2.Tìm và chmod 644 file có phần mở rộng là .html
### find /usr/local -name "*.html" -type f -exec chmod 644 {} \; 
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/11.png)

3.Tìm file có phần mở rộng là .mp3 và copy file đó đến thư mục /tmp/MusicFiles
### find . -type f -name "*.mp3" -exec cp {} /tmp/MusicFiles \;
 
![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/find/12.png)



4.Tìm file có chứa nội dụng vinahost
### find /home -type f -exec grep -l 'vinahost' {} \;


5.Tìm file theo tên hoặc phần mở rộng hoặc kích thước (-o = OR)
### find / \( -name '*.txt' -o -name 'doc*' -o -size +5M \)


