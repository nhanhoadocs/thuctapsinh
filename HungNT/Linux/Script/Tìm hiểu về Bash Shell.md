# TÌM HIỂU VỀ BASH SHELL  
**1. Định nghĩa :**  
- Bash là một ngôn ngữ biên dịch , được sử dụng rộng rãi trên các hệ thống và nhiều nhất là trên GNU/Linux system . Bash viết tắt cho **Bourne-Again-Shell** 
- Shell là môi trường giao tiếp với người dùng (Terminal). Có nghĩa là shell chấp nhận các lệnh từ bạn (keyboard) và thực thi nó. Nhưng nếu bạn muốn sử dụng nhiều lệnh chỉ bằng một lệnh, thì bạn có thể lưu chuỗi lệnh vào text file và bảo shell thực thi text file này thay vì nhập vào các lệnh. Điều này gọi là shell script.

- Shell script là một chuỗi các lệnh được viết trong plain text file. Shell script giúp thực hiện tự động các lệnh cần làm .

**2. Đuôi file và quyền truy cập :**  
 - File script nên để đuôi .sh .  
- Khi tạo ra file script cần lệnh chmod +x filename để cấp quyền thực thi file .  

Lưu ý : Giả sử ta tạo một file task.sh.Trước khi viết script ,ta cần thông báo hệ thống là shell script sẽ được bắt đầu .Trước mỗi file script sẽ có dòng #!/bin/sh .Đây là một shebang construct. Thông báo cho hệ thống rằng các lệnh sau sẽ được thực thi bởi Bourne Shell.   
VD : File task.sh  
```
#!/bin/bash
date
cal
pwd
ls

```

**3. Biến :**  
- Tên biến gồm các chữ  (a - z , A - Z), số  ( 0 - 9) hoặc dấu gạch dưỡi ( _) .Thường  các biến trong bash shell sẽ được viết hoa  .   
VD :  Các cách đặt tên sau là đúng  
```
_ALI
TOKEN_A
VAR_1
VAR_2
``` 

- Không được sử dụng các kí tự  !, *, - vì chúng có tác dụng riêng trong shell .   
VD : Các cách đặt tên sau là sai 
```
2_VAR
-VARIABLE
VAR1-VAR2
VAR_A!
```

- Sau khi đặt giá trị cho biến , muốn truy cập chúng phải có dấu $ trước tên biến : 
```
NAME="Zara Ali"
echo $NAME
``` 


-  Read-only Variables:   
Shell có thể đánh dấu biến là read-only. Sau khi được đánh dấu biến đấy không thể thay đổi được.

```
#!/bin/sh

NAME="Zara Ali"
readonly NAME
```
- Unsetting Variables

Khi đánh dấu biến là unset , không thể truy cập dữ liệu của biến .  
- Variables Types:  
Khi shell đang chạy , có 2 loại biến chính :

    - Local Variables (Shell Variables)− A local variable is a variable that is present within the current instance of the shell. It is not available to programs that are started by the shell. They are set at the command prompt.

    - Environment Variables − An environment variable is available to any child process of the shell. Some programs need environment variables in order to function correctly. Usually, a shell script defines only those environment variables that are needed by the programs that it runs.


