# 1 Khái niệm password aging 
- Đây là phương pháp để nhắc nhở người dùng thay đổi pass sau một khoảng thời gian đã được đặt trước. 
- Ta có thể kiểm tra thông tin về mật khẩu của một user 
- Cách đọc thông số của bảng 
    - Dòng 1 : thay đổi mật khẩu lần cuối
    - Dòng 2 : Mật khẩu hết hạn 
    - Dòng 3 : Mật khẩu không hoạt động 
    - DÒng 4 : Tài khoản hết hạn 
    - Dòng 5: số ngày tối thiểu giữa các lần thay đổi mật khẩu 
    - Dòng 6: Số ngày tối đa giữa các lần thay đổi mật khẩu 
    - Dòng 7: số ngày cảnh báo trước khi mật khẩu hết hạn 
![](https://github.com/duckmak14/linux/blob/master/security/pass_spc/Screenshot%20from%202018-12-19%2008-49-24.png)
# 2. Các option của lệnh `chage`
![](https://github.com/duckmak14/linux/blob/master/security/pass_spc/Screenshot%20from%202018-12-19%2008-58-49.png)
- `-d` : Đặt ngày thay đổi mật khẩu 
- `-E` : Đặt ngày hết hạn tài khoản 
- `-h` : hiển thị hỗ trợ 
- `-l` : hiển thị thông tin tài khoản 
- `-m` : đặt số ngày tối thiểu thay đổi mật khẩu
- `-M` : Đặt số ngày tối đa thay đổi mật khẩu 
- `-W` : đặt ngày cảnh báo hết hạn 
- ví dụ: thay đổi ngày hết hạn tài khoản 
![](https://github.com/duckmak14/linux/blob/master/security/pass_spc/Screenshot%20from%202018-12-19%2008-51-56.png)
# 3. Khái niệm lệnh SCP 
- Lệnh `scp`: viết tắt của secure copy là một ứng dụng sử dụng giao thức ssh thường để copy dữ liệu từ máy tính này sang máy tính khác 
- Cách cài đặt `scp`
    - Trong ubuntu 
    ```
    apt-get install scp 
    ```
    - Trong centos
    ```
    yum install scp 
    ```
- Cú pháp lệnh 
```
scp (file) user@IP:(địa chỉ tuyệt đối)
```
- ![](https://github.com/duckmak14/linux/blob/master/security/pass_spc/Screenshot%20from%202018-12-19%2009-22-45.png)

- file: là file mà ta muốn copy sang máy khác 
- user@IP : là user và địa chỉ máy ta muốn copy tới 
- (địa chỉ tuyệt đối ): địa chỉ của thư mục ta copy tới
# 4. Một số option của lệnh 
- Copy nhiều file 
```
scp (file1 file2 file3) user@IP:(địa chỉ tuyệt đối)
```
- `-r` : copy toàn bộ thư mục 
- `-C` : nén file trước khi chuyển và giải nén sau khi chuyển 
- `-l` : giới hạn băng thông tối thiểu cho việc gửi file đơn vị kbit/s
- `p`  : giữ nguyên các thuộc tính của file 