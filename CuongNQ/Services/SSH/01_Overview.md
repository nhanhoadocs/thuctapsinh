# SSH - Secure Shell
## **1) Khái niệm**
- **SSH - Secure Shell** là một giao thức mạng dùng để thiết lập kết nối mạng một cách bảo mật .
- **SSH** có sử dụng cơ chế mã hoá đủ mạnh nhằm ngăn chặn các hiện tượng nghe trộm , đánh cắp thông tin trên đường truyền . Các giao thức trước đây như **rlogin** , **telnet** không hỗ trợ mã hóa .
- **SSH** hoạt động ở tầng **Application** trong mô hình **TCP/IP**
- Các công cụ **SSH** ( như là **OpenSSH**,...) cung cấp cho người dùng cách thức để thiết lập kết nối mạng được mã hoá để tạo một kênh kết nối riêng tư .
## **2) Cấu trúc lệnh SSH**

## **3) Các kỹ thuật mã hóa**
- Một lợi thế quan trọng của **SSH** so với các giao thức tiền nhiệm trước là nó sử dụng mã hóa để đảm bảo kết nối bảo mật giữa ***host*** và ***client*** .
    - ***Host*** là server đầu xa .
    - ***Client*** là máy tính đang thực hiện truy cập từ xa vào ***host*** .
- Có 3 công nghệ mã hóa khác nhau được sử dụng trong **SSH** là : ***symmetric encryption*** , ***asymmetric encryption*** và ***hashing*** .
### **3.1) Symmetric Encryption ( *mã hóa đối xứng* )**
- **Symmetric Encryption** là 1 dạng mã hóa sử dụng **secret key** cho cả việc mã hóa và giải mã gói tin bởi ***host*** và ***client*** . Do vậy , bất cứ ai có được **secret key** đều có thể giải mã gói tin .

    <img src=https://i.imgur.com/54cAASp.png>

- **Symmetric Encryption** thường được gọi là **shared-key** hoặc **shared-secret** encryption . Thường chỉ có 1 **key** được sử dụng hoặc đôi khi là 1 cặp **key** trong khi từ **key** này có thể tính toán được ra **key** kia .
- **Symmetric keys** được sử dụng để mã hóa toàn bộ giao tiếp giữa 2 máy trong suốt phiên **SSH** . Cả server và client truy gốc **secret key** bằng việc sử dụng 1 thuật toán đồng nhất , và **key** sau khi được tổng hợp sẽ không được tiết lộ với bất kỳ bên thứ 3 nào . Quá trình tạo ra **symmetric key** được tiến hành bởi *thuật toán trao đổi key mã hóa* ( ***key exchange algorithm*** ) . Điều làm cho thuật toán này đặc biệt an toàn là **key** không bao giờ được trao đổi giữa ***client*** và ***host*** . Thay vào đó , 2 máy tính trao đổi 1 phần thông tin chung và sau đó thực hiện tính toán độc lập ra **secret key** . Kể cả khi có 1 máy khác bắt được phần thông tin này , nó cũng không thể tính toán được **secret key** bởi không biết *thuật toán trao đổi key* .
- Có rất nhiều thuật toán mã hóa ***( cypher )*** tồn tại , bao gồm **AES ( Advanced Encryption Standard )** , **CAST128** , **Blowfish** ,... Trước khi thiết lập một kết nối bảo mật , ***client*** và ***host*** sẽ quyết định xem dùng thuật toán mã hóa nào bằng cách xuất ra 1 danh sách các thuật toán mã hóa được hỗ trợ theo thứ tự ưu tiên . Thuật toán được ưu tiên nhất từ phía ***client*** và có xuất hiện trong danh sách thuật toán hỗ trợ của ***host*** sẽ được sử dụng làm thuật toán mã hóa chung . <br>**VD :** Ubuntu 14.04 LTS khi thực hiện kết nối với máy khác thông qua **SSH** , chúng sẽ sử dụng **aes128-ctr** là thuật toán mặc định .
### **3.2) Asymmetric Encryption ( *mã hóa bất đối xứng* )**
- Không giống **symmectric encryption** , **asymmetric encryption** sử dụng 2 **key** riêng biệt để mã hóa và giải mã . Hai loại **key** được biết đến với tên gọi là **public key** và **private key** . Cùng với nhau , chúng tạo thành 1 cặp **key-pair** .

    <img src=https://i.imgur.com/BjpfaFG.png>

- **Public key** được phân phối và chia sẻ với các bên khác . Trong khi nó được liên kết với **private key** theo 1 cách nào đó , **private key** không thể bị tính toán ra từ **public key** . Mối quan hệ giữa 2 loại **key** này khá phức tạp : gói tin được mã hóa bởi **public key** của máy nào thì chỉ được giải mã bằng chính **private key** của nó . Mối quan hệ 1 chiều này có nghĩa **public key** không thể giải mã gói tin của chính nó , và cũng không thể giải mã bất cứ thứ gì được mã hóa bởi **private key** .
- **Private key** sẽ ở lại với máy chủ của nó để kết nối được bảo mật , sẽ không có bên thứ 3 nào biết nó .
- Điều làm cho kết nối được an toàn giữa 2 máy là việc **private key** sẽ không bao giờ bị lộ , đó là khả năng duy nhất để giải mã gói tin sử dụng **public key** của nó . Do đó , bất kỳ bên nào có khả năng giải mã gói tin public phải sở hữu **private key** tương ứng .
- **Asymmetric encryption** không được sử dụng để mã hóa toàn bộ phiên **SSH** . Thay vào đó , nó chỉ được sử dụng trong *thuật toán trao đổi key* của **symmetric encryption** . Trước khi khởi tạo 1 kết nối bảo mật , cả 2 bên tạo ra 1 cặp **public-private keys** tạm thời , sau đó chia sẻ **private keys** của chúng để tạo ra **shared secret key** .
- Trong khi quá trình **symmetric** được thiết lập , server sẽ sử dụng **public key** của client để tạo ra và thử thách và truyền nó tới client để xác thực . Nếu client có thể giải mã thành công gói tin , có nghĩa là nó giữ **private key** được yêu cầu cho kết nối <br>**=>** Phiên làm việc **SSH** được bắt đầu .
### **3.3) Hashing**
- **Hashing** một chiều là 1 dạng mã hóa khác được sử dụng bởi **SSH** .
- Chức năng của chúng khác với 2 dạng mã hóa trên theo hướng rằng chúng sẽ không bao giờ bị giải mã .
- Chúng tạo ra 1 giá trị độc nhất cho phần đuôi được thêm vào của mỗi đoạn dữ liệu khiến chúng không thể bị khai thác . Điều này khiến **hash** hoàn toàn không thể bị đảo ngược .

    <img src=https://i.imgur.com/S97o5ia.png>

- Có thể dễ dàng **hash** một đầu vào cho sẵn , nhưng không thể giải mã được đầu vào bị **hash** đó . Điều này có nghĩa nếu 1 client giữ đoạn dữ liệu chính xác , nó có thể giải mã **hash** và so sánh các giá trị của chúng để xác thực rằng liệu chúng có sở hữu dữ liệu chuẩn hay không .
- **SSH** sử dụng **hash** để đảm bảo tính xác thực của các gói tin . Nó được thực hiện bằng cách sử dụng **HMACs ( Hash-based Message Authentication Codes )** . Điều này đảm bảo các lệnh mà máy đầu xa nhận được sẽ không bị giả mạo theo bất cứ cách nào .
- Trong quá trình lựa chọn thuật toán mã hóa **symmetric** , một thuật toán xác thực gói tin cũng sẽ được lựa chọn theo đúng cách lựa chọn **symmetric** .
- Mỗi gói tin được truyền đi phải chứa đựng 1 **MAC** được tính toán dựa trên **symmetric key** , **packet sequence number** và nội dung gói tin .
### **3.4) Cách kết hợp cả 3 công nghệ trên của SSH**
- **SSH** sử dụng mô hình **Client-Server** để cho phép xác thực giữa 2 máy đầu xa và mã hóa dữ liệu truyền qua chúng .
- **SSH** hoạt động mặc định trên port `22` của giao thức **TCP** ( có thể thay đổi được )
- ***Host*** ( server ) lắng nghe trên port `22` chờ kết nối đến .
- ***Host*** sẽ thiết lập kết nối bảo mật bằng việc xác thực ***client*** và mở 1 môi trường **shell** tương ứng khi việc xác thực thành công .

    <img src=https://i.imgur.com/oiBeWh5.png>

- ***Client*** sẽ phải bắt đầu kết nối **SSH** bằng việc bắt tay 3 bước **TCP** với ***host*** , đảm bảo kết nối bảo mật **symmetric** , xác thực định danh trong server đúng với các bản ghi trước ( thường đuợc lưu trữ trong file **RSA** ) , và trình diện đúng user được ủy quyền trên ***host*** để xác thực phiên kết nối .
- Khi ***client*** cố kết nối tới server qua TCP , ***server*** sẽ trình ra các kỹ thuật mã hóa và những phiên bản liên quan nó hỗ trợ . Nếu ***client*** cũng có protocol tương ứng và phiên bản đúng như vậy , một thỏa thuật sẽ được đặt ra và kết nối bát đầu tiếp nhận protocol . ***Server*** cũng sử dụng một **symmetric public key** mà client có thể dùng để xác thực tính chính xác của server .
- Khi đã được thiết lập , cả 2 bên sử dụng thuật toán **Diffie-Hellman** để tạo **symmetrical key** . Thuật toán này cho phép cả ***client*** và ***server*** có cùng một key chung được dùng để mã hóa toàn bộ liên lạc sau này . Thuật toán **Diffie-Hellman** được giải thích như sau :
    - Cả ***client*** và ***server*** đồng ý dựa trên một số nguyên lớn , dĩ nhiên là không có bất kỳ tính chất chung nào . Số này được gọi là **seed value** .
    - Tiếp theo , cả 2 bên đồng ý một cách mã hóa được tạo ra từ **seed value** bằng một dạng thuật toán nhất định . Những cơ chế này là nguồn tạo mã hóa , hoạt đông lớn trên **seed value** . Ví dụ như **AES ( *Advanced Encryption Standard* )** .
    - Cả 2 bên độc lập tạo một số khác . Nó được dùng như là một **private key** bí mật cho tương tác .
    - **Private key** mới tạo này , với số chung và thuật toán mã hóa ở trên ( **AES** ) được dùng để tạo ra một **public key** được phân phối cho máy còn lại .
    - 2 bên sau đó sử dụng **private key** của chính nó , **public key** của máy còn lại và số nguyên ban đầu để tạo ra một key chung cuối cùng . Key này độc lập được tính toán bởi cả 2 máy nhưng sẽ tạo ra một key mã hóa giống nhau trên cả 2 .
    - Bây giờ cả 2 đã có **shared key** , chúng có thể tạo mã hóa symmetric cho cả phiên SSH . Một key chung được sử dung để mã hóa và giải mã gói tin .<br>=> Bây giờ phiên giao dịch được mã hóa symmetric đã được thiết lập, chứng thực cho user sẽ được tiến hành.
# LAB : SSH Keypairs

<img src=https://i.imgur.com/wx6k7gh.png>

## B1 - Tạo cặp key RSA trên SSH Client :
- Bước đầu tiên là tạo ra cặp **SSH Key Pair** trên **SSH Client** hay chính máy tính thực hiện **SSH** :
    ```
    [root@CentOS7-01~]# ssh-keygen
    ```
- Mặc định , lệnh `ssh-keygen` sẽ tạo ra 1 cặp **RSA key pair `2048-bit`** , gần như đáp ứng đủ mọi trường hợp . Nếu muốn cặp key phức tạp hơn , có thể tạo key với độ dài **`4096-bit`** bằng option `-b 4096` .
- Sau khi thực hiện lệnh , bạn sẽ nhìn thấy output sau :

    <img src=https://i.imgur.com/gBqxbEB.png>

- Gõ `ENTER` để lưu cặp key vào thư mục con `.ssh/` nằm trong thự mục `home` của user hiện hành , hoặc tự chọn 1 đường dẫn khác
- Nếu trên máy đã có 1 cặp key từ trước đó , bạn sẽ nhìn thấy output sau :

    <img src=https://i.imgur.com/OmlCxbh.png>
- Nếu chọn "`overwrite the key on disk`" , bạn sẽ không thể xác thực các key đang sử dụng trước đây nữa .
- Sau khi lựa chọn , sẽ thấy output tiếp theo :

    <img src=https://i.imgur.com/SqYx2Er.png>

- Đây là tùy chọn thêm 1 chuỗi mật khẩu , được khuyến nghị để tăng tính bảo mật . Nếu nhập chuỗi **passphrase** này , bạn sẽ phải gõ thêm chúng bất kỳ lúc nào sử dụng key ( chỉ trừ khi sử dụng phần mềm để SSH đã lưu trữ passphrase ) . Nếu không muốn sử dụng **passphrase** , có thể `ENTER` để bỏ qua . Nếu nhập **passphrase** , sẽ thấy output sau :

    <img src=https://i.imgur.com/eM8Tr1e.png>
## Bước 2 - Copy Public Key vào SSH Server :
- Cách nhanh nhất để copy **Public Key** trên CentOS là sử dụng tiện ích `ssh-copy-id` vì nó khá đơn giản . Nếu không có sẵn `ssh-copy-id` , cần phải copy 1 cách thủ công .
### Cách 1 - Copy Public Key sử dụng `ssh-copy-id`
- Công cụ `ssh-copy-id` thường có sẵn trên nhiều hệ điều hành . Nếu dùng cách này , cần có kết nối SSH bằng mật khẩu từ client đến Server :
    ```
    [root@CentOS7-01~]# ssh-copy-id username@remote_host
                   == # ssh-copy-id root@192.168.5.20
    ```
    <img src=https://i.imgur.com/cYj3Lla.png>
- Điều này có nghĩa máy tính hiện tại đang không nhận ra máy chủ đầu xa . Hiện tượng này sẽ xảy ra trong lần đầu kết nối tới 1 host mới . Gõ `yes` hoặc `ENTER` để tiếp tục .
- Tiếp theo , công cụ sẽ dò quét file `id_rsa.pub` trên máy vừa tạo ra . Nếu tìm thấy , nó sẽ hỏi mật khẩu của user SSH :

    <img src=https://i.imgur.com/NINaYkG.png>
- Nhập mật khẩu và gõ `ENTER` . Công cụ sẽ kết nối tới Server bằng tài khoản được cung cấp . Sau đó nó sẽ copy nội dung file `~/.ssh/id_rsa.pub` vào 1 file tên là `authorized_keys` trong thư mục `~/.ssh` của Server .
- Tại bước này , key `id_rsa.pub` đã được upload lên Server .

    <img src=https://i.imgur.com/tjOivCH.png width=70%>
### Cách 2 - Copy Public Key sử dụng SSH
- Nếu không có sẵn tiện ích `ssh-copy-id` , có thể sử dụng phương pháp truyền thống để copy **public key** sang Server .
- Sử dụng lệnh pipe sau :
    ```
    [root@CentOS7-01]# cat ~/.ssh/id_rsa.pub | ssh root@192.168.5.20 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
    ```
    <img src=https://i.imgur.com/GNMSdqh.png>
- Sau khi nhập password , nội dung file `id_rsa.pub` sẽ được copy sang file `~/.ssh/authorized_keys` .
### Cách 3 - Copy thủ công
- Nếu không có cách nào để truy cập Server qua SSH , có thể thực hiện copy thủ công qua USB hay bất cứ cách nào khác .
- Xem nội dung file `id_rsa.pub` và copy :
    ```
    [root@CentOS7-01]# cat ~/.ssh/id_rsa.pub
    ```
    <img src=https://i.imgur.com/OPo4J07.png>
- Truy cập máy Server :
    ```
    [root@CentOS7-02]# mkdir -p ~/.ssh
    [root@CentOS7-02]# echo public_key_string >> ~/.ssh/authorized_keys   ( public_key_string là phần copy được từ id_rsa.pub )
    [root@CentOS7-02]# chmod -R go= ~/.ssh    ( tùy chọn này sẽ gỡ bỏ hết các permission về Group và Others trong thư mục /.ssh )
    ```
## Bước 3 - Xác thực trên CentOS Server sử dụng SSH Key
- Sau khi hoàn thành các bước trên , nhập lệnh sau để **SSH** vào Server :
    ```
    [root@CentOS7-01]# ssh root@192.168.5.20
    ```
    <img src=https://i.imgur.com/7xcXoCY.png>
- Điều này có nghĩa máy tính hiện tại đang không nhận ra máy chủ đầu xa . Gõ `yes` hoặc `ENTER` để tiếp tục .
- Nếu đã tạo **passphrase** thì ở bước này phải nhập thêm **passphrase** , nếu không thì có thể truy cập được luôn .
## Bước 4 - Tắt xác thực mật khẩu trên Server
- Mặc định , tồn tại song song cả 2 chế độ xác thực qua **SSH Key** và xác thực qua mật khẩu . Vì vậy , vẫn có khả năng Server bị tấn công bằng **Brute Force** .
- Trên Server , mở file cấu hình `sshd` :
    ```
    [root@CentOS7-02]# vi /etc/ssh/sshd_config
    : set nu
    ```
- Kéo xuống dòng `65` , sử  `yes` thành `no` :

    <img src=https://i.imgur.com/WKPrrLH.png width=90%>

- Restart dịch vụ **SSH** :
    ```
    [root@CentOS7-02]# systemctl restart sshd.service
    ```
- Sau đó , thực hiện kết nối **SSH** . Server sẽ hoàn toàn xác thực bằng **SSH Key** đã add trước đó mà không thể xác thực qua mật khẩu nữa .


