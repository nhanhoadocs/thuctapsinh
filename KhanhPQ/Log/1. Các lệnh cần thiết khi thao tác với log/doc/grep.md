# grep [option] file

-i 	: không phân biệt hoa thường

-v 	: Tìm những dòng không chứa chuỗi (tìm kiếm ngược)

-n	: Hiển thị số dòng

-c	: Đếm số dòng khớp

-m	: giới hạn số dòng kết quả khớp
 
![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/1.png)

![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/2.png)


## Tìm kiếm nhiều chuỗi	

•	Cách 1: grep -e "word1" -e "word2" file

•	Cách 2: grep "word1\|word2" file

•	Cách 3: egrep "word1|word2" file 
 
  ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/3.png)

   ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/4.png)













## Tìm kiếm kết hợp hiển thị tên tệp

-l 	: tìm kiếm ,hiển các file chứa chuỗi

-L	:tìm hiếm.hiển thị các file không chứa chuỗi

-h	: hiển thị dòng chứa

-H	: hiển thị dòng chứa và trên file chứa

 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/5.png)










## Hiển thị thêm dòng trước, sau, xung quanh dòng chứa kết qủa cần tìm.

grep -<A, B hoặc C> <n> "chuoi" <file>

Trong đó:

•	A : hiển thị dòng sau dòng khớp với kí tự cần tìm

•	B : hiển thị dòng trước dòng khớp với kí tự cần tìm

•	C : hiển thị dòng xung quanh dòng khớp với kí tự cần tìm

•	n : là số tự nhiên chỉ định xem hiển thị trước, sau hay xung quanh bao nhiêu dòng
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/6.png)

## Tìm chính xác với -w

khớp với 1 single word 
 
  ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/7.png)

## -R

Tìm tất cả các file trên cả thư mục con và thư mục cha 

 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/8.png)
 

## Mở rộng nâng cao, kết hợp các tùy chọn

 ### Tìm kiếm dựa trên output của lệnh trước làm input của lệnh sau sử dụng “|“
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/9.png)

  ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/10.png)

 

grep -Rin 'error' /var/log/ 

VD này sẽ tìm kiếm tất cả những file có chứa “error” và hiển thị tên file, số dòng, kể cả thư mục con năm trong thư mục log.


### Loại bỏ các comment khi xem file cấu hình 
 
egrep -v "^#|^*#|^$" tên_file

•	^#  không hiện Những dòng bắt đầu bằng #

•	^*#  không hiện Những dòng bắt đầu bằng # kể cả khoảng trống 
trước nó

•	^$  không hiện Những dòng trống


 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/grep/11.png)
