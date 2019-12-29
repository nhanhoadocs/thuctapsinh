## Tìm hiểu các lệnh làm việc với log  

### 1. tail  
- Lệnh `tail` dùng để in ra màn hình một số dòng cuối cùng của file (mặc định là 10 dòng).  
Cú pháp:  
```
tail /path/to/file
```  
Ví dụ: Mặc định in ra 10 dòng cuối cùng của file `messages` sau đó thoát.  
```
tail /var/log/messages
```

<img src="https://i.imgur.com/RvLefMt.png">  

- In ra số dòng cuối nhất định của file  
```
tail -n <number_of_lines> /path/to/file  
```  
Ví dụ in ra 3 dòng cuối của file `messages`  
<img src="https://i.imgur.com/XxmVOjE.png">  

- Chúng ta có thể mở nhiều file và thực hiện in ra các dòng cuối của các file   
```
tail -n <number_of_lines> <name_file_1> <name_file_2 
```
<img src="https://i.imgur.com/Yv4BqAa.png">

 Tùy chọn `-f` cho phép bạn theo dõi file liên tục. Nó sẽ bắt đầu in thêm các dòng trên bảng điều khiển được thêm vào tệp sau khi nó được mở. Lệnh này sẽ giữ tệp mở để hiển thị các thay đổi được cập nhật cho đến khi người dùng ngắt lệnh.  
 `-f --follow` : xuất ra các file liên tiếp theo chỉ định và theo dõi realtime ( có bất kỳ thay đổi gì sẽ show ra màn hình .Kết thúc khi ta thoát (Ctrl+C)

<img src="https://i.imgur.com/5OAzST4.png">  

- `-c`: Tùy chọn in ra số bytes của file  
```
tail -c <number of bytes> /path/to/file  
```  
Ví dụ:  
<img src="https://i.imgur.com/84egZqe.png">  

### 2. Tailf  
Tương tự như `tail -f`  
Cú pháp:  
```
tailf [option] file
```  
Các tùy chọn:  
- `-n`: in ra số dòng nhất định  
- `-NUMBER`: tương tự như `-n`  
 

