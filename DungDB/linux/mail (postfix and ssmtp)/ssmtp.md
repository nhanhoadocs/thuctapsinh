# SSMTP gửi mail với gmail

Docs: https://wiki.archlinux.org/index.php/SSMTP

Cài đặt trên Ubuntu

    sudo apt-get install ssmtp mailutils

Cài đặt trên Centos 7

    yum install epel-release -y
    
    yum install ssmtp -y

Nếu gặp lỗi “Package ssmtp is not available” thì thêm dòng

    yum --enablerepo=extras install epel-release

Đặt hostname trước:

    nano /etc/hosts

Sửa hostname

    reboot

Sửa file `/etc/ssmtp/ssmtp.conf`

    sudo nano /etc/ssmtp/ssmtp.conf

Sửa và thêm các dòng
```
root=test@gmail.com #mail bạn dùng để gửi mail
mailhub=smtp.gmail.com:587
hostname=smtp.gmail.com:587
UseSTARTTLS=YES
AuthUser=test@gmail.com #mail bạn dùng để gửi mail
AuthPass=password   #mật khẩu email ở trên
FromLineOverride=YES
```

Đăng nhập vào tài khoản mail ở trên. Vào trang https://myaccount.google.com/security

Sửa chỗ trong hình từ **Đang tắt** thành **Đang bật**

![Imgur](https://i.imgur.com/Q7jtrMg.png)

Mở file `/etc/ssmtp/revaliases`

    nano /etc/ssmtp/revaliases

Thêm dòng

    root:test@gmail.com:smtp.gmail.com:587  #tên email bạn dùng để gửi mail

Thử gửi 1 mail đến dungz1207@gmail.com

    sendmail -v dungz1207@gmail.com

Nhập nội dung email và kết thúc bằng dấu chấm.

Gửi bằng tổ hợp Ctrl + D.

Kết quả nhận được:

![Imgur](https://i.imgur.com/Ea26gui.png)

Mail đã được mã hóa nên sẽ không bị gửi đến mục thư rác.

## Các cách gửi mail

**Cách 1:**

Trên terminal

    # echo -e "Subject: this is the subject\n\nthis is the body" | mail user@example.com

**Cách 2:**

Cách khác (Đã test, không thêm được tiêu đề)

    # sendmail username@example.com
    Subject: this is my subject
    CC: optional@example.com

    Now I can type the body here

**Cách 3:**

Còn một cách nữa là tạo một file text và gửi nội dung file

Tạo file `test-mail.txt` có nội dung

    To:username@example.com
    From:youraccount@gmail.com  #Nếu cấu hình nhiều user gửi mail thì chỉ định mail gửi với dòng From
    Subject: Test

    This is a test mail.
    Send the test-mail.txt file

Gửi mail

    # sendmail -t < test-mail.txt