Cấu hình cơ bản đề mở phiên kết nối SSH trên Router
à Mở phiên SSH trên R1

Bước 1:   R1(config)#username abc password ha {Tạo username là “abc” và password là “ha” cho user đăng nhập vào Router}

Bước 2:   R1(config)#ip domain-name abc.com {Cấu hình thông số ip domain-name}

Trên các thiết bị Cisco, mặc định sử dụng thuật toán RSA để mã hóa dữ liệu. Thuật toán RSA đòi hỏi phải có 2 thông tin : hostname, ip domain-name.

Bước 3:   R1(config)#crypto key generate rsa {Tạo ra cặp khóa “Public/ Private” để mã hóa dữ liệu bằng RSA}

Mặc định mã hóa với 512 bit, tối đa 2048 bit (nhập vào khi cấu hình)

Hoặc dùng luôn câu lênh sau:

R1(config)#crypto key generate rsa general-keys modulus 1024

Bước 4:   R1(config)#ip ssh version 2 {Bậc tính năng SSH, dùng SSH version 2}

Bước 5:   R1(config)#ip ssh authentication-retries 3 {Cấu hình tùy chọn – số lần nhập username và password sai, ở đây là 3 lần}

R1(config)#ip ssh time-out 100 {Cấu hình tùy chọn – thời gian chờ để nhập username và password, ở đây là 100 giây}

Nếu thời gian cấu hình là 120 giây thì dùng lệnh show running-config sẽ không hiển thị lên.

Bước 6:   R1(config)#line vty 0 4

R1(config-line)#transport input ssh {áp SSH vào VTY}

R1(config-line)# login local

Từ R0 SSH tới R1

Router#ssh –v [version] –l [username] –c [encryption] –m [hashing] [ip]

VD: R0#ssh -v 2 -l abc -p ha 192.168.1.2

Hoặc: R0#ssh -l abc –v 2 192.168.1.2

Rồi sau đó nhập password được yêu cầu

Mô hình mạng
Cấu hình SSH cơ bản

Cấu hình cơ bản (hostname, password…)
Đặt IP như mô hình, cấu hình định tuyến đảm bảo mạng hội tụ
Cấu hình SSH trên Router R1 và R2
Capture lại thông tin
à Cấu hình SSH trên R1

R1#configure terminal

R1(config)# username abc password abc

R1(config)#ip domain name abc.com

R1(config)#crypto key generate rsa general-keys modulus 1024

R1(config)# ip ssh version 2

R1(config)# ip ssh authentication-retries 3

R1(config)# ip ssh time-out 100

R1(config)# line vty 0 4

R1(config-line)# transport input ssh

R1(config-line)# login local

R1(config-line)# exit

à Cấu hình SSH trên R2 (Cấu hình tương tự R1)

R2#configure terminal

R2(config)# username abc123 password abc123

R2(config)#ip domain name bcd.com

R2(config)#crypto key generate rsa general-keys modulus 1024

R2(config)# ip ssh version 2

R2(config)# ip ssh authentication-retries 3

R2(config)# ip ssh time-out 100

R2(config)# line vty 0 4

R2(config-line)# transport input ssh

R2(config-line)# login local

R2(config-line)# exit

Từ PC dùng putty để kết nối đến R1

Nhập IP của R1 và click Open

Cấu hình SSH cơ bản

Chấp nhận key được tạo thông qua thuật toán RSA để tạo kết nối SSH.

Nhập Username và password

Từ R1 kết nối tới R2 : 

R1#ssh -l ngocdai123 –v 2 12.0.0.2