# Tìm hiểu về SSH
## SSH là gì
SSH (hay Secure Shell) là một giao thức mạng được mã hoá để vận hành các dịch vụ mạng một cách an toàn. SSH cung cấp một kênh kết nối bảo mật trong mô hình kết nối client-server. SSH hoạt động ở tầng application trong mô hình TCP/IP. SSH sử dụng cổng TCP tiêu chuẩn là 22. Việc sử dụng giao thức SSH để kết nối sẽ tránh được các rủi ro trong việc nghe lén và đánh cắp thông tin.
Để thực hiện kết nối SSH, có thể làm một vài cách như sau:
- Sử dụng mật khẩu để xác thực.
- Sử dụng cơ chế Key pairs.

Trong đó phương thức dùng keypair được cho là có tính bảo mật cao hơn bởi nếu trong quá trình sử dụng mà các gói tin của bạn bị bắt lại, các phiên trao đổi khóa giữa SSH server và Client sẽ bị lộ và attacker có thể dùng nó để giải mã dữ liệu. Hơn nữa, việc này cũng tạo điều kiện cho các cuộc tấn công Brute Force mật khẩu.

SSH có hỗ trợ sử dụng cặp khóa Private Key và Public Key được chia sẻ với nhau từ trước. Nghĩa là bạn đã có sẵn Private Key để trao đổi với server mà không cần đến quá trình trao đổi khóa, điều này sẽ hạn chế khả năng bị bắt gói. Hơn nữa cặp khóa này còn có một mật khẩu riêng của nó, gọi là passphrase (hay keyphrase). Mật khẩu này được dùng để mở khóa Private Key (được hỏi khi bạn SSH vào server) và tạo lớp xác thực thứ 2 cho bộ khóa. Nghĩa là:

- Nếu attacker không có Private Key, việc truy cập vào server gần như không thể, chỉ cần bạn giữ kĩ Private Key.
- Tuy nhiên trong trường hợp Private Key bị lộ, bạn vẫn khá an toàn vì đối phương không có passphrase thì vẫn chưa thể làm được gì, tuy nhiên đó chỉ là tạm thời. Bạn cần truy cập server thông qua cách trực tiếp hoặc qua VNC của nhà cung cấp nếu đó là một VPS để thay đổi lại bộ khóa.

## Cơ chế hoạt động
Một phiên làm việc của SSH đều phải trải qua 4 bước:

Thiết lập kết nối ban đầu (SSH-TRANS)
Tiến hành xác thực (SSH-AUTH)
Mở phiên kết nối để thực hiện các dịch vụ (SSH-CONN)
Chạy các ứng dụng SSH (Có thể là SSH-SFTP, SCP)
SSH-TRANS: là khối xây dựng cơ bản cung cấp kết nối ban đầu, ghi chép giao thức, xác thực server, mã hóa cơ bản và bảo toàn dữ liệu. Sau khi thiết lập kết nối, client có một kết nối độc lập và bảo mật

Sau đó, client dùng SSH-AUTH để xác thực đến server. SSH-AUTH yêu cầu một phương thức: Public key với thuật toán DSA. Ngoài ra, sử dụng mật khẩu và hostbased

Sau khi xác thực, SSH client yêu cầu SSH-CONN để cung cấp một kênh riêng biệt qua SSH-TRANS

Ngoài ra, còn cung cấp các dịch vụ như Remote Login and Command Execution, agent fowarding, files transfer, TCP port fowarding, X fowarding,...

Cuối cùng, một ứng dụng có thể sử dụng SSH-SFTP hoặc SCP truyền file hoặc thao tác remote từ xa

## SSH key pair
SSH key pairs là một cặp khóa được mã hóa có thể được dùng để xác thực giữa client và server. Mỗi một cặp khóa sẽ có public key và private key. Private key được giữ ở phía client và phải được bảo mật tuyệt đối. Nếu có được private key, attackers hoàn toàn có thể truy cập vào server. Cũng vì thế nó được mã hóa với passphrase.

Public key có thể được chia sẻ và phân tán rộng rãi bởi nó được dùng để mã hóa các tin nhắn mà chỉ private key mới giải mã được. Public key sẽ được upload lên phía server và được lưu tại thư mục người dùng (~/.ssh/authorized_keys).

Khi có client muốn xác thực bằng SSH keys, server có thể test xem client đó có giữ private key hay không. Nếu client chứng minh được nó có private key thì kết nối có thể được thiết lập.

Hình dưới đây mô tả quá trình xác thực giữa server và client:

![Imgur](https://i.imgur.com/AE9p6IY.png)
## Các kỹ thuật mã hóa trong SSH
SSH có ưu điểm vượt trội so với các giao thức cũ là khả năng truyền tải dữ liệu bảo mật giữa client và host và khả năng mã hoá. Host đại diện cho sự kết nối giữa máy chủ từ xa client điều này có nghĩa là máy tính của bạn với mục đích truy cập tới host. Để mã hoá qua SSH sử dụng 3 kỹ thuật sau đây:

- Hashing
- Asymmetrical encryption
- Symmetrical encryption
### Hashing 
Hashing một chiều là một dạng mã hoá khác sử dụng trong Secure Shell Connections. Hash một chiều không được sinh ra để giải mã đây cũng là điểm khác biệt so với hai cách sau. Nó tạo ra một giá trị duy nhất với độ dài nhất định cho mỗi lần nhập dữ liệu mà không có hướng nào để khai thác. Việc này có nhược điểm là không quay lại để giải mã được.

### Asymmetric Encryption (Mã hóa bất đối xứng)
Để giải mã và mã hoá asymmetric encryption dùng 2 khoá khác nhau. Hai khoá này là private key và public key. Cả 2 đã hình thành nên một cặp khoá là private-public key pair.

Khoá private phải luôn được bảo đảm an toàn
Khoá public là khoá sẽ được công khai với tất cả các bên liên quan. Public key không cho phép private tính toán ra mặc dù có liên quan mật thiết tới private key. 
Sự liên quan này diễn ra rất phức tạp như: chỉ được giải mã bằng private key của chính máy đó và thư chỉ có thể được giải mã bởi private key. Sự liên quan một chiều này nghĩa là public key không thể giải mã bất cứ thứ gì được mã hoá bằng private key hoặc không thể giải mã chính thư của nó sở hữu.

### Symmetric Encryption (Mã hóa đối xứng)
Symmetric Encryption là một dạng mã hoá sử dụng secret key ở cả 2 chiều giải mã và mã hoá tin nhắn bởi cả client và host. Có nghĩa là ai nắm được khoá đều có thể giải mã tin nhắn trong quá trình truyền đi.

Symmetrical Encryption còn được gọi là shared secret hoặc shared key encryption. Bởi vì có một khoá được dùng, hoặc cặp khoá mà một khoá có thể được tính ra từ khoá kia. 

Người dùng mã hoá toàn bộ liên lạc trong phiên bản giao dịch SSH bằng cách sử dụng symmetric keys. Cả server và client tạo chung một key bí mật như là một phương thức thoả thuận, và key đó không được tiết lộ cho bên thứ 3. Quá trình tạo symmetric key được thực hiện bởi key exchange algorithm.
