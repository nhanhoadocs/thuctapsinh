# Git vs Github
## **1) Khái niệm**
### **1.1) Git**            <img src=https://i.imgur.com/gqnk7Q0.png align=right width=25%></p>
- **Git** là tên gọi của một *Hệ thống quản lý phiên bản phân tán* ( **Distributed Version Control System – DVCS** ) , là một trong những hệ thống quản lý phiên bản phân tán phổ biến nhất hiện nay . 
- **DVCS** nghĩa là hệ thống giúp mỗi máy tính có thể lưu trữ nhiều phiên bản khác nhau của một mã nguồn được *nhân bản* ( **clone** ) từ một *kho chứa mã nguồn* ( **repository** ) , mỗi thay đổi vào mã nguồn trên máy tính sẽ có thể *ủy thác* ( **commit** ) rồi đưa lên máy chủ nơi đặt kho chứa chính . Và một máy tính khác ( nếu họ có quyền truy cập ) cũng có thể **clone** lại mã nguồn từ kho chứa hoặc **clone** lại một tập hợp các thay đổi mới nhất trên máy tính kia .
- Trong **Git** , thư mục làm việc trên máy tính gọi là **Working Tree** .
- Lý do nên sử dụng **Git** :
    - **Git** dễ sử dụng , an toàn và nhanh chóng .
    - Có thể giúp quy trình làm việc code theo nhóm đơn giản hơn rất nhiều bằng việc kết hợp các phân nhánh ( **branch** )
    - Có thể làm việc ở bất cứ đâu vì chỉ cần **clone** mã nguồn từ **repository** hoặc **clone** một phiên bản thay đổi nào đó từ **repository** , hoặc một nhánh nào đó từ **repository** .
### **1.2) Github** <img src=https://i.imgur.com/DiHjJDZ.png align=right width=35%></p>
- **Github** chính là một dịch vụ máy chủ **repository** công cộng , mỗi người có thể tạo tài khoản trên đó để tạo ra các kho chứa của riêng mình để có thể làm việc .
- Trang chủ : https://github.com/

    <img src=https://i.imgur.com/bHjC171.png>

## **2) Cài đặt Git trên Linux**
### **2.1) Sử dụng không mã hóa** 
- **B1 :** Cài đặt **Git**
    ```
    # sudo apt-get install git   ( Ubuntu )
    # yum install -y git         ( CentOS )
- **B2 :** Cài đặt thông tin user **Git** :
    ```
    $ git config --global user.name "QuocCuong97"
    $ git config --global user.email "cuongnq24101997@gmail.com"
    ```
- **B3 :** Kiểm tra lại thông tin :
    ```
    # git config --list
    ```
### **2.2) Liên kết mã hóa SSH**
- Tạo **private key** :
    ```
    # ssh-keygen -t rsa
    ```
    <img src=https://i.imgur.com/U0hp7tR.png>

    => Ghi nhớ **passphrase** đã tạo .
    - Kết quả sau khi tạo key :
        ```
        # ls /root/.ssh
        ```
        <img src=https://i.imgur.com/XeBYHSK.png>
    
- Thêm **private key** vào tiến trình **SSH** :
    ```
    # ssh-agent -s
    # ssh-add /root/.ssh/id_rsa
    ```
- Copy **public key**
    ```
    # cat /root/.ssh/id_rsa.pub
    ```
    <img src=https://i.imgur.com/U8cIhJf.png>

- Truy cập URL : https://github.com/settings/keys , chọn `New SSH key` :

    <img src=https://i.imgur.com/GfHXvRN.png>

- Paste **public key** vào rồi chọn `Add SSH key` :

    <img src=https://i.imgur.com/EJ9b6qn.png>

- Xác thực lại mật khẩu của **Github** :

    <p align=center><img src=https://i.imgur.com/w4s6uAz.png width=70%></p>

- Liên kết thành công , có thể **commit** lên **Github** tại máy local mà không cần nhập `username` và `password` .

    <img src=https://i.imgur.com/ab8mYwR.png>

## **3) Các thao tác trên Git**
### **3.1) Clone**
- Cho phép **clone repository** từ Github về máy local
    ```
    # git clone git@github.com:QuocCuong97/INTERN.git
    ```
    hoặc
    ```
    # git clone https://github.com/QuocCuong97/INTERN.git
    ```

    <img src=https://i.imgur.com/LBEJmH2.png>

### **3.2) Add**
- Trong quá trình làm việc với Local Repository , tạo file `newfile.md` trong đường dẫn `/root/INTERN/docs`
- Thực hiện **add** file lên Github :
    ```
    # git add newfile.md
    ```
    hoặc add tất cả các file đã thêm vào :
    ```
    # git add *
    ```
- Thực hiện kiểm tra : file `newfile.md` đang đợi **commit**
    ```
    # git status
    ```

    <img src=https://i.imgur.com/90eoWzn.png>

### **3.3) Commit**
- Giống như xét duyệt lại lần cuối các thay đổi trong local repository để đưa lên Github
    ```
    # git commit newfile.md -m "Tao file moi"
    ```
    hoặc commit tất cả các file pending :
    ```
    # git commit * -m "Tao file moi"
    ```
    - `-m` : Ghi lại comment cho 1 **commit**

        <img src=https://i.imgur.com/GSxk6z6.png>
### **3.4) Push**
- Đẩy các file đã **commit** lên Github
    ```
    # git push origin master
    ```

    <img src=https://i.imgur.com/91KkeCi.png>

### **3.5) Pull**
- Giả sử có 1 thay đổi nào đó được tạo trên Github , cần phải đồng bộ xuống Local để làm việc . Thao tác **pull** sẽ đối chiếu remote repo trên Github và Local repo sau đó thực hiện đồng bộ xuống máy Local .
    ```
    # git pull
    ```
    <img src=https://i.imgur.com/I9IeAfY.png>

