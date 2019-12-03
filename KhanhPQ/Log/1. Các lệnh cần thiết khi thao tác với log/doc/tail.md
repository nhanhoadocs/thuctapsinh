## 1) Tail

![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/tail%20tailf/1.png)

default sẽ show ra 10 dòng cuối của file

Chú ý: Lệnh tail -f  rất hữu ích khi dùng để theo dõi trực tiếp các file log.
$tail [OPTION]... [FILE]...

-c	--bytes K	: xuất ra K bytes cuối cùng của file

	-c -K		: xuất ra K bytes cuối cùng của file

	-c +K		: xuất ra các bytes đằng sau K bytes đầu tiên của file
 

-f	 --follow		: xuất ra các file liên tiếp theo chỉ định và theo dõi realtime ( có bất kỳ thay đổi gì sẽ show ra màn hình .Kết thúc khi ta thoát (Ctrl C)

-F
 
 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/tail%20tailf/2.png)

 ![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/tail%20tailf/3.png)

-n	 --line=K	:Xuất ra K dòng cuối cùng của file

	-n –K		: Xuất ra K dòng cuối cùng của file

	-n +K		: Xuất ra các dòng phía sau K dòng đầu tiên của file
có thể kết hợp cùng 
	--pid=PID	: kết hợp cùng –f để theo dõi 1 process ID cho đến khi PID died 
 
![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/tail%20tailf/4.png)

-q	: Không hiện tiêu đề file
 
![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/tail%20tailf/5.png)

Ngoài ra còn có các option như

-s	--sleep-interval=N	: có thể đi kèm vs  -f  để kiểm tra

v	--verbose            hiển thị cả file name

--help     hiển thị các giúp đỡ (thông tin) về lệnh tail 

--version  hiển thị version


## 2) tailf

tương tự tail –f

Usage:

 tailf [option] file

Options:

 -n, --lines NUMBER  output the last NUMBER lines

 -NUMBER             same as `-n NUMBER'

 -V, --version       output version information and exit

 -h, --help          display this help and exit
 
![EX](https://github.com/PhamKhahn/Tong-hop-Note/blob/master/Log/1.%20C%C3%A1c%20l%E1%BB%87nh%20c%E1%BA%A7n%20thi%E1%BA%BFt%20khi%20thao%20t%C3%A1c%20v%E1%BB%9Bi%20log/img/tail%20tailf/6.png)