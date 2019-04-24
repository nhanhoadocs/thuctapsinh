Đề bài: Có một máy client và nhiều máy server. Có một file có pass; địa chỉ ip; và user của các server. Viết một chương trình bashshell để tạo ra genkey và đẩy key lên các server sao cho sử dụng được kết nối ssh. 
- Trong file gồm 
    - pass: anhduc
    - ip1: 192.168.54.134
    - ip2: 192.168.54.135
    - user: root    
#!/bin/sh

cat file ( đọc file lưu địa chỉ ip và pass)

echo "nhap ip cua server 1:"

read ip1 # 

echo "nhap ip cua server 2:"

read ip2 # 

grep "anhduc" file > pass_file

echo " user dang nhap" 

read user # 

sshpass -f pass_file ssh-copy-id -i .ssh/id_rsa.pub $user@$ip1 (truyền key bằng lệnh)

sshpass -f pass_file ssh-copy-id -i .ssh/id_rsa.pub $user@$ip2

# Note: có bao nhiêu địa chỉ ip thì làm tương tự chỉ thêm ip
